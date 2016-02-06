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

<body class="landing">

<c:import url="header.jsp">
    <c:param name="transparent" value="true"/>
</c:import>

<%--Banner--%>
<section id="banner">
    <h2>Subsonic</h2>
    <p>Your complete, personal media streamer.</p>
    <ul class="actions">
        <li><a href="download.jsp" class="button special">Download</a></li>
        <li><a href="#learnmore" class="button">Learn more</a></li>
    </ul>
</section>

<!-- Main -->
<section id="main" class="container">

    <a name="learnmore"></a>
    <section class="box special">
        <header class="major">
            <h2>Stream from your own computer.<br>Your media &mdash; your terms.</h2>
            <p>Enjoy your music and movies everywhere.<br>Share with family and friends.</p>
        </header>
        <span class="image featured"><img src="inc/img/premium.jpg" alt="" /></span>
    </section>

<%--<section class="box special features">--%>
        <%--<div class="features-row">--%>
            <%--<section>--%>
                <%--<span class="icon major fa-bolt accent2"></span>--%>
                <%--<h3>Magna etiam</h3>--%>
                <%--<p>Integer volutpat ante et accumsan commophasellus sed aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis accumsan dolore magna aliquam veroeros.</p>--%>
            <%--</section>--%>
            <%--<section>--%>
                <%--<span class="icon major fa-area-chart accent3"></span>--%>
                <%--<h3>Ipsum dolor</h3>--%>
                <%--<p>Integer volutpat ante et accumsan commophasellus sed aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis accumsan dolore magna aliquam veroeros.</p>--%>
            <%--</section>--%>
        <%--</div>--%>
        <%--<div class="features-row">--%>
            <%--<section>--%>
                <%--<span class="icon major fa-cloud accent4"></span>--%>
                <%--<h3>Sed feugiat</h3>--%>
                <%--<p>Integer volutpat ante et accumsan commophasellus sed aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis accumsan dolore magna aliquam veroeros.</p>--%>
            <%--</section>--%>
            <%--<section>--%>
                <%--<span class="icon major fa-lock accent5"></span>--%>
                <%--<h3>Enim phasellus</h3>--%>
                <%--<p>Integer volutpat ante et accumsan commophasellus sed aliquam feugiat lorem aliquet ut enim rutrum phasellus iaculis accumsan dolore magna aliquam veroeros.</p>--%>
            <%--</section>--%>
        <%--</div>--%>
    <%--</section>--%>

    <div class="row">

        <div class="6u 12u(2)">
            <section class="box special">
                <span class="image featured"><img src="inc/img/screenshot-1.png" alt="" style="background:#808080; background:linear-gradient(#808080, #353535)"/></span>
                <h3>Packed with features</h3>
                <p>Podcast receiver, Chromecast, Sonos, jukebox mode, on-the-fly downsampling and conversion,
                    multiple frontends, highly customizable, full support for tags, lyrics and album art, DLNA,
                    open REST API, ...</p>

                <ul class="actions">
                    <li><a href="features.jsp" class="button alt">See all features</a></li>
                </ul>
            </section>
        </div>

        <div class="6u 12u(2)">
            <section class="box special">
                <span class="image featured"><img src="inc/img/road.jpg" alt="" /></span>
                <h3>Don't leave home without it</h3>
                <p>Apps available for Android, iPhone, Windows Phone, Chrome and many more.</p>

                <div style="height:3.3em;"></div>

                <ul class="actions">
                    <li><a href="apps.jsp" class="button alt">See all apps</a></li>
                </ul>
            </section>
        </div>

    </div>

    <section class="box ">

        <div class="row">
            <div class="6u 12u(3)">

                    <h3 class="align-center">How does it work?</h3>
                    <ol>
                        <li>Install the Subsonic server app where you keep your media.</li>
                        <li>Use a browser on any computer to play music and movies.</li>
                        <li>(Optional) Get an app for your phone.</li>
                    </ol>
                    <ul class="actions align-center">
                        <li><a href="help.jsp" class="button alt">Learn more</a></li>
                    </ul>
            </div>
            <div class="6u 12u(3)">
                <span class="image right"><a href="inc/img/screenshot-2.png"><img src="inc/img/screenshot-2.png" class="dropshadow" alt=""
                                                                                  style="max-width:100%"/></a></span>
            </div>
        </div>

    </section>

</section>

<!-- CTA -->
<section id="cta">


    <h2>Ready to go?</h2>
    <p>Available for Windows, Mac, Linux and more.</p>

    <ul class="actions">
        <li><a href="download.jsp" class="button">OK, I'm convinced</a></li>
        <li><a href="demo.jsp" class="button">Show me the demo first</a></li>
    </ul>

</section>

<%@ include file="footer.jsp" %>

</body>
</html>