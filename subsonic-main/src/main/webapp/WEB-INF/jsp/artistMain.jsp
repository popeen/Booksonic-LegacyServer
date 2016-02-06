<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
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
  ~  Copyright 2014 (C) Sindre Mehus
  --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--@elvariable id="model" type="java.util.Map"--%>

<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
    <script type="text/javascript" src="<c:url value="/script/scripts-2.0.js"/>"></script>
    <script type="text/javascript" src="<c:url value='/dwr/util.js'/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/starService.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/multiService.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/fancyzoom/FancyZoom.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/fancyzoom/FancyZoomHTML.js"/>"></script>

</head>

<script type="text/javascript" language="javascript">

    var topSongs;

    function init() {
        setupZoom('<c:url value="/"/>');

        <c:if test="${model.showArtistInfo}">
        loadArtistInfo();
        </c:if>
    }

    function loadArtistInfo() {
        multiService.getArtistInfo(${model.dir.id}, 8, 50, function (artistInfo) {
            if (artistInfo.similarArtists.length > 0) {

                var html = "";
                for (var i = 0; i < artistInfo.similarArtists.length; i++) {
                    html += "<a href='main.view?id=" + artistInfo.similarArtists[i].mediaFileId + "' target='main'>" +
                            escapeHtml(artistInfo.similarArtists[i].artistName) + "</a>";
                    if (i < artistInfo.similarArtists.length - 1) {
                        html += " <span class='similar-artist-divider'>|</span> ";
                    }
                }
                $("#similarArtists").append(html);
                $("#similarArtists").show();
                $("#similarArtistsTitle").show();
                $("#similarArtistsRadio").show();
                $("#artistInfoTable").show();
            }

            if (artistInfo.artistBio && artistInfo.artistBio.biography) {
                $("#artistBio").append(artistInfo.artistBio.biography);
                if (artistInfo.artistBio.largeImageUrl) {
                    $("#artistImage").attr("src", artistInfo.artistBio.largeImageUrl);
                    $("#artistImageZoom").attr("href", artistInfo.artistBio.largeImageUrl);
                    $("#artistImage").show();
                    $("#artistInfoTable").show();
                }
            }
            if (artistInfo.artistBio && artistInfo.artistBio.mediumImageUrl) {
                $("#artistThumbImage").attr("src", artistInfo.artistBio.mediumImageUrl);
                $("#artistThumbImage").show();
            }

            this.topSongs = artistInfo.topSongs;

            if (topSongs.length > 0) {
                $("#topSongsHeader").show();
                $("#playTopSongs").show();

                // Delete all the rows except for the "pattern" row
                dwr.util.removeAllRows("topSongsBody", { filter:function(tr) {
                    return (tr.id != "pattern");
                }});

                // Create a new set cloned from the pattern row
                for (var i = 0; i < topSongs.length; i++) {
                    var song  = topSongs[i];
                    var id = i + 1;
                    dwr.util.cloneNode("pattern", { idSuffix:id });
                    $("#starSong" + id).addClass(song.starred ? "fa-star starred" : "fa-star-o");
                    $("#rank" + id).html(i + 1);
                    $("#title" + id).html(song.title);
                    $("#title" + id).attr("title", song.title);
                    $("#album" + id).html(song.album);
                    $("#album" + id).attr("title", song.album);
                    $("#albumUrl" + id).attr("href", "main.view?id=" + song.id);
                    $("#artist" + id).html(song.artist);
                    $("#artist" + id).attr("title", song.artist);
                    $("#songDuration" + id).html(song.durationAsString);

                    // Note: show() method causes page to scroll to top.
                    $("#pattern" + id).css("display", "table-row");
                }
            }
        });
    }

    function toggleStarTopSong(index, imageId) {
        toggleStar(topSongs[index].id, imageId);
    }
    function toggleStar(mediaFileId, element) {
        starService.star(mediaFileId, !$(element).hasClass("fa-star"));
        $(element).toggleClass("fa-star fa-star-o starred");
    }
    function playAll() {
        top.playQueue.onPlay(${model.dir.id});
    }
    function playRandom() {
        top.playQueue.onPlayRandom(${model.dir.id}, 40);
    }
    function addAll() {
        top.playQueue.onAdd(${model.dir.id});
    }
    function playSimilar() {
        top.playQueue.onPlaySimilar(${model.dir.id}, 50);
    }
    function playAllTopSongs() {
        top.playQueue.onPlayTopSong(${model.dir.id});
    }
    function playTopSong(index) {
        top.playQueue.onPlayTopSong(${model.dir.id}, index);
    }
    function addTopSong(index) {
        top.playQueue.onAdd(topSongs[index].id);
        $().toastmessage('showSuccessToast', '<fmt:message key="main.addlast.toast"/>')
    }
    function addNextTopSong(index) {
        top.playQueue.onAddNext(topSongs[index].id);
        $().toastmessage('showSuccessToast', '<fmt:message key="main.addnext.toast"/>')
    }
    function showAllAlbums() {
        $("#showAllButton").hide();
        $(".albumThumb").show();
    }
</script>

<body class="mainframe bgcolor1" onload="init();">

<div style="display:flex; align-items:center">

    <img id="artistThumbImage" alt="" class="circle dropshadow" style="display:none;width:4em;height:4em;margin-right:1em">

    <div style="flex-grow:1" class="ellipsis">
        <h1 class="ellipsis">
            <c:forEach items="${model.ancestors}" var="ancestor">
                <sub:url value="main.view" var="ancestorUrl">
                    <sub:param name="id" value="${ancestor.id}"/>
                </sub:url>
                <a href="${ancestorUrl}">${fn:escapeXml(ancestor.name)}</a> &nbsp;&bull;&nbsp;
            </c:forEach>
            ${fn:escapeXml(model.dir.name)}
        </h1>

        <c:if test="${not model.partyMode}">
            <h2 class="ellipsis">
                <i class="fa ${not empty model.dir.starredDate ? 'fa-star starred' : 'fa-star-o'} clickable"
                   onclick="toggleStar(${model.dir.id}, this)" style="padding-right:0.25em"></i>
                <c:set var="needSep" value="true"/>
                <c:if test="${model.user.streamRole}">
                    <c:if test="${needSep}">|</c:if>
                    <span class="header"><a href="javascript:playAll()"><fmt:message key="main.playall"/></a></span> |
                    <span class="header"><a href="javascript:playRandom(0)"><fmt:message key="main.playrandom"/></a></span> |
                    <span class="header"><a href="javascript:addAll(0)"><fmt:message key="main.addall"/></a></span>
                    <c:set var="needSep" value="true"/>
                </c:if>

                <c:if test="${model.user.commentRole}">
                    <c:if test="${needSep}">|</c:if>
                    <span class="header"><a href="javascript:toggleComment()"><fmt:message key="main.comment"/></a></span>
                </c:if>
            </h2>
        </c:if>
    </div>

    <div>
        <%@ include file="viewSelector.jsp" %>
    </div>

</div>

<div id="comment" class="albumComment"><sub:wiki text="${model.dir.comment}"/></div>

<div id="commentForm" style="display:none">
    <form method="post" action="setMusicFileInfo.view">
        <input type="hidden" name="action" value="comment">
        <input type="hidden" name="id" value="${model.dir.id}">
        <textarea name="comment" rows="6" cols="70">${model.dir.comment}</textarea>
        <input type="submit" value="<fmt:message key="common.save"/>">
    </form>
    <fmt:message key="main.wiki"/>
</div>

<script type='text/javascript'>
    function toggleComment() {
        $("#commentForm").toggle();
        $("#comment").toggle();
    }
</script>

<c:choose>
    <c:when test="${model.viewAsList}">
        <table class="music indent">
            <c:forEach items="${model.subDirs}" var="subDir">
                <tr>
                    <c:choose>
                        <c:when test="${subDir.album}">
                            <c:import url="playButtons.jsp">
                                <c:param name="id" value="${subDir.id}"/>
                                <c:param name="playEnabled" value="${model.user.streamRole and not model.partyModeEnabled}"/>
                                <c:param name="addEnabled" value="${model.user.streamRole and not model.partyModeEnabled}"/>
                                <c:param name="asTable" value="true"/>
                            </c:import>
                            <td class="truncate"><a href="main.view?id=${subDir.id}" title="${fn:escapeXml(subDir.name)}">${fn:escapeXml(subDir.name)}</a></td>
                            <td class="fit rightalign detail">${subDir.year}</td>
                        </c:when>
                        <c:otherwise>
                            <td class="fit"><i class="fa fa-folder-open-o icon>"></i></td>
                            <td class="truncate" colspan="5"><a href="main.view?id=${subDir.id}" title="${fn:escapeXml(subDir.name)}">${fn:escapeXml(subDir.name)}</a></td>
                        </c:otherwise>
                    </c:choose>

                </tr>
            </c:forEach>
        </table>
    </c:when>

    <c:otherwise>
        <table class="music indent">
            <c:forEach items="${model.subDirs}" var="subDir">
                <c:if test="${not subDir.album}">
                    <tr>
                        <td class="fit"><i class="fa fa-folder-open-o icon>"></i></td>
                        <td class="truncate"><a href="main.view?id=${subDir.id}" title="${fn:escapeXml(subDir.name)}">${fn:escapeXml(subDir.name)}</a></td>
                        <td class="fit rightalign detail">${subDir.year}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>

        <div style="float: left;padding-top: 1.5em">
            <c:set var="albumCount" value="0"/>
            <c:forEach items="${model.subDirs}" var="subDir" varStatus="loopStatus">
                <c:if test="${subDir.album}">
                    <c:set var="albumCount" value="${albumCount + 1}"/>
                    <div class="albumThumb" style="display:${loopStatus.count < 40 ? 'inline-block' : 'none'}">
                        <c:import url="coverArt.jsp">
                            <c:param name="albumId" value="${subDir.id}"/>
                            <c:param name="auth" value="${subDir.hash}"/>
                            <c:param name="caption1" value="${fn:escapeXml(subDir.name)}"/>
                            <c:param name="caption2" value="${subDir.year}"/>
                            <c:param name="captionCount" value="2"/>
                            <c:param name="coverArtSize" value="${model.coverArtSizeMedium}"/>
                            <c:param name="showLink" value="true"/>
                            <c:param name="appearAfter" value="${loopStatus.count * 30}"/>
                        </c:import>
                    </div>
                </c:if>
            </c:forEach>
            <c:if test="${albumCount >= 40}">
                <input id="showAllButton" class="albumOverflowButton" type="button" value="<fmt:message key="main.showall"/>" onclick="showAllAlbums()">
            </c:if>
        </div>
    </c:otherwise>
</c:choose>

<table id="artistInfoTable" style="padding:2em;clear:both;display:none" class="bgcolor2 dropshadow">
    <tr>
        <td rowspan="5" style="vertical-align: top">
            <a id="artistImageZoom" rel="zoom" href="void">
                <img id="artistImage" class="dropshadow" alt="" style="margin-right:2em; display:none; max-width:300px; max-height:300px">
            </a>
        </td>
        <td style="text-align:center"><h2>${fn:escapeXml(model.dir.name)}</h2></td>
    </tr>
    <tr>
        <td id="artistBio" style="padding-bottom: 0.5em"></td>
    </tr>
    <tr><td style="padding-bottom: 0.5em">
        <span id="similarArtistsTitle" style="padding-right: 0.5em; display: none"><fmt:message key="main.similarartists"/>:</span>
        <span id="similarArtists"></span>
    </td></tr>
    <tr><td style="height: 100%"></td></tr>
</table>

<h2 id="topSongsHeader" style="display:none;clear:both;padding-top:1em"><fmt:message key="main.topsongs"/></h2>

<table class="music indent">
    <tbody id="topSongsBody">
    <tr id="pattern" style="display:none;margin:0;padding:0;border:0">
        <td class="fit">
            <i id="starSong" class="fa clickable" onclick="toggleStarTopSong(this.id.substring(8) - 1, this)"></i>
        </td>
        <td class="fit">
            <i id="play" class="fa fa-play clickable icon" onclick="playTopSong(this.id.substring(4) - 1)" title="<fmt:message key="common.play"/>"></i>
        </td>
        <td class="fit">
            <i id="add" class="fa fa-plus clickable icon" onclick="addTopSong(this.id.substring(3) - 1)" title="<fmt:message key="main.addlast"/>"></i>
        </td>
        <td class="fit" style="padding-right:30px">
            <i id="addNext" class="fa fa-arrow-right clickable icon" onclick="addNextTopSong(this.id.substring(7) - 1)" title="<fmt:message key="main.addnext"/>"></i>
        </td>
        <td class="fit rightalign"><span id="rank" class="detail">Rank</span></td>
        <td class="truncate"><span id="title" class="songTitle">Title</span></td>
        <td class="truncate"><a id="albumUrl" target="main"><span id="album" class="detail">Album</span></a></td>
        <td class="truncate"><span id="artist" class="detail">Artist</span></td>
        <td class="fit rightalign"><span id="songDuration" class="detail">Duration</span></td>
    </tr>
    </tbody>
</table>

<div style="padding-top:3em"></div>
</body>
</html>
