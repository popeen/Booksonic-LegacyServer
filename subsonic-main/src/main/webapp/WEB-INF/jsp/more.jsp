<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>

<html><head>
    <%@ include file="head.jsp" %>
    <style type="text/css">
        body a {text-decoration: underline;}
        .more-header {padding-top: 1em; padding-bottom: 0.3em;}
        .more-shortcut {font-weight: 500; padding-left: 2em; padding-right: 0.5em;}
        .more-shortcut-descr {padding-left: 1em; padding-right: 3em; font-weight: 300;}
        #progressBar {width: 350px; height: 10px; border: 1px solid black; display:none;}
        #progressBarContent {width: 0; height: 10px; background: url("<c:url value="/icons/default_light/progress.png"/>") repeat;}
    </style>
    <script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/util.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/transferService.js"/>"></script>

    <script type="text/javascript">
        function refreshProgress() {
            transferService.getUploadInfo(updateProgress);
        }

        function updateProgress(uploadInfo) {

            var progressBar = document.getElementById("progressBar");
            var progressBarContent = document.getElementById("progressBarContent");
            var progressText = document.getElementById("progressText");


            if (uploadInfo.bytesTotal > 0) {
                var percent = Math.ceil((uploadInfo.bytesUploaded / uploadInfo.bytesTotal) * 100);
                var width = parseInt(percent * 3.5) + 'px';
                progressBarContent.style.width = width;
                progressText.innerHTML = percent + "<fmt:message key="more.upload.progress"/>";
                progressBar.style.display = "block";
                progressText.style.display = "block";
                window.setTimeout("refreshProgress()", 1000);
            } else {
                progressBar.style.display = "none";
                progressText.style.display = "none";
                window.setTimeout("refreshProgress()", 5000);
            }
        }
    </script>

</head>
<body class="mainframe bgcolor1" onload="${model.user.uploadRole ? "refreshProgress()" : ""}">

<h1><fmt:message key="more.title"/></h1>

<h2 class="more-header"><i class="fa fa-android fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="more.apps.title"/></h2>

<fmt:message key="more.booksonic.text"/>

<h2 class="more-header"><i class="fa fa-html5 fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="more.jamstash.title"/></h2>
<fmt:message key="more.jamstash.text"><fmt:param>${model.jamstashUrl}</fmt:param></fmt:message>

<h2 class="more-header"><i class="fa fa-area-chart fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="more.status.title"/></h2>
<fmt:message key="more.status.text"/>

<a name="shortcuts"></a>
<h2 class="more-header"><i class="fa fa-keyboard-o fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="more.keyboard.title"/></h2>

<table class="indent music" style="width:inherit">
    <tr>
        <th colspan="2"><fmt:message key="more.keyboard.playback"/></th>
        <th colspan="2"><fmt:message key="more.keyboard.navigation"/></th>
        <th colspan="2"><fmt:message key="more.keyboard.general"/></th>
    </tr>
    <tr>
        <td class="more-shortcut">Space</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.playpause"/></td>
        <td class="more-shortcut">g <fmt:message key="more.keyboard.then"/> h</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.home"/></td>
        <td class="more-shortcut">/</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.search"/></td>
    </tr>
    <tr>
        <td class="more-shortcut"><i class="fa fa-long-arrow-left"></i></td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.previous"/></td>
        <td class="more-shortcut">g <fmt:message key="more.keyboard.then"/> i</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.index"/></td>
        <td class="more-shortcut">m</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.sidebar"/></td>
    </tr>
    <tr>
        <td class="more-shortcut"><i class="fa fa-long-arrow-right"></i></td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.next"/></td>
        <td class="more-shortcut">g <fmt:message key="more.keyboard.then"/> p</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.playlists"/></td>
        <td class="more-shortcut">?</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.shortcuts"/></td>
    </tr>
    <tr>
        <td class="more-shortcut">Shift <i class="fa fa-long-arrow-left"></i></td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.seekbackward"/></td>
        <td class="more-shortcut">g <fmt:message key="more.keyboard.then"/> o</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.podcasts"/></td>
        <td></td><td></td>
    </tr>
    <tr>
        <td class="more-shortcut">Shift <i class="fa fa-long-arrow-right"></i></td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.seekforward"/></td>
        <td class="more-shortcut">g <fmt:message key="more.keyboard.then"/> s</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.settings"/></td>
        <td></td><td></td>
    </tr>
    <tr>
        <td class="more-shortcut">&ndash;</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.volumedown"/></td>
        <td class="more-shortcut">g <fmt:message key="more.keyboard.then"/> d</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.radio"/></td>
        <td></td><td></td>
    </tr>
    <tr>
        <td class="more-shortcut">+</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.volumeup"/></td>
        <td class="more-shortcut">g <fmt:message key="more.keyboard.then"/> t</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.starred"/></td>
        <td></td><td></td>
    </tr>
    <tr>
        <td></td><td></td>
        <td class="more-shortcut">g <fmt:message key="more.keyboard.then"/> r</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.more"/></td>
        <td></td><td></td>
    </tr>
    <tr>
        <td></td><td></td>
        <td class="more-shortcut">g <fmt:message key="more.keyboard.then"/> a</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.about"/></td>
        <td></td><td></td>
    </tr>
    <tr>
        <td></td><td></td>
        <td class="more-shortcut">i <fmt:message key="more.keyboard.then"/> a, b, c &hellip;</td><td class="more-shortcut-descr"><fmt:message key="more.keyboard.indexletter"/></td>
        <td></td><td></td>
    </tr>
</table>

<h2 class="more-header"><i class="fa fa-rss fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="more.podcast.title"/></h2>
<fmt:message key="more.podcast.text"/>

<c:if test="${model.user.uploadRole}">

    <h2 class="more-header"><i class="fa fa-upload fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="more.upload.title"/></h2>
    <form method="post" enctype="multipart/form-data" action="upload.view">
        <table>
            <tr>
                <td><fmt:message key="more.upload.source"/></td>
                <td colspan="2"><input type="file" id="file" name="file" size="40"/></td>
            </tr>
            <tr>
                <td><fmt:message key="more.upload.target"/></td>
                <td><input type="text" id="dir" name="dir" size="37" value="${model.uploadDirectory}"/></td>
                <td><input type="submit" value="<fmt:message key="more.upload.ok"/>"/></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="checkbox" checked name="unzip" id="unzip" class="checkbox"/>
                    <label for="unzip"><fmt:message key="more.upload.unzip"/></label>
                </td>
            </tr>
        </table>
    </form>

    <p class="detail" id="progressText"></p>

    <div id="progressBar">
        <div id="progressBarContent"></div>
    </div>

</c:if>

<div style="padding-top: 3em"></div>

</body></html>