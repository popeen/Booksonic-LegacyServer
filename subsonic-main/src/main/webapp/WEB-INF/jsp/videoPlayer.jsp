<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>

<html>
<head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
    <link type="text/css" rel="stylesheet" href="<c:url value="/style/videoPlayer.css"/>">
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/starService.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/jwplayer-7.2.4/jwplayer.js"/>"></script>
    <script type="text/javascript">jwplayer.key="fnCY1zPzsH/DE/Uo+pvsBes6gTdfOCcLCCnD6g==";</script>
    <script type="text/javascript" src="<c:url value="/script/cast_sender-v1.js"/>"></script>
    <%@ include file="videoPlayerCast.jsp" %>

    <script type="text/javascript" language="javascript">
        function toggleStar(mediaFileId, element) {
            starService.star(mediaFileId, !$(element).hasClass("fa-star"));
            $(element).toggleClass("fa-star fa-star-o starred");
        }

        function keyboardShortcut(action) {
            if (action == "togglePlayPause") {
                if ($("#play").is(":visible")) {
                    $("#play").click();
                } else if ($("#pause").is(":visible")) {
                    $("#pause").click();
                }
            } else if (action == "volumeDown") {
                var volume = parseInt($("#volume-slider").slider("option", "value"));
                $("#volume-slider").slider("option", "value", Math.max(0, volume - 5));
                castPlayer.setVolume(false);
            } else if (action == "volumeUp") {
                var volume = parseInt($("#volume-slider").slider("option", "value"));
                $("#volume-slider").slider("option", "value", Math.min(100, volume + 5));
                castPlayer.setVolume(false);
            } else if (action == "seekForward" && $("#pause").is(":visible")) {
                var position = parseInt($("#progress-slider").slider("option", "value"));
                var duration = parseInt($("#progress-slider").slider("option", "max"));
                $("#progress-slider").slider("option", "value", Math.min(duration, position + duration / 100));
                castPlayer.seekMedia();
            } else if (action == "seekBackward" && $("#pause").is(":visible")) {
                var position = parseInt($("#progress-slider").slider("option", "value"));
                var duration = parseInt($("#progress-slider").slider("option", "max"));
                $("#progress-slider").slider("option", "value", Math.max(0, position - duration / 100));
                castPlayer.seekMedia();
            }
        }

    </script>
</head>

<body class="mainframe bgcolor1" style="padding-bottom:0.5em">

<c:set var="licenseInfo" value="${model.licenseInfo}"/>
<%@ include file="licenseNotice.jsp" %>

<c:if test="${licenseInfo.licenseOrTrialValid}">
    <div>
        <div id="overlay">
            <span><fmt:message key="videoPlayer.chromecast"/></span>
        </div>
        <div id="jwplayer"></div>
        <div id="media-control" class="bgcolor2">
            <div class="ellipsis" style="flex-grow:1">
                <div id="progress-slider"></div>

                <div class="ellipsis" style="display:flex; align-items:center; margin-left:10px">
                    <div id="title" class="ellipsis" style="flex:1">
                        <i class="fa ${not empty model.video.starredDate ? 'fa-star starred' : 'fa-star-o'} fa-lg clickable"
                           onclick="toggleStar(${model.video.id}, this)" style="padding-right:0.25em"></i>&nbsp;${fn:escapeXml(model.video.title)}
                    </div>

                    <span id="play" class="fa-stack fa-lg">
                        <i class="fa fa-circle fa-stack-2x fa-inverse"></i>
                        <i class="fa fa-play-circle fa-stack-2x"></i>
                    </span>
                    <span id="pause" class="fa-stack fa-lg">
                        <i class="fa fa-circle fa-stack-2x fa-inverse"></i>
                        <i class="fa fa-pause-circle fa-stack-2x"></i>
                    </span>
                    <span id="buffer" class="fa-stack fa-lg">
                        <i class="fa fa-circle fa-stack-2x"></i>
                        <i class="fa fa-refresh fa-stack-1x fa-inverse fa-spin"></i>
                    </span>
                    <div style="flex:1;">
                        <div style="display:flex; align-items: center">
                            <span style="flex-grow:1"></span>
                            <i id="cast-idle" class="material-icons">cast</i>
                            <i id="cast-active" class="material-icons">cast_connected</i>
                            <i id="cc-on" class="material-icons">closed_caption</i>
                            <i id="cc-off" class="material-icons">closed_caption</i>
                            <i id="new-window" class="material-icons">open_in_new</i>
                            <i id="share" class="material-icons">share</i>
                            <i id="download" class="material-icons">file_download</i>
                            <span id="progress-and-duration" class="detail">
                                <span id="progress">0:00</span> /
                                <span id="duration">0:00</span>
                            </span>
                            <i id="audio-on" class="fa fa-volume-up fa-fw"></i>
                            <i id="audio-off" class="fa fa-volume-off fa-fw"></i>
                            <div id="volume-slider"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="debug"></div>

    <script type="text/javascript">
        var castPlayer = new CastPlayer();
    </script>
</c:if>

</body>
</html>
