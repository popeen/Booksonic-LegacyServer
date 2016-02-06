<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
    <script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/multiService.js"/>"></script>

    <script type="text/javascript">
        var previousQuery = "";
        var instantSearchTimeout;

        function showPage(url) {
            parent.frames.main.location.href = url;
        }

        function triggerInstantSearch(event) {
            if (event.keyCode == 27) { // Escape key
                $("#query").blur();
                return;
            }
            if (instantSearchTimeout) {
                window.clearTimeout(instantSearchTimeout);
            }
            instantSearchTimeout = window.setTimeout(executeInstantSearch, 300);
        }

        function executeInstantSearch() {
            var query = $("#query").val().trim();
            if (query.length > 1 && query != previousQuery) {
                previousQuery = query;
                document.searchForm.submit();
            }
        }

        function toggleSideBar(show) {
            $("#hide-side-bar").toggle(show);
            $("#show-side-bar").toggle(!show);
            parent.toggleSideBar(show);
            multiService.setShowSideBar(show);
        }

        function keyboardShortcut(action, param) {
            if (action == "toggleSideBar") {
                if ($("#show-side-bar").is(":visible")) {
                    $("#show-side-bar").click();
                } else if ($("#hide-side-bar").is(":visible")) {
                    $("#hide-side-bar").click();
                }
            } else if (action == "showHome") {
                showPage("home.view");
            } else if (action == "showIndex") {
                showPage(param ? "artists.view#" + param : "artists.view");
            } else if (action == "showPlaylists") {
                showPage("playlists.view");
            } else if (action == "showPodcasts") {
                showPage("podcastChannels.view");
            } else if (action == "showSettings") {
                showPage("settings.view");
            } else if (action == "showStarred") {
                showPage("starred.view");
            } else if (action == "showMore") {
                showPage(param ? "more.view#" + param : "more.view");
            } else if (action == "showAbout") {
                showPage("help.view");
            } else if (action == "search") {
                $("#query").focus().select();
            }
        }

    </script>

    <style type="text/css">
        .top-menu-item {
            margin-right: 2em;
            cursor: pointer;
            flex-grow: 1;
        }
    </style>
</head>

<body class="bgcolor2 topframe" style="margin:10px 10px 0 20px;white-space:nowrap">
<fmt:message key="top.home" var="home"/>
<fmt:message key="top.artists" var="artists"/>
<fmt:message key="top.now_playing" var="nowPlaying"/>
<fmt:message key="top.starred" var="starred"/>
<fmt:message key="left.playlists" var="playlists"/>
<fmt:message key="top.podcast" var="podcast"/>
<fmt:message key="top.help" var="help"/>
<fmt:message key="top.search" var="search"/>

<form method="post" action="search.view" target="main" name="searchForm">
    <div style="display:flex; align-items:center">
        <span id="show-side-bar" class="topHeader top-menu-item" style="display:${model.showSideBar ? 'none' : 'inline'}; margin-right:3em" onclick="toggleSideBar(true)"><i class="fa fa-bars fa-lg icon"></i></span>
        <span id="hide-side-bar" class="topHeader top-menu-item" style="display:${model.showSideBar ? 'inline' : 'none'}; margin-right:3em" onclick="toggleSideBar(false)"><i class="fa fa-bars fa-lg icon"></i></span>
        <span class="topHeader top-menu-item" onclick="showPage('home.view')"><i class="fa fa-home fa-fw fa-lg icon"></i>&nbsp;${home}</span>
        <span class="topHeader top-menu-item" onclick="showPage('artists.view')"><i class="fa fa-microphone fa-fw fa-lg icon"></i>&nbsp;${artists}</span>
        <span class="topHeader top-menu-item" onclick="showPage('nowPlaying.view')"><i class="fa fa-headphones fa-fw fa-lg icon"></i>&nbsp;${nowPlaying}</span>
        <span class="topHeader top-menu-item" onclick="showPage('starred.view')"><i class="fa fa-star fa-fw fa-lg icon"></i>&nbsp;${starred}</span>
        <span class="topHeader top-menu-item" onclick="showPage('podcastChannels.view')"><i class="fa fa-rss fa-lg icon"></i>&nbsp;${podcast}</span>

        <span style="flex-grow:8"></span>

        <input type="text" name="query" id="query" size="20" placeholder="${search}" onclick="select();" onkeyup="triggerInstantSearch(event);"
               style="flex-grow:8; margin-left:1em;margin-right:0.5em">
        <i class="fa fa-search icon clickable" onclick="document.searchForm.submit()"></i>
    </div>

</form>

</body></html>