<a name="getStarred"></a>
<section class="box">
    <h3>getStarred</h3>

    <p>
        <code>http://your-server/rest/getStarred.view</code>
        Since <a href="#versions">1.8.0</a>
    </p>

    <p>
        Returns starred songs, albums and artists.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>musicFolderId</code></td>
            <td>No</td>
            <td></td>
            <td>(Since <a href="#versions">1.12.0</a>) Only return results from the music folder with the given ID. See <code>getMusicFolders</code>.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;starred&gt;</code>
        element on success. <a href="inc/api/examples/starred_example_1.xml">Example</a>.
    </p>
</section>