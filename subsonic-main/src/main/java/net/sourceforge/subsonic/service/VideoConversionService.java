/*
 * This file is part of Subsonic.
 *
 *  Subsonic is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  Subsonic is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Subsonic.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  Copyright 2016 (C) Sindre Mehus
 */

package net.sourceforge.subsonic.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;

import net.sourceforge.subsonic.Logger;
import net.sourceforge.subsonic.dao.VideoConversionDao;
import net.sourceforge.subsonic.domain.MediaFile;
import net.sourceforge.subsonic.domain.VideoConversion;
import net.sourceforge.subsonic.service.metadata.MetaData;
import net.sourceforge.subsonic.service.metadata.MetaDataParser;
import net.sourceforge.subsonic.service.metadata.MetaDataParserFactory;
import net.sourceforge.subsonic.service.metadata.Track;
import net.sourceforge.subsonic.util.Util;

/**
 * @author Sindre Mehus
 * @version $Id$
 */
public class VideoConversionService {

    private static final Logger LOG = Logger.getLogger(VideoConversionService.class);

    private MediaFileService mediaFileService;
    private TranscodingService transcodingService;
    private VideoConversionDao videoConversionDao;
    private VideoConverter videoConverter;
    private MetaDataParserFactory metaDataParserFactory;

    public void init() {
        videoConversionDao.cleanUp();
        videoConverter = new VideoConverter();
        videoConverter.start();
    }

    public void createVideoConversion(VideoConversion conversion) {
        videoConversionDao.deleteVideoConversionsForFile(conversion.getMediaFileId());
        videoConversionDao.createVideoConversion(conversion);
    }

    public void cancelVideoConversion(VideoConversion conversion) {
        videoConversionDao.deleteVideoConversionsForFile(conversion.getMediaFileId());
        videoConverter.cancel(conversion);
    }

    public VideoConversion getVideoConversionForFile(int mediaFileId) {
        VideoConversion conversion = videoConversionDao.getVideoConversionForFile(mediaFileId);
        if (conversion != null && conversion.getStatus() == VideoConversion.Status.COMPLETED && !getTargetFile(conversion).exists()) {
            return null;
        }
        return conversion;
    }

    public MetaData getVideoMetaData(MediaFile video) {
        MetaDataParser parser = metaDataParserFactory.getParser(video.getFile());
        return parser != null ? parser.getMetaData(video.getFile()) : null;
    }

    private File getTempFile(VideoConversion conversion) {
        return getFile(conversion, ".tmp");
    }

    private File getLogFile(VideoConversion conversion) {
        return getFile(conversion, ".convert.log");
    }

    private File getTargetFile(VideoConversion conversion) {
        return getFile(conversion, ".streamable.mp4");
    }

    private File getFile(VideoConversion conversion, String extension) {
        MediaFile mediaFile = mediaFileService.getMediaFile(conversion.getMediaFileId());
        File originalFile = mediaFile.getFile();
        return new File(originalFile.getParentFile(), FilenameUtils.getBaseName(originalFile.getName()) + extension);
    }

    public void setVideoConversionDao(VideoConversionDao videoConversionDao) {
        this.videoConversionDao = videoConversionDao;
    }

    public void setMediaFileService(MediaFileService mediaFileService) {
        this.mediaFileService = mediaFileService;
    }

    public void setTranscodingService(TranscodingService transcodingService) {
        this.transcodingService = transcodingService;
    }

    public void setMetaDataParserFactory(MetaDataParserFactory metaDataParserFactory) {
        this.metaDataParserFactory = metaDataParserFactory;
    }

    private class VideoConverter extends Thread{

        private VideoConversion conversion;
        private Process process;
        private MediaFile mediaFile;

        private VideoConverter() {
            setDaemon(true);
        }

        @Override
        public void run() {
            while (true) {
                Util.sleep(3000L);
                conversion = videoConversionDao.getNextVideoConversion();
                if (conversion != null) {
                    convert();
                }
            }
        }

        private void cancel(VideoConversion conversion) {
            if (process != null && this.conversion != null && this.conversion.getId().equals(conversion.getId())) {
                LOG.info("Killing conversion process for " + mediaFile);
                process.destroy();
            }
        }

        private void convert() {
            videoConversionDao.updateStatus(conversion.getId(), VideoConversion.Status.IN_PROGRESS);

            mediaFile = mediaFileService.getMediaFile(conversion.getMediaFileId());
            try {
                LOG.info("Starting video conversion of " + mediaFile);

                File originalFile = mediaFile.getFile();
                File tmpFile = getTempFile(conversion);
                File logFile = getLogFile(conversion);
                File targetFile = getTargetFile(conversion);

                List<String> command = buildFFmpegCommand(originalFile, tmpFile);

                StringBuffer buf = new StringBuffer("Starting video converter: ");
                for (String s : command) {
                    buf.append(s).append(" ");
                }
                LOG.info(buf);

                process = new ProcessBuilder(command).redirectErrorStream(true)
                                                     .start();

                new ProcessReaderThread(process, conversion, logFile).start();
                int retval = process.waitFor();
                LOG.info("ffmpeg exit value: " + retval);

                boolean success =
                        videoConversionDao.getVideoConversionById(conversion.getId()) != null  // conversion was canceled (i.e., removed)
                        && tmpFile.exists()
                        && tmpFile.length() > 0;

                if (success) {
                    tmpFile.renameTo(targetFile);
                    MediaFile dir = mediaFileService.getMediaFile(originalFile.getParentFile());
                    if (dir != null) {
                        mediaFileService.refreshMediaFile(dir);
                    }
                    videoConversionDao.updateStatus(conversion.getId(), VideoConversion.Status.COMPLETED);
                    LOG.info("Completed video conversion of " + mediaFile);
                } else {
                    tmpFile.delete();
                    LOG.error("An error occurred while converting video " + mediaFile + ". See log file " + logFile.getAbsolutePath());
                    videoConversionDao.updateStatus(conversion.getId(), VideoConversion.Status.ERROR);
                }

            } catch (Exception x) {
                LOG.error("An error occurred while converting video " + mediaFile + ": " + x, x);
                videoConversionDao.updateStatus(conversion.getId(), VideoConversion.Status.ERROR);
            }
        }

        private List<String> buildFFmpegCommand(File originalFile, File tmpFile) {
            List<String> command = new ArrayList<String>();

            command.add(transcodingService.getTranscodeDirectory() + File.separator + "ffmpeg");
            command.add("-i");
            command.add(originalFile.getAbsolutePath());
            command.add("-ac");
            command.add("2");
            command.add("-f");
            command.add("mp4");
            command.add("-preset");
            command.add("superfast");
            command.add("-y");

            // Look for video track with streamable codec. If found, copy it.
            MetaData metaData = getVideoMetaData(mediaFile);
            Track videoTrack = null;
            List<Track> videoTracks = metaData.getVideoTracks();
            for (Track track : videoTracks) {
                if (track.isStreamable()) {
                    command.add("-c:v");
                    command.add("copy");
                    videoTrack = track;
                    break;
                }
            }
            if (videoTrack == null && !videoTracks.isEmpty()) {
                videoTrack = videoTracks.get(0);
            }

            // Find audio track, taking user-preferred track into account.
            List<Track> audioTracks = metaData.getAudioTracks();
            Track audioTrack = null;
            if (conversion.getAudioTrackId() != null) {
                for (Track track : audioTracks) {
                    if (conversion.getAudioTrackId().equals(track.getId())) {
                        audioTrack = track;
                        break;
                    }
                }
            }
            if (audioTrack == null && !audioTracks.isEmpty()) {
                audioTrack = audioTracks.get(0);
            }

            // Copy audio track if streamable.
            if (audioTrack != null && audioTrack.isStreamable()) {
                command.add("-c:a");
                command.add("copy");
            }

            // If container has multiple audio or video tracks, add "-map" options to specify which
            // tracks to include.
            if (videoTracks.size() > 1 || audioTracks.size() > 1) {
                if (videoTrack != null) {
                    command.add("-map");
                    command.add("0:" + videoTrack.getId());
                }
                if (audioTrack != null) {
                    command.add("-map");
                    command.add("0:" + audioTrack.getId());
                }
            }

            command.add(tmpFile.getAbsolutePath());
            return command;
        }
    }

    private class ProcessReaderThread extends Thread {
        private final Process process;
        private final VideoConversion conversion;
        private final File logFile;

        public ProcessReaderThread(Process process, VideoConversion conversion, File logFile) {
            this.process = process;
            this.conversion = conversion;
            this.logFile = logFile;
            setDaemon(true);
        }

        @Override
        public void run() {

            // frame= 2558 fps=150 q=24.0 size=   82720kB time=00:01:47.47 bitrate=6305.3kbits/s dup=1 drop=0
            Pattern pattern = Pattern.compile("^frame=.*time=(\\d+):(\\d+):(\\d+).(\\d+).*");
            BufferedReader reader = null;
            BufferedWriter logWriter = null;
            try {
                reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                logWriter = new BufferedWriter(new FileWriter(logFile));

                for (String line = reader.readLine(); line != null; line = reader.readLine()) {
                    logWriter.append(line);
                    logWriter.newLine();
                    logWriter.flush();

                    Matcher matcher = pattern.matcher(line);
                    if (matcher.matches()) {
                        int hours = Integer.parseInt(matcher.group(1));
                        int minutes = Integer.parseInt(matcher.group(2));
                        int seconds = Integer.parseInt(matcher.group(3));

                        int progress = hours * 3600 + minutes * 60 + seconds;
                        videoConversionDao.updateProgress(conversion.getId(), progress);
                    }
                }
            } catch (IOException e) {
                LOG.warn("Error when reading output from video converter.", e);
            } finally {
                IOUtils.closeQuietly(reader);
                IOUtils.closeQuietly(logWriter);
            }
        }
    }
}

