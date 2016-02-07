<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>

<html>
<head>
    <%@ include file="head.jsp" %>
</head>

<body class="mainframe bgcolor1">

<h1 style="padding-bottom:1em"><i class="fa fa-ban fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="notFound.title"/></h1>

<fmt:message key="notFound.text"/>

<i class="fa fa-chevron-right icon"></i>&nbsp;<a href="javascript:top.location.reload(true)"><fmt:message key="notFound.reload"/></a>
<i class="fa fa-chevron-right icon" style="padding-left:2em"></i>&nbsp;<a href="musicFolderSettings.view"><fmt:message key="notFound.scan"/></a>

</body>
</html>