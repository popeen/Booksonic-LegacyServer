<a name="getAlbumList2"></a>
<section class="box">
    <h3>getAlbumList2</h3>

    <p>
        <code>http://your-server/rest/getAlbumList2.view</code>
        Since <a href="#versions">1.8.0</a>
    </p>

    <p>
        Similar to <code>getAlbumList</code>, but organizes music according to ID3 tags.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>type</code></td>
            <td>Yes</td>
            <td></td>
            <td>The list type. Must be one of the following: <code>random</code>, <code>newest</code>,
                <code>frequent</code>, <code>recent</code>, <code>starred</code>,
                <code>alphabeticalByName</code> or <code>alphabeticalByArtist</code>.
                Since <a href="#versions">1.10.1</a> you can use <code>byYear</code> and <code>byGenre</code> to list
                albums in
                a given year range or genre.
            </td>
        </tr>
        <tr>
            <td><code>size</code></td>
            <td>No</td>
            <td>10</td>
            <td>The number of albums to return. Max 500.</td>
        </tr>
        <tr>
            <td><code>offset</code></td>
            <td>No</td>
            <td>0</td>
            <td>The list offset. Useful if you for example want to page through the list of newest albums.</td>
        </tr>
        <tr>
            <td><code>fromYear</code></td>
            <td>Yes (if <code>type</code> is <code>byYear</code>)</td>
            <td></td>
            <td>The first year in the range. If <code>fromYear &gt; toYear</code> a reverse chronological list is returned.</td>
        </tr>
        <tr>
            <td><code>toYear</code></td>
            <td>Yes (if <code>type</code> is <code>byYear</code>)</td>
            <td></td>
            <td>The last year in the range.</td>
        </tr>
        <tr>
            <td><code>genre</code></td>
            <td>Yes (if <code>type</code> is <code>byGenre</code>)</td>
            <td></td>
            <td>The name of the genre, e.g., "Rock".</td>
        </tr>
        <tr>
            <td><code>musicFolderId</code></td>
            <td>No</td>
            <td></td>
            <td>(Since <a href="#versions">1.12.0</a>) Only return albums in the music folder with the given ID. See <code>getMusicFolders</code>.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;albumList2&gt;</code>
        element on success. <a href="inc/api/examples/albumList2_example_1.xml">Example</a>.
    </p>
</section>