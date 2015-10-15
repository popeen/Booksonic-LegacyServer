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
    <h2>Thank You!</h2>
</header>
<div class="row">
<div class="12u">

<section class="box">

    <p>
        Thanks for upgrading to Subsonic Premium &ndash; your license key will be emailed to you shortly.
    </p>

    <p>
        If you haven't received the email within an hour, <b>remember to check your spam folder</b>. Feel free to
        <a href="mailto:mail@subsonic.org">take contact</a> if you have any questions or issues
        regarding the payment or the Subsonic license key.
    </p>

    <p>
        To install the license, click the "Get Subsonic Premium" link in the top right corner of the Subsonic web interface
        (<a href="getting-started.jsp#3">more info</a>).
    </p>

</section>
</div>
</div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>