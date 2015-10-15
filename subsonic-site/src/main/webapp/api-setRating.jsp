<a name="setRating"></a>
<section class="box">
    <h3>setRating</h3>

    <p>
        <code>http://your-server/rest/setRating.view</code>
        Since <a href="#versions">1.6.0</a>
    </p>

    <p>
        Sets the rating for a music file.
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
            <td>A string which uniquely identifies the file (song) or folder (album/artist) to rate.</td>
        </tr>
        <tr>
            <td><code>rating</code></td>
            <td>Yes</td>
            <td></td>
            <td>The rating between 1 and 5 (inclusive), or 0 to remove the rating.</td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>