<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<html><head>
    <%@ include file="head.jsp" %>
    <%@ include file="jquery.jsp" %>
    <script type="text/javascript" src="<c:url value="/script/scripts-2.0.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/engine.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/util.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/nowPlayingService.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/playQueueService.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/dwr/interface/playlistService.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/script/cast_sender-v1.js"/>"></script>
    <%@ include file="playQueueCast.jsp" %>
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <style type="text/css">
        .ui-slider .ui-slider-handle {
            width: 12px; height: 12px; cursor: pointer;
            background: #3184A5;
            display:none;
            border:none;
        }
        .ui-slider {
            cursor: pointer;
            border:none;
        }
        .ui-slider-range-min {
            background: #3184A5;
        }
        .ui-slider-handle:focus {
            outline:none;
        }
        #startButton, #stopButton {
            cursor:pointer; font-size:30px; color:#3184A5
        }
        #bufferButton {
            font-size:30px; color:#3184A5
        }
        #previousButton, #nextButton {
            cursor:pointer; font-size:18px; padding:10px; margin-left:10px; margin-right:10px
        }
        #muteOn, #muteOff {
            cursor:pointer; font-size:20px; padding:8px
        }
        #collapse, #expand, #castOn, #castOff {
            margin-left:25px; cursor:pointer; display:none;
        }
        #castOff, #collapse {
            color: #E65100;
        }
        #startButton:hover, #stopButton:hover {
            opacity: 0.8;
        }
        #songName {
            cursor:pointer; font-weight:500;
        }
        #artistName {
            cursor:pointer; font-weight:300;
        }
        #coverArt {
            cursor:pointer; width:80px; height:80px;
        }
        #volume {
            width:100px; height:3px; margin-right:20px
        }
        #progress {
            height:3px; margin: 5px 20px 10px 10px;
        }
    </style>
    <script type="text/javascript" language="javascript">
    var songs = null;
    var currentStreamUrl = null;
    var repeatEnabled = false;
    var castPlayer;
    var localPlayer = null;
    var jukeboxPlayer = false;
    var externalPlayer = false;
    var externalPlayerWithPlaylist = false;
    var autoHide = ${model.autoHide};

    function init() {

        jukeboxPlayer = ${model.player.jukebox};
        externalPlayer = ${model.player.external};
        externalPlayerWithPlaylist = ${model.player.externalWithPlaylist};
        castPlayer = new CastPlayer(!jukeboxPlayer && !externalPlayer && !externalPlayerWithPlaylist);
        initMouseListener();

        dwr.engine.setErrorHandler(null);

        $("#dialog-select-playlist").dialog({resizable: true, height: 220, autoOpen: false,
            buttons: {
                "<fmt:message key="common.cancel"/>": function() {
                    $(this).dialog("close");
                }
            }});

        $("#progress").slider({max: 0, range: "min"});
        $("#volume").slider({max: 100, value: 50, animate: "fast", range: "min"});
        $("#volume").on("slidestop", onVolumeChanged);
        $("#progress").on("slidestop", onProgressChanged);
        $(".ui-slider").css("background", $("#dummy").css("background-color"));
        $("#expand").toggle(!autoHide);

        if (!externalPlayerWithPlaylist) {
            $("#playlistBody").sortable({
                stop: function (event, ui) {
                    var indexes = [];
                    $("#playlistBody").children().each(function () {
                        var id = $(this).attr("id").replace("pattern", "");
                        if (id.length > 0) {
                            indexes.push(parseInt(id) - 1);
                        }
                    });
                    onRearrange(indexes);
                },
                cursor: "move",
                axis: "y",
                containment: "parent",
                helper: function (e, tr) {
                    var originals = tr.children();
                    var trclone = tr.clone();
                    trclone.children().each(function (index) {
                        // Set cloned cell sizes to match the original sizes
                        $(this).width(originals.eq(index).width());
                        $(this).css("maxWidth", originals.eq(index).width());
                        $(this).css("border-top", "1px solid black");
                        $(this).css("border-bottom", "1px solid black");
                    });
                    return trclone;
                }
            });
        }

        <c:if test="${model.player.web}">createPlayer();</c:if>

        if (jukeboxPlayer || externalPlayer || externalPlayerWithPlaylist) {
            startTimer();
            $("#progress").hide();
            $("#progress-and-duration").hide();
        }
        if (externalPlayer || externalPlayerWithPlaylist) {
            $("#volume").hide();
            $("#muteOn").hide();
            $("#muteOff").hide();
        }
        if (externalPlayerWithPlaylist) {
            $("#nextButton").hide();
            $("#previousButton").hide();
        }

        getPlayQueue();
    }

    function initMouseListener() {
        $("body").mouseleave(function (event) {
            if (event.clientY < 30) {
                if (autoHide) {
                    collapse();
                }
                $(".ui-slider-handle").fadeOut();
            }
        });

        $("body").mouseenter(function () {
            if (autoHide) {
                expand();
            }
            $(".ui-slider-handle").fadeIn();
        });
    }

    function collapse() {
        setFrameHeight(95);
        $("#collapse").hide();
        $("#expand").toggle(!autoHide);
    }

    function expand() {
        var height = $("body").height() + 25;
        height = Math.min(height, window.top.innerHeight * 0.8);
        setFrameHeight(height);
        $("#expand").hide();
        $("#collapse").toggle(!autoHide);
    }

    function setFrameHeight(height) {
        parent.setPlayQueueHeight(height);
    }

    function startTimer() {
        <!-- Periodically check if the current song has changed. -->
        nowPlayingService.getNowPlayingForCurrentPlayer(nowPlayingCallback);
        setTimeout("startTimer()", 5000);
    }

    function nowPlayingCallback(nowPlayingInfo) {
        if (nowPlayingInfo != null && nowPlayingInfo.streamUrl != currentStreamUrl) {
            getPlayQueue();
            currentStreamUrl = nowPlayingInfo.streamUrl;
            updateCurrentImage();
            updateCoverArt(songs[getCurrentSongIndex()]);
        }
    }

    function createPlayer() {
        localPlayer = new Audio();

        localPlayer.addEventListener("ended", function() {onNext(repeatEnabled)});
        localPlayer.addEventListener("canplay", function() {updateControls()});
        localPlayer.addEventListener("canplaythrough", function() {updateControls()});
        localPlayer.addEventListener("loadeddata", function() {updateControls()});
        localPlayer.addEventListener("loadedmetadata", function() {updateControls()});
        localPlayer.addEventListener("loadstart", function() {updateControls()});
        localPlayer.addEventListener("seeked", function() {updateControls()});
        localPlayer.addEventListener("seeking", function() {updateControls()});
        localPlayer.addEventListener("stalled", function() {updateControls()});
        localPlayer.addEventListener("waiting", function() {updateControls()});
        localPlayer.addEventListener("play", function() {updateControls()});
        localPlayer.addEventListener("playing", function() {updateControls()});
        localPlayer.addEventListener("pause", function() {updateControls()});
        localPlayer.addEventListener("volumechange", function() {updateControls()});
        localPlayer.addEventListener("timeupdate", function() {updateProgressBar()});

        localPlayer.volume = 0.66;
    }

    function updateControls() {
        var ready = localPlayer.readyState == localPlayer.HAVE_FUTURE_DATA ||
                    localPlayer.readyState == localPlayer.HAVE_ENOUGH_DATA ||
                    localPlayer.networkState == localPlayer.NETWORK_NO_SOURCE;

        var paused = localPlayer.paused;
        $("#startButton").toggle(ready && paused);
        $("#stopButton").toggle(ready && !paused);
        $("#bufferButton").toggle(!ready);
        toggleSpinner(ready && !paused);

        $("#volume").slider("option", "value", Math.round(localPlayer.volume * 100));

        var muted = localPlayer.muted;
        $("#muteOn").toggle(!muted);
        $("#muteOff").toggle(muted);
    }

    function toggleSpinner(spin) {
        $(".fa-circle-o-notch").toggleClass("fa-spin", spin);
    }

    function updateProgressBar() {
        var position = localPlayer.currentTime;
        var duration = localPlayer.duration;
        duration = isNaN(duration) ? 0 : duration;
        $("#progress").slider("option", "max", Math.round(duration * 1000));
        $("#progress").slider("option", "value", Math.round(position * 1000));
        $("#progress-text").html(formatDuration(Math.round(position)));
        $("#duration-text").html(formatDuration(Math.round(duration)));
    }

    function formatDuration(duration) {
        var hours = Math.floor(duration / 3600);
        duration = duration % 3600;
        var minutes = Math.floor(duration / 60);
        var seconds = Math.floor(duration % 60);

        var result = "";
        if (hours > 0) {
            result += hours + ":";
            if (minutes < 10) {
                result += "0";
            }
        }
        result += minutes + ":";
        if (seconds < 10) {
            result += "0";
        }
        result += seconds;

        return result;
    }

    function getPlayQueue() {
        playQueueService.getPlayQueue(playQueueCallback);
    }

    function onClear() {
        var ok = true;
        <c:if test="${model.partyMode}">
        ok = confirm("<fmt:message key="playlist.confirmclear"/>");
        </c:if>
        if (ok) {
            playQueueService.clear(playQueueCallback);
        }
    }

    function onStart() {
        if (castPlayer.castSession) {
            castPlayer.playCast();
        } else if (localPlayer) {
            if (localPlayer.ended && getCurrentSongIndex() == songs.length -1) {
                skip(0);
            } else {
                localPlayer.play();
            }

        } else {
            playQueueService.start(playQueueCallback);
        }
    }

    function onStop() {
        if (castPlayer.castSession) {
            castPlayer.pauseCast();
        } else if (localPlayer) {
            localPlayer.pause();
        } else {
            playQueueService.stop(playQueueCallback);
        }
    }

    function onVolumeChanged() {
        var value = parseInt($("#volume").slider("option", "value"));
        if (castPlayer.castSession) {
            castPlayer.setCastVolume(value / 100, false);
        } else if (localPlayer) {
            localPlayer.volume = value / 100.0;
            localPlayer.muted = false;
        } else if (jukeboxPlayer) {
            playQueueService.setJukeboxGain(value / 100);
        }
    }

    function onProgressChanged() {
        var value = parseInt($("#progress").slider("option", "value") / 1000);
        if (localPlayer && !castPlayer.castSession && Math.round(localPlayer.currentTime) != value) {
            localPlayer.currentTime = value;
            localPlayer.play();
        }
    }

    function onMute(mute) {
        $("#muteOn").toggle(!mute);
        $("#muteOff").toggle(mute);

        if (castPlayer.castSession) {
            castPlayer.castMute(mute);
        } else if (localPlayer) {
            localPlayer.muted = mute;
        } else if (jukeboxPlayer) {
            playQueueService.setJukeboxMute(mute);
        }
    }

    function keyboardShortcut(action) {
        if (action == "togglePlayPause") {
            if ($("#startButton").is(":visible")) {
                $("#startButton").click();
            } else if ($("#stopButton").is(":visible")) {
                $("#stopButton").click();
            }
        } else if (action == "previous" && $("#previousButton").is(":visible")) {
            $("#previousButton").click();
        } else if (action == "next" && $("#nextButton").is(":visible")) {
            $("#nextButton").click();
        } else if (action == "volumeDown" && $("#volume").is(":visible")) {
            var volume = parseInt($("#volume").slider("option", "value"));
            $("#volume").slider("option", "value", Math.max(0, volume - 5));
            onVolumeChanged();
        } else if (action == "volumeUp" && $("#volume").is(":visible")) {
            var volume = parseInt($("#volume").slider("option", "value"));
            $("#volume").slider("option", "value", Math.min(100, volume + 5));
            onVolumeChanged();
        } else if (action == "seekForward") {
            var position = parseInt($("#progress").slider("option", "value"));
            var duration = parseInt($("#progress").slider("option", "max"));
            $("#progress").slider("option", "value", Math.min(duration, position + 1000));
            onProgressChanged();
        } else if (action == "seekBackward") {
            var position = parseInt($("#progress").slider("option", "value"));
            $("#progress").slider("option", "value", Math.max(0, position - 1000));
            onProgressChanged();
        }
    }

    function onNext(wrap) {
        var index = parseInt(getCurrentSongIndex()) + 1;
        if (wrap) {
            index = index % songs.length;
        }
        skip(index);
    }
    function onPrevious() {
        if (localPlayer && !castPlayer.castSession && localPlayer.currentTime > 4.0) {
            skip(parseInt(getCurrentSongIndex()));
        } else {
            skip(Math.max(0, parseInt(getCurrentSongIndex()) - 1));
        }
    }
    function onPlay(id) {
        playQueueService.play(id, playQueueCallback);
    }
    function onPlayShuffle(albumListType, offset, size, genre, decade) {
        playQueueService.playShuffle(albumListType, offset, size, genre, decade, playQueueCallback);
    }
    function onPlayPlaylist(id, index) {
        playQueueService.playPlaylist(id, index, playQueueCallback);
    }
    function onPlayTopSong(id, index) {
        playQueueService.playTopSong(id, index, playQueueCallback);
    }
    function onPlayPodcastChannel(id) {
        playQueueService.playPodcastChannel(id, playQueueCallback);
    }
    function onPlayPodcastEpisode(id) {
        playQueueService.playPodcastEpisode(id, playQueueCallback);
    }
    function onPlayNewestPodcastEpisode(index) {
        playQueueService.playNewestPodcastEpisode(index, playQueueCallback);
    }
    function onPlayStarred() {
        playQueueService.playStarred(playQueueCallback);
    }
    function onPlayRandom(id, count) {
        playQueueService.playRandom(id, count, playQueueCallback);
    }
    function onPlaySimilar(id, count) {
        playQueueService.playSimilar(id, count, playQueueCallback);
    }
    function onAdd(id) {
        playQueueService.add(id, playQueueCallback);
    }
    function onAddNext(id) {
        playQueueService.addAt(id, getCurrentSongIndex() + 1, playQueueCallback);
    }
    function onShuffle() {
        playQueueService.shuffle(playQueueCallback);
    }
    function onStar(index) {
        playQueueService.toggleStar(index, playQueueCallback);
    }
    function onRemove(index) {
        playQueueService.remove(index, playQueueCallback);
    }
    function onRemoveSelected() {
        var indexes = new Array();
        var counter = 0;
        for (var i = 0; i < songs.length; i++) {
            var index = i + 1;
            if ($("#songIndex" + index).is(":checked")) {
                indexes[counter++] = i;
            }
        }
        playQueueService.removeMany(indexes, playQueueCallback);
    }

    function onRearrange(indexes) {
        playQueueService.rearrange(indexes, playQueueCallback);
    }
    function onToggleRepeat() {
        playQueueService.toggleRepeat(playQueueCallback);
    }
    function onUndo() {
        playQueueService.undo(playQueueCallback);
    }
    function onSortByTrack() {
        playQueueService.sortByTrack(playQueueCallback);
    }
    function onSortByArtist() {
        playQueueService.sortByArtist(playQueueCallback);
    }
    function onSortByAlbum() {
        playQueueService.sortByAlbum(playQueueCallback);
    }
    function onSavePlayQueue() {
        var positionMillis = localPlayer ? Math.round(1000.0 * localPlayer.currentTime) : 0;
        playQueueService.savePlayQueue(getCurrentSongIndex(), positionMillis);
        $().toastmessage("showSuccessToast", "<fmt:message key="playlist.toast.saveplayqueue"/>");
    }
    function onLoadPlayQueue() {
        playQueueService.loadPlayQueue(playQueueCallback);
    }
    function onSavePlaylist() {
        playlistService.createPlaylistForPlayQueue(function (playlistId) {
            top.main.location.href = "playlist.view?id=" + playlistId;
            $().toastmessage("showSuccessToast", "<fmt:message key="playlist.toast.saveasplaylist"/>");
        });
    }
    function onAppendPlaylist() {
        playlistService.getWritablePlaylists(playlistCallback);
    }
    function playlistCallback(playlists) {
        $("#dialog-select-playlist-list").empty();
        for (var i = 0; i < playlists.length; i++) {
            var playlist = playlists[i];
            $("<p class='dense'><b><a href='#' onclick='appendPlaylist(" + playlist.id + ")'>" + escapeHtml(playlist.name)
                    + "</a></b></p>").appendTo("#dialog-select-playlist-list");
        }
        $("#dialog-select-playlist").dialog("open");
    }
    function appendPlaylist(playlistId) {
        $("#dialog-select-playlist").dialog("close");

        var mediaFileIds = new Array();
        for (var i = 0; i < songs.length; i++) {
            if ($("#songIndex" + (i + 1)).is(":checked")) {
                mediaFileIds.push(songs[i].id);
            }
        }
        playlistService.appendToPlaylist(playlistId, mediaFileIds, function (){
            top.main.location.href = "playlist.view?id=" + playlistId;
            $().toastmessage("showSuccessToast", "<fmt:message key="playlist.toast.appendtoplaylist"/>");
        });
    }
    function playQueueCallback(playQueue) {
        songs = playQueue.entries;
        repeatEnabled = playQueue.repeatEnabled;

        if ($("#toggleRepeat")) {
            var text = repeatEnabled ? "<fmt:message key="playlist.repeat_on"/>" : "<fmt:message key="playlist.repeat_off"/>";
            $("#toggleRepeat").html(text);
        }

        if (songs.length == 0) {
            $("#songCountAndDuration").html("");
            $("#empty").show();
        } else {
            $("#songCountAndDuration").html(songs.length + " <fmt:message key="playlist2.songs"/>&nbsp;&nbsp;&bull;&nbsp;&nbsp;" + playQueue.durationAsString);
            $("#empty").hide();
        }

        // Delete all the rows except for the "pattern" row
        dwr.util.removeAllRows("playlistBody", { filter:function(tr) {
            return (tr.id != "pattern");
        }});

        // Create a new set cloned from the pattern row
        for (var i = 0; i < songs.length; i++) {
            var song  = songs[i];
            var id = i + 1;
            dwr.util.cloneNode("pattern", { idSuffix:id });
            if ($("#trackNumber" + id)) {
                $("#trackNumber" + id).html(song.trackNumber);
            }
            $("#starSong" + id).addClass(song.starred ? "fa-star starred" : "fa-star-o");
            if ($("#title" + id)) {
                $("#title" + id).html(song.title);
                $("#title" + id).attr("title", song.title);
            }
            if ($("#titleUrl" + id)) {
                $("#titleUrl" + id).html(song.title);
                $("#titleUrl" + id).attr("title", song.title);
                $("#titleUrl" + id).click(function () {skip(this.id.substring(8) - 1, 0)});
            }
            if ($("#album" + id)) {
                $("#album" + id).html(song.album);
                $("#album" + id).attr("title", song.album);
                $("#albumUrl" + id).attr("href", song.albumUrl);
            }
            if ($("#artist" + id)) {
                $("#artist" + id).html(song.artist);
                $("#artist" + id).attr("title", song.artist);
            }
            if ($("#genre" + id)) {
                $("#genre" + id).html(song.genre);
            }
            if ($("#year" + id)) {
                $("#year" + id).html(song.year);
            }
            if ($("#bitRate" + id)) {
                $("#bitRate" + id).html(song.bitRate);
            }
            if ($("#duration" + id)) {
                $("#duration" + id).html(song.durationAsString);
            }
            if ($("#format" + id)) {
                $("#format" + id).html(song.sourceFormat);
            }
            if ($("#fileSize" + id)) {
                $("#fileSize" + id).html(song.fileSize);
            }

            // Note: show() method causes page to scroll to top.
            $("#pattern" + id).css("display", "table-row");
        }

        if (playQueue.sendM3U) {
            parent.frames.main.location.href="play.m3u?";
        }

        if (jukeboxPlayer) {
            $("#volume").slider("option", "value", Math.floor(playQueue.jukeboxGain * 100));
            $("#muteOn").toggle(!playQueue.jukeboxMute);
            $("#muteOff").toggle(playQueue.jukeboxMute);
        }

        if (localPlayer) {
            triggerLocalPlayer(playQueue.startPlayerAt, playQueue.startPlayerAtPosition);
        } else {
            $("#startButton").toggle(!playQueue.stopEnabled);
            $("#stopButton").toggle(playQueue.stopEnabled);
            toggleSpinner(playQueue.stopEnabled);
            if (playQueue.startPlayerAt != -1) {
                currentStreamUrl = songs[playQueue.startPlayerAt].streamUrl;
                updateCoverArt(songs[playQueue.startPlayerAt]);
            }
            updateCurrentImage();
        }
    }

    function triggerLocalPlayer(index, positionMillis) {

        // Load first song (but don't play) if this is the initial case.
        if (localPlayer.networkState == localPlayer.NETWORK_EMPTY && localPlayer.readyState == localPlayer.HAVE_NOTHING) {
            skip(0);
            localPlayer.pause();
        }

        skip(index);
        if (positionMillis != 0) {
            localPlayer.currentTime = positionMillis / 1000;
        }
        updateCurrentImage();
        if (songs.length == 0) {
            localPlayer.pause();
            localPlayer.src = "";
            updateCoverArt(null);
            updateProgressBar(0, 0);
        }
    }

    function updateCoverArt(song) {
        var showAlbum = function () {
            parent.frames.main.location.href = "main.view?id=" + song.id
        };
        $("#coverArt").attr("src", song ? "coverArt.view?id=" + song.id + "&auth=" + song.hash + "&size=80" : "");
        $("#songName").text(song && song.title ? song.title : "");
        $("#artistName").text(song && song.artist ? song.artist : "");
        $("#songName").off("click");
        $("#artistName").off("click");
        $("#coverArt").off("click");
        if (song) {
            $("#songName").click(showAlbum);
            $("#artistName").click(showAlbum);
            $("#coverArt").click(showAlbum);
        }
    }

    function skip(index, position) {
        if (index < 0 || index >= songs.length) {
            return;
        }

        var song = songs[index];
        currentStreamUrl = song.streamUrl;
        updateCurrentImage();

        if (castPlayer.castSession) {
            castPlayer.loadCastMedia(song, position);
        } else if (localPlayer) {
            console.log(song.streamUrl);
            localPlayer.src = song.streamUrl;
            localPlayer.play();
        } else {
            playQueueService.skip(index, playQueueCallback);
        }

        updateWindowTitle(song);
        updateCoverArt(song);

        if (${model.notify}) {
            showNotification(song);
        }
    }

    function updateWindowTitle(song) {
        var title = "";
        if (song.title) {
            title += song.title;
        }
        if (song.title && song.artist) {
            title += " - ";
        }
        if (song.artist) {
            title += song.artist;
        }
        top.document.title = title  + " - Subsonic";
    }

    function showNotification(song) {
        if (!("Notification" in window)) {
            return;
        }
        if (Notification.permission === "granted") {
            createNotification(song);
        }
        else if (Notification.permission !== 'denied') {
            Notification.requestPermission(function (permission) {
                Notification.permission = permission;
                if (permission === "granted") {
                    createNotification(song);
                }
            });
        }
    }

    function createNotification(song) {
        var body = "";
        if (song.artist) {
            body += song.artist;
        }
        if (song.artist && song.album) {
            body += " - ";
        }
        if (song.album) {
            body += song.album;
        }

        var n = new Notification(song.title, {
            tag: "subsonic",
            body: body,
            icon: "coverArt.view?id=" + song.id + "&auth=" + song.hash + "&size=110"
        });
        n.onshow = function() {
            setTimeout(function() {n.close()}, 5000);
        }
    }

    function updateCurrentImage() {
        for (var i = 0; i < songs.length; i++) {
            var song  = songs[i];
            var id = i + 1;
            var image = $("#currentImage" + id);

            if (image) {
                image.toggle(song.streamUrl == currentStreamUrl);
            }
        }
    }

    function getCurrentSongIndex() {
        for (var i = 0; i < songs.length; i++) {
            if (songs[i].streamUrl == currentStreamUrl) {
                return i;
            }
        }
        return -1;
    }

    <!-- actionSelected() is invoked when the users selects from the "More actions..." combo box. -->
    function actionSelected(id) {
        var selectedIndexes = getSelectedIndexes();
        if (id == "top") {
            return;
        } else if (id == "savePlayQueue") {
            onSavePlayQueue();
        } else if (id == "loadPlayQueue") {
            onLoadPlayQueue();
        } else if (id == "savePlaylist") {
            onSavePlaylist();
        } else if (id == "downloadPlaylist") {
            location.href = "download.view?player=${model.player.id}";
        } else if (id == "sharePlaylist") {
            parent.frames.main.location.href = "createShare.view?player=${model.player.id}&" + getSelectedIndexes();
        } else if (id == "sortByTrack") {
            onSortByTrack();
        } else if (id == "sortByArtist") {
            onSortByArtist();
        } else if (id == "sortByAlbum") {
            onSortByAlbum();
        } else if (id == "selectAll") {
            selectAll(true);
        } else if (id == "selectNone") {
            selectAll(false);
        } else if (id == "removeSelected") {
            onRemoveSelected();
        } else if (id == "download" && selectedIndexes != "") {
            location.href = "download.view?player=${model.player.id}&" + selectedIndexes;
        } else if (id == "appendPlaylist" && selectedIndexes != "") {
            onAppendPlaylist();
        }
        $("#moreActions").prop("selectedIndex", 0);
    }

    function getSelectedIndexes() {
        var result = "";
        for (var i = 0; i < songs.length; i++) {
            if ($("#songIndex" + (i + 1)).is(":checked")) {
                result += "i=" + i + "&";
            }
        }
        return result;
    }

    function selectAll(b) {
        for (var i = 0; i < songs.length; i++) {
            if (b) {
                $("#songIndex" + (i + 1)).attr("checked", "checked");
            } else {
                $("#songIndex" + (i + 1)).removeAttr("checked");
            }
        }
    }

    </script>
</head>

<body class="bgcolor2 playlistframe" onload="init()">

<span id="dummy" class="bgcolor1" style="display:none"></span>

<div class="bgcolor2" style="position:fixed; bottom:0; width:100%; z-index:2">
    <div style="display:flex; margin-top:5px; margin-bottom:7px">
        <img id="coverArt">
        <div class="ellipsis" style="flex-grow:1">
            <div id="progress"></div>

            <div class="ellipsis" style="display:flex; align-items:center; margin-left:10px">
                <div class="ellipsis" style="flex:1">
                    <div id="songName" class="ellipsis"></div>
                    <div id="artistName" class="ellipsis"></div>
                </div>

                <i id="previousButton" class="fa fa-step-backward" onclick="onPrevious()"></i>
                <span id="startButton" class="fa-stack fa-lg" onclick="onStart()">
                    <i class="fa fa-circle fa-stack-2x fa-inverse"></i>
                    <i class="fa fa-play-circle fa-stack-2x"></i>
                </span>
                <span id="stopButton" class="fa-stack fa-lg" onclick="onStop()" style="display:none">
                    <i class="fa fa-circle fa-stack-2x fa-inverse"></i>
                    <i class="fa fa-pause-circle fa-stack-2x"></i>
                </span>
                <span id="bufferButton" class="fa-stack fa-lg" style="display:none">
                    <i class="fa fa-circle fa-stack-2x"></i>
                    <i class="fa fa-refresh fa-stack-1x fa-inverse fa-spin"></i>
                </span>
                <i id="nextButton" class="fa fa-step-forward" onclick="onNext(repeatEnabled)"></i>
                <div style="flex:1; display:flex; align-items:center; margin-left:30px">
                    <i id="castOn" class="material-icons" onclick="castPlayer.launchCastApp()">cast</i>
                    <i id="castOff" class="material-icons" onclick="castPlayer.stopCastApp()">cast_connected</i>
                    <i id="expand" class="material-icons" onclick="expand()">queue_music</i>
                    <i id="collapse" class="material-icons" onclick="collapse()">queue_music</i>
                    <div id="progress-and-duration" class="detail" style="flex:1; text-align:right">
                        <span id="progress-text">0:00</span> /
                        <span id="duration-text">0:00</span>
                    </div>
                </div>
                <i id="muteOn" class="fa fa-volume-up fa-fw" onclick="onMute(true)"></i>
                <i id="muteOff" class="fa fa-volume-off fa-fw" onclick="onMute(false)" style="display:none"></i>
                <div id="volume"></div>
            </div>
        </div>
    </div>
</div>

<h2 style="float:left"><fmt:message key="playlist.more.playlist"/></h2>
<h2 id="songCountAndDuration" style="float:right;padding-right:1em"></h2>
<div style="clear:both"></div>
<p id="empty"><em><fmt:message key="playlist.empty"/></em></p>

<table class="music indent" style="cursor:pointer">
    <tbody id="playlistBody">
        <tr id="pattern" style="display:none;margin:0;padding:0;border:0">
            <td class="fit">
                <i id="starSong" class="fa clickable" onclick="onStar(this.id.substring(8) - 1)"></i>
            </td>
            <c:if test="${not model.player.externalWithPlaylist}">
                <td class="fit">
                    <i id="removeSong" class="fa fa-remove clickable icon" onclick="onRemove(this.id.substring(10) - 1)" title="<fmt:message key="playlist.remove"/>"></i>
                </td>
            </c:if>
            <td class="fit"><input type="checkbox" class="checkbox" id="songIndex"></td>
            <c:if test="${model.visibility.trackNumberVisible}">
                <td class="fit rightalign"><span class="detail" id="trackNumber">1</span></td>
            </c:if>

            <td class="truncate">
                <i id="currentImage" class="fa fa-circle-o-notch fa-spin icon" style="display:none;margin-right:0.5em"></i>
                <c:choose>
                    <c:when test="${model.player.externalWithPlaylist}">
                        <span id="title" class="songTitle">Title</span>
                    </c:when>
                    <c:otherwise>
                        <span class="songTitle"><a id="titleUrl" href="javascript:void(0)">Title</a></span>
                    </c:otherwise>
                </c:choose>
            </td>

            <c:if test="${model.visibility.albumVisible}">
                <td class="truncate"><a id="albumUrl" target="main"><span id="album" class="detail">Album</span></a></td>
            </c:if>
            <c:if test="${model.visibility.artistVisible}">
                <td class="truncate"><span id="artist" class="detail">Artist</span></td>
            </c:if>
            <c:if test="${model.visibility.genreVisible}">
                <td class="truncate"><span id="genre" class="detail">Genre</span></td>
            </c:if>
            <c:if test="${model.visibility.yearVisible}">
                <td class="fit rightalign"><span id="year" class="detail">Year</span></td>
            </c:if>
            <c:if test="${model.visibility.formatVisible}">
                <td class="fit rightalign"><span id="format" class="detail">Format</span></td>
            </c:if>
            <c:if test="${model.visibility.fileSizeVisible}">
                <td class="fit rightalign"><span id="fileSize" class="detail">Format</span></td>
            </c:if>
            <c:if test="${model.visibility.durationVisible}">
                <td class="fit rightalign"><span id="duration" class="detail">Duration</span></td>
            </c:if>
            <c:if test="${model.visibility.bitRateVisible}">
                <td class="fit rightalign"><span id="bitRate" class="detail">Bit Rate</span></td>
            </c:if>
        </tr>
    </tbody>
</table>

<table style="white-space:nowrap;">
    <tr style="white-space:nowrap;">
        <c:if test="${model.user.settingsRole and fn:length(model.players) gt 1}">
            <td style="padding-right: 5px"><select name="player" onchange="location='playQueue.view?player=' + options[selectedIndex].value;">
                <c:forEach items="${model.players}" var="player">
                    <option ${player.id eq model.player.id ? "selected" : ""} value="${player.id}">${player.shortDescription}</option>
                </c:forEach>
            </select></td>
        </c:if>

        <c:if test="${model.player.web or model.player.jukebox or model.player.external}">
            <td style="white-space:nowrap;"><span class="header"><a href="javascript:onClear()"><fmt:message key="playlist.clear"/></a></span> |</td>
            <td style="white-space:nowrap;"><span class="header"><a href="javascript:onUndo()"><fmt:message key="playlist.undo"/></a></span>  |</td>
        </c:if>

        <c:if test="${model.user.settingsRole}">
            <td style="white-space:nowrap;"><span class="header"><a href="playerSettings.view?id=${model.player.id}" target="main"><fmt:message key="playlist.settings"/></a></span>  |</td>
        </c:if>
    </tr></table>

<div style="height:100px"></div>

<div id="dialog-select-playlist" title="<fmt:message key="main.addtoplaylist.title"/>" style="display: none;">
    <p><fmt:message key="main.addtoplaylist.text"/></p>
    <div id="dialog-select-playlist-list"></div>
</div>

</body></html>
