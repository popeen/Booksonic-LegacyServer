<a name="getPlaylists"></a>
<section class="box">
    <h3>getPlaylists</h3>

    <p>
        <code>http://your-server/rest/getPlaylists.view</code>
        Since <a href="#versions">1.0.0</a>
    </p>

    <p>
        Returns all playlists a user is allowed to play.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>username</code></td>
            <td>no</td>
            <td></td>
            <td>(Since <a href="#versions">1.8.0</a>) If specified, return playlists for this user rather than for the
                authenticated user. The authenticated user must
                have admin role if this parameter is used.
            </td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;playlists&gt;</code>
        element on success. <a href="inc/api/examples/playlists_example_1.xml">Example</a>.
    </p>
</section>