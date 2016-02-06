<script type="text/javascript">

(function () {
    'use strict';

    /**
     * Constants of states for Chromecast device
     **/
    var DEVICE_STATE = {
        'NOT_PRESENT': 0,
        'IDLE': 1,
        'ACTIVE': 2,
        'WARNING': 3,
        'ERROR': 4
    };

    var PLAYER_STATE = {
        'IDLE': 'IDLE',
        'LOADING': 'LOADING',
        'LOADED': 'LOADED',
        'PLAYING': 'PLAYING',
        'PAUSED': 'PAUSED',
        'BUFFERING': 'BUFFERING',
        'SEEKING': 'SEEKING'
    };

    /**
     * Cast player object
     * main variables:
     *  - deviceState for Cast mode:
     *    IDLE: Default state indicating that Cast extension is installed, but showing no current activity
     *    ACTIVE: Shown when Chrome has one or more local activities running on a receiver
     *    WARNING: Shown when the device is actively being used, but when one or more issues have occurred
     *    ERROR: Should not normally occur, but shown when there is a failure
     *  - Cast player variables for controlling Cast mode media playback
     *  - Local player variables for controlling local mode media playbacks
     *  - Current media variables for transition between Cast and local modes
     */
    var CastPlayer = function () {

        /* device variables */

        // @type {DEVICE_STATE} A state for device
        this.deviceState = DEVICE_STATE.NOT_PRESENT;

        /* Cast player variables */

        // @type {Object} a chrome.cast.media.Media object
        this.currentMediaSession = null;

        // @type {Number} volume between 0 and 100
        this.currentVolume = 50;

        // @type {string} a chrome.cast.Session object
        this.session = null;

        // @type {PLAYER_STATE} A state for Cast media player
        this.castPlayerState = PLAYER_STATE.IDLE;

        /* Local player variables */

        // @type {PLAYER_STATE} A state for local media player
        this.localPlayerState = PLAYER_STATE.IDLE;

        // @type {jwplayer} local player
        this.localPlayer = null;

        /* Current media variables */

        // @type {Boolean} Muted audio
        this.muted = false;

        // @type {Number} A number for current media time
        this.currentMediaTime = 0;

        // @type {Number} A number for current media duration
        this.currentMediaDuration = ${empty model.duration ? 0: model.duration};

        this.initialPosition = ${empty model.position ? 'null' : model.position};
        this.hasCaptions = ${model.hasCaptions};

        this.updateDurationLabel();
        this.initializeUI();
        this.initializeLocalPlayer();
        this.initializeCastPlayer();
    };

    /**
     * Initialize local media player
     */
    CastPlayer.prototype.initializeLocalPlayer = function () {
        this.localPlayer = jwplayer("jwplayer");

        var tracks = this.hasCaptions ? [{
            file: "captions.view?id=${model.video.id}&auth=${model.video.hash}",
            kind: "captions",
            "default": true
        }] : [];

        this.localPlayer.setup({
            height: "85%",
            width: "100%",
            title: "${fn:escapeXml(model.video.title)}",
            image: "coverArt.view?id=${model.video.id}&size=600&auth=${model.video.hash}&offset=" + this.duration / 10,
            sources: [{
                file: "stream?id=${model.video.id}&player=${model.player.id}&auth=${model.video.hash}&format=raw",
                type: "${model.video.format}"
            }],
            tracks: tracks
        });

        this.localPlayer.on("play", this.updateLocalState.bind(this));
        this.localPlayer.on("pause", this.updateLocalState.bind(this));
        this.localPlayer.on("buffer", this.updateLocalState.bind(this));
        this.localPlayer.on("idle", this.updateLocalState.bind(this));
        this.localPlayer.on("complete", this.updateLocalState.bind(this));
        this.localPlayer.on("error", this.updateLocalState.bind(this));
        this.localPlayer.on("seek", this.updateLocalState.bind(this));
        this.localPlayer.on("seeked", this.updateLocalState.bind(this));
        this.localPlayer.on("mute", this.updateLocalVolume.bind(this));
        this.localPlayer.on("volume", this.updateLocalVolume.bind(this));
        this.localPlayer.on("time", this.updateLocalProgress.bind(this));
        this.localPlayer.on("ready", this.onPlayerReady.bind(this));
        this.localPlayer.on("resize", this.onPlayerResize.bind(this));
        this.localPlayer.on("fullscreen", this.onPlayerFullscreen.bind(this));
        this.localPlayer.on("captionsChanged", this.onCaptionsChanged.bind(this));
    };

    CastPlayer.prototype.onPlayerReady = function () {
        $(".jw-controlbar").hide();
        this.localPlayer.setMute(false);
        this.localPlayer.setVolume(this.currentVolume);
        if (this.initialPosition) {
            this.localPlayer.seek(this.initialPosition);
        }
        if (this.hasCaptions) {
            this.toggleCaptions(true);
        }
    };

    CastPlayer.prototype.onPlayerResize = function (event) {
        $("#overlay")
                .width($("#jwplayer").width())
                .height($("#jwplayer").height());
    };

    CastPlayer.prototype.onPlayerFullscreen = function (event) {
        $(".jw-controlbar").toggle(event.fullscreen);
    };

    CastPlayer.prototype.onCaptionsChanged = function (event) {
        var enabled = event.track > 0;
        $("#cc-on").toggle(enabled);
        $("#cc-off").toggle(!enabled);
    };

    CastPlayer.prototype.updateLocalProgress = function (event) {
        var newTime = Math.round(event.position);
        if (newTime != this.currentMediaTime) {
            this.currentMediaTime = newTime;
            this.updateProgressBar();
        }
    };

    CastPlayer.prototype.updateLocalVolume = function (event) {
        var mute = this.localPlayer.getMute();
        $("#volume-slider").slider("option", "value", this.localPlayer.getVolume());
        $("#audio-off").toggle(mute);
        $("#audio-on").toggle(!mute);
    };

    CastPlayer.prototype.updateLocalState = function () {
        var state = this.localPlayer.getState();
        console.log("JW player state: " + state);
        if (state == "playing") {
            this.localPlayerState = PLAYER_STATE.PLAYING;
        } else if (state == "buffering") {
            this.localPlayerState = PLAYER_STATE.BUFFERING;
        } else if (state == "paused") {
            this.localPlayerState = PLAYER_STATE.PAUSED;
        } else if (state == "idle" || state == 'complete') {
            this.localPlayerState = PLAYER_STATE.IDLE;
        }
        this.updateMediaControlUI();
    };

    /**
     * Initialize Cast media player
     * Initializes the API. Note that either successCallback and errorCallback will be
     * invoked once the API has finished initialization. The sessionListener and
     * receiverListener may be invoked at any time afterwards, and possibly more than once.
     */
    CastPlayer.prototype.initializeCastPlayer = function () {

        if (!window.chrome) {
            return;
        }

        if (!chrome.cast || !chrome.cast.isAvailable) {
            setTimeout(this.initializeCastPlayer.bind(this), 1000);
            return;
        }
        // request session
        var applicationID = "9EAA0B71";
        var sessionRequest = new chrome.cast.SessionRequest(applicationID);
        var apiConfig = new chrome.cast.ApiConfig(sessionRequest,
                this.sessionListener.bind(this),
                this.receiverListener.bind(this));

        chrome.cast.initialize(apiConfig, this.onInitSuccess.bind(this), this.onError.bind(this));
        this.timer = setInterval(this.incrementMediaTime.bind(this), 1000);
    };

    /**
     * Callback function for init success
     */
    CastPlayer.prototype.onInitSuccess = function () {
        console.log("init success");
        this.updateMediaControlUI();
    };

    /**
     * Generic error callback function
     */
    CastPlayer.prototype.onError = function () {
        console.log("error");
    };

    /**
     * @param {!Object} e A new session
     * This handles auto-join when a page is reloaded
     * When active session is detected, playback will automatically
     * join existing session and occur in Cast mode and media
     * status gets synced up with current media of the session
     */
    CastPlayer.prototype.sessionListener = function (e) {
        this.session = e;
        if (this.session) {
            this.deviceState = DEVICE_STATE.ACTIVE;
            if (this.session.media[0]) {
                this.onMediaDiscovered('activeSession', this.session.media[0]);
            }
            else {
                this.loadMedia();
            }
            this.session.addUpdateListener(this.sessionUpdateListener.bind(this));
        }
    };

    /**
     * @param {string} e Receiver availability
     * This indicates availability of receivers but
     * does not provide a list of device IDs
     */
    CastPlayer.prototype.receiverListener = function (e) {
        if (e === 'available') {
            console.log("receiver found");
            this.deviceState = DEVICE_STATE.IDLE;
        }
        else {
            console.log("receiver list empty");
            this.deviceState = DEVICE_STATE.NOT_PRESENT;
        }
        this.updateMediaControlUI();
    };

    /**
     * session update listener
     */
    CastPlayer.prototype.sessionUpdateListener = function (isAlive) {
        if (!isAlive) {
            this.session = null;
            this.deviceState = DEVICE_STATE.IDLE;
            this.castPlayerState = PLAYER_STATE.IDLE;
            console.log(this.castPlayerState + " (sessionUpdateListener)");
            this.currentMediaSession = null;

            // continue to play media locally
            this.playMediaLocally(this.currentMediaTime);
            this.updateMediaControlUI();
        }
    };

    /**
     * Requests that a receiver application session be created or joined. By default, the SessionRequest
     * passed to the API at initialization time is used; this may be overridden by passing a different
     * session request in opt_sessionRequest.
     */
    CastPlayer.prototype.launchApp = function () {
        console.log("launching app...");
        chrome.cast.requestSession(this.onRequestSessionSuccess.bind(this), this.onLaunchError.bind(this));
    };

    /**
     * Callback function for request session success
     * @param {Object} e A chrome.cast.Session object
     */
    CastPlayer.prototype.onRequestSessionSuccess = function (e) {
        console.log("session success: " + e.sessionId);
        this.session = e;
        this.deviceState = DEVICE_STATE.ACTIVE;
        this.stopMediaLocally();
        this.loadMedia();
        this.session.addUpdateListener(this.sessionUpdateListener.bind(this));
    };

    /**
     * Callback function for launch error
     */
    CastPlayer.prototype.onLaunchError = function () {
        console.log("launch error");
        this.deviceState = DEVICE_STATE.ERROR;
    };

    /**
     * Stops the running receiver application associated with the session.
     */
    CastPlayer.prototype.stopApp = function () {
        this.session.stop(this.onStopAppSuccess.bind(this, 'Session stopped'),
                this.onError.bind(this));

    };

    /**
     * Callback function for stop app success
     */
    CastPlayer.prototype.onStopAppSuccess = function (message) {
        console.log(message);
        this.deviceState = DEVICE_STATE.IDLE;
        this.castPlayerState = PLAYER_STATE.IDLE;
        console.log(this.castPlayerState + " (onStopAppSuccess)");
        this.currentMediaSession = null;

        // continue to play media locally
        this.playMediaLocally(this.currentMediaTime);
        this.updateMediaControlUI();
    };

    /**
     * Loads media into a running receiver application
     */
    CastPlayer.prototype.loadMedia = function () {
        if (!this.session) {
            console.log("no session");
            return;
        }

        var url = "${model.remoteStreamUrl}";
        console.log("casting " + url);
        var mediaInfo = new chrome.cast.media.MediaInfo(url);
        mediaInfo.contentType = 'video/mp4';
        mediaInfo.streamType = chrome.cast.media.StreamType.BUFFERED;
        mediaInfo.duration = this.currentMediaDuration;
        mediaInfo.metadata = new chrome.cast.media.MovieMediaMetadata();
        mediaInfo.metadata.metadataType = chrome.cast.media.MetadataType.MOVIE;
        mediaInfo.metadata.title = "${model.video.title}";
        mediaInfo.metadata.images = [new chrome.cast.Image("${model.remoteCoverArtUrl}&size=384")];

        if (this.hasCaptions) {
            var track = new chrome.cast.media.Track(1, chrome.cast.media.TrackType.TEXT);
            track.trackContentId = "${model.remoteCaptionsUrl}&format=vtt";
            track.trackContentType = 'text/vtt';
            track.subtype = chrome.cast.media.TextTrackType.SUBTITLES;
            track.name = 'Subtitles';
            track.language = 'en-US';
            track.customData = null;

            mediaInfo.tracks = [track];
        }

        var request = new chrome.cast.media.LoadRequest(mediaInfo);
        request.autoplay = true;
        request.currentTime = this.currentMediaTime;

        if (this.hasCaptions && this.localPlayer.getCurrentCaptions() == 1) {
            request.activeTrackIds = [1];
        }

        this.castPlayerState = PLAYER_STATE.LOADING;
        console.log(this.castPlayerState + " (loadMedia)");

        this.session.loadMedia(request,
                this.onMediaDiscovered.bind(this, 'loadMedia'),
                this.onLoadMediaError.bind(this));

        this.updateMediaControlUI();
    };

    /**
     * Callback function for loadMedia success
     * @param {Object} mediaSession A new media object.
     * @param {String} how How the session was discovered.
     */
    CastPlayer.prototype.onMediaDiscovered = function (how, mediaSession) {
        console.log("new media session ID:" + mediaSession.mediaSessionId + ' (' + how + ')');
        this.currentMediaSession = mediaSession;
        if (how == 'loadMedia') {
            this.castPlayerState = PLAYER_STATE.LOADED;
            console.log(this.castPlayerState + " (onMediaDiscovered-loadMedia)");
        }

        if (how == 'activeSession') {
            // TODO: Use currentMediaSession?
            this.castPlayerState = this.session.media[0].playerState;
            console.log(this.castPlayerState + " (onMediaDiscovered-activeSession)");
            this.currentMediaTime = Math.round(this.session.media[0].currentTime);
        }

        this.currentMediaSession.addUpdateListener(this.onMediaStatusUpdate.bind(this));

        // update UI
        this.updateMediaControlUI();
    };

    /**
     * Callback function when media load returns error
     */
    CastPlayer.prototype.onLoadMediaError = function (e) {
        console.log("media error");
        this.castPlayerState = PLAYER_STATE.IDLE;
        console.log(this.castPlayerState + " (onLoadMediaError)");
        this.updateMediaControlUI();
    };

    /**
     * Callback function for media status update from receiver
     * @param {!Boolean} alive whether the media object is still alive.
     */
    CastPlayer.prototype.onMediaStatusUpdate = function (alive) {
        if (!alive) {
            this.castPlayerState = PLAYER_STATE.IDLE;
            console.log(this.castPlayerState + " (onMediaStatusUpdate-dead)");
        } else {
            this.castPlayerState = this.currentMediaSession.playerState;
            console.log(this.castPlayerState + " (onMediaStatusUpdate)");
        }

        this.updateProgressBar();
        this.updateMediaControlUI();
    };

    /**
     * Helper function
     * Increment media current position by 1 second
     */
    CastPlayer.prototype.incrementMediaTime = function () {
        if (this.castPlayerState == PLAYER_STATE.PLAYING) {
            if (this.currentMediaTime < this.currentMediaDuration) {
                this.currentMediaTime += 1;
                this.updateProgressBar();
            }
        }
    };

    /**
     * Updates the duration label.
     */
    CastPlayer.prototype.updateDurationLabel = function () {
        $("#duration").html(this.formatDuration(this.currentMediaDuration));
    };

    CastPlayer.prototype.formatDuration = function (duration) {
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
    };

    /**
     * Play media in Cast or local mode
     */
    CastPlayer.prototype.playMedia = function () {
        if (!this.currentMediaSession) {
            this.localPlayer.play(true);
            return;
        }

        switch (this.castPlayerState) {
            case PLAYER_STATE.LOADED:
            case PLAYER_STATE.PAUSED:
                this.currentMediaSession.play(null,
                        this.mediaCommandSuccessCallback.bind(this, "playing started for " + this.currentMediaSession.sessionId),
                        this.onError.bind(this));
                this.currentMediaSession.addUpdateListener(this.onMediaStatusUpdate.bind(this));
                this.castPlayerState = PLAYER_STATE.PLAYING;
                console.log(this.castPlayerState + " (playMedia)");
                break;
            case PLAYER_STATE.IDLE:
            case PLAYER_STATE.LOADING:
                this.loadMedia();
                this.currentMediaSession.addUpdateListener(this.onMediaStatusUpdate.bind(this));
                this.castPlayerState = PLAYER_STATE.PLAYING;
                console.log(this.castPlayerState + " (playMedia)");
                break;
            default:
                break;
        }
        this.updateMediaControlUI();
    };

    /**
     * Play media in local player
     * @param {Number} offset A number for media current position
     */
    CastPlayer.prototype.playMediaLocally = function (offset) {
        this.localPlayer.play();
        this.localPlayer.seek(offset);
        this.updateMediaControlUI();
    };

    /**
     * Pause media playback in Cast mode
     */
    CastPlayer.prototype.pauseMedia = function () {
        if (!this.currentMediaSession) {
            this.pauseMediaLocally();
            return;
        }

        if (this.castPlayerState == PLAYER_STATE.PLAYING) {
            this.castPlayerState = PLAYER_STATE.PAUSED;
            console.log(this.castPlayerState + " (pauseMedia)");
            this.currentMediaSession.pause(null,
                    this.mediaCommandSuccessCallback.bind(this, "paused " + this.currentMediaSession.sessionId),
                    this.onError.bind(this));
            this.updateMediaControlUI();
        }
    };

    /**
     * Share the video.
     */
    CastPlayer.prototype.share = function () {
        location.href = "createShare.view?id=${model.video.id}";
    };

    /**
     * Download the video.
     */
    CastPlayer.prototype.download = function () {
        location.href = "download.view?id=${model.video.id}";
    };

    /**
     * Turns captions on/off.
     */
    CastPlayer.prototype.toggleCaptions = function (enabled) {
        this.localPlayer.setCurrentCaptions(enabled ? 1 : 0);

        if (this.currentMediaSession) {
            var request = new chrome.cast.media.EditTracksInfoRequest(enabled ? [1] : []);
            this.currentMediaSession.editTracksInfo(request,
                    this.mediaCommandSuccessCallback.bind(this, "editTracksInfo " + this.currentMediaSession.sessionId),
                    this.onError.bind(this));

        }
    };

    /**
     * Open the video in a new window.
     */
    CastPlayer.prototype.newWindow = function () {
        this.localPlayer.pause(true);
        window.open("videoPlayer.view?id=${model.video.id}&position=" + Math.round(this.localPlayer.getPosition()));
    };

    /**
     * Pause media playback in local player
     */
    CastPlayer.prototype.pauseMediaLocally = function () {
        this.localPlayer.pause();
        this.updateMediaControlUI();
    };

    /**
     * Stop media playback in local player
     */
    CastPlayer.prototype.stopMediaLocally = function () {
        this.localPlayer.stop();
        this.updateMediaControlUI();
    };

    /**
     * Set media volume in local or Cast mode
     * @param {Boolean} mute A boolean
     */
    CastPlayer.prototype.setVolume = function (mute) {
        this.currentVolume = parseInt($("#volume-slider").slider("option", "value"));

        if (!this.currentMediaSession) {
            this.localPlayer.setMute(mute);
            if (!mute) {
                this.localPlayer.setVolume(this.currentVolume);
            }
            return;
        }

        if (mute) {
            this.session.setReceiverMuted(true,
                    this.mediaCommandSuccessCallback.bind(this),
                    this.onError.bind(this));
        } else {
            this.session.setReceiverVolumeLevel(this.currentVolume / 100.0,
                    this.mediaCommandSuccessCallback.bind(this),
                    this.onError.bind(this));
        }
        this.updateMediaControlUI();
    };

    /**
     * Toggle mute in either Cast or local mode
     */
    CastPlayer.prototype.muteMedia = function () {
        this.muted = !this.muted;
        this.setVolume(this.muted);
        $('#audio_on').toggle(!this.muted);
        $('#audio_off').toggle(this.muted);
        this.updateMediaControlUI();
    };

    /**
     * media seek function in either Cast or local mode
     */
    CastPlayer.prototype.seekMedia = function () {

        var offset = parseInt($("#progress-slider").slider("option", "value"));
        this.currentMediaTime = offset;

        if (this.localPlayerState == PLAYER_STATE.PLAYING || this.localPlayerState == PLAYER_STATE.PAUSED) {
            this.localPlayer.seek(offset);
            return;
        }

        if (this.castPlayerState != PLAYER_STATE.PLAYING && this.castPlayerState != PLAYER_STATE.PAUSED) {
            return;
        }

        var seekRequest = new chrome.cast.media.SeekRequest();
        seekRequest.currentTime = offset;
        console.log(seekRequest);
        this.currentMediaSession.seek(seekRequest,
                this.mediaCommandSuccessCallback.bind(this, "seek " + this.currentMediaSession.sessionId),
                this.onError.bind(this));

        this.castPlayerState = PLAYER_STATE.SEEKING;
        this.updateMediaControlUI();
    };

    /**
     * Callback function for media command success
     */
    CastPlayer.prototype.mediaCommandSuccessCallback = function (info, e) {
        this.currentMediaTime = Math.round(this.session.media[0].currentTime);
        if (info) {
            console.log(info);
        }
    };

    /**
     * Update progress bar with the current media time.
     */
    CastPlayer.prototype.updateProgressBar = function () {
        $("#progress-slider").slider("option", "value", this.currentMediaTime);
        $("#progress").html(this.formatDuration(this.currentMediaTime));
    };

    CastPlayer.prototype.updateDebug = function () {
        var debug = "<br>currentMediaTime: " + this.currentMediaTime + "<br>"
                + "localPlayerState: " + this.localPlayerState + "<br>"
                + "castPlayerState: " + this.castPlayerState;
        $("#debug").html(debug);
    };

    /**
     * Update media control UI components based on localPlayerState or castPlayerState
     */
    CastPlayer.prototype.updateMediaControlUI = function () {

        var playerState = this.localPlayerState;

        if (this.deviceState == DEVICE_STATE.NOT_PRESENT) {
            $("#cast-active").hide();
            $("#cast-idle").hide();
            $("#overlay").hide();
        } else if (this.deviceState == DEVICE_STATE.ACTIVE) {
            $("#cast-active").show();
            $("#cast-idle").hide();
            $("#overlay").css("display", "flex");
            playerState = this.castPlayerState;
        } else {
            $("#cast-active").hide();
            $("#cast-idle").show();
            $("#overlay").hide();
        }

        switch (playerState) {
            case PLAYER_STATE.PAUSED:
            case PLAYER_STATE.IDLE:
                $("#play").show();
                $("#pause").hide();
                $("#buffer").hide();
                break;
            case PLAYER_STATE.PLAYING:
                $("#play").hide();
                $("#pause").show();
                $("#buffer").hide();
                break;
            case PLAYER_STATE.LOADED:
            case PLAYER_STATE.LOADING:
            case PLAYER_STATE.BUFFERING:
            case PLAYER_STATE.SEEKING:
                $("#play").hide();
                $("#pause").hide();
                $("#buffer").show();
                break;
            default:
                break;
        }
    };

    /**
     * Initialize UI components and add event listeners
     */
    CastPlayer.prototype.initializeUI = function () {

        $("#progress-slider").slider({max: this.currentMediaDuration, range: "min"});
        $("#volume-slider").slider({max: 100, value: 50, animate: "fast", range: "min"});

        // add event handlers to UI components
        $("#cast-idle").on('click', this.launchApp.bind(this));
        $("#cast-active").on('click', this.stopApp.bind(this));
        $("#progress-slider").on('slidestop', this.seekMedia.bind(this));
        $("#volume-slider").on('slidestop', this.setVolume.bind(this, false));
        $("#audio-on").on('click', this.muteMedia.bind(this));
        $("#audio-off").on('click', this.muteMedia.bind(this));
        $("#play").on('click', this.playMedia.bind(this));
        $("#pause").on('click', this.pauseMedia.bind(this));
        $("#cc-on").on('click', this.toggleCaptions.bind(this, false));
        $("#cc-off").on('click', this.toggleCaptions.bind(this, true));
        $("#share").on('click', this.share.bind(this));
        $("#download").on('click', this.download.bind(this));
        $("#new-window").on('click', this.newWindow.bind(this)).toggle(this.initialPosition == null);

        $("#cc-on").toggle(this.hasCaptions);

        <c:if test="${not model.user.shareRole}">
        $("#share").hide();
        </c:if>
        <c:if test="${not model.user.downloadRole}">
        $("#download").hide();
        </c:if>

        $("#media-control").mouseenter(function (event) {
                $(".ui-slider-handle").fadeIn();
        });
        $("#media-control").mouseleave(function (event) {
                $(".ui-slider-handle").fadeOut();
        });

//        setInterval(this.updateDebug.bind(this), 100);
    };

    window.CastPlayer = CastPlayer;
})();
</script>