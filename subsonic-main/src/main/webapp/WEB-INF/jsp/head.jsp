<%@ include file="include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="styleSheet"><spring:theme code="styleSheet"/></c:set>
<link rel="icon" type="image/png" href="<c:url value="/icons/favicon.png"/>"/>
<link rel="stylesheet" href="<c:url value="/${styleSheet}"/>" type="text/css">
<link rel="stylesheet" href="<c:url value="/style/font-awesome-4.5.0/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Ubuntu&subset=latin,cyrillic-ext,greek-ext,greek,latin-ext,cyrillic" type="text/css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,300,400italic,500,300italic,500italic,700,700italic,100,100italic" type="text/css"/>
<title>Booksonic</title>
<script type="text/javascript" src="<c:url value="/script/mousetrap-1.5.3.js"/>"></script>
<script type="text/javascript">

    Mousetrap.bind('space', function() { getPlayerWindow().keyboardShortcut("togglePlayPause"); return false });
    Mousetrap.bind('left', function() { getPlayerWindow().keyboardShortcut("previous") });
    Mousetrap.bind('right', function() { getPlayerWindow().keyboardShortcut("next") });
    Mousetrap.bind('shift+left', function() { getPlayerWindow().keyboardShortcut("seekBackward") });
    Mousetrap.bind('shift+right', function() { getPlayerWindow().keyboardShortcut("seekForward") });
    Mousetrap.bind('-', function() { getPlayerWindow().keyboardShortcut("volumeDown") });
    Mousetrap.bind('plus', function() { getPlayerWindow().keyboardShortcut("volumeUp") });
    Mousetrap.bind('m', function() { parent.frames.upper.keyboardShortcut("toggleSideBar") });
    Mousetrap.bind('g h', function() { parent.frames.upper.keyboardShortcut("showHome") });
    Mousetrap.bind('g i', function() { parent.frames.upper.keyboardShortcut("showIndex") });
    Mousetrap.bind('g p', function() { parent.frames.upper.keyboardShortcut("showPlaylists") });
    Mousetrap.bind('g o', function() { parent.frames.upper.keyboardShortcut("showPodcasts") });
    Mousetrap.bind('g s', function() { parent.frames.upper.keyboardShortcut("showSettings") });
    Mousetrap.bind('g t', function() { parent.frames.upper.keyboardShortcut("showStarred") });
    Mousetrap.bind('g r', function() { parent.frames.upper.keyboardShortcut("showMore") });
    Mousetrap.bind('g a', function() { parent.frames.upper.keyboardShortcut("showAbout") });
    Mousetrap.bind('/', function() { parent.frames.upper.keyboardShortcut("search"); return false });
    Mousetrap.bind('?', function() { parent.frames.upper.keyboardShortcut("showMore", "shortcuts")});

    var indices = "abcdefghijklmnopqrstuvwxyz";
    for (var i = 0, len = indices.length; i < len; i++) {
        var target = indices.substring(i, i + 1);
        createKeyboardShortcutForIndex(target);
    }

    function getPlayerWindow() {
        if (parent.frames.main == null) {
            return window;
        }
        if (parent.frames.main.location.href.indexOf("videoPlayer.view") == -1) {
            return parent.frames.playQueue;
        }
        return parent.frames.main;
    }

    function createKeyboardShortcutForIndex(index) {
        Mousetrap.bind("i " + index, function() {
            parent.frames.upper.keyboardShortcut("showIndex", index.toUpperCase());
        });
    }

</script>

