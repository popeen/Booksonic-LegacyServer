<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>

<html>
<head>
    <%@ include file="head.jsp" %>
    <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
</head>
<body class="mainframe bgcolor1">

<h1><i class="fa fa-share-alt fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="share.title"/></h1>

<c:choose>
    <c:when test="${model.urlRedirectionEnabled}">
        <fmt:message key="share.warning"/>
        <p>
            <a href="http://www.facebook.com/sharer.php?u=${model.playUrl}" target="_blank"><img src="<spring:theme code="shareFacebookImage"/>" alt=""></a>&nbsp;
            <a href="http://www.facebook.com/sharer.php?u=${model.playUrl}" target="_blank"><fmt:message key="share.facebook"/></a>
        </p>

        <p>
            <a href="http://twitter.com/?status=Listening to ${model.playUrl}" target="_blank"><img src="<spring:theme code="shareTwitterImage"/>" alt=""></a>&nbsp;
            <a href="http://twitter.com/?status=Listening to ${model.playUrl}" target="_blank"><fmt:message key="share.twitter"/></a>
        </p>
        <p>
            <g:plusone size="small" annotation="none" href="${model.playUrl}"></g:plusone>&nbsp;<fmt:message key="share.googleplus"/>
        </p>
        <p>
            <fmt:message key="share.link">
                <fmt:param>${model.playUrl}</fmt:param>
            </fmt:message>
        </p>
    </c:when>
    <c:otherwise>
        <p class="space-above">
            <fmt:message key="share.disabled"/>
        </p>
    </c:otherwise>
</c:choose>

<c:set var="licenseInfo" value="${model.licenseInfo}"/>
<%@ include file="licenseNotice.jsp" %>

<div style="padding-top:1em">
    <c:if test="${not empty model.dir}">
        <sub:url value="main.view" var="backUrl"><sub:param name="path" value="${model.dir.path}"/></sub:url>
        <span style="padding-right:2em"><i class="fa fa-chevron-left icon"></i>&nbsp;<a href="${backUrl}"><fmt:message key="common.back"/></a></span>
    </c:if>
    <c:if test="${model.user.settingsRole}">
    <i class="fa fa-cog icon"></i>&nbsp;<a href="shareSettings.view"><fmt:message key="share.manage"/>
    </c:if>
</div>
</body>
</html>