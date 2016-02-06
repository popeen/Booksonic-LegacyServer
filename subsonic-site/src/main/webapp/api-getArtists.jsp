<a name="getArtists"></a>
<section class="box">
    <h3>getArtists</h3>

    <p>
        <code>http://your-server/rest/getArtists.view</code>
        Since <a href="#versions">1.8.0</a>
    </p>

    <p>
        Similar to <code>getIndexes</code>, but organizes music according to ID3 tags.
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
            <td>If specified, only return artists in the music folder with the given ID. See
                <code>getMusicFolders</code>.
            </td>
        </tr>
    </table>

    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;artists&gt;</code>
        element on success. <a href="inc/api/examples/artists_example_1.xml">Example</a>.
    </p>
</section>