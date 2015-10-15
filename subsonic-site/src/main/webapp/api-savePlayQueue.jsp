<a name="savePlayQueue"></a>
<section class="box">
    <h3>savePlayQueue</h3>

    <p>
        <code>http://your-server/rest/savePlayQueue.view</code>
        Since <a href="#versions">1.12.0</a>
    </p>

    <p>
        Saves the state of the play queue for this user. This includes the
        tracks in the play queue, the currently playing track, and the position within this track. Typically used
        to allow a user to move between different clients/apps while retaining the same play queue (for instance when
        listening to an audio book).
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
            <td>ID of a song in the play queue. Use one <code>id</code> parameter for each song in the play queue.</td>
        </tr>
        <tr>
            <td><code>current</code></td>
            <td>No</td>
            <td></td>
            <td>The ID of the current playing song.</td>
        </tr>
        <tr>
            <td><code>position</code></td>
            <td>No</td>
            <td></td>
            <td>The position in milliseconds within the currently playing song.</td>
        </tr>
    </table>

    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>