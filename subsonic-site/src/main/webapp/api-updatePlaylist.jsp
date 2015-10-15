<a name="updatePlaylist"></a>
<section class="box">
    <h3>updatePlaylist</h3>

    <p>
        <code>http://your-server/rest/updatePlaylist.view</code>
        Since <a href="#versions">1.8.0</a>
    </p>

    <p>
        Updates a playlist. Only the owner of a playlist is allowed to update it.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>playlistId</code></td>
            <td>Yes</td>
            <td></td>
            <td>The playlist ID.</td>
        </tr>
        <tr>
            <td><code>name</code></td>
            <td>No</td>
            <td></td>
            <td>The human-readable name of the playlist.</td>
        </tr>
        <tr>
            <td><code>comment</code></td>
            <td>No</td>
            <td></td>
            <td>The playlist comment.</td>
        </tr>
        <tr>
            <td><code>public</code></td>
            <td>No</td>
            <td></td>
            <td><code>true</code> if the playlist should be visible to all users, <code>false</code> otherwise.</td>
        </tr>
        <%--TODO: Add later--%>
        <%--<tr>--%>
        <%--<td><code>usernameToAdd</code></td>--%>
        <%--<td>No</td>--%>
        <%--<td></td>--%>
        <%--<td>Allow this user to listen to this playlist. Multiple parameters allowed.</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
        <%--<td><code>usernameToRemove</code></td>--%>
        <%--<td>No</td>--%>
        <%--<td></td>--%>
        <%--<td>Disallow this user to listen to this playlist. Multiple parameters allowed.</td>--%>
        <%--</tr>--%>
        <tr>
            <td><code>songIdToAdd</code></td>
            <td>No</td>
            <td></td>
            <td>Add this song with this ID to the playlist. Multiple parameters allowed.</td>
        </tr>
        <tr>
            <td><code>songIndexToRemove</code></td>
            <td>No</td>
            <td></td>
            <td>Remove the song at this position in the playlist. Multiple parameters allowed.</td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>