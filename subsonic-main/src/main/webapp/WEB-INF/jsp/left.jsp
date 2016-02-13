<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
    <script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/multiService.js"/>"></script>

    <style type="text/css">
        .left-index-title {
            display: flex;
            align-items: center;
            width: 100%;
            font-size: 105%;
            margin-top: 1.5em;
            padding-top: 2px;
            padding-bottom: 2px;
            font-weight: 500;
        }
        .left-index-shortcut-letter {
            flex-grow: 1;
            padding-left: 2px;
        }
        .left-index-shortcut-arrow {
            padding-right: 2px;
        }
        .left-index-shortcut-artist {
            padding-left: 2px;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            font-weight: 300;
        }
    </style>

    <script type="text/javascript" language="javascript">

        function changeMusicFolder(musicFolderId) {
            multiService.setSelectedMusicFolder(musicFolderId, refresh);
        }

        function refresh() {
            var mainLocation = top.main.location.href;
            if (mainLocation.indexOf("/home.view") != -1 ||
                mainLocation.indexOf("/artists.view") != -1 ) {
                top.main.location.href = mainLocation;
            }
            top.left.location.href = top.left.location.href;
        }
    </script>
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
<c:if test="${model.showIndex}">

    <c:if test="${fn:length(model.musicFolders) > 1}">
        <div style="padding-top:1em;padding-bottom:0.25em" class="topHeader">
            <i class="fa fa-folder-open-o fa-lg fa-fw icon"></i>&nbsp;<fmt:message key="settingsheader.musicFolder"/>
        </div>

        <div style="padding-bottom:0.5em">
            <select name="musicFolderId" onchange="changeMusicFolder(options[selectedIndex].value);" style="width:100%">
                <option value="-1"><fmt:message key="left.allfolders"/></option>
                <c:forEach items="${model.musicFolders}" var="musicFolder">
                    <option ${model.selectedMusicFolder.id == musicFolder.id ? "selected" : ""} value="${musicFolder.id}">${fn:escapeXml(musicFolder.name)}</option>
                </c:forEach>
            </select>
        </div>
    </c:if>

    <c:forEach items="${model.indexedArtists}" var="entry">
        <a name="${fn:escapeXml(entry.key.index)}"></a>
        <div class="left-index-title bgcolor1">
            <span class="left-index-shortcut-letter">${fn:escapeXml(entry.key.index)}</span>
            <span class="left-index-shortcut-arrow"><i class="fa fa-arrow-up icon clickable" onclick="location.href='#top'"></i></span>
        </div>

        <c:forEach items="${entry.value}" var="artist">
            <div class="left-index-shortcut-artist ellipsis">
                <sub:url value="main.view" var="mainUrl">
                    <c:forEach items="${artist.mediaFiles}" var="mediaFile">
                        <sub:param name="id" value="${mediaFile.id}"/>
                    </c:forEach>
                </sub:url>
                <a target="main" title="${fn:escapeXml(artist.name)}" href="${mainUrl}"><span class="ellipsis">${fn:escapeXml(artist.name)}</span></a>
            </div>
        </c:forEach>
    </c:forEach>

    <div style="padding-top:1em"></div>

    <c:forEach items="${model.singleSongs}" var="song">
        <div class="left-index-shortcut-artist">
            <c:import url="playButtons.jsp">
                <c:param name="id" value="${song.id}"/>
                <c:param name="playEnabled" value="${model.user.streamRole and not model.partyMode}"/>
                <c:param name="addEnabled" value="${model.user.streamRole}"/>
                <c:param name="downloadEnabled" value="${model.user.downloadRole and not model.partyMode}"/>
                <c:param name="video" value="${song.video and model.player.web}"/>
            </c:import>
            <span class="ellipsis" title="${fn:escapeXml(song.title)}">${fn:escapeXml(song.title)}</span>
        </div>
    </c:forEach>

    <div style="height:5em"></div>

    <div class="bgcolor2" style="opacity:1.0; width:100%; position:fixed; bottom:0; left:0; padding: 0.25em 0.75em 0.25em 0.75em; border-top:1px solid darkgray;">
        <c:forEach items="${model.indexes}" var="index">
            <a href="#${index.index}">${index.index}</a>
        </c:forEach>
    </div>

</c:if>

</body>
</html>