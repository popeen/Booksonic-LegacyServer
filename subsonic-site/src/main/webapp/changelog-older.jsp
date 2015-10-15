<a name="5.0.beta1"><h3>Subsonic 5.0.beta1 - May 24, 2014</h3></a>
<ul>
    <li><strong>New: </strong>Chromecast support.</li>
    <li><strong>New: </strong>Added play overlay button in cover art images.</li>
    <li><strong>New: </strong>Added browser notification.</li>
    <li><strong>New: </strong>Nicer scrollbar (in Webkit browsers).</li>
    <li><strong>New: </strong>Nicer styling of input fields and buttons.</li>
    <li><strong>New: </strong>Nicer icons.</li>
    <li><strong>New: </strong>Added Estonian translation, courtesy of Olav M&auml;gi.</li>
    <li><strong>New: </strong>Added Korean translation, courtesy of Rhetor Choi.</li>
    <li><strong>New: </strong>Added link to Jamstash.</li>
    <li><strong>Bugfix: </strong>Fixed broken Mac installer.</li>
    <li><strong>Bugfix: </strong>External player doesn't auto-advance.</li>
    <li><strong>Bugfix: </strong>Improved support for https in UPnP.</li>
</ul>

<a name="4.9"><h3>Subsonic 4.9 - Jan 25, 2014</h3></a>
<ul>
    <li><strong>New: </strong>Rename "Download" to "Download all"</li>
    <li><strong>New: </strong>Rename "More actions..." to "Selected songs..."</li>
    <li><strong>New: </strong>When playing a song, queue only later songs (not earlier).</li>
    <li><strong>New: </strong>Added button for downloading single files in left frame.</li>
    <li><strong>New: </strong>Updated Japanese translation, courtesy of Kenji Maekawa.</li>
    <li><strong>Bugfix: </strong>Changing artist for files with ID3v1 tags was broken.</li>
    <li><strong>Bugfix: </strong>Play/add buttons for single files in left frame didn't work.</li>
    <li><strong>Bugfix: </strong>Thumbs in external player was sometimes missing.</li>
    <li><strong>Bugfix: </strong>Fixed layout bug in podcast page.</li>
    <li><strong>Bugfix: </strong>Trim podcast urls.</li>
</ul>

<a name="4.9.beta4"><h3>Subsonic 4.9.beta4 - Jan 04, 2014</h3></a>
<ul>
    <li><strong>New: </strong>Support playlist sharing on Facebook etc.</li>
    <li><strong>New: </strong>Added "Play next" button to playlist view.</li>
    <li><strong>New: </strong>Added "Play all" to starred songs.</li>
    <li><strong>New: </strong>Added "Save as playlist" to starred songs.</li>
    <li><strong>New: </strong>Show cover art for starred albums.</li>
    <li><strong>New: </strong>Show album/song count in genre list.</li>
    <li><strong>New: </strong>When playing a song from a playlist, queue other songs in that playlist.</li>
    <li><strong>New: </strong>When clicking the play icon for a song, add whole album to play queue.</li>
    <li><strong>New: </strong>Clicking on album thumb in "Now playing" now opens album page.</li>
    <li><strong>New: </strong>Cache generated album art.</li>
    <li><strong>Bugfix: </strong>Don't create zip file when downloading a single song.</li>
    <li><strong>Bugfix: </strong>Show cover art in the right order.</li>
    <li><strong>Bugfix: </strong>Hande genres names with special characters (e.g., "R&amp;B").</li>
    <li><strong>Bugfix: </strong>Fixed character encoding problems in some translations.</li>
    <li><strong>Bugfix: </strong>Use locale-specific names for automatically created playlists.</li>
    <li><strong>REST: </strong>Added album/song count in getGenres.</li>
</ul>

<a name="4.9.beta3"><h3>Subsonic 4.9.beta3 - Dec 09, 2013</h3></a>
<ul>
    <li><strong>New: </strong>Modernized web interface. Nicer fonts, colors and layout. Larger album art.</li>
    <li><strong>New: </strong>Show thumbnails for "siebling" albums.</li>
    <li><strong>New: </strong>Generate automatic album art.</li>
    <li><strong>New: </strong>Replace Download button with Play next.</li>
    <li><strong>New: </strong>Use max gain 0 dB in jukebox mode to avoid distortion caused by clipping.</li>
    <li><strong>New: </strong>When playing a song, queue rest of album.</li>
    <li><strong>New: </strong>Added album lists "By decade" and "By genre".</li>
    <li><strong>New: </strong>Support playlists in DLNA.</li>
    <li><strong>New: </strong>DLNA now browses by folder, not tags.</li>
    <li><strong>New: </strong>Updated Dutch translation, courtesy of Toolman.</li>
    <li><strong>Bugfix: </strong>Fixed DLNA song duration and album art.</li>
    <li><strong>Bugfix: </strong>Newly added media was sometimes not picked up when scanning libraries.</li>
    <li><strong>Bugfix: </strong>Fixed font problem when using https.</li>
    <li><strong>Bugfix: </strong>Validate input in Settings &gt; Internet TV/radio.</li>
    <li><strong>Bugfix: </strong>Honor "subsonic.host" system property when resolving local IP address.</li>
    <li><strong>Bugfix: </strong>Playlist management was broken on Tomcat 7.</li>
    <li><strong>Bugfix: </strong>Settings &gt; Users was broken on Tomcat 7.</li>
    <li><strong>Bugfix: </strong>Settings &gt; Personal was broken on Tomcat 7.</li>
    <li><strong>Bugfix: </strong>When clicking "Create new playlist", automatically expand list of playlists.</li>
    <li><strong>REST: </strong>Add year and genre to albums.</li>
    <li><strong>REST: </strong>Added "byYear" and "byGenre" to getAlbumList and getAlbumList2.</li>
    <li><strong>REST: </strong>Add "bookmarkPosition" to songs.</li>
    <li><strong>Performance: </strong>Fixed slow queries on large media collections (&gt;100,000 files): get starred, get files in playlist, get genres.</li>
</ul>

<a name="4.9.beta2"><h3>Subsonic 4.9.beta2 - Nov 16, 2013</h3></a>
<ul>
    <li><strong>New: </strong>Use modern icons and fonts.</li>
    <li><strong>New: </strong>Added light icons for dark themes.</li>
    <li><strong>New: </strong>Added Estonian translation, courtesy of Olav M&auml;gi.</li>
    <li><strong>Bugfix: </strong>Proper support for album artist.</li>
    <li><strong>Bugfix: </strong>Remember DLNA settings when restarting server.</li>
    <li><strong>Bugfix: </strong>Play next/last popup menu was unreadable in some themes.</li>
    <li><strong>Bugfix: </strong>Created signed installer for Mac OS.</li>
    <li><strong>Bugfix: </strong>Set ID3 title tag based on Podcast episode name.</li>
    <li><strong>REST: </strong>Created updateUser method.</li>
    <li><strong>REST: </strong>Added "starred" to "Directory" and "Artist" in xsd.</li>
</ul>

<a name="4.9.beta1"><h3>Subsonic 4.9.beta1 - Oct 12, 2013</h3></a>
<ul>
    <li><strong>New: </strong>Added a DLNA/UPnP Media Server. This feature is experimental and might not work with all DLNA clients.</li>
    <li><strong>New: </strong>Added "Play next" option.</li>
    <li><strong>New: </strong>Updated Estonian translation, courtesy of Olav M&auml;gi.</li>
    <li><strong>REST: </strong>Escape special characters in XML for getGenres.</li>
    <li><strong>REST: </strong>Added ignoredArticles to getIndexes.</li>
    <li><strong>Bugfix: </strong>Improved lyrics search.</li>
    <li><strong>Bugfix: </strong>Trim license key when registering.</li>
    <li><strong>Bugfix: </strong>Fix download file names with special characters.</li>
    <li><strong>Bugfix: </strong>Don't create a new player for each download.</li>
    <li><strong>Tech: </strong>Make Subsonic work on Tomcat 7.</li>
    <li><strong>Tech: </strong>Increased limit of internal database from 2 to 8 GB (fresh installs only).</li>
    <li><strong>Tech: </strong>Set MIME type for cover arts.</li>
    <li><strong>Security: </strong>Added CAPTCHA to password recovery page.</li>
</ul>

<a name="4.8"><h3>Subsonic 4.8 - Apr 20, 2013</h3></a>
<ul>
    <li><strong>New: </strong>Introduced <a href="premium.jsp">Subsonic Premium</a>. (Note: Existing licenses will remain valid)</li>
    <li><strong>New: </strong>Re-import playlists if file timestamp has changed.</li>
    <li><strong>New: </strong>Make playlist folder setting visible again.</li>
    <li><strong>New: </strong>Changed bitrate to video resolution mapping.</li>
    <li><strong>New: </strong>Added Norwegion Nynorsk translation, courtesy of Kevin Brubeck Unhammer.</li>
    <li><strong>New: </strong>Updated Dutch translation, courtesy of W. van der Heijden.</li>
    <li><strong>New: </strong>Updated German translation, courtesy of deejay2302.</li>
    <li><strong>New: </strong>Updated French translation, courtesy of Yoann Spicher.</li>
    <li><strong>New: </strong>Updated Simplified Chinese translation, courtesy of Zhenghao Zhu.</li>
    <li><strong>Bugfix: </strong>Settings &gt; Network doesn't show error if a subsonic.org address is in use.</li>
    <li><strong>Bugfix: </strong>Improved speed of tag editing.</li>
    <li><strong>Bugfix: </strong>Ogg dates not always parsed properly.</li>
    <li><strong>Bugfix: </strong>Sort songs by filename if track number is missing.</li>
    <li><strong>Bugfix: </strong>Fix init exception in podcast bean.</li>
    <li><strong>Bugfix: </strong>Links to minisub and apps icons doesn't honor context path.</li>
    <li><strong>Bugfix: </strong>Less aggressive removal of track number from title.</li>
    <li><strong>Bugfix: </strong>HLS broken with context path.</li>
    <li><strong>Bugfix: </strong>Video player didn't require authentication.</li>
    <li><strong>Bugfix: </strong>Download cover to replace in-metadata image results in renaming music file (".old").</li>
    <li><strong>REST: </strong>Added Podcast methods.</li>
    <li><strong>REST: </strong>Added bookmark methods.</li>
    <li><strong>REST: </strong>Added getInternetRadioStations.</li>
    <li><strong>REST: </strong>Added getGenres.</li>
    <li><strong>REST: </strong>Added getSongsByGenre.</li>
    <li><strong>REST: </strong>Added option to disable transcoding when streaming.</li>
    <li><strong>REST: </strong>Fixed a bug in getAlbumList which caused it to return non-albums in some cases.</li>
    <li><strong>REST: </strong>Support CORS.</li>
    <li><strong>REST: </strong>Support "parent" attribute in getMusicDirectory.</li>
    <li><strong>Tech: </strong>Install Java 7 rather than Java 6.</li>
</ul>

<a name="4.7"><h3>Subsonic 4.7 - Sep 13, 2012</h3></a>
<ul>
    <li><strong>New:</strong> Auto-import playlists and update playlist statistics after scan.</li>
    <li><strong>New:</strong> Upgraded to JW Player 5.10.</li>
    <li><strong>Bugfix:</strong> Rescan looses comments and play statistics.</li>
    <li><strong>Bugfix:</strong> Play queue scrolls to the top when clicking on links.</li>
    <li><strong>Bugfix:</strong> MiniSub link uses wrong context path.</li>
    <li><strong>Bugfix:</strong> Not possible to create random playlist with a "-" in the genre.</li>
    <li><strong>Bugfix:</strong> Fails to import playlist if case is wrong.</li>
    <li><strong>REST:</strong> Add timestamp to scrobble method, and support multiple entries.</li>
</ul>

<a name="4.7.beta3"><h3>Subsonic 4.7.beta3 - Aug 03, 2012</h3></a>
<ul>
    <li><strong>New:</strong> Make it possible to refresh list of artists without rescanning.</li>
    <li><strong>New:</strong> Added Settings &gt; Media folders &gt; Clean-up database.</li>
    <li><strong>New:</strong> Added Settings &gt; General &gt; Sort albums by year.</li>
    <li><strong>New:</strong> Included MiniSub app.</li>
    <li><strong>New:</strong> Automatically import all playlists on start-up.</li>
    <li><strong>New:</strong> Collapse long list of playlists.</li>
    <li><strong>New:</strong> Use "album artist" tag if present.</li>
    <li><strong>New:</strong> Updated Slovenian translation, courtesy of Jan Jam&#353;ek.</li>
    <li><strong>New:</strong> Added new theme "SubStandard", courtesy of Dan Eriksen.</li>
    <li><strong>Bugfix:</strong> Improved speed when scanning large media libraries.</li>
    <li><strong>Bugfix:</strong> More robust playlist import.</li>
    <li><strong>Bugfix:</strong> Fixed problem with no files being showed if removing and re-adding a media folder.</li>
    <li><strong>Bugfix:</strong> Fixed crash on Java 7.</li>
    <li><strong>Bugfix:</strong> Fixed slow "Top rated".</li>
    <li><strong>Bugfix:</strong> Fixed album art on Internet Explorer.</li>
    <li><strong>Bugfix:</strong> Don't display "null" as artist in now playing.</li>
    <li><strong>Bugfix:</strong> Admins can now manage all playlists (that is visible to them).</li>
    <li><strong>Bugfix:</strong> Displayed album year now updates when editing corresponding tag.</li>
    <li><strong>REST:</strong> Added getUsers method.</li>
    <li><strong>REST:</strong> Added support for HTTP Live Streaming.</li>
    <li><strong>REST:</strong> getArtists now only returns album artists.</li>
    <li><strong>REST:</strong> Add index to getArtists.</li>
    <li><strong>Tech:</strong> Create database backup when upgrading.</li>
</ul>

<a name="4.7.beta2"><h3>Subsonic 4.7.beta2 - Jun 08, 2012</h3></a>
<ul>
    <li><strong>New:</strong> Playlist import/export.</li>
    <li><strong>New:</strong> Sort albums by year.</li>
    <li><strong>New:</strong> Show album year.</li>
    <li><strong>New:</strong> Added Czech translation, courtesy of Robert Ilyk.</li>
    <li><strong>New:</strong> Better error message if file or playlist not found.</li>
    <li><strong>Bugfix:</strong> Handle media files without any tags.</li>
    <li><strong>Bugfix:</strong> Display directory name rather than album name.</li>
    <li><strong>Bugfix:</strong> Fixed genre search problem.</li>
</ul>

<a name="4.7.beta1"><h3>Subsonic 4.7.beta1 - May 12, 2012</h3></a>
<ul>
    <li><strong>New:</strong> Major rewrite of the Subsonic core. It now uses less memory and is significantly faster.</li>
    <li><strong>New:</strong> "Star" support for managing your favorite artists, albums and songs.</li>
    <li><strong>New:</strong> Much improved playlist support: private/shared playlists, improved user interface.</li>
    <li><strong>New:</strong> Added option <em>Settings &gt; Media folders &gt; Fast access mode</em> which additionally improves performance for network disks.</li>
    <li><strong>New:</strong> Show media folder scanning status.</li>
    <li><strong>New:</strong> New albums lists: Starred and All.</li>
    <li><strong>New:</strong> Use ffmpeg rather than lame for downsampling.</li>
    <li><strong>New:</strong> Added Polish translation, courtesy of Micha&#322; Kotas</li>
    <li><strong>New:</strong> Added Catalan translation, courtesy of Josep Santal&oacute;.</li>
    <li><strong>New:</strong> Added Estonian translation, courtesy of Olav M&auml;gi.</li>
    <li><strong>New:</strong> Updated Dutch translation, courtesy of W. van der Heijden.</li>
    <li><strong>New:</strong> Updated Swedish translation, courtesy of Fritte Jensen.</li>
    <li><strong>New:</strong> Updated Catalan translation, courtesy of Josep Santalo.</li>
    <li><strong>New:</strong> Added option to reset and email forgotten password or username.</li>
    <li><strong>New:</strong> Make it configurable to run as a different user than root in Linux RPM.</li>
    <li><strong>New:</strong> Display warning if running as root user.</li>
    <li><strong>New:</strong> Avoid false alarms from Windows virus scanners.</li>
    <li><strong>Bugfix:</strong> Fixed problem with players being associated to wrong users.</li>
    <li><strong>Bugfix:</strong> Serve generic cover art if failing to scale original.</li>
    <li><strong>REST:</strong> Full support for accessing the media collection organized according to ID3 tags, rather than file structure.</li>
    <li><strong>REST:</strong> Added starring and playlist management.</li>
    <li><strong>REST:</strong> Added disc number, creation date and media type.</li>
    <li><strong>REST:</strong> Suppress content length estimation by default. Added "estimateContentLength" parameter to stream method.</li>
    <li><strong>REST:</strong> Added getAvatar method.</li>
    <li><strong>REST:</strong> Added "shareRole" to createUser</li>
    <li><strong>REST:</strong> Fixed some JSON conversion problems ("JSON does not allow non-finite numbers")</li>
    <li><strong>REST:</strong> Fixed a problem with the "u" and "p" parameters sometimes not being used if the JSESSIONID cookie is present.</li>
    <li><strong>REST:</strong> Stream method now supports HEAD requests.</li>
    <li><strong>REST:</strong> Use shorter IDs.</li>
    <li><strong>Tech:</strong> Use port 4040 by default for new Windows installs.</li>
</ul>

<a name="4.6"><h3>Subsonic 4.6 - Dec 06, 2011</h3></a>
<ul>
    <li><strong>New:</strong> Added option to resend license key.</li>
    <li><strong>New:</strong> Added AIFF support.</li>
</ul>

<a name="4.6.beta2"><h3>Subsonic 4.6.beta2 - Nov 17, 2011</h3></a>
<ul>
    <li><strong>New:</strong> Added option in Settings &gt; Transcoding: "Enable this transcoding for all existing and new players."</li>
    <li><strong>New:</strong> Updated Slovenian translation, courtesy of Jan Jam&#353;ek.</li>
    <li><strong>New:</strong> Added Google+ button.</li>
    <li><strong>New:</strong> Automatically delete obsolete players on startup.</li>
    <li><strong>Bugfix:</strong> Jukebox now support skipping when paused.</li>
    <li><strong>Bugfix:</strong> Fixed a case where guessing the title and track number failed.</li>
    <li><strong>Bugfix:</strong> Don't estimate content-length for web players.</li>
    <li><strong>Bugfix:</strong> Album search links missing if subdirectory exists.</li>
    <li><strong>Bugfix:</strong> Fixed broken Google search link.</li>
    <li><strong>Bugfix:</strong> Remove link to lyrics. chartlyrics.com no longer exists.</li>
    <li><strong>REST:</strong> Ensure that jukebox "set" method maintains correct current index.</li>
    <li><strong>REST:</strong> Added "scrobblingEnabled" to getUser.</li>
    <li><strong>Tech:</strong> Ensure Windows uninstaller only removes program files (in case user installs to c:\subsonic).</li>
    <li><strong>Tech:</strong> Subsonic Control Panel now prompts for elevated permissions when necessary.</li>
</ul>

<a name="4.6.beta1"><h3>Subsonic 4.6.beta1 - Nov 1, 2011</h3></a>
<ul>
    <li><strong>New:</strong> Simplified and improved transcoding framework.</li>
    <li><strong>New:</strong> Improved video quality with H.264 encoding.</li>
    <li><strong>New:</strong> Reimplemented jukebox. More robust and new features.</li>
    <li><strong>New:</strong> Share on Google+.</li>
    <li><strong>New:</strong> Estimate content-length for transcoded audio.</li>
    <li><strong>New:</strong> Updated Dutch translation, courtesy of Muiz.</li>
    <li><strong>New:</strong> Updated German translation, courtesy of deejay.</li>
    <li><strong>New:</strong> Added BUUF theme, courtesy of Fractal Systems.</li>
    <li><strong>New:</strong> Added UK English translation, courtesy of Brian Aust.</li>
    <li><strong>New:</strong> Hide dock icon on Mac.</li>
    <li><strong>Bugfix:</strong> Menu broken in "Settings &gt; Shared media" when logged in as admin.</li>
    <li><strong>Tech:</strong> Improved security in Linux packages.</li>
    <li><strong>Tech:</strong> Stronger license check.</li>
    <li><strong>Tech:</strong> Use UTF-8 when reading playlist files.</li>
    <li><strong>API:</strong> Include files in root folders.</li>
    <li><strong>API:</strong> New jukebox features.</li>
</ul>

<a name="4.5"><h3>Subsonic 4.5 - Aug 6, 2011</h3></a>
<ul>
    <li><strong>New:</strong> Updated Korean translation, courtesy of Rhetor Choi.</li>
    <li><strong>New:</strong> Updated Danish translation, courtesy of Morten Hartvich.</li>
    <li><strong>Bugfix:</strong> Clear rating now works again.</li>
    <li><strong>Bugfix:</strong> Misc fixes to share settings page.</li>
    <li><strong>Bugfix:</strong> Revert back to running as root in Debian/Ubuntu.</li>
    <li><strong>API:</strong> JSONP support</li>
</ul>

<a name="4.5.beta2"><h3>Subsonic 4.5.beta2 - Jul 28, 2011</h3></a>
<ul>
    <li><strong>New:</strong> Implemented management of shared media (expiration, removal, statistics, description).</li>
    <li><strong>New:</strong> Added more actions for selected songs in album view (Download, Add to playlist).</li>
    <li><strong>New:</strong> Added more actions for selected songs in playlist view (Share).</li>
    <li><strong>New:</strong> Subsonic service no longer running as root on Debian/Ubuntu</li>
    <li><strong>API:</strong> Added share management methods.</li>
    <li><strong>API:</strong> Added rating support.</li>
    <li><strong>Bugfix:</strong> Use guest user when streaming shared media.</li>
    <li><strong>Bugfix:</strong> Use UTF-8 in search index file.</li>
</ul>

<a name="4.5.beta1"><h3>Subsonic 4.5.beta1 - Jun 12, 2011</h3></a>
<ul>
    <li><strong>New:</strong> Twitter/Facebook integration.</li>
    <li><strong>New:</strong> Share songs and videos by sending someone a link.</li>
    <li><strong>New:</strong> Support video in external player.</li>
    <li><strong>New:</strong> Support higher video bitrates, 3000 and 5000 kbps.</li>
    <li><strong>New:</strong> Added Bulgarian translation, courtesy of Ivan Achev.</li>
    <li><strong>New:</strong> Updated Norwegian translation, courtesy of Tommy Karlsen.</li>
    <li><strong>New:</strong> Updated German translation, courtesy of deejay2302.</li>
    <li><strong>New:</strong> Support http header "Content-Range" when streaming.</li>
    <li><strong>New:</strong> Ignore "@eaDir" folders on Synology devices.</li>
    <li><strong>API:</strong> Added REST method getPodcasts.</li>
    <li><strong>API:</strong> Added REST method getShareUrl.</li>
    <li><strong>API:</strong> Added user email to REST API.</li>
    <li><strong>API:</strong> Added example XMLs to API documentation.</li>
    <li><strong>API:</strong> Encoded passwords were not decoded correctly in REST methods createUser and changePassword.</li>
    <li><strong>API:</strong> Added "format" and "size" parameters to REST method stream.</li>
    <li><strong>Bugfix:</strong> Don't include podcasts when generating random songs.</li>
    <li><strong>Bugfix:</strong> Handle whitespace in podcast urls.</li>
    <li><strong>Bugfix:</strong> Updated expired ssl cert.</li>
    <li><strong>Bugfix:</strong> Mac installer: make transcode dir executable.</li>
</ul>

<a name="4.4"><h3>Subsonic 4.4 - Feb 06, 2011</h3></a>
<ul>
    <li><strong>New:</strong> Updated Greek translation, courtesy of Constantine Samaklis.</li>
    <li><strong>New:</strong> Updated Slovenian translation, courtesy of Jan Jam&#353;ek and Marko Kastelic.</li>
</ul>

<a name="4.4.beta1"><h3>Subsonic 4.4.beta1 - Jan 20, 2011</h3></a>
<ul>
    <li><strong>New:</strong> Added https support.</li>
    <li><strong>New:</strong> Added option to open video in resizable window.</li>
    <li><strong>New:</strong> Improved search with accented characters (e.g., searching for "bartok" will match "bart&oacute;k").</li>
    <li><strong>New:</strong> Added REST API method for scrobbling to last.fm.</li>
    <li><strong>New:</strong> Added Greek translation, courtesy of Constantine Samaklis.</li>
    <li><strong>Bugfix:</strong> When converting videos, always use a width that is a multiple of two.</li>
    <li><strong>Bugfix:</strong> Handle invalid pixel aspect rates (PAR) reported by ffmpeg.</li>
    <li><strong>Bugfix:</strong> Don't scrobble videos to last.fm.</li>
    <li><strong>Bugfix:</strong> Remember port number and memory settings when reinstalling on Windows.</li>
    <li><strong>Bugfix:</strong> Accessing "Newest" album list from Android sometimes caused an error.</li>
</ul>

<a name="4.3"><h3>Subsonic 4.3 - Jan 7, 2011</h3></a>
<ul>
    <li><strong>Bugfix:</strong> When switching bit rate, also jump to correct time offset.</li>
    <li><strong>Bugfix:</strong> Fixed problem with audio getting out-of-sync with video.</li>
    <li><strong>Bugfix:</strong> When converting videos, always use a width that is a multiple of two.</li>
    <li><strong>Bugfix:</strong> Fixed bug in REST method createPlaylist.</li>
    <li><strong>Bugfix:</strong> Use language settings in /etc/default/locale on Ubuntu/Debian.</li>
</ul>

<a name="4.3.beta1"><h3>Subsonic 4.3.beta1 - Dec 30, 2010</h3></a>
<ul>
    <li><strong>New:</strong> Video support! Stream video to browsers and Android 2.2+ phones.</li>
    <li><strong>New:</strong> Added Korean translation, courtesy of Choi Jong-seok.</li>
    <li><strong>New:</strong> Updated French translation, courtesy of Yoann Spicher.</li>
</ul>

<a name="4.2"><h3>Subsonic 4.2 - Nov 21, 2010</h3></a>
<ul>
    <li><strong>New:</strong> Added Portuguese translation, courtesy of Miguel Fonseca.</li>
    <li><strong>New:</strong> Updated Italian translation, courtesy of Luca Perri.</li>
    <li><strong>Bugfix:</strong> Improved searching.</li>
    <li><strong>Bugfix:</strong> Set ID3 tags when transcoding.</li>
    <li><strong>Bugfix:</strong> Fixed problem with transcoding/downsampling failing for files with non-Latin characters.</li>
    <li><strong>Bugfix:</strong> Handle transcoding/downsampling files with double quotes in filename.</li>
    <li><strong>Bugfix:</strong> Remove html markup from podcast descriptions.</li>
    <li><strong>Bugfix:</strong> Fix broken link to allmusic.</li>
</ul>

<a name="4.2.beta1"><h3>Subsonic 4.2.beta1 - Nov 4, 2010</h3></a>
<ul>
    <li><strong>New:</strong> New &amp; improved search engine based on <a href="http://lucene.apache.org/">Lucene</a>.</li>
    <li><strong>New:</strong> New &amp; improved cover art search based on Google Image Search.</li>
    <li><strong>New:</strong> Mac installer now includes transcoders, courtesy of einstein2x.</li>
    <li><strong>New:</strong> Updated German translation, courtesy of deejay2302.</li>
    <li><strong>New:</strong> Improved LAME integration (preserve ID3 tags, avoid skipping in Android client).</li>
    <li><strong>New:</strong> Added new REST API method for searching.</li>
    <li><strong>Bugfix:</strong> Fixed bug in startup script in standalone Subsonic (readlink).</li>
</ul>

<a name="4.1"><h3>Subsonic 4.1 - Sep 10, 2010</h3></a>
<ul>
    <li><strong>New:</strong> Updated Danish translation, courtesy of Morten Hartvich.</li>
    <li><strong>Bugfix:</strong> Exclude dot files in cover art search.</li>
</ul>

<a name="4.1.beta1"><h3>Subsonic 4.1.beta1 - Aug 21, 2010</h3></a>
<ul>
    <li><strong>New:</strong> Support automatic port forwarding on Airport Extreme/Express.</li>
    <li><strong>New:</strong> Improved tray/application/fav icons.</li>
    <li><strong>New:</strong> New and updated themes.</li>
    <li><strong>New:</strong> Improved Mac control panel.</li>
    <li><strong>New:</strong> Added REST API methods getUser and deleteUser.</li>
    <li><strong>New:</strong> Added Traditional Chinese translation, courtesy of Cheng Jen Li.</li>
    <li><strong>New:</strong> Updated French translation, courtesy of Christophe.</li>
    <li><strong>Bugfix:</strong> Fixed chat feature when deploying Subsonic on Tomcat.</li>
    <li><strong>Bugfix:</strong> Proper lookup of local IP on Linux.</li>
    <li><strong>Bugfix:</strong> Support html5 (return correct content type and length).</li>
    <li><strong>Performance:</strong> Faster coverart lookup.</li>
    <li><strong>Tech:</strong> Upgraded to LAME 3.98.4.</li>
</ul>

<a name="4.0.1"><h3>Subsonic 4.0.1 - May 13, 2010</h3></a>
<ul>
    <li><strong>Bugfix:</strong> Fixed broken cover art download.</li>
    <li><strong>Bugfix:</strong> Fixed broken m4a transcoding.</li>
    <li><strong>Bugfix:</strong> Fixed broken quick links in artist frame for some new themes.</li>
</ul>

<a name="4.0"><h3>Subsonic 4.0 - May 12, 2010</h3></a>
<ul>
    <li><strong>New:</strong> Added REST API method for deleting playlists.</li>
    <li><strong>Bugfix:</strong> Use UTF-8 encoding when creating M3U playlists.</li>
    <li><strong>Security:</strong> Network and cover art settings require admin role.</li>
</ul>

<a name="4.0.beta2"><h3>Subsonic 4.0.beta2 - May 05, 2010</h3></a>
<ul>
    <li><strong>New:</strong> Added themes Slick, High Contrast, High Contrast (Inverted) and High-Tech, courtesy of Fisher Evans.</li>
    <li><strong>New:</strong> Added themes Simplify, PinkPanther and Denim, courtesy of Thomas Bruce Dyrud.</li>
    <li><strong>New:</strong> Updated Danish translation, courtesy of Morten Hartvich.</li>
    <li><strong>Bugfix:</strong> User statistics for streamed data was too high.</li>
    <li><strong>Bugfix:</strong> Proper ordering songs on multi-disc albums.</li>
    <li><strong>Bugfix:</strong> Read tags from AAC files.</li>
    <li><strong>Bugfix:</strong> Fixed errors with chat feature.</li>
    <li><strong>Bugfix:</strong> More robust tag parsing and editing.</li>
    <li><strong>Bugfix:</strong> Removed "Settings &gt; General &gt; Video mask" that was added by mistake.</li>
</ul>

<a name="4.0.beta1"><h3>Subsonic 4.0.beta1 - Apr 23, 2010</h3></a>
<ul>
    <li><strong>New:</strong> New version of the <a href="api.jsp">Subsonic API</a> with many new methods to be used by Subsonic <a href="apps.jsp">apps</a>.</li>
    <li><strong>New:</strong> New, simpler transcoder pack with ffmpeg and lame.</li>
    <li><strong>New:</strong> Improved usability of Settings &gt; Network.</li>
    <li><strong>New:</strong> Added option to clear chat messages.</li>
    <li><strong>New:</strong> Added Monochrome themes, courtesy of David D.</li>
    <li><strong>New:</strong> Added Groove themes, courtesy of Thomas Bruce Dyrud.</li>
    <li><strong>New:</strong> Updated German translation, courtesy of deejay2302.</li>
    <li><strong>New:</strong> Updated Finnish translation, courtesy of Reijo J&auml;&auml;rni.</li>
    <li><strong>New:</strong> Updated Slovenian translation, courtesy of Andrej &#381;i&#382;mond.</li>
    <li><strong>New:</strong> Made user statistics graphs logarithmic.</li>
    <li><strong>New:</strong> Truncate long genre names in "More" page.</li>
    <li><strong>New:</strong> Improved year selection in "More" page.</li>
    <li><strong>New:</strong> Automatically exclude all hidden files and directories (those starting with ".")</li>
    <li><strong>Bugfix:</strong> Fixed native playback of AAC in Flash player.</li>
    <li><strong>Bugfix:</strong> Make Flash player work on Linux.</li>
    <li><strong>Bugfix:</strong> Fixed bug in coverart batch.</li>
    <li><strong>Bugfix:</strong> Fixed album link to last.fm.</li>
    <li><strong>Bugfix:</strong> Improved stability of lyrics lookup.</li>
    <li><strong>Tech:</strong> Replaced tag library with <a href="http://www.jthink.net/jaudiotagger/">Jaudiotagger</a>.</li>
    <li><strong>Tech:</strong> Compress html pages with gzip.</li>
    <li><strong>Tech:</strong> Changed default Java memory limit to 100 MB.</li>
</ul>

<a name="3.9"><h3>Subsonic 3.9 - Feb 12, 2010</h3></a>
<ul>
    <li><strong>New:</strong> Added link to <a href="http://www.nonpixel.com/subair/">SubAir</a> in "More" page.</li>
    <li><strong>New:</strong> Make <em>yourname.subsonic.org</em> addresses also work within LANs.</li>
    <li><strong>Bugfix:</strong> Don't look for UPnP routers if port forwarding is disabled.</li>
</ul>

<a name="3.9.beta1"><h3>Subsonic 3.9.beta1 - Jan 28, 2010</h3></a>
<ul>
    <li><strong>New:</strong> Automatically configure port forwarding for compatible routers.</li>
    <li><strong>New:</strong> Access your server using an easy-to-remember address: <em>yourname.subsonic.org</em></li>
    <li><strong>New:</strong> Added "Getting started" page for basic setup.</li>
    <li><strong>New:</strong> Cover art batch download, courtesy of Christian Nedreg&aring;rd.</li>
    <li><strong>New:</strong> Improved relevance for top hits in cover art search, courtesy of Christian Nedreg&aring;rd.</li>
    <li><strong>New:</strong> Added Polish translation, courtesy of Micha&#322; Kotas</li>
    <li><strong>New:</strong> Added Icelandic translation, courtesy of DJ Danni.</li>
    <li><strong>New:</strong> Updated Finnish translation, courtesy of Reijo J&auml;&auml;rni.</li>
    <li><strong>New:</strong> Updated Russian translation, courtesy of Anton Khoruzhy.</li>
    <li><strong>New:</strong> Reversed order of chat log, showing newest messages first.</li>
    <li><strong>New:</strong> Added API method to change password.</li>
    <li><strong>New:</strong> Discontinued Subsonic JME client.</li>
    <li><strong>Bugfix:</strong> Avoid setting incorrect content length when transcoding or downsampling.</li>
    <li><strong>Bugfix:</strong> Fixed lyrics lookup. Now uses chartlyrics.com which provides a stable API.</li>
    <li><strong>Bugfix:</strong> Fixed "Not in GZIP format" error in Discogs cover image search, courtesy of Christian Nedreg&aring;rd.</li>
    <li><strong>Bugfix:</strong> Sort list of saved playlists.</li>
    <li><strong>Bugfix:</strong> Home &gt; Newest now sorts by creation date, not modification date.</li>
    <li><strong>Bugfix:</strong> Hide donate button when license is valid.</li>
</ul>

<a name="3.8"><h3>Subsonic 3.8 - Oct 23, 2009</h3></a>
<ul>
    <li><strong>New:</strong> (Android) Downloaded songs can now be played directly from the Subsonic app.</li>
    <li><strong>New:</strong> (Android) New feature: Download + Play.</li>
    <li><strong>New:</strong> (Android) New feature: Search.</li>
    <li><strong>New:</strong> (Android) New feature: Load playlist.</li>
    <li><strong>New:</strong> (Android) New feature: Delete from phone.</li>
    <li><strong>New:</strong> (Android) New feature: Check for software update.</li>
    <li><strong>New:</strong> (Android) Nicer song listing.</li>
    <li><strong>New:</strong> (Android) More informative error message when not connected.</li>
    <li><strong>New:</strong> (Android) Show artist shortcuts.</li>
    <li><strong>New:</strong> Added option to disable chat messages.</li>
    <li><strong>New:</strong> Delete chat entries more than seven days old.</li>
    <li><strong>New:</strong> Documented error codes in REST API.</li>
    <li><strong>New:</strong> Updated Swedish translation, courtesy of Fritte.</li>
    <li><strong>New:</strong> Updated German translation, courtesy of deejay2302 and Radon.</li>
    <li><strong>Bugfix:</strong> Fixed wrong background color in More page.</li>
</ul>

<a name="3.8.beta1"><h3>Subsonic 3.8.beta1 - Oct 02, 2009</h3></a>
<ul>
    <li><strong>New:</strong> Implemented Subsonic client for Android phones.</li>
    <li><strong>New:</strong> Added chat.</li>
    <li><strong>New:</strong> Added REST API for third party applications.</li>
    <li><strong>New:</strong> Support playlist repeat in web player.</li>
    <li><strong>New:</strong> Jukebox now support WAV format (including FLAC > WAV transcoding).</li>
    <li><strong>New:</strong> Updated to Last.fm submission protocol version 1.2.1, with support for "Now playing".</li>
    <li><strong>New:</strong> Updated Dutch translation, courtesy of Sander van der Grind and Jeremy Terpstra.</li>
    <li><strong>New:</strong> Updated Slovenian translation, courtesy of Andrej &#381;i&#382;mond</li>
    <li><strong>New:</strong> Improved French translation, courtesy of Rapha&euml;l Boulcourt.</li>
    <li><strong>New:</strong> Improved German translation, courtesy of 3R3.</li>
    <li><strong>New:</strong> Added Finnish translation, courtesy of Reijo J&auml;&auml;rni</li>
    <li><strong>Bugfix:</strong> Subsonic server doesn't require an internet connection during startup.</li>
    <li><strong>Bugfix:</strong> Avoid problems when upgrading stand-alone version.</li>
    <li><strong>Bugfix:</strong> Repeat now works properly in jukebox mode.</li>
    <li><strong>Bugfix:</strong> Looks nicer in Chrome.</li>
    <li><strong>Bugfix:</strong> Usernames can now contain white spaces and international characters.</li>
    <li><strong>Bugfix:</strong> Allow alternate date format in Podcast episodes.</li>
    <li><strong>Bugfix:</strong> Fixed broken Discogs image search.</li>
    <li><strong>Security:</strong> IP addresses are no longer displayed in the log or the status view.</li>
</ul>

<a name="3.7"><h3>Subsonic 3.7 - Jun 22, 2009</h3></a>
<ul>
    <li><strong>New:</strong> Default search option is now to search both title, album and artist.</li>
    <li><strong>New:</strong> Customizable default music, playlist and podcast folders in support of Amahi Home Server.</li>
    <li><strong>New:</strong> Added configurable message in login page.</li>
    <li><strong>Bugfix:</strong> Fixed broken WAR version.</li>
    <li><strong>Bugfix:</strong> Fixed broken tag editor.</li>
    <li><strong>Bugfix:</strong> Fixed broken upload progress bar.</li>
    <li><strong>Bugfix:</strong> Automatically start web player when clicking play on artist, album or song.</li>
    <li><strong>Bugfix:</strong> Fixed problem with "Random album" page being initially empty.</li>
    <li><strong>Bugfix:</strong> Added some padding above player toolbar.</li>
    <li><strong>Bugfix:</strong> Playlist combobox option disabling broken in IE8.</li>
    <li><strong>Security:</strong> Don't show full file paths in "Status" and "Help" pages.</li>
</ul>

<a name="3.7.beta1"><h3>Subsonic 3.7.beta1 - May 08, 2009</h3></a>
<ul>
    <li><strong>New:</strong> Jukebox support. Plays music directly on the server's audio hardware.</li>
    <li><strong>New:</strong> Improved search feature. (Paging, album/artist search fields.)</li>
    <li><strong>New:</strong> Added buttons for next/previous track in web player.</li>
    <li><strong>New:</strong> Support for artist-level comments.</li>
    <li><strong>New:</strong> Added new authorization role "User is allowed to change settings and password" in support for guest users.</li>
    <li><strong>New:</strong> Added theme "Cool and Clean", courtesy of Dan Eriksen.</li>
    <li><strong>New:</strong> Added theme "Midnight Fun", courtesy of Don Pearson.</li>
    <li><strong>New:</strong> Added Slovenian translation, courtesy of Andrej &#381;i&#382;mond.</li>
    <li><strong>New:</strong> Added Danish translation, courtesy of Morten Hartvich</li>
    <li><strong>New:</strong> Added Japanese translation, courtesy of Takahiro Suzuki.</li>
    <li><strong>New:</strong> Updated Norwegian translation, courtesy of jigsaw.</li>
    <li><strong>New:</strong> Updated Swedish translation, courtesy of Fredrik Leufkens.</li>
    <li><strong>New:</strong> Show online help as balloon tooltip.</li>
    <li><strong>New:</strong> Player is always visible in playlist, even when scrolling.</li>
    <li><strong>New:</strong> Removed frame borders.</li>
    <li><strong>New:</strong> Don't show player username or IP address in playlist.</li>
    <li><strong>New:</strong> Automatically trim text fields when entering email address and license key.</li>
    <li><strong>New:</strong> Added advanced option to bind Subsonic to a particular IP address. (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1740 ">More</a>)</li>
    <li><strong>New:</strong> Improved subsonic.sh startup script.</li>
    <li><strong>New:</strong> Automatically add Windows Firewall exceptions during install. (<a href="http://forum.subsonic.org/forum/viewtopic.php?p=5188">More</a>)</li>
    <li><strong>Performance:</strong> Improved browser and server caching of artist list. (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1558">More</a>)</li>
    <li><strong>Performance:</strong> Only poll for service status if Subsonic Control Panel is opened. (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1612">More</a>)</li>
    <li><strong>Bugfix:</strong> Web player now displays correct duration for transcoded tracks.</li>
    <li><strong>Bugfix:</strong> Sticky artist index now works in IE.</li>
    <li><strong>Bugfix:</strong> Discogs image retrieval now works again.</li>
    <li><strong>Bugfix:</strong> Now works behind SSL proxy. (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1301">More</a>)</li>
    <li><strong>Bugfix:</strong> Missing album art for artists in multiple folders. (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1626">More</a>)</li>
    <li><strong>Bugfix:</strong> Wrong player selected if different users access Subsonic from the same browser instance.</li>
    <li><strong>Bugfix:</strong> Wrong repeat state displayed in playlist.</li>
    <li><strong>Bugfix:</strong> Stop web player when playlist is cleared.</li>
    <li><strong>Bugfix:</strong> Lyrics lookup working again.</li>
    <li><strong>Bugfix:</strong> Support quotes in Podcast names. (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1734">More</a>)</li>
    <li><strong>Bugfix:</strong> Fixed IE layout problem in top frame.</li>
</ul>

<a name="3.6"><h3>Subsonic 3.6 - Feb 01, 2009</h3></a>
<ul>
    <li><strong>Security:</strong> For improved security, only transcoders installed in SUBSONIC_HOME/transcode are allowed to be executed. This includes LAME downsampling.</li>
    <li><strong>New:</strong> Added Swedish translation by J&ouml;rgen Sj&ouml;berg.</li>
    <li><strong>New:</strong> Added two new locales, "English (United States)" and "English (United Kingdom)". The only difference currently is the date format.</li>
    <li><strong>New:</strong> Change tray icon if Subsonic server isn't running.</li>
    <li><strong>Bugfix:</strong> Make new Flash player work if Subsonic is behind proxy.</li>
    <li><strong>Bugfix:</strong> Fixed problem where server in some cases came to a state where streaming is refused.</li>
    <li><strong>Bugfix:</strong> Support download and streaming of files larger than 2 GB.</li>
    <li><strong>Bugfix:</strong> Use UTF-8 when generating m3u playlist.</li>
    <li><strong>Bugfix:</strong> Main frame now correctly switches to the currently playing album.</li>
    <li><strong>Bugfix:</strong> Show currently playing icon for all player types.</li>
</ul>

<a name="3.6.beta2"><h3>Subsonic 3.6.beta2 - Jan 13, 2009</h3></a>
<ul>
    <li><strong>New:</strong> Updated French translation. (Thanks to sheridan).</li>
    <li><strong>New:</strong> Improved subsonic.sh startup script.</li>
    <li><strong>Bugfix:</strong> New Flash player now works in Linux browsers. (Thanks to zeekay).</li>
    <li><strong>Bugfix:</strong> Fixed bug introduced in 3.6.beta1 causing streams to be killed repeatedly.</li>
    <li><strong>Bugfix:</strong> Show proper error message if user is not authorized to perform an operation.</li>
    <li><strong>Bugfix:</strong> Removing welcome title/subtitle/message doesn't work.</li>
    <li><strong>Bugfix:</strong> Welcome message too wide in IE.</li>
    <li><strong>Bugfix:</strong> Flash player doesn't work with Italian locale.</li>
    <li><strong>Bugfix:</strong> Disable "Play more random songs when end of playlist is reached" if Flash player.</li>
    <li><strong>Tech:</strong> Embedded player now requires Flash plugin 9.0.0 or later, not 9.0.115 or later.</li>
</ul>

<a name="3.6.beta1"><h3>Subsonic 3.6.beta1 - Jan 05, 2009</h3></a>
<ul>
    <li><strong>New:</strong> Much improved embedded Flash player.</li>
    <li><strong>New:</strong> Playlist is now Ajax-enabled, for a smoother user experience.</li>
    <li><strong>New:</strong> Configurable Welcome title, subtitle and message in home page. Uses wiki notation.</li>
    <li><strong>New:</strong> Fade-in effect for cover art images.</li>
    <li><strong>New:</strong> Option to append selected tracks to previously saved playlist.</li>
    <li><strong>New:</strong> Random play on artist/album level.</li>
    <li><strong>New:</strong> New agent/service architecture. Tray icon should now (finally) work on Vista.</li>
    <li><strong>New:</strong> From the Subsonic Control Panel you can now see the Windows service status, and start/stop the Subsonic service.</li>
    <li><strong>New:</strong> Display "Now playing" for up to an hour, including idle time.</li>
    <li><strong>New:</strong> Enable transcoders on first-time Windows install (since they are now bundled).</li>
    <li><strong>New:</strong> Added Cancel buttons to all settings pages.</li>
    <li><strong>New:</strong> Created subsonic.bat</li>
    <li><strong>New:</strong> Changed license to GPLv3.</li>
    <li><strong>New:</strong> Hide music library statistics if unavailable.</li>
    <li><strong>Bugfix:</strong> Fixed broken lyrics lookup (again).</li>
    <li><strong>Bugfix:</strong> Avoid ugly line breaks in IE.</li>
    <li><strong>Tech:</strong> Java 6 or later is now required for Windows installer version.</li>
</ul>

<a name="3.5"><h3>Subsonic 3.5 - Nov 09, 2008</h3></a>
<ul>
    <li><strong>New:</strong> New Subsonic logo (thanks to <a href="http://www.conceptualintegration.com/">Concept211</a>).</li>
    <li><strong>New:</strong> Added Italian translation (thanks to Michele Petrecca).
    <li><strong>New:</strong> Smooth scrolling in jump list.</li>
    <li><strong>New:</strong> Updated AAC decoder (faad.exe) in transcoder pack.</li>
    <li><strong>New:</strong> Added OS to about page.</li>
    <li><strong>New:</strong> Changed license to Creative Commons Noncommercial.</li>
    <li><strong>Bugfix:</strong> Added start menu item "Settings" as work-around for missing tray icon in Vista.</li>
    <li><strong>Bugfix:</strong> Fixed caching problem in Opera. (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1334">More</a>)</li>
    <li><strong>Bugfix:</strong> Improved Windows installer. (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1291">More</a>)</li>
    <li><strong>Bugfix:</strong> Fixed typos in several translations.</li>
</ul>

<a name="3.5.beta2"><h3>Subsonic 3.5.beta2 - Sep 23, 2008</h3></a>
<ul>
    <li><strong>New:</strong> Fancy cover art zoom.</li>
    <li><strong>New:</strong> Remove artist name from album name.</li>
    <li><strong>New:</strong> Transcoding pack is now included in Windows installer.</li>
    <li><strong>New:</strong> Updated German translation (thanks to J&ouml;rg Frommann) and Norwegian translation
        (thanks to jigsaw).
    </li>
    <li><strong>New:</strong> Added French translation (thanks to JohnDillinger).
    <li><strong>New:</strong> Added Ripserver theme.</li>
    <li><strong>Bugfix:</strong> Streaming to mobile phones now works better.</li>
    <li><strong>Bugfix:</strong> Made tray icon work on Vista (requires Java 6 or later).</li>
    <li><strong>Bugfix:</strong> Disable random playlist functionality if user is not authorized to play
        music.
    </li>
    <li><strong>Tech:</strong> Build number is now identical to Subversion revision.</li>
</ul>

<a name="3.5.beta1"><h3>Subsonic 3.5.beta1 - Jul 10, 2008</h3></a>
<ul>
    <li><strong>New:</strong> Implemented music player for Java-enabled mobile phones.
        (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1203">More</a>)
    </li>
    <li><strong>New:</strong> Support for personal images (avatars).</li>
    <li><strong>New:</strong> Support "read-only" view.
        (<a href="http://forum.subsonic.org/forum/viewtopic.php?p=2435">More</a>)
    </li>
    <li><strong>New:</strong> Simplified user interface in settings pages. Now only one "Save" button.</li>
    <li><strong>New:</strong> Improved usability of coverart search page. Now also searches discogs.com.</li>
    <li><strong>New:</strong> Merge artists with same name, but located in different music folders.</li>
    <li><strong>New:</strong> Added option "Let others see what I am playing"</li>
    <li><strong>New:</strong> Added option "Always use web player".
        (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1077">More</a>)
    </li>
    <li><strong>New:</strong> Nicer controls in modern browsers (Opera 9.5, Firefox 3, IE 7).</li>
    <li><strong>Bugfix:</strong> Lots of extra players are no longer created.</li>
    <li><strong>Bugfix:</strong> Fix minor bug with letter appearing if only file (not directory) exists.
        (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1023">More</a>)
    </li>
    <li><strong>Bugfix:</strong> Make standalone version work on Linux without X11 server.</li>
    <li><strong>Bugfix:</strong> Make lyrics work again.
        (<a href="http://forum.subsonic.org/forum/viewtopic.php?p=2588">More</a>)
    </li>
    <li><strong>Bugfix:</strong> Proper sorting of "The" artists.
        (<a href="http://forum.subsonic.org/forum/viewtopic.php?t=1144">More</a>)
    </li>
    <li><strong>Bugfix:</strong> Make source release build.</li>
</ul>

<a name="3.4"><h3>Subsonic 3.4 - Apr 27, 2008</h3></a>
<ul>
    <li><strong>New:</strong> Added optional setting for LDAP bind DN and password.</li>
    <li><strong>New:</strong> Added quick links to Google, Wikipedia, allmusic and Last.fm.</li>
    <li><strong>New:</strong> Added standalone installation option.</li>
    <li><strong>Bugfix:</strong> Fixed layout problems in Podcast page.</li>
    <li><strong>Bugfix:</strong> Clean up partially downloaded Podcast episodes at start-up.</li>
    <li><strong>Bugfix:</strong> Old Podcast episodes were in some cases not deleted.</li>
</ul>

<a name="3.4.beta1"><h3>Subsonic 3.4.beta1 - Mar 28, 2008</h3></a>
<ul>
    <li><strong>New:</strong> Added support for user authentication in LDAP, including Microsoft Active
        Directory.
    </li>
    <li><strong>New:</strong> Implemented "Party mode" with a simpler user interface.</li>
    <li><strong>New:</strong> Added option to specify music folder in "Random playlist".</li>
    <li><strong>New:</strong> Added option "Play more random songs when end of playlist is reached" in "Random
        playlist".
    </li>
    <li><strong>New:</strong> Implemented download option in WAP interface.</li>
    <li><strong>New:</strong> Implemented random playlist option in WAP interface.</li>
    <li><strong>New:</strong> Make index always visible (doesn't work in IE).</li>
    <li><strong>New:</strong> Added play/add/download buttons for songs in left frame.</li>
    <li><strong>New:</strong> Suggest track number in tag editor.</li>
    <li><strong>Bugfix:</strong> Fixed faulty layout in main frame.</li>
    <li><strong>Bugfix:</strong> Fixed caching bug of left frame (when changing theme etc).</li>
    <li><strong>Bugfix:</strong> "Highest rated" now also shows albums that have never been played.</li>
    <li><strong>Bugfix:</strong> Player selection in WAP interface now works.</li>
    <li><strong>Bugfix:</strong> Support quotes in search field and shortcut field.</li>
    <li><strong>Bugfix:</strong> Don't display track number zero.</li>
    <li><strong>Tech:</strong> Faster start-up on Windows. Extract war file to SUBSONIC_HOME/jetty instead of
        temp directory.
    </li>
    <li><strong>Tech:</strong> Made it possible to run the Jetty version on Linux and other platforms.</li>
    <li><strong>Tech:</strong> Allow up to one week of idle time in Jetty.</li>
</ul>

<a name="3.3"><h3>Subsonic 3.3 - Dec 23, 2007</h3></a>
<ul>
    <li><strong>New:</strong> Added "HD-720" and "Barents Sea" themes.</li>
    <li><strong>New:</strong> Improved layout of left and main frame.</li>
    <li><strong>New:</strong> Sort genres in "Edit tags".</li>
    <li><strong>Bugfix:</strong> Make transcoding work when combined with client-side playlist.</li>
    <li><strong>Bugfix:</strong> Case-insensitive sorting of artists.</li>
    <li><strong>Bugfix:</strong> Made genre parsing more robust.</li>
    <li><strong>Tech:</strong> Upgraded to Acegi 1.0.5</li>
    <li><strong>Tech:</strong> Upgraded to Spring 2.5</li>
    <li><strong>Tech:</strong> Make it compile with Java 5.</li>
</ul>

<a name="3.3.beta1"><h3>Subsonic 3.3.beta1 - Nov 23, 2007</h3></a>
<ul>
    <li><strong>New:</strong> Implemented client-side playlists, including random skipping within songs
        (see <em>Settings &gt; Players &gt; Playlist is managed by player</em>).
    </li>
    <li><strong>New:</strong> Support resumable downloads.</li>
    <li><strong>New:</strong> Rewrite stream URL if Subsonic is behind a proxy.</li>
    <li><strong>New:</strong> Added two new themes designed for large HD screens.</li>
    <li><strong>New:</strong> Added Russian translation by Iaroslav Andrusiak.</li>
    <li><strong>New:</strong> Made it possible to collapse/expand Podcast episodes. Improved layout and
        usability.
    </li>
    <li><strong>New:</strong> Added "Play on phone" option to wap interface.</li>
    <li><strong>New:</strong> Auto-focus on username field in login page.</li>
    <li><strong>New:</strong> Created new settings categories "Advanced" and "Personal".</li>
    <li><strong>New:</strong> Moved index from top to left frame.</li>
    <li><strong>Bugfix:</strong> Support Podcast folder that is located outside music folder.</li>
    <li><strong>Bugfix:</strong> Handle track number on the form "3/12"</li>
    <li><strong>Bugfix:</strong> Fixed concurrency bug when rendering wiki markup.</li>
</ul>

<a name="3.2"><h3>Subsonic 3.2 - Oct 09, 2007</h3></a>
<ul>
    <li><strong>New:</strong> Added support for editing genre in ID3 tags.</li>
    <li><strong>New:</strong> Show miniature album images in "Now playing" sidebar.</li>
    <li><strong>Bugfix:</strong> Handle podcasts with colons in the name.</li>
    <li><strong>Bugfix:</strong> Handle podcasts without enclosures.</li>
    <li><strong>Bugfix:</strong> Handle song, album and artist names with special characters (&lt;, &gt; etc)
    </li>
</ul>

<a name="3.2.beta1"><h3>Subsonic 3.2.beta1 - Sep 19, 2007</h3></a>
<ul>
    <li><strong>New:</strong> Download Podcasts with the new integrated Podcast receiver.</li>
    <li><strong>New:</strong> One-click installation with the new Windows installer.</li>
    <li><strong>New:</strong> Fetch lyrics automatically from www.metrolyrics.com.</li>
    <li><strong>New:</strong> See what others are playing in the new "Now playing" sidebar.</li>
    <li><strong>New:</strong> Play music directly in the browser with the new integrated Flash-based player.
    </li>
    <li><strong>New:</strong> New tag engine (entagged.sourceforge.net) supports tags in a lot of formats
        (mp3, ogg, flac, wav, wma,
        etc).
    </li>
    <li><strong>New:</strong> Added confirmation dialog when deleting playlists.</li>
    <li><strong>New:</strong> Remember selected music folder (in left frame) across sessions.</li>
    <li><strong>Bugfix:</strong> Fixed bug with rendering multiple status charts concurrently.</li>
    <li><strong>Tech:</strong> Added db admin tool.</li>
</ul>

<a name="3.1"><h3>Subsonic 3.1 - Jul 30, 2007</h3></a>
<p>(No changes since 3.1.beta2)</p>

<a name="3.1.beta2"><h3>Subsonic 3.1.beta2 - Jul 23, 2007</h3></a>
<ul>
    <li><strong>New:</strong> Optimized scanning of music folders. Dramatic improvement for network disks.
    </li>
    <li><strong>Bugfix:</strong> Fixed minor concurrency bug in search index creation.</li>
    <li><strong>Bugfix:</strong> Make cache work if clocks on remote disks are out of sync.</li>
    <li><strong>Bugfix:</strong> Ensure that cover art images are ordered alphabetically.</li>
    <li><strong>Bugfix:</strong> Remove nag message for licensed users.</li>
</ul>

<a name="3.1.beta1"><h3>Subsonic 3.1.beta1 - Jun 30, 2007</h3></a>
<ul>
    <li><strong>New:</strong> Added checkboxes to songs in playlist, with option to perform operations on all
        selected songs.
    </li>
    <li><strong>New:</strong> Now possible to specify genre and decade when generating random playlist.</li>
    <li><strong>New:</strong> Added menu option to sort playlist by track, album or artist.</li>
    <li><strong>New:</strong> Audioscrobbling is now more fault-tolerant. Will retry if Last.fm is down.</li>
    <li><strong>New:</strong> Replaced Google ads with a donation request message. Donors will not see the
        message.
    </li>
    <li><strong>New:</strong> Added new attribute "default" to transcodings. When "default" is true, the
        transcoding is automatically activated for new players.
    </li>
    <li><strong>New:</strong> Implemented support for browser caching of left frame (with artist list).</li>
    <li><strong>New:</strong> Made downsampling command configurable.</li>
    <li><strong>New:</strong> Switch to "Now playing" after 3 minutes of inactivity.</li>
    <li><strong>New:</strong> Album page now has link to artist.</li>
    <li><strong>Bugfix:</strong> Logically delete/undelete metadata for albums that disappear/reappear on
        disk.
    </li>
    <li><strong>Bugfix:</strong> Fixed ugly checkboxes in IE.</li>
</ul>

<a name="3.0"><h3>Subsonic 3.0 - Mar 22, 2007</h3></a>
<ul>
    <li><strong>New:</strong> Added Google ads.</li>
    <li><strong>Tech:</strong> Upgraded <a href="http://code.google.com/p/jvorbiscomment/">jvorbiscomment</a>
        library.
    </li>
    <li><strong>Bugfix:</strong> Artists from different music folders are now properly sorted.</li>
</ul>

<a name="3.0.beta2"><h3>Subsonic 3.0.beta2 - Feb 24, 2007</h3></a>
<ul>
    <li><strong>New:</strong> Added per-user bitrate limit.</li>
    <li><strong>New:</strong> Show error message in browser if Subsonic home can't be created.</li>
    <li><strong>Bugfix:</strong> Fixed remaining bugs (hopefully) related to folders with non-latin
        characters.
    </li>
    <li><strong>Bugfix:</strong> Zooming of ID3 cover art now works.</li>
    <li><strong>Bugfix:</strong> last.fm password must no longer be entered every time.</li>
</ul>

<a name="3.0.beta1"><h3>Subsonic 3.0.beta1 - Feb 04, 2007</h3></a>
<ul>
    <li><strong>New:</strong> Audioscrobbling support. Automatically register what you're playing on last.fm.
    </li>
    <li><strong>New:</strong> Support display and editing of OGG Vorbis tags.</li>
    <li><strong>New:</strong> Display cover art embedded in ID3 tags.</li>
    <li><strong>New:</strong> Dutch translation by Ronald Knot.</li>
    <li><strong>New:</strong> Links to previous/next album by same artist.</li>
    <li><strong>New:</strong> Change tab order in login screen.</li>
    <li><strong>Bugfix:</strong> Support directory names with non-latin characters.</li>
    <li><strong>Bugfix:</strong> Fixed ampersand bug in wap interface.</li>
    <li><strong>Bugfix:</strong> Display hours for very long tracks.</li>
    <li><strong>Tech:</strong> Upgraded Spring and Acegi to latest versions.</li>
</ul>

<a name="2.9"><h3>Subsonic 2.9 - Nov 13, 2006</h3></a>
<ul>
    <li><strong>New:</strong> Added German translation by Harald Weiss.</li>
    <li><strong>New:</strong> Show server version and memory usage in help page.</li>
    <li><strong>Bugfix:</strong> Don't hang if unable to resolve latest version number.</li>
    <li><strong>Bugfix:</strong> Avoid duplicates in random album page.</li>
    <li><strong>Bugfix:</strong> More robust ID3 parsing.</li>
    <li><strong>Bugfix:</strong> More robust thumbnail scaling.</li>
    <li><strong>Bugfix:</strong> Fixed bug which in some cases made it impossible to restart streams.</li>
    <li><strong>Bugfix:</strong> Improve track number removal from title.</li>
</ul>

<a name="2.9.beta1"><h3>Subsonic 2.9.beta1 - Oct 16, 2006</h3></a>
<ul>
    <li><strong>Bugfix:</strong> Avoid excessive disk and memory usage when (re)scanning the music library
        (bug introduced in 2.8).
    </li>
    <li><strong>Bugfix:</strong> Avoid flickering PNG images in IE.</li>
    <li><strong>New:</strong> Improved thumbnail quality using step-wise bilinear resampling.</li>
    <li><strong>New:</strong> Thumbnails are now cached in SUBSONIC_HOME/thumbs. Expect significant speed-ups
        (after a while), in particular for huge images.
    </li>
    <li><strong>New:</strong> Improved search speed by a factor of two.</li>
    <li><strong>New:</strong> Miscellaneous other caching mechanisms for faster response times.</li>
    <li><strong>New:</strong> Support Wiki markup in album comments.</li>
    <li><strong>New:</strong> Added "Download" menu option to main album view.</li>
    <li><strong>New:</strong> Ratings are now per-user. Average rating is also displayed.</li>
    <li><strong>New:</strong> Now possible to delete rating (for current user).</li>
    <li><strong>New:</strong> Added Spanish translation by Jorge Bueno Magdalena. Gracias, Jorge!</li>
    <li><strong>New:</strong> New Subsonic logo.</li>
    <li><strong>New:</strong> Keep bitrate statistics even if player reconnects.</li>
    <li><strong>New:</strong> Support editing of track numbers in ID3 tags.</li>
    <li><strong>New:</strong> Show full file name as tool tip in ID3 tag editor.</li>
    <li><strong>New:</strong> Search results are now better sorted.</li>
</ul>

<a name="2.8"><h3>Subsonic 2.8 - Sep 07, 2006</h3></a>
<ul>
    <li><strong>New:</strong> Added option for transcoders to obey the player max bitrate setting.</li>
    <li><strong>New:</strong> Sort songs by track number.</li>
    <li><strong>New:</strong> Added transcoding support for Shorten and WavPack.</li>
    <li><strong>New:</strong> Improved caching of cover art images in browser.</li>
    <li><strong>New:</strong> Scroller color in Sandstorm theme.</li>
    <li><strong>New:</strong> Updated Norwegian translation.</li>
    <li><strong>New:</strong> Added Simplified Chinese translation by Neil Gao (currently incomplete).</li>
    <li><strong>Bugfix:</strong> Fixed performance problem with "Home" page.</li>
    <li><strong>Bugfix:</strong> Fixed broken wap interface.</li>
    <li><strong>Bugfix:</strong> Fixed playlist autoscroll.</li>
    <li><strong>Bugfix:</strong> Proper rendering of directories with both files and sub-directories.</li>
</ul>

<a name="2.8.beta1"><h3>Subsonic 2.8.beta1 - Aug 13, 2006</h3></a>
<ul>
    <li><strong>New:</strong> Transcoding plugin framework.</li>
    <li><strong>New:</strong> VBR (variable bitrate) detection and resampling.</li>
    <li><strong>New:</strong> Added form-based login with remember-me.</li>
    <li><strong>New:</strong> Added logout option.</li>
    <li><strong>New:</strong> Support per-user language and theme.</li>
    <li><strong>New:</strong> Show track number, genre, format, duration and file size.</li>
    <li><strong>New:</strong> Configurable level of song details.</li>
    <li><strong>New:</strong> Various artists detection.</li>
    <li><strong>New:</strong> Added option to stream over plain HTTP when using SSL.</li>
    <li><strong>New:</strong> Mouseover tooltip for truncated text and cover art images.</li>
    <li><strong>New:</strong> Optional notification of new final and beta releases.</li>
    <li><strong>New:</strong> Nicer error page.</li>
    <li><strong>New:</strong> Added "Back in black" and "Sandstorm" themes.</li>
    <li><strong>New:</strong> Exclude files and folders listed in "subsonic_exclude.txt"</li>
    <li><strong>Tech:</strong> New security implementation based on Acegi (http://acegisecurity.org/)</li>
    <li><strong>Tech:</strong> Springified WAP pages and servlets.</li>
    <li><strong>Tech:</strong> Springified DWR.</li>
    <li><strong>Tech:</strong> Springified DAO's and data source.</li>
</ul>

<a name="2.7"><h3>Subsonic 2.7 - Jun 12, 2006</h3></a>
<ul>
    <li><strong>Tech:</strong> Subsonic was completely rewritten to use the Spring MVC framework.</li>
    <li><strong>New:</strong> Theme support. Now ships with two themes, "Subsonic Default" and "2 minutes to
        midnight". Theme authors are encouraged to contribute.
    </li>
    <li><strong>New:</strong> Ajax-based ID3 tag editor.</li>
    <li><strong>New:</strong> Cover art 3D effect and popup. (3D effect not available in Internet Explorer).
    </li>
    <li><strong>New:</strong> Added options to limit bandwidth for downloads and uploads.</li>
    <li><strong>New:</strong> Added progress bar to upload page.</li>
    <li><strong>New:</strong> Show upload (as well as download and streaming) charts in status page.</li>
    <li><strong>New:</strong> Added option to configure shortcuts to certain folders.</li>
    <li><strong>New:</strong> Rating where you can see how much each user has uploaded/downloaded/streamed.
    </li>
    <li><strong>New:</strong> Nicer layout and graphics.</li>
    <li><strong>New:</strong> Added option to download playlists, both current and previously saved ones.</li>
    <li><strong>New:</strong> Now logs to c:/subsonic/subsonic.log (Windows) or /var/subsonic/subsonic.log
        (other platforms).
    </li>
    <li><strong>New:</strong> Support symbolic links on Unix.</li>
    <li><strong>New:</strong> Support XSPF playlist format.</li>
    <li><strong>New:</strong> Create backup of old image file when changing cover art.</li>
    <li><strong>Bugfix:</strong> Avoid wrapped lines if browser window is small.</li>
    <li><strong>Bugfix:</strong> Use proper Y-range in bandwidth charts.</li>
    <li><strong>Bugfix:</strong> Integer overflow in search index creation interval.</li>
    <li><strong>Bugfix:</strong> Some Amazon search didn't show any results.</li>
    <li><strong>Bugfix:</strong> Now possible to change cover art even if original file is write protected
        (Windows only).
    </li>
</ul>

<a name="2.6"><h3>Subsonic 2.6 - Mar 10, 2006</h3></a>
<ul>
    <li><strong>New:</strong> Nicer layout, colors and icons. Customizable welcome message. Option to limit
        number of cover art images to display.
    </li>
    <li><strong>New:</strong> You can now specify multiple media folders in the configuration.
        This is useful, for example, if you have your music on multiple disks, or if you have one
        directory with music, and another with movies. The index (on the left-hand side) can either show all
        media folders (merged alphabetically), or you can select from a combo box which folder to display.
    </li>
    <li><strong>New:</strong> Assign ratings (one to five stars) and comments to individual albums.</li>
    <li><strong>New:</strong> There is a new welcome page, displaying lists of random albums, newest albums,
        highest rated albums, most often played albums and most recently played albums.
    </li>
    <li><strong>New:</strong> You can configure a set of links to Internet TV and radio stations. These links
        become available in the index on the left-hand side. Click on a link, and your player connects to the station.
    </li>
    <li><strong>New:</strong> Saved playlists are now available as Podcasts (available from the "More" page).
    </li>
    <li><strong>New:</strong> Improved player management. Support multiple players with the same IP address,
        and players with dynamic IP addresses. Display player type (e.g., WinAmp) and last-seen date.
    </li>
    <li><strong>New:</strong> Macedonian translation by Stefan Ivanovski.</li>
    <li><strong>New:</strong> Implemented support for non-Latin character encodings (for instance Japanese or
        Cyrillic).
    </li>
    <li><strong>New:</strong> Added option to load a previously saved playlist in the WAP interface.</li>
    <li><strong>New:</strong> "Album Info" now integrates with Google Music.</li>
    <li><strong>New:</strong> Avoid unnecessary reloading of the playlist window.</li>
    <li><strong>Bugfix:</strong> Fallback to file name if ID3 tags are present but empty.</li>
    <li><strong>Bugfix:</strong> LAME now works on Linux.</li>
    <li><strong>Bugfix:</strong> Solved problem with playlist autoscroll on rearrange.</li>
    <li><strong>Bugfix:</strong> Clicking index in top frame sometimes caused reloading of left frame.</li>
</ul>

<a name="2.5"><h3>Subsonic 2.5 - Nov 25, 2005</h3></a>
<ul>
    <li><strong>New:</strong> Implemented user management. Users are easily created, deleted and assigned
        different privileges.
    </li>
    <li><strong>New:</strong> Faster song switching. Players react immediately to playlist changes.</li>
    <li><strong>New:</strong> Now possible to refine search for cover art and album info.</li>
    <li><strong>New:</strong> Better support for OGG, AAC and other formats. Added proper suffix to stream URL
        as a hint to the player. </li>
    <li><strong>New:</strong> Display media library statistics.</li>
    <li><strong>New:</strong> New location for preferences, search index and database (c:\subsonic or
        /var/subsonic).
    </li>
    <li><strong>Bugfix:</strong> Improved parsing of MP3 tags. Avoid funny characters in artist, album and
        song title.
    </li>
</ul>

<a name="2.4"><h3>Subsonic 2.4 - Oct 10, 2005</h3></a>
<ul>
    <li><strong>New:</strong> Download cover art and album info from Amazon web service.</li>
    <li><strong>New:</strong> Show selection of random albums on welcome page.</li>
    <li><strong>New:</strong> Display notice if LAME is not installed.</li>
    <li><strong>Bugfix:</strong> Allow max one stream per player.</li>
    <li><strong>Bugfix:</strong> Use user-wide (not system-wide) preferences on non-Windows platforms.</li>
</ul>

<a name="2.3"><h3>Subsonic 2.3 - May 28, 2005</h3></a>
<ul>
    <li><strong>New:</strong> Full internationalization support.</li>
    <li><strong>New:</strong> Automatic update of search index at specified intervals.</li>
    <li><strong>New:</strong> Search is now more like Google.</li>
    <li><strong>New:</strong> Updating search index is now a lot faster (30 seconds for 18000 songs).</li>
    <li><strong>New:</strong> Unique playlist "undo" function.</li>
    <li><strong>New:</strong> "Now Playing" automatically refreshes when a new album is played.</li>
    <li><strong>New:</strong> Ongoing downloads are now displayed in the status page, with charts showing
        download speed.
    </li>
    <li><strong>New:</strong> Some improvements in zip functionality.</li>
    <li><strong>New:</strong> Significantly improved accuracy in charts.</li>
    <li><strong>New:</strong> Better support for non-ASCII characters in SHOUTcast.</li>
    <li><strong>New:</strong> No longer necessary to enter username and password in player.</li>
    <li><strong>New:</strong> Support for "ignored articles".</li>
    <li><strong>New:</strong> Show log in help page.</li>
</ul>

<a name="2.2"><h3>Subsonic 2.2 - March 17, 2005</h3></a>
<ul>
    <li><strong>New:</strong> Implemented SHOUTcast support.</li>
    <li><strong>New:</strong> Added "Album info" which links to reviews etc at allmusic.com.</li>
    <li><strong>New:</strong> Support for uploading files from the browser to the Subsonic server. Zip-files
        are automatically unpacked.
    </li>
    <li><strong>New:</strong> Improved usability in search interface.</li>
    <li><strong>New:</strong> Option to specify http://yourhostname/stream/file.ogg etc.</li>
    <li><strong>Bugfix:</strong> Detect zero-terminated strings in ID3 tags.</li>
    <li><strong>Bugfix:</strong> Use ID3v2 tags instead of ID3v1, if both are present.</li>
</ul>

<a name="2.1"><h3>Subsonic 2.1 - March 8, 2005</h3></a>
<ul>
    <li><strong>New:</strong> Added more search options.</li>
    <li><strong>New:</strong> Added support for downloading an entire directory structure as a zip file.</li>
    <li><strong>New:</strong> Subsonic now parses song titles, artists and albums from ID3 tags.</li>
    <li><strong>New:</strong> Settings for cover art size and max bitrate can now be set for individual
        players.
    </li>
    <li><strong>New:</strong> Search index is now generated in the background.</li>
    <li><strong>New:</strong> Keep position in playlist frame (e.g., always show the currently playing track).
    </li>
    <li><strong>Bugfix:</strong> Some minor bug fixes.</li>
</ul>

<a name="2.0"><h3>Subsonic 2.0 - February 27, 2005</h3></a>
<ul>
    <li><strong>New:</strong> Added WAP interface for controlling Subsonic from a mobile phone or PDA.</li>
    <li><strong>New:</strong> Added option to generate a random playlist.</li>
    <li><strong>New:</strong> Added option to download and save individual songs.</li>
    <li><strong>New:</strong> Subsonic now alerts users if a new version is available.</li>
    <li><strong>New:</strong> Improved documentation and usability.</li>
    <li><strong>New:</strong> ANT support.</li>
</ul>

<a name="1.0"><h3>Subsonic 1.0 - February 10, 2005</h3></a>
<ul>
    <li><strong>New:</strong> Added chart for displaying bitrates last few minutes.</li>
    <li><strong>New:</strong> Implemented transcoding to lower bitrates.</li>
    <li><strong>New:</strong> Added online help.</li>
    <li><strong>New:</strong> Support PLS and M3U playlists.</li>
</ul>

<a name="0.1"><h3>Subsonic 0.1 - December 14, 2004</h3></a>
<ul>
    <li>Initial release.</li>
</ul>
