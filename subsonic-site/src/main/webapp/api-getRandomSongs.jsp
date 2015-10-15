<a name="getRandomSongs"></a>
<section class="box">
    <h3>getRandomSongs</h3>

    <p>
        <code>http://your-server/rest/getRandomSongs.view</code>
        Since <a href="#versions">1.2.0</a>
    </p>

    <p>
        Returns random songs matching the given criteria.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>size</code></td>
            <td>No</td>
            <td>10</td>
            <td>The maximum number of songs to return. Max 500.</td>
        </tr>
        <tr>
            <td><code>genre</code></td>
            <td>No</td>
            <td></td>
            <td>Only returns songs belonging to this genre.</td>
        </tr>
        <tr>
            <td><code>fromYear</code></td>
            <td>No</td>
            <td></td>
            <td>Only return songs published after or in this year.</td>
        </tr>
        <tr>
            <td><code>toYear</code></td>
            <td>No</td>
            <td></td>
            <td>Only return songs published before or in this year.</td>
        </tr>
        <tr>
            <td><code>musicFolderId</code></td>
            <td>No</td>
            <td></td>
            <td>Only return songs in the music folder with the given ID. See <code>getMusicFolders</code>.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;randomSongs&gt;</code>
        element on success. <a href="inc/api/examples/randomSongs_example_1.xml">Example</a>.
    </p>
</section>