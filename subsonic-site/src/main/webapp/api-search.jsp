<a name="search"></a>
<section class="box">
    <h3>search</h3>

    <p>
        <code>http://your-server/rest/search.view</code>
        Since <a href="#versions">1.0.0</a>
        <br>Deprecated since <a href="#versions">1.4.0</a>, use <code>search2</code> instead.
    </p>

    <p>
        Returns a listing of files matching the given search criteria. Supports paging through the result.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>artist</code></td>
            <td>No</td>
            <td></td>
            <td>Artist to search for.</td>
        </tr>
        <tr>
            <td><code>album</code></td>
            <td>No</td>
            <td></td>
            <td>Album to searh for.</td>
        </tr>
        <tr>
            <td><code>title</code></td>
            <td>No</td>
            <td></td>
            <td>Song title to search for.</td>
        </tr>
        <tr>
            <td><code>any</code></td>
            <td>No</td>
            <td></td>
            <td>Searches all fields.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td>No</td>
            <td>20</td>
            <td>Maximum number of results to return.</td>
        </tr>
        <tr>
            <td><code>offset</code></td>
            <td>No</td>
            <td>0</td>
            <td>Search result offset. Used for paging.</td>
        </tr>
        <tr>
            <td><code>newerThan</code></td>
            <td>No</td>
            <td></td>
            <td>Only return matches that are newer than this. Given as milliseconds since 1970.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;searchResult&gt;</code>
        element on success. <a href="inc/api/examples/searchResult_example_1.xml">Example</a>.
    </p>
</section>