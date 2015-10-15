<%@ page import="java.util.Random" %>
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
        <h2>Subsonic Live Demo</h2>

        <%
            Random random = new Random(System.currentTimeMillis());
            int userId = random.nextInt(5) + 1;
        %>
        <p><a href="http://demo.subsonic.org/login.view?user=guest<%=userId%>&password=guest" class="button special icon fa-arrow-right" target="_blank">Go to demo site</a></p>
    </header>

    <section class="box">
        <span class="image featured"><img src="inc/img/demo.jpg" alt="" /></span>
        <p> Not all Subsonic's features are available in the demo version. For instance, application settings can not be viewed
            or changed, and video streaming is not available.</p>

        <p>All the music in the demo is free, and courtesy of <a href="http://www.jamendo.com/" target="_blank">Jamendo</a> and the respective artists.</p>
    </section>

</section>


<%@ include file="footer.jsp" %>

</body>
</html>