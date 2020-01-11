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

<%-- Uncomment if beta is available.--%>
<c:set var="beta" value="1.2.release"/>
<c:set var="stable" value="5.3"/>

<body>

<c:import url="header.jsp"/>

<section id="main" class="container">
    <header>
        <h2>Download Subsonic</h2>
    </header>
    <div class="row">
        <div class="12u">

            <section class="box">

                <div class="table-wrapper">
                    <table>
                        <tbody>
                        <tr>
                            <td class="icon fa-windows">&nbsp;&nbsp;Windows</td>
                            <td><a href="download2.jsp?target=subsonic-${stable}-setup.exe"
                                   class="button small special icon fa-download">Subsonic ${stable}</a>
                                <c:if test="${not empty beta}">
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="download2.jsp?target=subsonic-${beta}-setup.exe"
                                                           class="button small alt icon fa-download">Subsonic ${beta}</a>
                                </c:if>
                            <td><a href="installation.jsp#windows" class="button small">Instructions</a></td>
                        </tr>
                        <tr>
                            <td class="icon fa-apple">&nbsp;&nbsp;Mac OS X</td>
                            <td><a href="download2.jsp?target=subsonic-${stable}.pkg"
                                   class="button small special icon fa-download">Subsonic ${stable}</a>
                                <c:if test="${not empty beta}">
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="download2.jsp?target=subsonic-${beta}.pkg"
                                                           class="button small alt icon fa-download">Subsonic ${beta}</a>
                                </c:if>
                            <td><a href="installation.jsp#mac" class="button small">Instructions</a></td>
                        </tr>
                        <tr>
                            <td class="icon fa-linux">&nbsp;&nbsp;Debian / Ubuntu</td>
                            <td><a href="download2.jsp?target=subsonic-${stable}.deb"
                                   class="button small special icon fa-download">Subsonic ${stable}</a>
                                <c:if test="${not empty beta}">
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="download2.jsp?target=subsonic-${beta}.deb"
                                                           class="button small alt icon fa-download">Subsonic ${beta}</a>
                                </c:if>
                            <td><a href="installation.jsp#debian" class="button small">Instructions</a></td>
                        </tr>
                        <tr>
                            <td class="icon fa-linux">&nbsp;&nbsp;Red Hat / Fedora</td>
                            <td><a href="download2.jsp?target=subsonic-${stable}.rpm"
                                   class="button small special icon fa-download">Subsonic ${stable}</a>
                                <c:if test="${not empty beta}">
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="download2.jsp?target=subsonic-${beta}.rpm"
                                                           class="button small alt icon fa-download">Subsonic ${beta}</a>
                                </c:if>
                            <td><a href="installation.jsp#rpm" class="button small">Instructions</a></td>
                        </tr>
                        <tr>
                            <td class="icon fa-archive">&nbsp;&nbsp;Stand-alone version (all platforms)</td>
                            <td><a href="download2.jsp?target=subsonic-${stable}-standalone.tar.gz"
                                   class="button small special icon fa-download">Subsonic ${stable}</a>
                                <c:if test="${not empty beta}">
                                &nbsp;&nbsp;&nbsp;&nbsp;<a
                                        href="download2.jsp?target=subsonic-${beta}-standalone.tar.gz"
                                        class="button small alt icon fa-download">Subsonic ${beta}</a>
                                </c:if>
                            <td><a href="installation.jsp#standalone" class="button small">Instructions</a></td>
                        </tr>
                        <tr>
                            <td class="icon fa-coffee">&nbsp;&nbsp;WAR version (all platforms)</td>
                            <td><a href="download2.jsp?target=subsonic-${stable}-war.zip"
                                   class="button small special icon fa-download">Subsonic ${stable}</a>
                                <c:if test="${not empty beta}">
                                &nbsp;&nbsp;&nbsp;&nbsp;<a href="download2.jsp?target=subsonic-${beta}-war.zip"
                                                           class="button small alt icon fa-download">Subsonic ${beta}</a>
                                </c:if>
                            <td><a href="installation.jsp#war" class="button small">Instructions</a></td>
                        </tr>
                        </tbody>
                        <tfoot>
                        <tr>
                            <td colspan="2"></td>
                            <td><a href="changelog.jsp">What's new?</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a target="_blank" href="https://sourceforge.net/projects/subsonic/files/subsonic/">Older versions</a></td>
                        </tr>
                        </tfoot>
                    </table>
                </div>

                <h3>Hosting</h3>

                <p>
                    If you don't want to install and configure Subsonic on your own computer you can get a pre-installed
                    Subsonic server,
                    which works immediately out-of-the-box, from one of our affiliated hosting providers.
                    <a href="hosting.jsp">Read more about their Subsonic hosting offers</a>.
                </p>

                <h3>Terms of use</h3>

                <p>
                    <span class="image right"><img src="inc/img/gpl.png" alt=""/></span>
                    Subsonic is open-source software licensed under the <a href="http://www.gnu.org/copyleft/gpl.html">GNU
                    General Public License</a>.
                    Please note that Subsonic is <em>not</em> a tool for illegal distribution of copyrighted material.
                    Always pay attention to and
                    follow the relevant laws specific to your country.
                </p>
            </section>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>