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
    <h2>Transcoding</h2>
</header>
<div class="row">
<div class="12u">

<section class="box">

    <p>
        Transcoding is the process of converting media from one format to another. Subsonic's transcoding engine allows for streaming of
        media that would normally not be streamable, for instance lossless formats. The transcoding is performed on-the-fly and doesn't require any disk usage.
    </p>

    <p>
        The actual transcoding is done by third-party command line programs which are installed in:
    </p>
    <table>
        <tr><td>Windows</td><td><strong>c:\booksonic\transcode</strong></td></tr>
        <tr><td>Mac</td><td><strong>/Library/Application Support/Subsonic/transcode</strong></td></tr>
        <tr><td>Linux</td><td><strong>/var/booksonic/transcode</strong></td></tr>
    </table>

    <p>
        Note that two transcoders can be chained together. Subsonic comes pre-installed with ffmpeg which supports
        a huge range of audio and video formats.
    </p>

    <h3>Recommended configuration</h3>
    <p>
        The recommended settings for audio and video transcoding are:
    </p>
    <table>
        <tr><td>mp3 audio</td><td><strong>ffmpeg -i %s -map 0:0 -b:a %bk -v 0 -f mp3 -</strong></td></tr>
        <tr><td>flv/h264 video</td><td><strong>ffmpeg -ss %o -i %s -async 1 -b %bk -s %wx%h -ar 44100 -ac 2 -v 0 -f flv -c:v libx264 -preset superfast -threads 0 -</strong></td></tr>
        <tr><td>mkv video</td><td><strong>ffmpeg -ss %o -i %s -c:v libx264 -preset superfast -b:v %bk -c:a libvorbis -f matroska -threads 0 -</strong></td></tr>
    </table>

    <p>
        The recommended <strong>downsample</strong> command is:
    </p>
    <p>
    <table><tr><td><strong>ffmpeg -i %s -map 0:0 -b:a %bk -v 0 -f mp3 -</strong></td></tr></table>

    <p>
        The recommended <b>HTTP Live Streaming</b> (HLS) command is:
    </p>
    <table><tr><td><strong>ffmpeg -ss %o -t %d -i %s -async 1 -b:v %bk -s %wx%h -ar 44100 -ac 2 -v 0 -f mpegts -c:v libx264 -preset superfast -c:a libmp3lame -threads 0 -</strong></td></tr></table>

    <p>
        Note that "%s" is substituted with the path of the original file at run-time, and "%b" is substituted with
        the max bitrate of the player. "%t", "%a" and "%l" are substituted with the song's title, artist and album.
    </p>


    <h3>Adding custom transcoders</h3>
    <p>
        You can add your own custom transcoder given that it fulfills the following requirements:
    </p>
    <ul>
        <li>It must have a command line interface.</li>
        <li>It must be able to send output to stdout.</li>
        <li>If used in transcoding step 2 it must be able to read input from stdin.</li>
    </ul>

    <h3>Troubleshooting</h3>
    <ul>
        <li>Is the transcoder installed in <strong>c:\booksonic\transcode</strong> (or <strong>/var/booksonic/transcode</strong>)?</li>
        <li>Is the transcoder activated for your player (in Settings &gt; Players)?</li>
        <li>Is the proper file extension added to the list of recognized file types (in Settings &gt; General)?</li>
        <li>If it still doesn't work, please check the Subsonic log.</li>
    </ul>

</section>
</div>
</div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>