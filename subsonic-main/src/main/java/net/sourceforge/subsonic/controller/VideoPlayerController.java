/*
 This file is part of Subsonic.

 Subsonic is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Subsonic is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Subsonic.  If not, see <http://www.gnu.org/licenses/>.

 Copyright 2009 (C) Sindre Mehus
 */
package net.sourceforge.subsonic.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.ParameterizableViewController;
import org.springframework.web.servlet.view.RedirectView;

import net.sourceforge.subsonic.domain.MediaFile;
import net.sourceforge.subsonic.domain.Player;
import net.sourceforge.subsonic.domain.User;
import net.sourceforge.subsonic.service.MediaFileService;
import net.sourceforge.subsonic.service.PlayerService;
import net.sourceforge.subsonic.service.SecurityService;
import net.sourceforge.subsonic.service.SettingsService;
import net.sourceforge.subsonic.service.VideoConversionService;
import net.sourceforge.subsonic.service.metadata.MetaData;
import net.sourceforge.subsonic.util.StringUtil;

/**
 * Controller for the page used to play videos.
 *
 * @author Sindre Mehus
 */
public class VideoPlayerController extends ParameterizableViewController {

    @Deprecated
    public static final int DEFAULT_BIT_RATE = 2000;

    private MediaFileService mediaFileService;
    private SettingsService settingsService;
    private PlayerService playerService;
    private SecurityService securityService;
    private VideoConversionService videoConversionService;
    private CaptionsController captionsController;

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = ServletRequestUtils.getRequiredIntParameter(request, "id");
        MediaFile file = mediaFileService.getMediaFile(id);

        if (!isStreamable(file)) {
            return new ModelAndView(new RedirectView("videoConverter.view?id=" + id));
        }

        User user = securityService.getCurrentUser(request);
        Map<String, Object> map = new HashMap<String, Object>();
        Integer position = ServletRequestUtils.getIntParameter(request, "position");
        mediaFileService.populateStarredDate(file, user.getUsername());

        Integer duration = file.getDurationSeconds();
        Player player = playerService.getPlayer(request, response);
        String url = request.getRequestURL().toString();
        String streamUrl = url.replaceFirst("/videoPlayer.view.*", "/stream?id=" + file.getId() + "&auth=" + file.getHash() + "&player=" + player.getId() + "&format=raw");
        String coverArtUrl = url.replaceFirst("/videoPlayer.view.*", "/coverArt.view?id=" + file.getId() + "&auth=" + file.getHash());
        String captionsUrl = url.replaceFirst("/videoPlayer.view.*", "/captions.view?id=" + file.getId() + "&auth=" + file.getHash());

        // Rewrite URLs in case we're behind a proxy.
        if (settingsService.isRewriteUrlEnabled()) {
            String referer = request.getHeader("referer");
            streamUrl = StringUtil.rewriteUrl(streamUrl, referer);
            coverArtUrl = StringUtil.rewriteUrl(coverArtUrl, referer);
            captionsUrl = StringUtil.rewriteUrl(captionsUrl, referer);
        }

        String remoteStreamUrl = settingsService.rewriteRemoteUrl(streamUrl);
        String remoteCoverArtUrl = settingsService.rewriteRemoteUrl(coverArtUrl);
        String remoteCaptionsUrl = settingsService.rewriteRemoteUrl(captionsUrl);

        map.put("video", file);
        map.put("hasCaptions", captionsController.findCaptionsVideo(file) != null);
        map.put("remoteStreamUrl", remoteStreamUrl);
        map.put("remoteCoverArtUrl", remoteCoverArtUrl);
        map.put("remoteCaptionsUrl", remoteCaptionsUrl);
        map.put("duration", duration);
        map.put("position", position);
        map.put("licenseInfo", settingsService.getLicenseInfo());
        map.put("user", user);
        map.put("player", player);

        ModelAndView result = super.handleRequestInternal(request, response);
        result.addObject("model", map);
        return result;
    }

    private boolean isStreamable(MediaFile file) {
        if (!StringUtils.equalsIgnoreCase("mp4", file.getFormat())) {
            return false;
        }

        // Only h264/aac/mp3 codecs are generally supported.
        MetaData metaData = videoConversionService.getVideoMetaData(file);
        if (metaData == null) {
            return true;
        }
        if (!metaData.getVideoTracks().isEmpty() && !metaData.getVideoTracks().get(0).isStreamable()) {
            return false;
        }
        if (!metaData.getAudioTracks().isEmpty() && !metaData.getAudioTracks().get(0).isStreamable()) {
            return false;
        }
        return true;
    }

    public void setMediaFileService(MediaFileService mediaFileService) {
        this.mediaFileService = mediaFileService;
    }

    public void setSettingsService(SettingsService settingsService) {
        this.settingsService = settingsService;
    }

    public void setPlayerService(PlayerService playerService) {
        this.playerService = playerService;
    }

    public void setSecurityService(SecurityService securityService) {
        this.securityService = securityService;
    }

    public void setCaptionsController(CaptionsController captionsController) {
        this.captionsController = captionsController;
    }

    public void setVideoConversionService(VideoConversionService videoConversionService) {
        this.videoConversionService = videoConversionService;
    }
}
