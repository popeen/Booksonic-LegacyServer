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
        <h2>Subsonic Apps</h2>

        <p>For Android, iPhone, Windows Phone, Mac, Chrome and more</p>
    </header>

    <section class="box">
        <span class="image featured"><img src="inc/img/desk.jpg" alt="" /></span>
        <h3>Subsonic App Gallery</h3>

        <p>A variety of Subsonic apps provide fun and alternative ways to enjoy your media collection &ndash; no matter where you are.</p>

        <h4 class="icon fa-mobile-phone">&nbsp;&nbsp;On your phone</h4>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li><a href="#android">Subsonic</a> for Android</li>
                    <li><a href="#dsub">DSub</a> for Android</li>
                    <li><a href="#xenoamp">XenoAmp</a> for Android</li>
                    <li><a href="#substreamer">SubStreamer</a> for Android</li>
                    <li><a href="#submuxic">Sub Muxic</a> for Android</li>
                    <li><a href="#winphone">Subsonic</a> for Windows Phone</li>
                    <li><a href="#silversonic">SilverSonic</a> for Windows Phone</li>
                    <li><a href="#sonicstreamer">SonicStreamer</a> for Windows Phone</li>
                    <li><a href="#subsonar">SubSonar</a> for BlackBerry</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li><a href="#isub">iSub</a> for iPhone/iPad</li>
                    <li><a href="#audiophone">Audiophone</a> for iPhone/iPad</li>
                    <li><a href="#zsubsonic">Z-Subsonic</a> for iPhone/iPad</li>
                    <li><a href="#substream">SubStream</a> for iPhone/iPad</li>
                    <%--<li><a href="#hypersonic">Hypersonic</a> for iPhone/iPad</li>--%>
                    <li><a href="#substreamer">SubStreamer</a> for iPhone/iPad</li>
                    <li><a href="#subhub">SubHub</a> for iPhone/iPad</li>
                    <li><a href="#avsub">AVSub</a> for iPhone/iPad</li>
                    <li><a href="#soundwaves">Soundwaves</a> for iPhone/iPad</li>
                    <li><a href="#playsub">play:Sub</a> for iPhone/iPad</li>
                </ul>
            </div>
        </div>

        <h4 class="icon fa-tablet">&nbsp;&nbsp;On your device</h4>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li><a href="#sonicair">SonicAir</a> for BlackBerry PlayBook</li>
                    <li><a href="#mmtm">My Music To Me</a> for Sonos</li>
                    <%--<li><a href="#chumby">Subsonic</a> for Chumby</li>--%>
                    <li><a href="#subsonictv">SubsonicTV</a> for Roku</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li><a href="#subsonicchannel">Subsonic Channel</a> for Roku</li>
                    <li><a href="#xo">XO</a> for webOS and BlackBerry PlayBook</li>
                </ul>
            </div>
        </div>

        <h4 class="icon fa-desktop">&nbsp;&nbsp;On your desktop</h4>

        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li><a href="#subair">SubAir</a> for desktops</li>
                    <li><a href="#submariner">Submariner</a> for Mac</li>
                    <li><a href="#thumper">Thumper</a> for Mac</li>
                    <li><a href="#subclient">Subclient</a> for Windows</li>
                    <li><a href="#subgadget">SubGadget</a> for Windows</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li><a href="#subwiji">SubWiji</a> for Windows</li>
                    <li><a href="#supersonic">Supersonic</a> for Windows 8</li>
                    <li><a href="#subsonic8">Subsonic8</a> for Windows 8</li>
                    <li><a href="#sonicstreamer">SonicStreamer</a> for Windows 8</li>
                </ul>
            </div>
        </div>

        <h4 class="icon fa-html5">&nbsp;&nbsp;In your browser</h4>

        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li><a href="#jamstash">Jamstash</a> for HTML5 and Chrome</li>
                    <li><a href="#subfire">SubFire</a> for HTML5, Chrome and Amazon Fire</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li><a href="#perisonic">Perisonic</a> for Chrome</li>
                    <li><a href="#polysonic">Polysonic</a> for Chrome</li>
                </ul>
            </div>
        </div>

            <p>
                Please note that most of the apps are made by third-party developers, and are not maintained by
            the Subsonic project. Some apps are commercial, while some are available for free.
        </p>
        <p>Also note that after a 30-day trial period you need to upgrade to <a href="premium.jsp">Subsonic Premium</a> to use the apps.
            By upgrading you also get <a href="premium.jsp">other benefits</a>.
        </p>
        <p>
           Want to make your own Subsonic app? Check out the <a href="api.jsp">API</a>.
        </p>

    </section>

    <%@ include file="apps-android.jsp" %>
    <%@ include file="apps-dsub.jsp" %>
    <%@ include file="apps-xenoamp.jsp" %>
    <%@ include file="apps-substreamer.jsp" %>
    <%@ include file="apps-submuxic.jsp" %>
    <%@ include file="apps-winphone.jsp" %>
    <%@ include file="apps-silversonic.jsp" %>
    <%@ include file="apps-sonicstreamer.jsp" %>
    <%@ include file="apps-subsonar.jsp" %>

    <%@ include file="apps-isub.jsp" %>
    <%@ include file="apps-audiophone.jsp" %>
    <%@ include file="apps-zsubsonic.jsp" %>
    <%@ include file="apps-substream.jsp" %>
    <%@ include file="apps-subhub.jsp" %>
    <%@ include file="apps-avsub.jsp" %>
    <%@ include file="apps-soundwaves.jsp" %>
    <%@ include file="apps-playsub.jsp" %>

    <%@ include file="apps-sonicair.jsp" %>
    <%@ include file="apps-mmtm.jsp" %>
    <%@ include file="apps-subsonictv.jsp" %>
    <%@ include file="apps-subsonicchannel.jsp" %>
    <%@ include file="apps-xo.jsp" %>

    <%@ include file="apps-subair.jsp" %>
    <%@ include file="apps-submariner.jsp" %>
    <%@ include file="apps-thumper.jsp" %>
    <%@ include file="apps-subclient.jsp" %>
    <%@ include file="apps-subgadget.jsp" %>
    <%@ include file="apps-subwiji.jsp" %>
    <%@ include file="apps-supersonic.jsp" %>
    <%@ include file="apps-subsonic8.jsp" %>

    <%@ include file="apps-jamstash.jsp" %>
    <%@ include file="apps-subfire.jsp" %>
    <%@ include file="apps-perisonic.jsp" %>
    <%@ include file="apps-polysonic.jsp" %>

</section>


<%@ include file="footer.jsp" %>

</body>
</html>