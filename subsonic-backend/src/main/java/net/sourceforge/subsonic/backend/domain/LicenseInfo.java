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
 *  Copyright 2015 (C) Sindre Mehus
 */

package net.sourceforge.subsonic.backend.domain;

import java.util.Date;
import java.util.List;

/**
 * @author Sindre Mehus
 * @version $Id$
 */
public class LicenseInfo {

    // Note: Unused fields are useful when debugging.

    private final Subscription subscription;
    private final List<Payment> payments;
    private boolean licenseValid;
    private Date licenseExpires;
    private boolean blacklisted;
    private boolean whitelisted;

    public LicenseInfo(Subscription subscription, List<Payment> payments) {
        this.subscription = subscription;
        this.payments = payments;
    }

    public boolean isLicenseValid() {
        return licenseValid;
    }

    public Date getLicenseExpires() {
        return licenseExpires;
    }

    public String getFirstName() {
        if (subscription != null) {
            return subscription.getFirstName();
        }
        if (!payments.isEmpty()) {
            return payments.get(0).getPayerFirstName();
        }
        return null;
    }

    public LicenseInfo licenseExpires(Date licenseExpires) {
        this.licenseExpires = licenseExpires;
        Date now = new Date();
        licenseValid = licenseExpires == null || licenseExpires.after(now);
        return this;
    }

    public LicenseInfo blacklisted() {
        blacklisted = true;
        return this;
    }

    public LicenseInfo whitelisted() {
        whitelisted = true;
        return this;
    }
}
