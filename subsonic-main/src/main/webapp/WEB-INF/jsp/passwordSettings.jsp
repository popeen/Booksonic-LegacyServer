<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<%--@elvariable id="command" type="net.sourceforge.subsonic.command.passwordsettingscommand"--%>

<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
</head>
<body class="mainframe bgcolor1">


<c:set var="category" value="password"/>
<c:set var="user" value="${command.user}"/>
<c:set var="toast" value="${command.toast}"/>
<%@ include file="settingsHeader.jsp" %>

<c:choose>

    <c:when test="${command.ldapAuthenticated}">
        <p><fmt:message key="usersettings.passwordnotsupportedforldap"/></p>
    </c:when>

    <c:otherwise>
        <fmt:message key="passwordsettings.title" var="title"><fmt:param>${command.user.username}</fmt:param></fmt:message>
        <h2>${fn:escapeXml(title)}</h2>
        <form:form method="post" action="passwordSettings.view" commandName="command">
            <table class="indent">
                <tr>
                    <td><fmt:message key="usersettings.newpassword"/></td>
                    <td><form:password path="password"/></td>
                    <td class="warning"><form:errors path="password"/></td>
                </tr>
                <tr>
                    <td><fmt:message key="usersettings.confirmpassword"/></td>
                    <td><form:password path="confirmPassword"/></td>
                    <td/>
                </tr>
                <tr>
                    <td colspan="3" style="padding-top:1.5em">
                        <input type="submit" value="<fmt:message key="common.save"/>" style="margin-right:0.3em">
                        <input type="button" value="<fmt:message key="common.cancel"/>" onclick="location.href='nowPlaying.view'">
                    </td>
                </tr>

            </table>
        </form:form>
    </c:otherwise>
</c:choose>

</body></html>
