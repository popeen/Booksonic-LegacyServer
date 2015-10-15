<a name="changePassword"></a>
<section class="box">
    <h3>changePassword</h3>

    <p>
        <code>http://your-server/rest/changePassword.view</code>
        Since <a href="#versions">1.1.0</a>
    </p>

    <p>
        Changes the password of an existing Subsonic user, using the following parameters.
        You can only change your own password unless you have admin privileges.
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
            <td>The name of the user which should change its password.</td>
        </tr>
        <tr>
            <td><code>password</code></td>
            <td>Yes</td>
            <td></td>
            <td>The new password of the new user, either in clear text of hex-encoded (see above).</td>
        </tr>
    </table>

    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>