<a name="deletePlaylist"></a>
<section class="box">
    <h3>deletePlaylist</h3>

    <p>
        <code>http://your-server/rest/deletePlaylist.view</code>
        Since <a href="#versions">1.2.0</a>
    </p>

    <p>
        Deletes a saved playlist.
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
            <td>ID of the playlist to delete, as obtained by <code>getPlaylists</code>.</td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>