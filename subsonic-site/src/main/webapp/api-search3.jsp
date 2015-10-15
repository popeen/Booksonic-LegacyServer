<a name="search3"></a>
<section class="box">
    <h3>search3</h3>

    <p>
        <code>http://your-server/rest/search3.view</code>
        Since <a href="#versions">1.8.0</a>
    </p>

    <p>
        Similar to <code>search2</code>, but organizes music according to ID3 tags.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>query</code></td>
            <td>Yes</td>
            <td></td>
            <td>Search query.</td>
        </tr>
        <tr>
            <td><code>artistCount</code></td>
            <td>No</td>
            <td>20</td>
            <td>Maximum number of artists to return.</td>
        </tr>
        <tr>
            <td><code>artistOffset</code></td>
            <td>No</td>
            <td>0</td>
            <td>Search result offset for artists. Used for paging.</td>
        </tr>
        <tr>
            <td><code>albumCount</code></td>
            <td>No</td>
            <td>20</td>
            <td>Maximum number of albums to return.</td>
        </tr>
        <tr>
            <td><code>albumOffset</code></td>
            <td>No</td>
            <td>0</td>
            <td>Search result offset for albums. Used for paging.</td>
        </tr>
        <tr>
            <td><code>songCount</code></td>
            <td>No</td>
            <td>20</td>
            <td>Maximum number of songs to return.</td>
        </tr>
        <tr>
            <td><code>songOffset</code></td>
            <td>No</td>
            <td>0</td>
            <td>Search result offset for songs. Used for paging.</td>
        </tr>
        <tr>
            <td><code>musicFolderId</code></td>
            <td>No</td>
            <td></td>
            <td>(Since <a href="#versions">1.12.0</a>) Only return results from music folder with the given ID. See <code>getMusicFolders</code>.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;searchResult3&gt;</code>
        element on success. <a href="inc/api/examples/searchResult3_example_1.xml">Example</a>.
    </p>

</section>