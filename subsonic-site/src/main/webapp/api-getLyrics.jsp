<a name="getLyrics"></a>
<section class="box">
    <h3>getLyrics</h3>

    <p>
        <code>http://your-server/rest/getLyrics.view</code>
        Since <a href="#versions">1.2.0</a>
    </p>

    <p>
        Searches for and returns lyrics for a given song.
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
            <td>The artist name.</td>
        </tr>
        <tr>
            <td><code>title</code></td>
            <td>No</td>
            <td></td>
            <td>The song title.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;lyrics&gt;</code>
        element on success. The <code>&lt;lyrics&gt;</code> element is empty if no matching lyrics was found.
        <a href="inc/api/examples/lyrics_example_1.xml">Example</a>.
    </p>
</section>