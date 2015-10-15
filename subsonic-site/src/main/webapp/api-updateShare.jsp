<a name="updateShare"></a>
<section class="box">
    <h3>updateShare</h3>

    <p>
        <code>http://your-server/rest/updateShare.view</code>
        Since <a href="#versions">1.6.0</a>
    </p>

    <p>
        Updates the description and/or expiration date for an existing share.
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
            <td>ID of the share to update.</td>
        </tr>
        <tr>
            <td><code>description</code></td>
            <td>No</td>
            <td></td>
            <td>A user-defined description that will be displayed to people visiting the shared media.</td>
        </tr>
        <tr>
            <td><code>expires</code></td>
            <td>No</td>
            <td></td>
            <td>The time at which the share expires. Given as milliseconds since 1970, or zero to remove the expiration.
            </td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>