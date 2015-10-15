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
package net.sourceforge.subsonic.backend.controller;

import net.sourceforge.subsonic.backend.dao.PaymentDao;
import net.sourceforge.subsonic.backend.dao.SubscriptionDao;
import net.sourceforge.subsonic.backend.domain.Payment;
import net.sourceforge.subsonic.backend.domain.ProcessingStatus;
import net.sourceforge.subsonic.backend.domain.Subscription;
import net.sourceforge.subsonic.backend.domain.SubscriptionNotification;
import net.sourceforge.subsonic.backend.domain.SubscriptionPayment;
import net.sourceforge.subsonic.backend.service.LicenseService;

import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.HttpConnectionParams;
import org.apache.log4j.Logger;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Processes IPNs (Instant Payment Notifications) from PayPal.
 *
 * @author Sindre Mehus
 */
public class IPNController implements Controller {

    private static final Logger LOG = Logger.getLogger(IPNController.class);

    private static final String PAYPAL_URL = "https://www.paypal.com/cgi-bin/webscr";
    private static final Pattern SUBSCRIPTION_DURATION_PATTERN = Pattern.compile("(\\d+) year(s)?");

    private LicenseService licenseService;
    private PaymentDao paymentDao;
    private SubscriptionDao subscriptionDao;

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {

            LOG.info("Incoming IPN from " + request.getRemoteAddr());

            String url = createValidationURL(request);
            if (validate(url)) {
                LOG.info("Verified payment. " + url);
            } else {
                LOG.warn("Failed to verify payment. " + url);
            }
            processIpnRequest(request);

            return null;
        } catch (Exception x) {
            LOG.error("Failed to process IPN.", x);
            throw x;
        }
    }

    private void processIpnRequest(HttpServletRequest request) throws ServletRequestBindingException {
        if (isSubscriptionRequest(request)) {
            processSubscriptionRequest(request);
        } else {
            processPaymentRequest(request);
        }
    }

    private void processSubscriptionRequest(HttpServletRequest request) throws ServletRequestBindingException {
        createSubscriptionNotification(request);
        if (isSubscriptionPayment(request)) {
            processSubscriptionPayment(request);
        }
    }

    private Subscription getOrCreateSubscription(HttpServletRequest request) {
        String email = request.getParameter("payer_email");
        Subscription subscription = subscriptionDao.getSubscriptionByEmail(email);
        if (subscription != null) {
            return subscription;
        }

        Date now = new Date();
        subscription = new Subscription(null,
                request.getParameter("subscr_id"),
                request.getParameter("payer_id"),
                request.getParameter("btn_id"),
                email,
                request.getParameter("first_name"),
                request.getParameter("last_name"),
                request.getParameter("residence_country"),
                now,
                null,
                ProcessingStatus.NEW,
                now,
                now);
        subscriptionDao.createSubscription(subscription);
        return subscriptionDao.getSubscriptionByEmail(email);
    }

    private boolean isSubscriptionRequest(HttpServletRequest request) {
        String txnType = request.getParameter("txn_type");
        return txnType.startsWith("subscr_");
    }

    private boolean isSubscriptionPayment(HttpServletRequest request) {
        String txnType = request.getParameter("txn_type");
        return txnType.equals("subscr_payment");
    }

    private void processSubscriptionPayment(HttpServletRequest request) throws ServletRequestBindingException {
        String subscrId = request.getParameter("subscr_id");
        String payerId = request.getParameter("payer_id");
        String btnId = request.getParameter("btn_id");
        String ipnTrackId = request.getParameter("ipn_track_id");
        String txnId = request.getParameter("txn_id");
        String currency = request.getParameter("mc_currency");
        String email = request.getParameter("payer_email");
        Double amount = ServletRequestUtils.getDoubleParameter(request, "mc_gross");
        Double fee = ServletRequestUtils.getDoubleParameter(request, "mc_fee");
        Date created = new Date();

        LOG.info("Received subscription payment of " + amount + " " + currency + " from " + email);

        subscriptionDao.createSubscriptionPayment(new SubscriptionPayment(null, subscrId, payerId, btnId,
                ipnTrackId, txnId, email, amount, fee, currency, created));

        // Extend subscription validity with one year.
        Subscription subscription = getOrCreateSubscription(request);
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.YEAR, 1);
        subscription.setValidTo(cal.getTime());
        subscription.setUpdated(new Date());
        subscriptionDao.updateSubscription(subscription);
    }

    private void createSubscriptionNotification(HttpServletRequest request) {
        String subscrId = request.getParameter("subscr_id");
        String payerId = request.getParameter("payer_id");
        String btnId = request.getParameter("btn_id");
        String ipnTrackId = request.getParameter("ipn_track_id");
        String txnType = request.getParameter("txn_type");
        String email = request.getParameter("payer_email");
        Date created = new Date();

        LOG.info("Received subscription notification " + txnType + " from " + email);

        subscriptionDao.createSubscriptionNotification(new SubscriptionNotification(null, subscrId, payerId, btnId,
                ipnTrackId, txnType, email, created));
    }

    private void processPaymentRequest(HttpServletRequest request) {
        String item = request.getParameter("item_number");
        if (item == null) {
            item = request.getParameter("item_number1");
        }
        String paymentStatus = request.getParameter("payment_status");
        String paymentType = request.getParameter("payment_type");
        int paymentAmount = Math.round(new Float(request.getParameter("mc_gross")));
        String paymentCurrency = request.getParameter("mc_currency");
        String txnId = request.getParameter("txn_id");
        String txnType = request.getParameter("txn_type");
        String payerEmail = request.getParameter("payer_email");
        String payerFirstName = request.getParameter("first_name");
        String payerLastName = request.getParameter("last_name");
        String payerCountry = request.getParameter("residence_country");

        // Update of an existing transaction?
        Payment paymentForTx = paymentDao.getPaymentByTransactionId(txnId);
        if (paymentForTx != null) {
            paymentForTx.setPaymentStatus(paymentStatus);
            paymentForTx.setLastUpdated(new Date());
            paymentDao.updatePayment(paymentForTx);

        } else if (isDonation(item)) {
            // TODO: insert into separate donation table?
            LOG.info("Received donation of " + paymentCurrency + " " + paymentAmount + " from " + payerEmail);

        } else {
            Date validTo = computeValidTo(payerEmail, request, item);

            Payment newPayment = new Payment(null, txnId, txnType, item, paymentType, paymentStatus,
                    paymentAmount, paymentCurrency, payerEmail, payerFirstName, payerLastName,
                    payerCountry, ProcessingStatus.NEW, validTo, new Date(), new Date());
            paymentDao.createPayment(newPayment);
        }
    }

    private boolean isDonation(String item) {
        return "sub-donation".equals(item);
    }

    private Date computeValidTo(String email, HttpServletRequest request, String item) {
        if ("sub-pre-lifetime".equals(item)) {
            return null;
        }

        String duration = request.getParameter("option_selection1");
        if (duration == null) {
            // TODO: Consider amount
            return null; // Old-school donation. Use no end date.
        }
        Matcher matcher = SUBSCRIPTION_DURATION_PATTERN.matcher(duration);
        if (!matcher.matches()) {
            throw new IllegalArgumentException("Invalid subscription duration: " + duration);
        }

        int years = Integer.parseInt(matcher.group(1));
        Calendar validTo = Calendar.getInstance();

        // If payment exists, add to the existing end date.
        Date licenseExpires = licenseService.getLicenseInfo(email).getLicenseExpires();
        if (licenseExpires != null && licenseExpires.after(validTo.getTime())) {
            validTo.setTime(licenseExpires);
        }

        validTo.add(Calendar.YEAR, years);
        return validTo.getTime();
    }

    private String createValidationURL(HttpServletRequest request) throws UnsupportedEncodingException {
        Enumeration<?> en = request.getParameterNames();
        StringBuilder url = new StringBuilder(PAYPAL_URL).append("?cmd=_notify-validate");
        String encoding = request.getParameter("charset");
        if (encoding == null) {
            encoding = "ISO-8859-1";
        }

        while (en.hasMoreElements()) {
            String paramName = (String) en.nextElement();
            String paramValue = request.getParameter(paramName);
            url.append("&").append(paramName).append("=").append(URLEncoder.encode(paramValue, encoding));
        }

        return url.toString();
    }

    private boolean validate(String url) throws Exception {
        HttpClient client = new DefaultHttpClient();
        HttpConnectionParams.setConnectionTimeout(client.getParams(), 60000);
        HttpConnectionParams.setSoTimeout(client.getParams(), 60000);
        HttpGet method = new HttpGet(url);
        String content;
        try {
            ResponseHandler<String> responseHandler = new BasicResponseHandler();
            content = client.execute(method, responseHandler);

            LOG.info("Validation result: " + content);
            return "VERIFIED".equals(content);
        } finally {
            client.getConnectionManager().shutdown();
        }
    }

    public void setPaymentDao(PaymentDao paymentDao) {
        this.paymentDao = paymentDao;
    }

    public void setSubscriptionDao(SubscriptionDao subscriptionDao) {
        this.subscriptionDao = subscriptionDao;
    }

    public void setLicenseService(LicenseService licenseService) {
        this.licenseService = licenseService;
    }
}

