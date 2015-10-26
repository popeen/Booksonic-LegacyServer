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
        <h2>Subsonic Premium</h2>

        <p>Only $1 per month</p>
    </header>

    <section class="box">
        <span class="image featured"><img src="inc/img/premium.jpg" alt="" /></span>
        <h3>Upgrade to Subsonic Premium to enjoy these extra features</h3>

        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li><a href="apps.jsp">Apps</a> for Android, iPhone, Windows Phone, Mac, Chrome and more*.</li>
                    <li>Video streaming.</li>
                    <li>Your personal server address: <em>yourname</em>.subsonic.org</li>
                    <li>No ads in the web interface.</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li>Stream to your Chromecast and Sonos devices.</li>
                    <li>Podcast receiver.</li>
                    <li>Play your media on compatible DLNA/UPnP devices.</li>
                    <li>Share your media on Facebook, Twitter, Google+.</li>
                    <li>Other features to be released later.</li>
                </ul>
            </div>
        </div>

        <h6>* Some apps must be purchased separately.</h6>

        <p>The basic version of Subsonic is free. In addition, the premium features are available for 30 days so
            you can try them out before deciding to upgrade.</p>

        <p>Select payment option below. You'll receive the license code by email within a few minutes.</p>
    </section>


    <section class="box special features">

        <div class="features-row">
            <section>
                <%--<span class="icon major fa-cc-paypal accent2"></span>--%>

                <h3>Recurring payment</h3>
                <h5>$1 per month</h5>

                <p>Select this option to automatically renew your Subsonic Premium subscription every year. It can be
                    <a href="faq.jsp">cancelled</a> at any time.</p>

                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" name="subscriptionForm">
                    <input type="hidden" name="cmd" value="_s-xclick">
                    <input type="hidden" name="hosted_button_id" value="SDHSJ5T5E2DC4">
                    <input type="hidden" name="lc" value="US">
                </form>
                <a onclick="document.subscriptionForm.submit()" class="button special icon fa-arrow-right">Continue to PayPal</a>
            </section>

            <section>
                <%--<span class="icon major fa-cc-paypal accent3"></span>--%>

                <h3>One-time payment</h3>
                <h5>$1 per month</h5>

                <p>Select this option to buy a Subsonic Premium subscription for <span style="white-space: nowrap">1 - 8</span>
                    years.</p>

                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" name="paymentForm">
                    <input type="hidden" name="cmd" value="_s-xclick">
                    <input type="hidden" name="hosted_button_id" value="TNL7NC2HVY5E6">
                    <input type="hidden" name="on0" value="Duration">
                    <input type="hidden" name="currency_code" value="USD">
                    <input type="hidden" name="lc" value="US">

                    <div class="select-wrapper">
                        <select name="os0">
                            <option value="1 year"> 1 year of Subsonic Premium &ndash; $12</option>
                            <option value="2 years">2 years of Subsonic Premium &ndash; $24</option>
                            <option value="3 years">3 years of Subsonic Premium &ndash; $36</option>
                            <option value="4 years">4 years of Subsonic Premium &ndash; $48</option>
                            <option value="5 years">5 years of Subsonic Premium &ndash; $60</option>
                            <option value="6 years">6 years of Subsonic Premium &ndash; $72</option>
                            <option value="7 years">7 years of Subsonic Premium &ndash; $84</option>
                            <option value="8 years">8 years of Subsonic Premium &ndash; $96</option>
                        </select>
                    </div>
                </form>
                <a onclick="document.paymentForm.submit()" class="button special icon fa-arrow-right">Continue to PayPal</a>
            </section>
        </div>

        <div class="features-row">

            <section>
                <%--<span class="icon major fa-cc-paypal accent3"></span>--%>

                <h3>Lifetime subscription</h3>
                <h5>$99</h5>

                <p>Select this option to buy a Subsonic Premium subscription that is valid for all eternity.</p>

                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" name="lifetimeForm">
                    <input type="hidden" name="cmd" value="_s-xclick">
                    <input type="hidden" name="hosted_button_id" value="RDHD4QKYSAYK8">
                    <input type="hidden" name="lc" value="US">
                </form>
                <a onclick="document.lifetimeForm.submit()" class="button special icon fa-arrow-right">Continue to PayPal</a>
            </section>

            <section class="align-left">
                <p>All payment options include free upgrades to future Subsonic releases.</p>

                <p> The Subsonic Premium license is valid for personal, non-commercial use.
                    For commercial use, please <a href="mailto:mail@subsonic.org">contact us</a> for licensing options. </p>

                <p><a href="faq.jsp">Other payment alternatives</a> are also available.</p>

                <p>Want to give an extra contribution to the project? <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=G9LP3DHYDVG6J&lc=US">Donations</a>
                    are much appreciated!</p>

                <p>If you have any questions, feel free to send an email to <a href="mailto:mail@subsonic.org">mail@subsonic.org</a></p>
            </section>

        </div>
    </section>


</section>


<%@ include file="footer.jsp" %>

</body>
</html>