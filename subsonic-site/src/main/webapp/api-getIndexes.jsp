<a name="getIndexes"></a>
<section class="box">
    <h3>getIndexes</h3>

    <p>
        <code>http://your-server/rest/getIndexes.view</code>
        Since <a href="#versions">1.0.0</a>
    </p>

    <p>
        Returns an indexed structure of all artists.
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
        <tr>
            <td><code>ifModifiedSince</code></td>
            <td>No</td>
            <td></td>
            <td>If specified, only return a result if the artist collection has changed since the given time (in
                milliseconds since 1 Jan 1970).
            </td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;indexes&gt;</code>
        element on success. <a href="inc/api/examples/indexes_example_1.xml">Example</a>.
    </p>
</section>