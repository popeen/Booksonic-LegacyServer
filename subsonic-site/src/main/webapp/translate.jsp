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
    <h2>Translating Subsonic</h2>
</header>
<div class="row">
<div class="12u">

<section class="box">

    <p>
        Here's how to translate Subsonic to a new language. This description assumes that you're using the Windows installer
        version of Subsonic.
    </p>

    <p>
        In the following, <strong>&lt;ROOT&gt;</strong> refers to the directory in which you installed Subsonic
        &ndash; normally <strong>c:\Program Files\Subsonic</strong>.
    </p>
    <ol>
        <li>Stop the Subsonic service if it's running.</li>
        <li>Rename <strong>&lt;ROOT&gt;\booksonic.war</strong> to <strong>&lt;ROOT&gt;\subsonic.zip</strong>.</li>
        <li>Unzip the zip file into a new <em>directory</em> called <strong>&lt;ROOT&gt;\booksonic.war</strong>.
        <li>Find the two-letter ISO-639 code for your language &ndash; a list is available <a href="http://www.loc.gov/standards/iso639-2/php/English_list.php">here</a>.
            For instance, Italian is assigned the code <strong>it</strong>.</li>
        <li>Add the ISO-639 code to the file <strong>&lt;ROOT&gt;\booksonic.war\WEB_INF\classes\net\sourceforge\subsonic\i18n\locales.txt</strong>.</li>
        <li>In the same directory is the file <strong>ResourceBundle_en.properties</strong> which is the English translation. Use this (or any other file)
            as the basis for your translation. Better yet, use the latest version from the
            <a href="https://sourceforge.net/p/subsonic/code/HEAD/tree/trunk/subsonic-main/src/main/resources/net/sourceforge/subsonic/i18n/">SVN repository</a>.</li>
        <li>Create the new resource file, for instance <strong>ResourceBundle_it.properties</strong>.</li>
        <li>Translate the text in the new file.</li>
        <li>If you are using a non-Latin alphabet (e.g., Cyrillic or Japanese), you have to convert the property file to ASCII before using it.
            Use the <strong>native2ascii</strong> tool which is included in the Java Development Kit. For instance, if you're writing a Macedonian translation
            (using the Cyrillic alphabet) using UTF-16 character encoding, you must convert it as follows: <br>

            <strong>native2ascii -encoding utf-16 c:\develop\ResourceBundle_mk.properties &lt;ROOT&gt;/booksonic.war/WEB_INF/classes/net/sourceforge/subsonic/i18n/ResourceBundle_mk.properties</strong>
        </li>
        <li>You have to restart Subsonic for the changes to have effect.</li>
        <li>When you're done, send the new language file to <a href="mailto:mail@subsonic.org">mail@subsonic.org</a>.</li>
    </ol>

</section>
</div>
</div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>