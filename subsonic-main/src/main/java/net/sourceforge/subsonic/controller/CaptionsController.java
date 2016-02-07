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
package net.sourceforge.subsonic.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.google.common.io.Files;

import net.sourceforge.subsonic.domain.MediaFile;
import net.sourceforge.subsonic.service.MediaFileService;
import net.sourceforge.subsonic.service.SecurityService;
import net.sourceforge.subsonic.service.captions.SrtToVtt;
import net.sourceforge.subsonic.util.StringUtil;

/**
 * Controller for serving closed captions.
 *
 * @author Sindre Mehus
 */
public class CaptionsController implements Controller {

    private static final String CAPTION_FORMAT_VTT = "vtt";
    private static final String CAPTION_FORMAT_SRT = "srt";

    private static final String[] CAPTIONS_FORMATS = {CAPTION_FORMAT_VTT, CAPTION_FORMAT_SRT};

    private MediaFileService mediaFileService;
    private SecurityService securityService;


    @Override
    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int id = ServletRequestUtils.getRequiredIntParameter(request, "id");
        String requiredFormat = request.getParameter("format");
        MediaFile video = mediaFileService.getMediaFile(id);

        if (!securityService.isAuthenticated(video, request)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access to file " + id + " is forbidden");
            return null;
        }

        File captionsFile = findCaptionsVideo(video);
        if (captionsFile == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }

        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/plain");
        response.setCharacterEncoding(StringUtil.ENCODING_UTF8);

        String actualFormat = FilenameUtils.getExtension(captionsFile.getName());
        if (requiredFormat == null || requiredFormat.equalsIgnoreCase(actualFormat)) {
            Files.copy(captionsFile, response.getOutputStream());
        } else if (CAPTION_FORMAT_SRT.equals(actualFormat) &&
                   CAPTION_FORMAT_VTT.equals(requiredFormat)) {
            convertAndSend(captionsFile, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

        return null;
    }

    private void convertAndSend(File captionsFile, HttpServletResponse response) throws IOException {
        Reader reader = new InputStreamReader(new FileInputStream(captionsFile), StringUtil.ENCODING_UTF8);
        try {
            Writer writer = new OutputStreamWriter(response.getOutputStream(), StringUtil.ENCODING_UTF8);
            SrtToVtt.convert(reader, writer);
        } finally {
            IOUtils.closeQuietly(reader);
        }
    }

    public File findCaptionsVideo(MediaFile video) {
        File file = video.getFile();
        String videoFileBaseName = FilenameUtils.getBaseName(file.getName()).replace(".streamable", "");

        for (File candidate : file.getParentFile().listFiles()) {
            for (String format : CAPTIONS_FORMATS) {
                if (candidate.isFile() &&
                    format.equals(FilenameUtils.getExtension(candidate.getName())) &&
                    (FilenameUtils.getBaseName(candidate.getName()).startsWith(videoFileBaseName) ||
                     videoFileBaseName.startsWith(FilenameUtils.getBaseName(candidate.getName())))) {
                    return candidate;
                }
            }
        }
        return null;
    }

    public void setMediaFileService(MediaFileService mediaFileService) {
        this.mediaFileService = mediaFileService;
    }

    public void setSecurityService(SecurityService securityService) {
        this.securityService = securityService;
    }
}
