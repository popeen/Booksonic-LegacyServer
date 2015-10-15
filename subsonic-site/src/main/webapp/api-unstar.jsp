<a name="unstar"></a>
<section class="box">
    <h3>unstar</h3>

    <p>
        <code>http://your-server/rest/unstar.view</code>
        Since <a href="#versions">1.8.0</a>
    </p>

    <p>
        Removes the star from a song, album or artist.
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
            <td>No</td>
            <td></td>
            <td>The ID of the file (song) or folder (album/artist) to unstar. Multiple parameters allowed.</td>
        </tr>
        <tr>
            <td><code>albumId</code></td>
            <td>No</td>
            <td></td>
            <td>The ID of an album to unstar. Use this rather than <code>id</code> if the client accesses the media
                collection according to ID3
                tags rather than file structure. Multiple parameters allowed.
            </td>
        </tr>
        <tr>
            <td><code>artistId</code></td>
            <td>No</td>
            <td></td>
            <td>The ID of an artist to unstar. Use this rather than <code>id</code> if the client accesses the media
                collection according to ID3
                tags rather than file structure. Multiple parameters allowed.
            </td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>