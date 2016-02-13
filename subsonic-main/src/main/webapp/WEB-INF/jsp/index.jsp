<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>

<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
    <link rel="alternate" type="application/rss+xml" title="Subsonic Podcast" href="podcast.view?suffix=.rss">

    <script type="application/javascript">

        function toggleSideBar(show) {
            var width = show ? 210 : 0;
            $("#left").stop();
            $("#left").animate({"width": width});
        }

        function setPlayQueueHeight(height) {
            $("#playQueue").stop();
            $("#playQueue").animate({"height": height}, {step: updateSize});
        }

        // Work-around for quirky iframe layout issue.
        function updateSize(playQueueHeight) {
            var w = $(window).width() - $("#left").width() - $("#right").width() - 1;
            var h = $(window).height() - $("#upper").height() - playQueueHeight - 1;
            $("#left").height(h);
            $("#right").height(h);
            $("#main").height(h);
            $("#main").width(w);
        }

        function init() {
            updateSize($("#playQueue").height());
            $(window).resize(function () {
                updateSize($("#playQueue").height());
            });
        }

    </script>

    <style type="text/css">
        #upper {
            height: 42px;
            width: 100%;
        }
        #left {
            width: ${model.showSideBar ? 210 : 0}px;
        }
        #main {
            flex-grow: 1;
        }
        #right {
            width: ${model.showRight ? 200 : 0}px;
        }
        #playQueue {
            height: 95px;
            width:100%;
            border-top: 1px solid rgba(0, 0, 0, 0.1)
        }
    </style>
</head>

<body class="nospace" onload="init()">

<div class="nospace" style="display:flex; flex-direction:column; width: 100%; height: 100%">
    <iframe src="top.view" id="upper" name="upper" class="nospace"></iframe>

    <div style="display:flex; flex-grow:1">
        <iframe src="left.view" id="left" name="left" class="nospace"></iframe>
        <iframe src="home.view" id="main" name="main" allowfullscreen class="nospace"></iframe>
        <iframe src="right.view" id="right" name="right" class="nospace"></iframe>
    </div>

    <iframe src="playQueue.view" id="playQueue" name="playQueue" class="nospace"></iframe>
</div>
</body>

</html>