<a name="getSimilarSongs"></a>
<section class="box">
    <h3>getSimilarSongs</h3>

    <p>
        <code>http://your-server/rest/getSimilarSongs.view</code>
        Since <a href="#versions">1.11.0</a>
    </p>

    <p>
        Returns a random collection of songs from the given artist and similar artists, using data from
        <a href="http://last.fm" target="_blank">last.fm</a>. Typically used for artist radio features.
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
            <td>50</td>
            <td>Max number of songs to return.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;similarSongs&gt;</code>
        element on success.
        <a href="inc/api/examples/similarSongs_example_1.xml">Example</a>.
    </p>
</section>