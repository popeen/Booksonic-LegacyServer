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

package net.sourceforge.subsonic.backend.service;

import java.util.Date;
import java.util.List;

import net.sourceforge.subsonic.backend.Util;
import net.sourceforge.subsonic.backend.dao.PaymentDao;
import net.sourceforge.subsonic.backend.dao.SubscriptionDao;
import net.sourceforge.subsonic.backend.domain.LicenseInfo;
import net.sourceforge.subsonic.backend.domain.Payment;
import net.sourceforge.subsonic.backend.domain.Subscription;

/**
 * @author Sindre Mehus
 */
public class LicenseService {

    private PaymentDao paymentDao;
    private SubscriptionDao subscriptionDao;

    public LicenseInfo getLicenseInfo(String email) {
        Subscription subscription = subscriptionDao.getSubscriptionByEmail(email);
        List<Payment> payments = paymentDao.getPaymentsByEmail(email);
        LicenseInfo licenseInfo = new LicenseInfo(subscription, payments);

        if (email == null) {
            return licenseInfo;
        }

        if (paymentDao.isBlacklisted(email)) {
            return licenseInfo.blacklisted();
        }

        if (paymentDao.isWhitelisted(email)) {
            return licenseInfo.whitelisted().licenseExpires(paymentDao.getWhitelistExpirationDate(email));
        }

        if (subscription == null && payments.isEmpty()) {
            return licenseInfo;
        }

        return licenseInfo.licenseExpires(getExpirationDate(subscription, payments));
    }

    private Date getExpirationDate(Subscription subscription, List<Payment> payments) {
        Date expirationDate = subscription == null ? null : subscription.getValidTo();

        for (Payment payment : payments) {
            if (payment.getValidTo() == null) {
                return null;
            }
            expirationDate = Util.latest(expirationDate, payment.getValidTo());
        }
        return expirationDate;
    }

    public void setPaymentDao(PaymentDao paymentDao) {
        this.paymentDao = paymentDao;
    }

    public void setSubscriptionDao(SubscriptionDao subscriptionDao) {
        this.subscriptionDao = subscriptionDao;
    }
}
