<a name="deleteBookmark"></a>
<section class="box">
    <h3>deleteBookmark</h3>

    <p>
        <code>http://your-server/rest/deleteBookmark.view</code>
        Since <a href="#versions">1.9.0</a>
    </p>

    <p>
        Deletes the bookmark for a given file.

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
            <td>ID of the media file for which to delete the bookmark. Other users' bookmarks are not affected.</td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>