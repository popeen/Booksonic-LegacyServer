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

import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;

import com.google.common.base.Function;
import com.google.common.base.Joiner;
import com.google.common.collect.FluentIterable;

import net.sourceforge.subsonic.domain.MediaFile;
import net.sourceforge.subsonic.service.MediaFileService;
import net.sourceforge.subsonic.service.SecurityService;
import net.sourceforge.subsonic.service.SettingsService;
import net.sourceforge.subsonic.service.VideoConversionService;
import net.sourceforge.subsonic.service.metadata.MetaData;
import net.sourceforge.subsonic.service.metadata.Track;

/**
 * Controller for the page used to convert videos.
 *
 * @author Sindre Mehus
 */
public class VideoConverterController extends ParameterizableViewController {

    private MediaFileService mediaFileService;
    private SecurityService securityService;
    private VideoConversionService videoConversionService;
    private SettingsService settingsService;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = ServletRequestUtils.getRequiredIntParameter(request, "id");
        MediaFile video = mediaFileService.getMediaFile(id);

        List<Track> audioTracks = Collections.emptyList();
        MetaData metaData = videoConversionService.getVideoMetaData(video);
        String audioCodecs = null;
        String videoCodecs = null;
        if (metaData != null) {
            audioTracks = metaData.getAudioTracks();
            audioCodecs = getCodecs(audioTracks);
            videoCodecs = getCodecs(metaData.getVideoTracks());
        }

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("video", video);
        map.put("audioTracks", audioTracks);
        map.put("audioCodecs", audioCodecs);
        map.put("videoCodecs", videoCodecs);
        map.put("user", securityService.getCurrentUser(request));
        map.put("licenseInfo", settingsService.getLicenseInfo());

        ModelAndView result = super.handleRequestInternal(request, response);
        result.addObject("model", map);
        return result;
    }

    private String getCodecs(List<Track> tracks) {
        Set<String> codecs = new LinkedHashSet<String>();
        FluentIterable.from(tracks)
                      .transform(new Function<Track, String>() {
                          @Override
                          public String apply(Track input) {
                              return input.getCodec();
                          }
                      })
                      .copyInto(codecs);
        return Joiner.on(", ").join(codecs);
    }

    public void setMediaFileService(MediaFileService mediaFileService) {
        this.mediaFileService = mediaFileService;
    }

    public void setSecurityService(SecurityService securityService) {
        this.securityService = securityService;
    }

    public void setVideoConversionService(VideoConversionService videoConversionService) {
        this.videoConversionService = videoConversionService;
    }

    public void setSettingsService(SettingsService settingsService) {
        this.settingsService = settingsService;
    }
}
