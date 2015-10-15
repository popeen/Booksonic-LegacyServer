<a name="getSongsByGenre"></a>
<section class="box">
    <h3>getSongsByGenre</h3>

    <p>
        <code>http://your-server/rest/getSongsByGenre.view</code>
        Since <a href="#versions">1.9.0</a>
    </p>

    <p>
        Returns songs in a given genre.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>genre</code></td>
            <td>Yes</td>
            <td></td>
            <td>The genre, as returned by <code>getGenres</code>.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td>No</td>
            <td>10</td>
            <td>The maximum number of songs to return. Max 500.</td>
        </tr>
        <tr>
            <td><code>offset</code></td>
            <td>No</td>
            <td>0</td>
            <td>The offset. Useful if you want to page through the songs in a genre.</td>
        </tr>
        <tr>
            <td><code>musicFolderId</code></td>
            <td>No</td>
            <td></td>
            <td>(Since <a href="#versions">1.12.0</a>) Only return albums in the music folder with the given ID. See <code>getMusicFolders</code>.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;songsByGenre&gt;</code>
        element on success. <a href="inc/api/examples/songsByGenre_example_1.xml">Example</a>.
    </p>
</section>