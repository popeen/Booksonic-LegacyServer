<%--@elvariable id="model" type="java.util.Map"--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>

<html>
<head>
    <%@ include file="head.jsp" %>
    <script type="text/javascript" src="<c:url value="/script/jwplayer-7.2.4/jwplayer.js"/>"></script>
    <script type="text/javascript">jwplayer.key="fnCY1zPzsH/DE/Uo+pvsBes6gTdfOCcLCCnD6g==";</script>

    <%--TODO--%>
    <script type="text/javascript" src="<c:url value="/script/prototype.js"/>"></script>

    <meta name="og:type" content="album"/>

    <c:if test="${not empty model.entries}">
        <sub:url value="/coverArt.view" var="coverArtUrl">
            <sub:param name="id" value="${model.entries[0].file.id}"/>
            <sub:param name="auth" value="${model.entries[0].file.hash}"/>
            <sub:param name="size" value="800"/>
        </sub:url>
        <meta name="og:title" content="${fn:escapeXml(model.entries[0].file.artist)} &mdash; ${fn:escapeXml(model.entries[0].file.albumName)}"/>
        <meta name="og:image" content="${model.redirectUrl}${coverArtUrl}"/>
    </c:if>

    <script type="text/javascript">
        function init() {
            var list = new Array();

            <c:forEach items="${model.entries}" var="entry" varStatus="loopStatus">
            <c:url value="/stream" var="streamUrl">
            <c:param name="id" value="${entry.file.id}"/>
            <c:param name="auth" value="${entry.file.hash}"/>
            <c:param name="player" value="${model.player}"/>
            <c:if test="${entry.file.video}">
            <c:param name="format" value="raw"/>
            </c:if>
            </c:url>
            <c:url value="/coverArt.view" var="coverUrl">
            <c:param name="id" value="${entry.file.id}"/>
            <c:param name="auth" value="${entry.file.hash}"/>
            <c:param name="size" value="800"/>
            </c:url>

            list[${loopStatus.count - 1}] = {
                sources: [{
                    file: "${streamUrl}",
                    type: "${entry.file.video ? "mp4" : entry.format}"}],
                image: "${coverUrl}",
                title: "${fn:escapeXml(entry.file.title)}",
                description: "${fn:escapeXml(entry.file.artist)}"
            };

            </c:forEach>

            var jwPlayer = jwplayer("jwplayer");
            jwPlayer.on("ready", function () {
                console.log("Ready");
            });
            jwPlayer.setup({
                playlist: list,
                autostart: false,
                width: 800,
                height: 450
            });
        }

    </script>
</head>

<body class="mainframe bgcolor1" style="padding-top:2em" onload="init();">

<div style="margin:auto;width:800px">
    <h1>
        <c:choose>
            <c:when test="${empty model.share or empty model.entries}">
                Sorry, the content is not available.
            </c:when>
            <c:otherwise>
                ${empty model.share.description ? model.entries[0].file.artist : fn:escapeXml(model.share.description)}
            </c:otherwise>
        </c:choose>
    </h1>
    <div style="float:left;padding-right:1.5em">
        <h2 style="margin:0;">${empty model.share.description ? model.entries[0].file.albumName : fn:escapeXml(model.share.username)}</h2>
    </div>
    <div class="detail" style="float:right">Streaming by <a href="http://subsonic.org/" target="_blank"><b>Subsonic</b></a></div>

    <div style="clear:both;padding-top:1em">
        <div id="jwplayer"></div>
    </div>
</div>
</body>
</html>
