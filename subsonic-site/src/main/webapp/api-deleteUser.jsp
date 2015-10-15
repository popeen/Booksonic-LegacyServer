<a name="deleteUser"></a>
<section class="box">
    <h3>deleteUser</h3>

    <p>
        <code>http://your-server/rest/deleteUser.view</code>
        Since <a href="#versions">1.3.0</a>
    </p>

    <p>
        Deletes an existing Subsonic user, using the following parameters:
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
            <td>Yes</td>
            <td></td>
            <td>The name of the user to delete.</td>
        </tr>
    </table>

    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>