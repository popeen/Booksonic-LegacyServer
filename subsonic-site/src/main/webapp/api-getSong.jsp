<a name="getSong"></a>
<section class="box">
    <h3>getSong</h3>

    <p>
        <code>http://your-server/rest/getSong.view</code>
        Since <a href="#versions">1.8.0</a>
    </p>

    <p>
        Returns details for a song.
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
            <td>The song ID.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;song&gt;</code>
        element on success.
        <a href="inc/api/examples/song_example_1.xml">Example</a>.
    </p>
</section>