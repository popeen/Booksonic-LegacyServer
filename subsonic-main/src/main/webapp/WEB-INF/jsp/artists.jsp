<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
    <script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/multiService.js"/>"></script>

    <style type="text/css">
        .browse-index-shortcut {
            padding-bottom: 8px;
            font-size: 105%;
            line-height: 100%;
            font-weight: 300;
        }
        .browse-index-title {
            clear: both;
            font-size: 4em;
            line-height: 100%;
            padding-top: 20px;
            padding-bottom: 5px;
        }
        .browse-artist {
            float: left;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            width: 12em;
            padding: 0.2em 1.5em 0.2em 1.5em;
            font-weight: 300;
        }
    </style>

    <script type="text/javascript" language="javascript">

        function changeMusicFolder(musicFolderId) {
            multiService.setSelectedMusicFolder(musicFolderId, function() {
                location.href = "artists.view";
            });
        }

        function filterArtists(element) {
            var filter = $(element).val().toLowerCase();
            $(".browse-artist").each(function(i) {
                var artist = $(this).text().toLowerCase();
                $(this).toggle(artist.indexOf(filter) != -1);
            });
        }
    </script>
</head>

<body class="bgcolor1 mainframe">

<a name="top"></a>
<h1 style="padding-bottom:1em"><i class="fa fa-microphone fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="top.artists"/></h1>

<div style="clear:both; position:fixed; top:0; right:0; padding:1.25em 0.75em 0.25em 0.75em; text-align:center">
    <div class="browse-index-shortcut"><i class="fa fa-arrow-up fa-fw icon clickable" onclick="location.href='#top'"></i></div>
    <c:forEach items="${model.indexes}" var="index">
        <div class="browse-index-shortcut"><a href="#${index.index}">${index.index}</a></div>
    </c:forEach>
</div>

<div style="padding-bottom:1.5em">
    <c:if test="${fn:length(model.musicFolders) > 1}">
        <i class="fa fa-folder-open-o fa-fw icon"></i>&nbsp;<select name="musicFolderId" onchange="changeMusicFolder(options[selectedIndex].value);" style="margin-right:2em">
        <option value="-1"><fmt:message key="left.allfolders"/></option>
        <c:forEach items="${model.musicFolders}" var="musicFolder">
            <option ${model.selectedMusicFolder.id == musicFolder.id ? "selected" : ""} value="${musicFolder.id}">${fn:escapeXml(musicFolder.name)}</option>
        </c:forEach>
        </select>
    </c:if>
    <span>
        <c:choose>
            <c:when test="${model.scanning}">
                <i class="fa fa-refresh fa-fw icon"></i>&nbsp;<a href="artists.view"><fmt:message key="common.refresh"/></a>
            </c:when>
            <c:otherwise>
                <i class="fa fa-refresh fa-fw icon"></i>&nbsp;<a href="artists.view?refresh=true"><fmt:message key="common.refresh"/></a>
            </c:otherwise>
        </c:choose>
    </span>
    <div style="float:right; padding-right:3em">
        <input type="text" size="28" placeholder="<fmt:message key="common.filter"/>" onclick="select();" onkeyup="filterArtists(this)">
    </div>
</div>

<div style="padding-bottom:0.4em">
    <c:forEach items="${model.shortcuts}" var="shortcut">
        <sub:url value="main.view" var="mainUrl">
            <sub:param name="id" value="${shortcut.id}"/>
        </sub:url>
        <input type="button" style="margin-right:0.6em; margin-bottom:0.6em" value="${fn:escapeXml(shortcut.name)}" onclick="location.href='${mainUrl}'">
    </c:forEach>
</div>

<c:forEach items="${model.indexedArtists}" var="entry">
    <a name="${fn:escapeXml(entry.key.index)}"></a>
    <div class="browse-index-title">${fn:escapeXml(entry.key.index)}</div>

    <c:forEach items="${entry.value}" var="artist">
        <sub:url value="main.view" var="mainUrl">
            <c:forEach items="${artist.mediaFiles}" var="mediaFile">
                <sub:param name="id" value="${mediaFile.id}"/>
            </c:forEach>
        </sub:url>
        <div class="browse-artist">
            <a target="main" href="${mainUrl}" title="${fn:escapeXml(artist.name)}">${fn:escapeXml(artist.name)}</a>
        </div>
    </c:forEach>
</c:forEach>

<div style="clear:both; padding-top:2em"></div>

<table class="music">
    <c:forEach items="${model.singleSongs}" var="song" varStatus="loopStatus">
        <%--@elvariable id="song" type="net.sourceforge.subsonic.domain.MediaFile"--%>
        <tr style="margin:0;padding:0;border:0">
            <c:import url="playButtons.jsp">
                <c:param name="id" value="${song.id}"/>
                <c:param name="video" value="${song.video and model.player.web}"/>
                <c:param name="playEnabled" value="${model.user.streamRole and not model.partyMode}"/>
                <c:param name="addEnabled" value="${model.user.streamRole and (not model.partyMode or not song.directory)}"/>
                <c:param name="downloadEnabled" value="${model.user.downloadRole and not model.partyMode}"/>
                <c:param name="starEnabled" value="true"/>
                <c:param name="starred" value="${not empty song.starredDate}"/>
                <c:param name="asTable" value="true"/>
            </c:import>

            <c:if test="${model.visibility.trackNumberVisible}">
                <td class="fit rightalign">
                    <span class="detail">${song.trackNumber}</span>
                </td>
            </c:if>

            <td class="truncate">
                <span class="songTitle" title="${fn:escapeXml(song.title)}">${fn:escapeXml(song.title)}</span>
            </td>

            <c:if test="${model.visibility.albumVisible}">
                <td class="truncate">
                    <span class="detail" title="${fn:escapeXml(song.albumName)}">${fn:escapeXml(song.albumName)}</span>
                </td>
            </c:if>

            <c:if test="${model.visibility.artistVisible}">
                <td class="truncate">
                    <span class="detail" title="${fn:escapeXml(song.artist)}">${fn:escapeXml(song.artist)}</span>
                </td>
            </c:if>

            <c:if test="${model.visibility.genreVisible}">
                <td class="fit rightalign">
                    <span class="detail">${fn:escapeXml(song.genre)}</span>
                </td>
            </c:if>

            <c:if test="${model.visibility.yearVisible}">
                <td class="fit rightalign">
                    <span class="detail">${song.year}</span>
                </td>
            </c:if>

            <c:if test="${model.visibility.formatVisible}">
                <td class="fit rightalign">
                    <span class="detail">${fn:toLowerCase(song.format)}</span>
                </td>
            </c:if>

            <c:if test="${model.visibility.fileSizeVisible}">
                <td class="fit rightalign">
                    <span class="detail"><sub:formatBytes bytes="${song.fileSize}"/></span>
                </td>
            </c:if>

            <c:if test="${model.visibility.durationVisible}">
                <td class="fit rightalign">
                    <span class="detail">${song.durationString}</span>
                </td>
            </c:if>

            <c:if test="${model.visibility.bitRateVisible}">
                <td class="fit rightalign">
                    <span class="detail">
                        <c:if test="${not empty song.bitRate}">
                            ${song.bitRate} Kbps ${song.variableBitRate ? "vbr" : ""}
                        </c:if>
                        <c:if test="${song.video and not empty song.width and not empty song.height}">
                            (${song.width}x${song.height})
                        </c:if>
                    </span>
                </td>
            </c:if>
        </tr>
    </c:forEach>
</table>

<div style="padding-top:2em"></div>

</body></html>