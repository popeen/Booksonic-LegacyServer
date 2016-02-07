<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>

<html>
<head>
    <%@ include file="head.jsp" %>
</head>

<body class="mainframe bgcolor1">

<h1 style="padding-bottom:1em"><i class="fa fa-ban fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="accessDenied.title"/></h1>

<p>
    <fmt:message key="accessDenied.text"/>
</p>

<i class="fa fa-chevron-left icon"></i>&nbsp;<a href="javascript:history.go(-1)"><fmt:message key="common.back"/></a>

</body>
</html>