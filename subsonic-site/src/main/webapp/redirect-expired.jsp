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
        <h2>Trial period expired</h2>
        <p>Sorry, the trial period for <b><%= request.getParameter("redirectFrom")%>.subsonic.org</b> has expired.</p>
    </header>

    <section class="box">
        <p>
            Upgrade to <a href="premium.jsp">Subsonic Premium</a> to continue using the address, as well other extra features:
        </p>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li><a href="apps.jsp">Apps</a> for Android, iPhone, Windows Phone, Mac, Chrome and more.</li>
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

        <p style="text-align: center"><a href="premium.jsp" class="button special icon fa-arrow-right">Get Subsonic Premium</a></p>

    </section>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>