<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>

<html>
<head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
    <script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/util.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/chatService.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/nowPlayingService.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/scripts-2.0.js"/>"></script>

    <style type="text/css">
        .now-playing-artist {
            font-weight: 300;
        }
    </style>

    <script type="text/javascript">

        var chatRevision = 0;

        function init() {
            dwr.engine.setErrorHandler(null);

            startGetScanningStatusTimer();

            <c:if test="${model.showChat}">
            chatService.addMessage(null);
            </c:if>

            <c:if test="${model.showNowPlaying}">
            startGetNowPlayingTimer();
            </c:if>

            <c:if test="${model.showChat}">
            startGetMessagesTimer();
            </c:if>
        }

        function startGetNowPlayingTimer() {
            nowPlayingService.getNowPlaying(getNowPlayingCallback);
            setTimeout("startGetNowPlayingTimer()", 10000);
        }

        function getNowPlayingCallback(nowPlaying) {
            $("#now-playing-header").toggle(nowPlaying.length > 0);
            var container = $("#now-playing-container");
            container.empty();

            for (var i = 0; i < nowPlaying.length; i++) {
                var entry = nowPlaying[i];
                var clone = $(".now-playing-pattern").clone();
                clone.removeClass("now-playing-pattern");

                var user = clone.find(".now-playing-user");
                var avatar = clone.find(".now-playing-avatar");
                var title = clone.find(".now-playing-title");
                var artist = clone.find(".now-playing-artist");
                var lyrics = clone.find(".now-playing-lyrics");
                var lyricsContainer = clone.find(".now-playing-lyrics-container");
                var coverart = clone.find(".now-playing-coverart");
                var albumlink = clone.find(".now-playing-album-link");
                var when = clone.find(".now-playing-when");

                user.text(entry.username);
                title.text(entry.title);
                artist.text(entry.artist ? entry.artist : "");
                lyrics.attr("href", entry.lyricsUrl);
                coverart.attr("src", entry.coverArtUrl);
                albumlink.attr("href", entry.albumUrl);
                lyricsContainer.toggle(entry.lyricsUrl != null);

                if (entry.avatarUrl) {
                    avatar.attr("src", entry.avatarUrl);
                } else {
                    avatar.hide();
                }

                var minutesAgo = entry.minutesAgo;
                if (minutesAgo > 4) {
                    when.text(minutesAgo + " <fmt:message key="main.minutesago"/>");
                } else {
                    when.hide();
                }

                clone.show();
                container.append(clone);
            }
        }

        function startGetMessagesTimer() {
            chatService.getMessages(chatRevision, getMessagesCallback);
            setTimeout("startGetMessagesTimer()", 10000);
        }

        function addMessage() {
            chatService.addMessage($("#message").val());
            $("#message").val(null);
            setTimeout("startGetMessagesTimer()", 500);
        }
        function clearMessages() {
            chatService.clearMessages();
            setTimeout("startGetMessagesTimer()", 500);
        }

        function getMessagesCallback(messages) {

            if (messages == null) {
                return;
            }
            chatRevision = messages.revision;

            // Delete all the rows except for the "pattern" row
            dwr.util.removeAllRows("chatlog", { filter:function(div) {
                return (div.id != "pattern");
            }});

            // Create a new set cloned from the pattern row
            for (var i = 0; i < messages.messages.length; i++) {
                var message = messages.messages[i];
                var id = i + 1;
                dwr.util.cloneNode("pattern", { idSuffix:id });
                $("#user" + id).text(message.username);
                $("#date" + id).text(" [" + formatDate(message.date) + "]");
                $("#content" + id).text(message.content);
                $("#pattern" + id).show();
            }

            var clearDiv = $("#clearDiv");
            if (clearDiv) {
                if (messages.messages.length == 0) {
                    clearDiv.hide();
                } else {
                    clearDiv.show();
                }
            }
        }

        function formatDate(date) {
            var hours = date.getHours();
            var minutes = date.getMinutes();
            var result = hours < 10 ? "0" : "";
            result += hours;
            result += ":";
            if (minutes < 10) {
                result += "0";
            }
            result += minutes;
            return result;
        }

        function startGetScanningStatusTimer() {
            nowPlayingService.getScanningStatus(getScanningStatusCallback);
        }

        function getScanningStatusCallback(scanInfo) {
            $("#scanCount").text(scanInfo.count);
            if (scanInfo.scanning) {
                $("#scanningStatus").show();
                setTimeout("startGetScanningStatusTimer()", 1000);
            } else {
                $("#scanningStatus").hide();
                setTimeout("startGetScanningStatusTimer()", 15000);
            }
        }

    </script>
</head>
<body class="bgcolor1 rightframe" style="padding-top:2em" onload="init()">

<c:if test="${not model.licenseInfo.licenseValid}">
    <div class="detail" style="text-align: center;padding-bottom: 1em">

        <i class="fa fa-trophy fa-lg icon"></i>&nbsp;&nbsp;<a href="premiumSettings.view" target="main"><fmt:message key="top.getpremium"/></a>
        <c:if test="${model.licenseInfo.trialDaysLeft gt 0}">
            <br>
            <a href="premiumSettings.view" target="main"><fmt:message key="top.trialdaysleft"><fmt:param value="${model.licenseInfo.trialDaysLeft}"/></fmt:message></a>
        </c:if>
    </div>
</c:if>

<c:if test="${model.newVersionAvailable}">
    <div class="warning" style="padding-bottom: 1em">
        <fmt:message key="top.upgrade"><fmt:param value="${model.brand}"/><fmt:param value="${model.latestVersion}"/></fmt:message>
    </div>
</c:if>

<div id="scanningStatus" style="display: none;" class="warning">
    <i class="fa fa-refresh fa-spin"></i>&nbsp;&nbsp;<fmt:message key="main.scanning"/> <span id="scanCount"></span>
</div>

<div class="now-playing-pattern" style="display:none; margin-top:1.5em">
    <div class="ellipsis" style="margin-bottom:0.5em">
        <img class="now-playing-avatar" style="padding-right:5px;width:30px;height:30px">
        <b><span class="now-playing-user ellipsis"></span></b>
    </div>
    <div class="ellipsis" style="display:flex">
        <div class="ellipsis" style="flex-grow:1">
            <div class="ellipsis"><a class="now-playing-album-link" target="main"><b><span class="now-playing-title"></span></b></a></div>
            <div class="now-playing-artist ellipsis"></div>
            <div class="now-playing-when" style="margin-top:0.5em"></div>
        </div>
        <a class="now-playing-album-link" target="main"><img class="now-playing-coverart" style="height:60px; width:60px; margin-left:0.4em"></a>
    </div>
</div>

<h2 id="now-playing-header" style="display:none"><fmt:message key="main.nowplaying"/></h2>

<div id="now-playing-container" class="detail">
</div>

<c:if test="${model.showChat}">
    <h2 style="padding-top:1.5em"><i class="fa fa-comment-o fa-lg fa-fw icon"></i>&nbsp;<fmt:message key="main.chat"/></h2>
    <div style="padding-top:0.3em;padding-bottom:0.3em">
        <input type="text" id="message" placeholder="<fmt:message key="main.message"/>" style="width:100%" onkeypress="dwr.util.onReturn(event, addMessage)"/>
    </div>

    <table>
        <tbody id="chatlog">
        <tr id="pattern" style="display:none;margin:0;padding:0 0 0.15em 0;border:0"><td>
            <span id="user" class="detail" style="font-weight:bold"></span>&nbsp;<span id="date" class="detail"></span> <span id="content"></span></td>
        </tr>
        </tbody>
    </table>

    <c:if test="${model.user.adminRole}">
        <div id="clearDiv" style="display:none;"><i class="fa fa-remove fa-lg fa-fw icon"></i>&nbsp;<a href="javascript:clearMessages()"><fmt:message key="main.clearchat"/></a></div>
    </c:if>
</c:if>

</body>
</html>
