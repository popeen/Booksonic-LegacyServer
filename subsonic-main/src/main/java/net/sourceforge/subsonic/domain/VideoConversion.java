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

package net.sourceforge.subsonic.domain;

import java.util.Date;

/**
 * @author Sindre Mehus
 * @version $Id$
 */
public class VideoConversion {

    private Integer id;
    private int mediaFileId;
    private Integer audioTrackId;
    private String username;
    private Status status;
    private final Integer progressSeconds;
    private Date created;
    private Date changed;
    private Date started;

    public VideoConversion(Integer id, int mediaFileId, Integer audioTrackId, String username, Status status,
                           Integer progressSeconds, Date created, Date changed, Date started) {
        this.id = id;
        this.mediaFileId = mediaFileId;
        this.audioTrackId = audioTrackId;
        this.username = username;
        this.status = status;
        this.progressSeconds = progressSeconds;
        this.created = created;
        this.changed = changed;
        this.started = started;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getMediaFileId() {
        return mediaFileId;
    }

    public void setMediaFileId(int mediaFileId) {
        this.mediaFileId = mediaFileId;
    }

    public Integer getAudioTrackId() {
        return audioTrackId;
    }

    public void setAudioTrackId(Integer audioTrackId) {
        this.audioTrackId = audioTrackId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Integer getProgressSeconds() {
        return progressSeconds;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getChanged() {
        return changed;
    }

    public void setChanged(Date changed) {
        this.changed = changed;
    }

    public Date getStarted() {
        return started;
    }

    public void setStarted(Date started) {
        this.started = started;
    }

    public enum Status {
        NEW,
        IN_PROGRESS,
        ERROR,
        COMPLETED
    }
}
