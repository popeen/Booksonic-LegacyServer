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
  ~  Copyright 2015 (C) Sindre Mehus
  --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="main.view" var="changeViewUrl">
    <c:param name="id" value="${model.dir.id}"/>
    <c:param name="viewAsList" value="${not model.viewAsList}"/>
</c:url>


<h1 style="padding-right:1em">
    <c:choose>
        <c:when test="${model.viewAsList}">
            <i class="fa fa-bars fa-fw headerSelected clickable"></i>
            <i class="fa fa-th-large fa-fw clickable" onclick="location.href='${changeViewUrl}'"></i>
        </c:when>
        <c:otherwise>
            <i class="fa fa-bars fa-fw clickable" onclick="location.href='${changeViewUrl}'"></i>
            <i class="fa fa-th-large fa-fw headerSelected clickable"></i>
        </c:otherwise>
    </c:choose>
</h1>

