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
        <h2>Subsonic Help</h2>
    </header>

    <section class="box">
        <div class="row">
            <div class="6u 12u(3)">

                <p><strong><a href="installation.jsp">How to install</a></strong><br>
                    How to install Subsonic on Windows, Mac, Linux and other platforms.</p>

                <p><strong><a href="getting-started.jsp">Getting started</a></strong><br>
                    How to set up music folders, remote access etc.</p>

                <p><strong><a href="faq.jsp">FAQ</a></strong><br>
                    Frequently asked questions.</p>

                <p><strong><a href="changelog.jsp">Change log</a></strong><br>
                    See what's new in the latest version.</p>

            </div>
            <div class="6u 12u(3)">

                <p><strong><a href="forum.jsp">Forum</a></strong><br>
                    Discuss and ask questions to fellow users. Roughly 30 new posts per day.</p>

                <p><strong><a href="transcoding.jsp">Transcoding</a></strong><br>
                    Detailed documentation of how Subsonic automatically converts between music formats.</p>

                <p><strong><a href="translate.jsp">Translation</a></strong><br>
                    How to translate Subsonic to a new language.</p>

                <p><strong><a href="api.jsp">API documentation</a></strong><br>
                    How to access Subsonic using the REST API. (For developers)</p>
            </div>
        </div>
    </section>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>