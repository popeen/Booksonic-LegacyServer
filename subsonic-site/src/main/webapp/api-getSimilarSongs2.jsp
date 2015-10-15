<a name="getSimilarSongs2"></a>
<section class="box">
    <h3>getSimilarSongs2</h3>

    <p>
        <code>http://your-server/rest/getSimilarSongs2.view</code>
        Since <a href="#versions">1.11.0</a>
    </p>

    <p>
        Similar to <code>getSimilarSongs</code>, but organizes music according to ID3 tags.
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
            <td>50</td>
            <td>Max number of songs to return.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;similarSongs2&gt;</code>
        element on success.
        <a href="inc/api/examples/similarSongs2_example_1.xml">Example</a>.
    </p>
</section>