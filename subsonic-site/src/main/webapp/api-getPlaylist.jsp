<a name="getPlaylist"></a>
<section class="box">
    <h3>getPlaylist</h3>

    <p>
        <code>http://your-server/rest/getPlaylist.view</code>
        Since <a href="#versions">1.0.0</a>
    </p>

    <p>
        Returns a listing of files in a saved playlist.
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
            <td>yes</td>
            <td></td>
            <td>ID of the playlist to return, as obtained by <code>getPlaylists</code>.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;playlist&gt;</code>
        element on success. <a href="inc/api/examples/playlist_example_1.xml">Example</a>.
    </p>
</section>