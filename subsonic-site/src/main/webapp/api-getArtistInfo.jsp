<a name="getArtistInfo"></a>
<section class="box">
    <h3>getArtistInfo</h3>

    <p>
        <code>http://your-server/rest/getArtistInfo.view</code>
        Since <a href="#versions">1.11.0</a>
    </p>

    <p>
        Returns artist info with biography, image URLs and similar artists, using data
        from <a href="http://last.fm" target="_blank">last.fm</a>.
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
            <td>The artist, album or song ID.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td>No</td>
            <td>20</td>
            <td>Max number of similar artists to return.</td>
        </tr>
        <tr>
            <td><code>includeNotPresent</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether to return artists that are not present in the media library.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;artistInfo&gt;</code>
        element on success.
        <a href="inc/api/examples/artistInfo_example_1.xml">Example</a>.
    </p>
</section>