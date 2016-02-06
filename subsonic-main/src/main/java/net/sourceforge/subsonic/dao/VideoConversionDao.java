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
package net.sourceforge.subsonic.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.springframework.jdbc.core.simple.ParameterizedRowMapper;

import net.sourceforge.subsonic.domain.VideoConversion;

/**
 * Provides database services for video conversions.
 *
 * @author Sindre Mehus
 */
public class VideoConversionDao extends AbstractDao {

    private static final String COLUMNS = "id, media_file_id, audio_track_id, username, status, progress_seconds, created, changed, started";

    private VideoConversionRowMapper rowMapper = new VideoConversionRowMapper();

    public synchronized void createVideoConversion(VideoConversion conversion) {
        Integer audioTrackId = conversion.getAudioTrackId() == null ? -1 : conversion.getAudioTrackId();
        update("insert into video_conversion (" + COLUMNS + ") values (" + questionMarks(COLUMNS) + ")", null,
               conversion.getMediaFileId(), audioTrackId, conversion.getUsername(), conversion.getStatus().name(),
               conversion.getProgressSeconds(), conversion.getCreated(), conversion.getChanged(), conversion.getStarted());
    }

    public synchronized void updateProgress(Integer id, Integer progressSeconds) {
        update("update video_conversion set progress_seconds=? where id=?", progressSeconds, id);
    }

    public synchronized void updateStatus(Integer id, VideoConversion.Status status) {
        Date changed = new Date();
        Date started = status == VideoConversion.Status.IN_PROGRESS ? changed : null;
        update("update video_conversion set status=?, changed=?, started=? where id=?", status.name(), changed, started, id);
    }

    public synchronized VideoConversion getVideoConversionForFile(int mediaFileId) {
        return queryOne("select " + COLUMNS + " from video_conversion where media_file_id=? order by created desc",
                        rowMapper, mediaFileId);
    }

    public synchronized void deleteVideoConversionsForFile(Integer mediaFileId) {
        update("delete from video_conversion where media_file_id=?", mediaFileId);
    }

    public synchronized VideoConversion getVideoConversionById(Integer id) {
        return queryOne("select " + COLUMNS + " from video_conversion where id=?", rowMapper, id);
    }

    public synchronized VideoConversion getNextVideoConversion() {
        return queryOne("select " + COLUMNS + " from video_conversion where status=? order by created",
                        rowMapper, VideoConversion.Status.NEW.name());
    }

    public synchronized void cleanUp() {
        update("delete from video_conversion where status != ?", VideoConversion.Status.NEW.name());
    }

    private static class VideoConversionRowMapper implements ParameterizedRowMapper<VideoConversion> {
        public VideoConversion mapRow(ResultSet rs, int rowNum) throws SQLException {
            Integer audioTrackId = rs.getInt(3);
            if (audioTrackId == -1) {
                audioTrackId = null;
            }

            return new VideoConversion(rs.getInt(1), rs.getInt(2), audioTrackId, rs.getString(4), VideoConversion.Status.valueOf(rs.getString(5)),
                                       rs.getInt(6), rs.getTimestamp(7), rs.getTimestamp(8), rs.getTimestamp(9));
        }
    }
}
