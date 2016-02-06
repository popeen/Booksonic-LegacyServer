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

package net.sourceforge.subsonic.ajax;

/**
 * @author Sindre Mehus
 * @version $Id$
 */
public class VideoConversionStatus {

    private boolean statusNew;
    private boolean statusInProgress;
    private boolean statusError;
    private boolean statusCompleted;
    private Integer progressSeconds;
    private String progressString;

    public boolean isStatusNew() {
        return statusNew;
    }

    public void setStatusNew(boolean statusNew) {
        this.statusNew = statusNew;
    }

    public boolean isStatusInProgress() {
        return statusInProgress;
    }

    public void setStatusInProgress(boolean statusInProgress) {
        this.statusInProgress = statusInProgress;
    }

    public boolean isStatusError() {
        return statusError;
    }

    public void setStatusError(boolean statusError) {
        this.statusError = statusError;
    }

    public boolean isStatusCompleted() {
        return statusCompleted;
    }

    public void setStatusCompleted(boolean statusCompleted) {
        this.statusCompleted = statusCompleted;
    }

    public void setProgressSeconds(Integer progressSeconds) {
        this.progressSeconds = progressSeconds;
    }

    public Integer getProgressSeconds() {
        return progressSeconds;
    }

    public void setProgressString(String progressString) {
        this.progressString = progressString;
    }

    public String getProgressString() {
        return progressString;
    }
}
