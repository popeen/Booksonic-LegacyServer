<a name="createBookmark"></a>
<section class="box">
    <h3>createBookmark</h3>

    <p>
        <code>http://your-server/rest/createBookmark.view</code>
        Since <a href="#versions">1.9.0</a>
    </p>

    <p>
        Creates or updates a bookmark (a position within a media file). Bookmarks are personal and not visible to other
        users.

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
            <td>ID of the media file to bookmark. If a bookmark already exists for this file it will be overwritten.
            </td>
        </tr>
        <tr>
            <td><code>position</code></td>
            <td>Yes</td>
            <td></td>
            <td>The position (in milliseconds) within the media file.</td>
        </tr>
        <tr>
            <td><code>comment</code></td>
            <td>No</td>
            <td></td>
            <td>A user-defined comment.</td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>