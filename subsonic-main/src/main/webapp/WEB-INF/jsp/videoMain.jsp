<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<%--@elvariable id="model" type="java.util.Map"--%>

<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>

    <script type="text/javascript">
        var image;
        var id;
        var hash;
        var duration;
        var timer;
        var offset;
        var step;
        var size = 120;

        function startPreview(img, id, hash, duration) {
            stopPreview();
            image = $(img);
            step = Math.max(5, Math.round(duration / 50));
            offset = step;
            this.id = id;
            this.hash = hash;
            this.duration = duration;
            updatePreview();
            timer = window.setInterval(updatePreview, 1000);
        }

        function updatePreview() {
            image.attr("src", "coverArt.view?id=" + id + "&auth=" + hash + "&size=" + size + "&offset=" + offset);
            offset += step;
            if (offset > duration) {
                stopPreview();
            }
        }

        function stopPreview() {
            if (timer != null) {
                window.clearInterval(timer);
                timer = null;
            }
            if (image != null) {
                image.attr("src", "coverArt.view?id=" + id + "&auth=" + hash + "&size=" + size);
            }
        }
    </script>

    <style type="text/css">
        .video-duration, .video-format {
            position: absolute;
            bottom: 3px;
            color: #d3d3d3;
            background-color: black;
            opacity: 0.8;
            padding-right:3px;
            padding-left:3px;
        }
        .video-duration {
            right: 3px;
        }
        .video-format {
            left: 3px;
        }
    </style>

</head><body class="mainframe bgcolor1">

<div style="display:flex; align-items:center; padding-bottom:2em">

    <h1 class="ellipsis" style="flex-grow:1">
        <c:forEach items="${model.ancestors}" var="ancestor">
            <sub:url value="main.view" var="ancestorUrl">
                <sub:param name="id" value="${ancestor.id}"/>
            </sub:url>
            <a href="${ancestorUrl}">${fn:escapeXml(ancestor.name)}</a> &nbsp;&bull;&nbsp;
        </c:forEach>
        ${fn:escapeXml(model.dir.name)}
    </h1>

    <div>
        <c:import url="viewSelector.jsp">
            <c:param name="changeViewUrl" value="main.view?id=${model.dir.id}&viewAsList=${not model.viewAsList}"/>
            <c:param name="viewAsList" value="${model.viewAsList}"/>
        </c:import>
    </div>
</div>

<table class="music">
    <c:forEach items="${model.subDirs}" var="subDir" varStatus="loopStatus">
        <tr>
            <td class="fit"><i class="fa fa-folder-open-o icon>"></i></td>
            <td class="truncate" colspan="8"><a href="main.view?id=${subDir.id}" title="${fn:escapeXml(subDir.name)}">${fn:escapeXml(subDir.name)}</a></td>
        </tr>
    </c:forEach>
    <c:if test="${model.viewAsList}">
        <c:forEach items="${model.files}" var="child">
            <c:url value="/videoPlayer.view" var="videoUrl">
                <c:param name="id" value="${child.id}"/>
            </c:url>
            <tr>
                <c:import url="playButtons.jsp">
                    <c:param name="id" value="${child.id}"/>
                    <c:param name="playEnabled" value="${model.user.streamRole and not model.partyMode}"/>
                    <c:param name="downloadEnabled" value="${model.user.downloadRole and not model.partyMode}"/>
                    <c:param name="video" value="${child.video and model.player.web}"/>
                    <c:param name="asTable" value="true"/>
                </c:import>
                <td class="truncate">
                    <a href="${videoUrl}"><span class="songTitle" title="${fn:escapeXml(child.name)}">${fn:escapeXml(child.name)}</span></a>
                </td>
                <td class="fit rightalign detail">${child.year}</td>
                <td class="fit rightalign detail">${fn:toLowerCase(child.format)}</td>
                <td class="fit rightalign detail"><sub:formatBytes bytes="${child.fileSize}"/></td>
                <td class="fit rightalign detail">${child.durationString}</td>
            </tr>
        </c:forEach>
    </c:if>
</table>

<div style="clear:both;height:1.5em"></div>

<c:if test="${not model.viewAsList}">
    <c:forEach items="${model.files}" var="child">
        <c:url value="/videoPlayer.view" var="videoUrl">
            <c:param name="id" value="${child.id}"/>
        </c:url>
        <c:url value="/coverArt.view" var="coverArtUrl">
            <c:param name="id" value="${child.id}"/>
            <c:param name="auth" value="${child.hash}"/>
            <c:param name="size" value="120"/>
        </c:url>

        <div class="albumThumb">
            <div class="coverart dropshadow" style="width:213px">
                <div style="position:relative">
                    <div>
                        <a href="${videoUrl}"><img src="${coverArtUrl}" height="120" width="213" alt=""
                                                   onmouseover="startPreview(this, ${child.id}, ${child.hash}, ${child.durationSeconds})"
                                                   onmouseout="stopPreview()"></a>
                    </div>
                    <div class="detail video-format">${child.format}</div>
                    <div class="detail video-duration">${child.durationString}</div>
                </div>
                <div class="caption1" title="${fn:escapeXml(child.name)}"><a href="${videoUrl}" title="${fn:escapeXml(child.name)}">${fn:escapeXml(child.name)}</a></div>
            </div>
        </div>
    </c:forEach>
</c:if>

</body>
</html>
