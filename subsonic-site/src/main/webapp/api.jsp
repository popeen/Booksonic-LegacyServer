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
    <h2>Subsonic API</h2>
</header>
<div class="row">
<div class="12u">

<section class="box">

<p>
    The Subsonic API allows anyone to build their own programs using Subsonic as the media server,
    whether they're on the web, the desktop or on mobile devices. All the Subsonic <a href="apps.jsp">apps</a>
    are built using the Subsonic API.
</p>

<p>
    Feel free to join the <a target="_blank" href="http://groups.google.com/group/subsonic-app-developers">Subsonic App
    Developers</a> group for discussions, suggestions and questions.
</p>

<h3>Introduction</h3>

<p>
    The Subsonic API allows you to call methods that respond in
    <a target="_blank" href="http://en.wikipedia.org/wiki/Representational_State_Transfer">REST</a> style xml.
    Individual methods are detailed below.
</p>

<p>
    Please note that all methods take the following parameters:
</p>

<div class="table-wrapper">
    <table class="alt">
        <thead>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><code>u</code></td>
            <td>Yes</td>
            <td></td>
            <td>The username.</td>
        </tr>
        <tr>
            <td><code>p</code></td>
            <td>Yes*</td>
            <td></td>
            <td>The password, either in clear text or hex-encoded with a "enc:" prefix. Since <a href="#versions">1.13.0</a>
                this should only be used for testing purposes.</td>
        </tr>
        <tr>
            <td><code>t</code></td>
            <td>Yes*</td>
            <td></td>
            <td>(Since <a href="#versions">1.13.0</a>) The authentication token computed as <strong>md5(password + salt)</strong>.
                See below for details.</td>
        </tr>
        <tr>
            <td><code>s</code></td>
            <td>Yes*</td>
            <td></td>
            <td>(Since <a href="#versions">1.13.0</a>) A random string ("salt") used as input for computing the password hash.
                See below for details.</td>
        </tr>
        <tr>
            <td><code>v</code></td>
            <td>Yes</td>
            <td></td>
            <td>The protocol version implemented by the client, i.e., the version of the
                <a href="#versions">subsonic-rest-api.xsd</a> schema used (see below).
            </td>
        </tr>
        <tr>
            <td><code>c</code></td>
            <td>Yes</td>
            <td></td>
            <td>A unique string identifying the client application.</td>
        </tr>
        <tr>
            <td><code>f</code></td>
            <td>No</td>
            <td>xml</td>
            <td>Request data to be returned in this format. Supported values are "xml", "json" (since <a
                    href="#versions">1.4.0</a>) and "jsonp" (since <a href="#versions">1.6.0</a>). If
                using jsonp, specify name of javascript callback function using a <code>callback</code>
                parameter.
            </td>
        </tr>
        </tbody>
    </table>
</div>

<p>
    *) Either <code>p</code> or <em>both</em> <code>t</code> and <code>s</code> must be specified.
</p>

<p>
    Remember to <a href="http://www.w3schools.com/tags/ref_urlencode.asp">URL encode</a> the request parameters.
    All methods (except those that return binary data) returns XML documents conforming to the
    <a href="#versions">subsonic-rest-api.xsd</a> schema. The XML documents are encoded with UTF-8.
</p>

<h3>Authentication</h3>
<p>
    If your targeting API version <a href="#versions">1.12.0</a> or earlier, authentication is performed by sending
    the password as clear text or hex-encoded.  Examples:
</p>

<p>
    <code>http://your-server/rest/ping.view?u=joe&amp;p=sesame&amp;v=1.12.0&amp;c=myapp</code>
    <br>
    <code>http://your-server/rest/ping.view?u=joe&amp;p=enc:736573616d65&amp;v=1.12.0&amp;c=myapp</code>
</p>

<p>
    Starting with API version <a href="#versions">1.13.0</a>, the recommended authentication scheme is to send
    an authentication token, calculated as a <em>one-way salted hash</em> of the password.
</p>
<p>This involves two steps:</p>
<ol>
    <li>For each REST call, generate a random string called the <em>salt</em>. Send this as parameter <code>s</code>.</li>
    Use a salt length of at least six characters.
    <li>Calculate the authentication token as follows: <strong>token = md5(password + salt)</strong>.
        The md5() function takes a string and returns the 32-byte ASCII hexadecimal representation of the MD5 hash, using lower case
        characters for the hex values. The '+' operator represents concatenation of the two strings. Treat the strings
        as UTF-8 encoded when calculating the hash. Send the result as parameter <code>t</code>.
    </li>
</ol>
<p>
    For example: if the password is <strong>sesame</strong> and the random salt is <strong>c19b2d</strong>, then
    <strong>token = md5("sesamec19b2d") = 26719a1196d2a940705a59634eb18eab</strong>. The corresponding request URL then becomes:
</p>
<p>
    <code>http://your-server/rest/ping.view?u=joe&amp;t=26719a1196d2a940705a59634eb18eab&amp;s=c19b2d&amp;v=1.12.0&amp;c=myapp</code>
</p>
<%--<p>--%>
    <%--Starting with API version <a href="#versions">1.2.0</a> it is no longer necessary to send the--%>
    <%--username and password as part of the URL. Instead, HTTP <a target="_blank"--%>
                                                               <%--href="http://en.wikipedia.org/wiki/Basic_access_authentication">Basic</a>--%>
    <%--authentication could be used. (Only <em>preemptive</em> authentication is supported, meaning that--%>
    <%--the credentials should be supplied by the client without being challenged for it.)--%>
<%--</p>--%>

<h3>Error handling</h3>

<p>
    If a method fails it will return an error code and message in an <code>&lt;error&gt;</code> element.
    In addition, the <code>status</code> attribute of the <code>&lt;subsonic-response&gt;</code> root
    element will be set to <code>failed</code> instead of <code>ok</code>. For example:
</p>

<p class="codeblock">
    &lt;?xml version="1.0" encoding="UTF-8"?&gt;<br>
    &lt;subsonic-response xmlns="http://subsonic.org/restapi" status="failed" version="1.1.0"&gt;<br>
    &nbsp;&nbsp;&nbsp;&lt;error code="40" message="Wrong username or password"/&gt;<br>
    &lt;/subsonic-response&gt;<br>
</p>

<p>
    The following error codes are defined:
</p>

<div class="table-wrapper">
    <table class="alt">
        <thead>
        <tr>
            <th>Code</th>
            <th>Description</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>0</td>
            <td>A generic error.</td>
        </tr>
        <tr>
            <td>10</td>
            <td>Required parameter is missing.</td>
        </tr>
        <tr>
            <td>20</td>
            <td>Incompatible Subsonic REST protocol version. Client must upgrade.</td>
        </tr>
        <tr>
            <td>30</td>
            <td>Incompatible Subsonic REST protocol version. Server must upgrade.</td>
        </tr>
        <tr>
            <td>40</td>
            <td>Wrong username or password.</td>
        </tr>
        <tr>
            <td>50</td>
            <td>User is not authorized for the given operation.</td>
        </tr>
        <tr>
            <td>50</td>
            <td>The trial period for the Subsonic server is over. Please upgrade to Subsonic Premium.
                Visit subsonic.org for details.
            </td>
        </tr>
        <tr>
            <td>70</td>
            <td>The requested data was not found.</td>
        </tr>
        </tbody>
    </table>
</div>


<h3><a name="versions"></a>Versions</h3>

<p>
    This table shows the REST API version implemented in different Subsonic versions:
</p>

<div class="table-wrapper">
    <table class="alt">
        <thead>
        <tr>
            <th>Subsonic version</th>
            <th>REST API version</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>6.0</td>
            <td>
                <a href="https://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-1.2.release/subsonic-rest-api/src/main/resources/subsonic-rest-api.xsd">1.14.0</a>
            </td>
        </tr>
        <tr>
            <td>5.3</td>
            <td>
                <a href="https://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-5.3/subsonic-rest-api/src/main/resources/subsonic-rest-api.xsd">1.13.0</a>
            </td>
        </tr>
        <tr>
            <td>5.2</td>
            <td>
                <a href="https://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-5.2/subsonic-rest-api/src/main/resources/subsonic-rest-api.xsd">1.12.0</a>
            </td>
        </tr>
        <tr>
            <td>5.1</td>
            <td>
                <a href="https://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-5.1/subsonic-rest-api/src/main/resources/subsonic-rest-api.xsd">1.11.0</a>
            </td>
        </tr>
        <tr>
            <td>4.9</td>
            <td>
                <a href="https://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-4.9/subsonic-site/src/main/webapp/inc/api/subsonic-rest-api.xsd">1.10.2</a>
            </td>
        </tr>
        <tr>
            <td>4.8</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-4.8/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.9.0</a>
            </td>
        </tr>
        <tr>
            <td>4.7</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-4.7/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.8.0</a>
            </td>
        </tr>
        <tr>
            <td>4.6</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-4.6/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.7.0</a>
            </td>
        </tr>
        <tr>
            <td>4.5</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-4.5/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.6.0</a>
            </td>
        </tr>
        <tr>
            <td>4.4</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-4.4/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.5.0</a>
            </td>
        </tr>
        <tr>
            <td>4.2</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-4.2/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.4.0</a>
            </td>
        </tr>
        <tr>
            <td>4.1</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-4.1.beta1/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.3.0</a>
            </td>
        </tr>
        <tr>
            <td>4.0</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-4.0/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.2.0</a>
            </td>
        </tr>
        <tr>
            <td>3.9</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-3.9/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.1.1</a>
            </td>
        </tr>
        <tr>
            <td>3.8</td>
            <td>
                <a href="http://sourceforge.net/p/subsonic/code/HEAD/tree/tags/release-3.8/subsonic-main/src/main/webapp/xsd/subsonic-rest-api.xsd">1.1.0</a>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<p>
    Note that a Subsonic server is backward compatible with a REST client if and only if the major version is the same,
    and the minor version of the client is less than or equal to the server's. For example, if the server has
    REST API version 2.2, it supports client versions 2.0, 2.1 and 2.2, but not versions 1.x, 2.3+ or 3.x. The third
    part of the version number is not used to determine compatibility.
</p>

<h3>File structure vs ID3 tags</h3>

<p>
    Starting with version <a href="#versions">1.8.0</a>, the API provides methods for accessing the media collection
    organized according to ID3 tags, rather than file structure.
</p>

<p>
    For instance, browsing through the collection using ID3 tags should use the <code>getArtists</code>,
    <code>getArtist</code>
    and <code>getAlbum</code> methods.
    To browse using file structure you would use <code>getIndexes</code> and <code>getMusicDirectory</code>.
</p>

<p>
    Correspondingly, there are two sets of methods for searching, starring and album lists. Refer to the method
    documentation for details.
</p>

<h2>API method documentation</h2>

<div class="table-wrapper">
    <table class="alt">
        <tbody>
        <tr>
            <td>System</td>
            <td>
                <code><a href="#ping">ping</a></code>
                <code><a href="#getLicense">getLicense</a></code>
            </td>
        </tr>
        <tr>
            <td>Browsing</td>
            <td>
                <code><a href="#getMusicFolders">getMusicFolders</a></code>
                <code><a href="#getIndexes">getIndexes</a></code>
                <code><a href="#getMusicDirectory">getMusicDirectory</a></code>
                <code><a href="#getGenres">getGenres</a></code>
                <code><a href="#getArtists">getArtists</a></code>
                <code><a href="#getArtist">getArtist</a></code>
                <code><a href="#getAlbum">getAlbum</a></code>
                <code><a href="#getSong">getSong</a></code>
                <code><a href="#getVideos">getVideos</a></code>
                <code><a href="#getArtistInfo">getArtistInfo</a></code>
                <code><a href="#getArtistInfo2">getArtistInfo2</a></code>
                <code><a href="#getAlbumInfo">getAlbumInfo</a></code>
                <code><a href="#getAlbumInfo2">getAlbumInfo2</a></code>
                <code><a href="#getSimilarSongs">getSimilarSongs</a></code>
                <code><a href="#getSimilarSongs2">getSimilarSongs2</a></code>
                <code><a href="#getTopSongs">getTopSongs</a></code>
            </td>
        </tr>
        <tr>
            <td>Album/song lists</td>
            <td>
                <code><a href="#getAlbumList">getAlbumList</a></code>
                <code><a href="#getAlbumList2">getAlbumList2</a></code>
                <code><a href="#getRandomSongs">getRandomSongs</a></code>
                <code><a href="#getSongsByGenre">getSongsByGenre</a></code>
                <code><a href="#getNowPlaying">getNowPlaying</a></code>
                <code><a href="#getStarred">getStarred</a></code>
                <code><a href="#getStarred2">getStarred2</a></code>
            </td>
        </tr>
        <tr>
            <td>Searching</td>
            <td>
                <code><a href="#search">search</a></code>
                <code><a href="#search2">search2</a></code>
                <code><a href="#search3">search3</a></code>
            </td>
        </tr>
        <tr>
            <td>Playlists</td>
            <td>
                <code><a href="#getPlaylists">getPlaylists</a></code>
                <code><a href="#getPlaylist">getPlaylist</a></code>
                <code><a href="#createPlaylist">createPlaylist</a></code>
                <code><a href="#updatePlaylist">updatePlaylist</a></code>
                <code><a href="#deletePlaylist">deletePlaylist</a></code>
            </td>
        </tr>
        <tr>
            <td>Media retrieval</td>
            <td>
                <code><a href="#stream">stream</a></code>
                <code><a href="#download">download</a></code>
                <code><a href="#hls">hls</a></code>
                <code><a href="#getCoverArt">getCoverArt</a></code>
                <code><a href="#getLyrics">getLyrics</a></code>
                <code><a href="#getAvatar">getAvatar</a></code>
            </td>
        </tr>
        <tr>
            <td>Media annotation</td>
            <td>
                <code><a href="#star">star</a></code>
                <code><a href="#unstar">unstar</a></code>
                <code><a href="#setRating">setRating</a></code>
                <code><a href="#scrobble">scrobble</a></code>
            </td>
        </tr>
        <tr>
            <td>Sharing</td>
            <td>
                <code><a href="#getShares">getShares</a></code>
                <code><a href="#createShare">createShare</a></code>
                <code><a href="#updateShare">updateShare</a></code>
                <code><a href="#deleteShare">deleteShare</a></code>
            </td>
        </tr>
        <tr>
            <td>Podcast</td>
            <td>
                <code><a href="#getPodcasts">getPodcasts</a></code>
                <code><a href="#getNewestPodcasts">getNewestPodcasts</a></code>
                <code><a href="#refreshPodcasts">refreshPodcasts</a></code>
                <code><a href="#createPodcastChannel">createPodcastChannel</a></code>
                <code><a href="#deletePodcastChannel">deletePodcastChannel</a></code>
                <code><a href="#deletePodcastEpisode">deletePodcastEpisode</a></code>
                <code><a href="#downloadPodcastEpisode">downloadPodcastEpisode</a></code>
            </td>
        </tr>
        <tr>
            <td>Jukebox</td>
            <td>
                <code><a href="#jukeboxControl">jukeboxControl</a></code>
            </td>
        </tr>
        <tr>
            <td>Internet radio</td>
            <td>
                <code><a href="#getInternetRadioStations">getInternetRadioStations</a></code>
            </td>
        </tr>
        <tr>
            <td>Chat</td>
            <td>
                <code><a href="#getChatMessages">getChatMessages</a></code>
                <code><a href="#addChatMessage">addChatMessage</a></code>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap">User management</td>
            <td>
                <code><a href="#getUser">getUser</a></code>
                <code><a href="#getUsers">getUsers</a></code>
                <code><a href="#createUser">createUser</a></code>
                <code><a href="#updateUser">updateUser</a></code>
                <code><a href="#deleteUser">deleteUser</a></code>
                <code><a href="#changePassword">changePassword</a></code>
            </td>
        </tr>
        <tr>
            <td>Bookmarks</td>
            <td>
                <code><a href="#getBookmarks">getBookmarks</a></code>
                <code><a href="#createBookmark">createBookmark</a></code>
                <code><a href="#deleteBookmark">deleteBookmark</a></code>
                <code><a href="#getPlayQueue">getPlayQueue</a></code>
                <code><a href="#savePlayQueue">savePlayQueue</a></code>
            </td>
        </tr>
        </tbody>
    </table>
</div>
</section>

<%@ include file="api-ping.jsp" %>
<%@ include file="api-getLicense.jsp" %>

<%@ include file="api-getMusicFolders.jsp" %>
<%@ include file="api-getIndexes.jsp" %>
<%@ include file="api-getMusicDirectory.jsp" %>
<%@ include file="api-getGenres.jsp" %>
<%@ include file="api-getArtists.jsp" %>
<%@ include file="api-getArtist.jsp" %>
<%@ include file="api-getAlbum.jsp" %>
<%@ include file="api-getSong.jsp" %>
<%@ include file="api-getVideos.jsp" %>
<%@ include file="api-getArtistInfo.jsp" %>
<%@ include file="api-getArtistInfo2.jsp" %>
<%@ include file="api-getAlbumInfo.jsp" %>
<%@ include file="api-getAlbumInfo2.jsp" %>
<%@ include file="api-getSimilarSongs.jsp" %>
<%@ include file="api-getSimilarSongs2.jsp" %>
<%@ include file="api-getTopSongs.jsp" %>

<%@ include file="api-getAlbumList.jsp" %>
<%@ include file="api-getAlbumList2.jsp" %>
<%@ include file="api-getRandomSongs.jsp" %>
<%@ include file="api-getSongsByGenre.jsp" %>
<%@ include file="api-getNowPlaying.jsp" %>
<%@ include file="api-getStarred.jsp" %>
<%@ include file="api-getStarred2.jsp" %>

<%@ include file="api-search.jsp" %>
<%@ include file="api-search2.jsp" %>
<%@ include file="api-search3.jsp" %>

<%@ include file="api-getPlaylists.jsp" %>
<%@ include file="api-getPlaylist.jsp" %>
<%@ include file="api-createPlaylist.jsp" %>
<%@ include file="api-updatePlaylist.jsp" %>
<%@ include file="api-deletePlaylist.jsp" %>

<%@ include file="api-stream.jsp" %>
<%@ include file="api-download.jsp" %>
<%@ include file="api-hls.jsp" %>
<%@ include file="api-getCoverArt.jsp" %>
<%@ include file="api-getLyrics.jsp" %>
<%@ include file="api-getAvatar.jsp" %>

<%@ include file="api-star.jsp" %>
<%@ include file="api-unstar.jsp" %>
<%@ include file="api-setRating.jsp" %>
<%@ include file="api-scrobble.jsp" %>

<%@ include file="api-getShares.jsp" %>
<%@ include file="api-createShare.jsp" %>
<%@ include file="api-updateShare.jsp" %>
<%@ include file="api-deleteShare.jsp" %>

<%@ include file="api-getPodcasts.jsp" %>
<%@ include file="api-getNewestPodcasts.jsp" %>
<%@ include file="api-refreshPodcasts.jsp" %>
<%@ include file="api-createPodcastChannel.jsp" %>
<%@ include file="api-deletePodcastChannel.jsp" %>
<%@ include file="api-deletePodcastEpisode.jsp" %>
<%@ include file="api-downloadPodcastEpisode.jsp" %>

<%@ include file="api-jukeboxControl.jsp" %>

<%@ include file="api-getInternetRadioStations.jsp" %>

<%@ include file="api-getChatMessages.jsp" %>
<%@ include file="api-addChatMessage.jsp" %>

<%@ include file="api-getUser.jsp" %>
<%@ include file="api-getUsers.jsp" %>
<%@ include file="api-createUser.jsp" %>
<%@ include file="api-updateUser.jsp" %>
<%@ include file="api-deleteUser.jsp" %>
<%@ include file="api-changePassword.jsp" %>

<%@ include file="api-getBookmarks.jsp" %>
<%@ include file="api-createBookmark.jsp" %>
<%@ include file="api-deleteBookmark.jsp" %>
<%@ include file="api-getPlayQueue.jsp" %>
<%@ include file="api-savePlayQueue.jsp" %>

</div>
</div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>