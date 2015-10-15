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
        <h2>Third-party libraries</h2>
    </header>

    <section class="box">
        <h4>Subsonic uses the following licensed third-party software libraries</h4>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li>Spring Framework &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                    <li>Acegi Security &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                    <li>cglib &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                    <li>Apache Commons &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                    <li>HSQL &ndash; <a href="http://hsqldb.org/web/hsqlLicense.html">HSQL License</a></li>
                    <li>Radeox &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                    <li>Log4j &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                    <li>DWR &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li>Jaudiotagger &ndash; <a href="http://www.gnu.org/copyleft/lesser.txt">LGPL</a></li>
                    <li>JFreeChart &ndash; <a href="http://www.gnu.org/copyleft/lesser.txt">LGPL</a></li>
                    <li>JDOM &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                    <li>Ehcache &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                    <li>JLayer &ndash; <a href="http://www.gnu.org/copyleft/lesser.txt">LGPL</a></li>
                    <li>Jetty &ndash; <a href="http://www.apache.org/licenses/LICENSE-2.0.html">Apache License, Version 2.0</a></li>
                    <li>JGoodies &ndash; <a href="http://www.opensource.org/licenses/bsd-license.php">BSD</a></li>
                </ul>
            </div>
        </div>

    </section>

</section>
<%@ include file="footer.jsp" %>

</body>
</html>