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
        <h2>Subsonic Hosting</h2>
    </header>

    <section class="box special features">

        <div class="features-row">
            <section>
                <span class="icon major fa-cloud accent4"></span>

                <h3>HostingVideo</h3>

                <p>Store all of your media, music and video files in the cloud and stream via the web or to any mobile phone.</p>

                <p>Storage options from 50 GB to 500 GB, all with unlimited bandwidth. Try Video Hosting for 30 days free.</p>

                <a href="https://hostingvideo.com/" target="_blank" class="button special icon fa-arrow-right">Continue</a>

            </section>
            <section>
                <span class="icon major fa-cloud accent3"></span>

                <h3>GigaPros</h3>

                <p>GigaPros' Subsonic hosting servers are powerful Virtual Private Servers (VPS), which are highly optimized to run Subsonic.</p>

                <p>Servers come with pre-installed Subsonic and behave exactly like your own Dedicated Server with full root access.</p>

                <a href="https://www.gigapros.com/portal/subsonic-server/" target="_blank" class="button special icon fa-arrow-right">Continue</a>

            </section>
        </div>
    </section>


</section>


<%@ include file="footer.jsp" %>

</body>
</html>