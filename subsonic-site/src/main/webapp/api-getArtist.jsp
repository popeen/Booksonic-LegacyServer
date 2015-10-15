<a name="getArtist"></a>
<section class="box">
    <h3>getArtist</h3>

    <p>
        <code>http://your-server/rest/getArtist.view</code>
        Since <a href="#versions">1.8.0</a>
    </p>

    <p>
        Returns details for an artist, including a list of albums. This method organizes music according to ID3 tags.
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
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;artist&gt;</code>
        element on success.
        <a href="inc/api/examples/artist_example_1.xml">Example</a>.
    </p>
</section>