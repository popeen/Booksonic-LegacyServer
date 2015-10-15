<a name="getArtistInfo2"></a>
<section class="box">
    <h3>getArtistInfo2</h3>

    <p>
        <code>http://your-server/rest/getArtistInfo2.view</code>
        Since <a href="#versions">1.11.0</a>
    </p>

    <p>
        Similar to <code>getArtistInfo</code>, but organizes music according to ID3 tags.
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
            <td>The artist ID.</td>
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
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;artistInfo2&gt;</code>
        element on success.
        <a href="inc/api/examples/artistInfo2_example_1.xml">Example</a>.
    </p>
</section>