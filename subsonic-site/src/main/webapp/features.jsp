<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>
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

<!DOCTYPE HTML>
<html>
<%@ include file="head.jsp" %>

<body>

<c:import url="header.jsp"/>

<section id="main" class="container">
    <header>
        <h2>Subsonic Features</h2>
    </header>

    <section class="box">

        <h3>Easy to use</h3>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li>Listen to your music from anywhere &ndash; all you need is a browser.</li>
                    <li>The clean web interface is optimized for constrained bandwidth environments and efficient browsing through large music
                        collections (hundreds of gigabytes).</li>
                    <li>Free-text search helps you find your favorite tracks quickly.</li>
                    <li>Displays cover art, including images embedded in ID3 tags.</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li>Assign ratings and comments to albums.</li>
                    <li>Star your favorite artists, albums and tracks.</li>
                    <li>Create your own playlist and share them with other users if you like.</li>
                    <li>Administer the play queue (add, remove, rearrange, repeat, shuffle, undo, save, load).</li>
                </ul>
            </div>
        </div>

        <h3>Works with all media formats</h3>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li>Supports MP3, OGG, AAC and any other audio or video format that streams over HTTP.</li>
                    <li><a href="transcoding.jsp">Transcoding engine</a> allows for streaming of a variety of lossy and lossless formats by converting to MP3 on-the-fly.</li>
                    <li>Works with any network-enabled media player, such as Winamp, iTunes, XMMS, VLC, MusicMatch and Windows Media Player. Also includes an embedded Flash player.</li>
                    <li>Tag parsing and editing of MP3, AAC, OGG, FLAC, WMA and APE files, using the <a target="_blank" href="http://www.jthink.net/jaudiotagger/">Jaudiotagger</a> library.</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li>Playlists can be imported and exported. M3U, PLS and XSPF formats are supported. Saved playlists are available as Podcasts.</li>
                    <li>On-the-fly resampling to lower bitrates using the high-quality ffmpeg encoder. Handy if your bandwidth is limited.</li>
                    <li>Implements the SHOUTcast protocol. Players which support this (including Winamp, iTunes and XMMS) display the current artist and song, along
                        with other metadata.</li>
                    <li>HLS video streaming supported.</li>
                </ul>
            </div>
        </div>

        <h3>Customizable user experience</h3>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li>Available in 28 languages.</li>
                    <li>Select from 30 different themes.</li>
                    <li>Highly configurable user interface.</li>
                    <li>Select your personal avatar.</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li>Chat with other users.</li>
                    <li>Automatic album lists (newest, starred, most played, top rated etc).</li>
                    <li>Browse by genre and decade.</li>
                </ul>
            </div>
        </div>

        <h3>Versatile</h3>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li>Stream music directly to your phone. More than 25 <a href="apps.jsp">apps</a> available.
                    <li>Works with any number of users, and any number of simultaneous players.</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li>Share your media on Facebook, Twitter, Google+.</li>
                    <li>Access your server using your own <em>yourname.subsonic.org</em> address.</li>
                    <li>Open <a href="api.jsp">REST API</a> for app developers.</li>
                </ul>
            </div>
        </div>

        <h3>Integrates with the best web services</h3>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li>Automatically register what you're playing on Last.fm, using the built-in Audioscrobbling support.</li>
                    <li>Show artist images, similar artists and biography from Last.fm</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li>Find cover art and lyrics using web services from Google and Chartlyrics.</li>
                    <li>Read album reviews and more at Wikipedia, Google Music and allmusic.</li>
                </ul>
            </div>
        </div>

        <h3>Secure and reliable</h3>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li>Users must log in with a username and password. Users are assigned different privileges.</li>
                    <li>Specify upload and download bandwidth limits.</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li>Supports authentication in LDAP and Active Directory.</li>
                    <li>Runs for months without crashing, hanging or leaking resources.</li>
                    <li>Use HTTPS/SSL encryption for ultimate protection.</li>
                </ul>
            </div>
        </div>

        <h3>Awesome extra features</h3>
        <div class="row">
            <div class="6u 12u(3)">
                <ul>
                    <li>Stream to your Chromecast and Sonos devices.</li>
                    <li>Download Podcasts with the integrated Podcast receiver.</li>
                    <li>Manage your internet TV and radio stations.</li>
                </ul>
            </div>

            <div class="6u 12u(3)">
                <ul>
                    <li>Play your media on compatible DLNA/UPnP devices.</li>
                    <li>Play music directly on the server's audio hardware using the jukebox mode.</li>
                </ul>
            </div>
        </div>

    </section>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>