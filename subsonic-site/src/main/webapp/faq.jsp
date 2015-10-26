<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>
<%--
  ~ This file is part of Subsonic.
  ~
  ~  Subsonic is free software: you can redistribute it and/or modify
  ~  it under the terms of the GNU General Public License as published by
  ~  the Free Software Foundation, either version 3 of the License, or
  ~  (at your option) any later version.
  ~
  ~  Subsonic is distributed in the hope that it will be useful,
  ~  but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~  GNU General Public License for more details.
  ~
  ~  You should have received a copy of the GNU General Public License
  ~  along with Subsonic.  If not, see <http://www.gnu.org/licenses/>.
  ~
  ~  Copyright 2014 (C) Sindre Mehus
  --%>

<!DOCTYPE HTML>
<html>
<%@ include file="head.jsp" %>

<body>

<c:import url="header.jsp"/>

<section id="main" class="container">
<header>
    <h2>Frequently Asked Questions</h2>
</header>
<div class="row">
<div class="12u">

<section class="box">

    <h3>Are there other payment options than PayPal?</h3>
    <p>Yes, you can use any of the following alternatives:</p>
    <ul>
        <li>Make a payment to <strong>mail@subsonic.org</strong> on <a href="http://www.skrill.com/" target="_blank">Skrill</a>.</li>
        <li>Bitcoins are welcome on <strong>16BzYq6HXPkCYdDaafpQWiaJqmqUfnYmFA</strong></li>
        <li>Transfer money to our bank account; please <a href="mailto:mail@subsonic.org">contact us</a> for bank details.</li>
    </ul>
    <p>
        The price is always the same, $1 per month, so if you pay for instance the equivalent of $12 your license
        will be valid for 12 months. For Bitcoin payments, please find the conversion rate on
        <a href="http://preev.com" target="_blank">preev.com</a>, and send us an <a href="mailto:mail@subsonic.org">email</a>
        after you made the payment to let us know where to send the license key.
    </p>

    <h3>How long does it take to get the license after I have made the payment?</h3>
    <p>Normally no more than ten minutes.  If it should take longer, please <a href="mailto:mail@subsonic.org">take contact</a>,
        but please check your spam filter first.</p>

    <h3>How do I install the license key I received by email?</h3>
    <p>Please follow the guide in the <a href="getting-started.jsp#3">Getting Started</a> documentation.</p>

    <h3>How do I cancel a recurring payment?</h3>
    <p>Logon to your PayPal account, then select My Profile &gt; My Money &gt; My preapproved payments. Here you can cancel the recurring payment.</p>

    <h3>I can't access my Subsonic server from the internet or from my phone.</h3>
    <p>Please follow the guide in the <a href="getting-started.jsp#2">Getting Started</a> documentation.</p>

    <h3>Why doesn't Subsonic find media on mapped network disks?</h3>
    <p>You might have to configure the Subsonic Windows service, please see the <a href="getting-started.jsp#1">Getting Started</a> documentation.</p>

    <h3>I forgot my Subsonic password. Can it be retrieved?</h3>
    <p>Yes. Please read <a href="http://forum.subsonic.org/forum/viewtopic.php?t=3770">this forum post</a>.</p>

    <h3>I've lost my license key. Can I have it resent?</h3>
    <p>Yes. Please go <a href="http://subsonic.org/backend/requestLicense.view">here</a>.</p>

</section>
</div>
</div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>