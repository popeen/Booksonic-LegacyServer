<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
</head>

<body class="bgcolor2 leftframe">
<a name="top"></a>

<div style="padding-top:1em; padding-bottom:2.5em">
    <a href="help.view" target="main"><img src="<spring:theme code="logoImage"/>" title="<fmt:message key="top.help"/>" alt=""></a>
</div>

<div style="padding-bottom:1em" class="topHeader">
    <fmt:message key="top.logout" var="logout"><fmt:param value="${model.user.username}"/></fmt:message>
    <i class="fa fa-sign-out fa-lg fa-fw icon"></i>&nbsp;<a href="j_acegi_logout" target="_top">${fn:escapeXml(logout)}</a>
</div>

<c:if test="${model.user.settingsRole}">
    <div style="padding-bottom:1em" class="topHeader">
        <i class="fa fa-cog fa-lg fa-fw icon"></i>&nbsp;<a href="settings.view" target="main"><fmt:message key="top.settings"/></a>
    </div>
</c:if>

<div style="padding-bottom:1em" class="topHeader">
    <i class="fa fa-plus-square fa-lg fa-fw icon"></i>&nbsp;<a href="more.view" target="main"><fmt:message key="top.more"/></a>
</div>

<div style="padding-bottom:1em" class="topHeader">
    <i class="fa fa-info-circle fa-lg fa-fw icon"></i>&nbsp;<a href="help.view" target="main"><fmt:message key="help.title"><fmt:param value="${model.brand}"/></fmt:message></a>
</div>
</body>
</html>