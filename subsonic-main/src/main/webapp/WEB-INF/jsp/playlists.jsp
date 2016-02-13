<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<%--@elvariable id="model" type="java.util.Map"--%>

<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>

    <script type="text/javascript" src="<c:url value="/script/scripts-2.0.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/playlistService.js"/>"></script>
    <script type="text/javascript" language="javascript">

        function createEmptyPlaylist() {
            playlistService.createEmptyPlaylist(playlistCallback);
        }

        function playlistCallback(playlist) {
            location.href = "playlist.view?id=" + playlist.id;
        }
    </script>
</head>

<body class="mainframe bgcolor1">

<div style="display:flex; align-items:center; padding-bottom:2em">
    <h1 style="flex-grow:1">
        <i class="fa fa-music fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="left.playlists"/>
    </h1>
    <div>
        <c:import url="viewSelector.jsp">
            <c:param name="changeViewUrl" value="playlists.view?viewAsList=${not model.viewAsList}"/>
            <c:param name="viewAsList" value="${model.viewAsList}"/>
        </c:import>
    </div>
</div>

<c:if test="${empty model.playlists}">
    <p><em><fmt:message key="playlist2.noplaylists"/></em></p>
</c:if>

<c:choose>
    <c:when test="${model.viewAsList}">
        <table class="music">
            <c:forEach items="${model.playlists}" var="playlist">
                <tr>
                    <td class="fit"><i class="fa fa-play clickable icon" onclick="top.playQueue.onPlayPlaylist(${playlist.id})"></i></td>
                    <td class="fit"><a href="playlist.view?id=${playlist.id}">${fn:escapeXml(playlist.name)}</a></td>
                    <td class="truncate detail">${fn:escapeXml(playlist.comment)}</td>
                    <td class="fit rightalign detail"><fmt:formatDate type="date" dateStyle="medium" value="${playlist.created}"/></td>
                    <td class="fit rightalign detail">${playlist.fileCount} <fmt:message key="playlist2.songs"/></td>
                    <td class="fit rightalign detail">${playlist.durationAsString}</td>
                </tr>
            </c:forEach>
        </table>
    </c:when>

    <c:otherwise>
        <c:forEach items="${model.playlists}" var="playlist" varStatus="loopStatus">
            <c:set var="caption2">
                ${playlist.fileCount} <fmt:message key="playlist2.songs"/> &ndash; ${playlist.durationAsString}
            </c:set>
            <div class="albumThumb">
                <c:import url="coverArt.jsp">
                    <c:param name="playlistId" value="${playlist.id}"/>
                    <c:param name="coverArtSize" value="200"/>
                    <c:param name="caption1" value="${fn:escapeXml(playlist.name)}"/>
                    <c:param name="caption2" value="${caption2}"/>
                    <c:param name="captionCount" value="2"/>
                    <c:param name="showLink" value="true"/>
                    <c:param name="appearAfter" value="${loopStatus.count * 30}"/>
                </c:import>
            </div>
        </c:forEach>
    </c:otherwise>
</c:choose>


<div style="padding-top:1em; padding-bottom:2em">
    <span style="padding-right:3em"><i class="fa fa-music fa-lg fa-fw icon"></i>&nbsp;&nbsp;<a href="javascript:noop()" onclick="createEmptyPlaylist()"><fmt:message key="left.createplaylist"/></a></span>
    <span><i class="fa fa-download fa-lg fa-fw icon"></i>&nbsp;&nbsp;<a href="importPlaylist.view"><fmt:message key="left.importplaylist"/></a></span>
</div>

</body>
</html>
