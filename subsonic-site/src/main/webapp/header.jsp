<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
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
<%@ include file="include.jsp"%>

<header id="header" class="${param.transparent ? 'alt' : 'skel-layers-fixed'}">
    <h1>

        <a href="index.jsp"><span class="image left"><img src="inc/img/subsonic_logo.png" alt="" style="height: 50px"/></span>
            Subsonic</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;... easy listening</h1>

    <nav id="nav">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="premium.jsp">Premium</a></li>
            <li><a href="apps.jsp">Apps</a></li>
            <li><a href="sonos.jsp">Sonos</a></li>
            <li><a href="demo.jsp">Demo</a></li>

            <li>
                <a href="help.jsp" class="icon fa-angle-down">Help</a>
                <ul>
                    <li><a href="installation.jsp">How to Install</a></li>
                    <li><a href="getting-started.jsp">Getting Started</a></li>
                    <li><a href="features.jsp">Features</a></li>
                    <li><a href="faq.jsp">FAQ</a></li>
                    <li><a href="http://forum.subsonic.org/forum/index.php">Forum</a></li>
                    <li>
                        <a href="">More...</a>
                        <ul>
                            <li><a href="changelog.jsp">Change Log</a></li>
                            <li><a href="transcoding.jsp">Transcoding Settings</a></li>
                            <li><a href="translate.jsp">How to Translate</a></li>
                        </ul>
                    </li>
                </ul>
            </li>

            <li><a href="api.jsp">API</a></li>
            <li><a href="download.jsp" class="button icon fa-download">Download</a></li>
        </ul>
    </nav>
</header>
