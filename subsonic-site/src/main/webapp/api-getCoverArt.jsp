<a name="getCoverArt"></a>
<section class="box">
    <h3>getCoverArt</h3>

    <p>
        <code>http://your-server/rest/getCoverArt.view</code>
        Since <a href="#versions">1.0.0</a>
    </p>

    <p>
        Returns a cover art image.
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
            <td>The ID of a song, album or artist.</td>
        </tr>
        <tr>
            <td><code>size</code></td>
            <td>No</td>
            <td></td>
            <td>If specified, scale image to this size.</td>
        </tr>
    </table>
    <p>
        Returns the cover art image in binary form.
    </p>
</section>