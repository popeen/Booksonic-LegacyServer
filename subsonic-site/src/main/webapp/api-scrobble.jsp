<a name="scrobble"></a>
<section class="box">
    <h3>scrobble</h3>

    <p>
        <code>http://your-server/rest/scrobble.view</code>
        Since <a href="#versions">1.5.0</a>
    </p>

    <p>
        "Scrobbles" a given music file on last.fm. Requires that the user has configured his/her last.fm
        credentials on the Subsonic server (Settings &gt; Personal).
    </p>

    <p>
        Since <a href="#versions">1.8.0</a> you may specify multiple <code>id</code> (and optionally <code>time</code>)
        parameters to scrobble multiple files.
    </p>

    <p>
        Since <a href="#versions">1.11.0</a> this method will also update the play count and last played timestamp for
        the song and album. It will also make the song appear in the "Now playing" page in the web app, and appear in the
        list of songs returned by <code>getNowPlaying</code>.
    </p>

    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>id</code></td>
            <td>Yes</td>
            <td></td>
            <td>A string which uniquely identifies the file to scrobble.</td>
        </tr>
        <tr>
            <td><code>time</code></td>
            <td>No</td>
            <td></td>
            <td>(Since <a href="#versions">1.8.0</a>) The time (in milliseconds since 1 Jan 1970) at which the song was
                listened to.
            </td>
        </tr>
        <tr>
            <td><code>submission</code></td>
            <td>No</td>
            <td>True</td>
            <td>Whether this is a "submission" or a "now playing" notification.</td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>