<a name="updateUser"></a>
<section class="box">
    <h3>updateUser</h3>

    <p>
        <code>http://your-server/rest/updateUser.view</code>
        Since <a href="#versions">1.10.1</a>
    </p>

    <p>
        Modifies an existing Subsonic user, using the following parameters:
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
            <td>The name of the user.</td>
        </tr>
        <tr>
            <td><code>password</code></td>
            <td>No</td>
            <td></td>
            <td>The password of the user, either in clear text of hex-encoded (see above).</td>
        </tr>
        <tr>
            <td><code>email</code></td>
            <td>No</td>
            <td></td>
            <td>The email address of the user.</td>
        </tr>
        <tr>
            <td><code>ldapAuthenticated</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is authenicated in LDAP.</td>
        </tr>
        <tr>
            <td><code>adminRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is administrator.</td>
        </tr>
        <tr>
            <td><code>settingsRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is allowed to change personal settings and password.</td>
        </tr>
        <tr>
            <td><code>streamRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is allowed to play files.</td>
        </tr>
        <tr>
            <td><code>jukeboxRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is allowed to play files in jukebox mode.</td>
        </tr>
        <tr>
            <td><code>downloadRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is allowed to download files.</td>
        </tr>
        <tr>
            <td><code>uploadRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is allowed to upload files.</td>
        </tr>
        <tr>
            <td><code>coverArtRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is allowed to change cover art and tags.</td>
        </tr>
        <tr>
            <td><code>commentRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is allowed to create and edit comments and ratings.</td>
        </tr>
        <tr>
            <td><code>podcastRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is allowed to administrate Podcasts.</td>
        </tr>
        <tr>
            <td><code>shareRole</code></td>
            <td>No</td>
            <td></td>
            <td>Whether the user is allowed to share files with anyone.</td>
        </tr>
        <tr>
            <td><code>musicFolderId</code></td>
            <td>No</td>
            <td></td>
            <td>(Since <a href="#versions">1.12.0</a>) IDs of the music folders the user is allowed access to. Include the parameter once for each folder.</td>
        </tr>
        <tr>
            <td><code>maxBitRate</code></td>
            <td>No</td>
            <td></td>
            <td>(Since <a href="#versions">1.13.0</a>) The maximum bit rate (in Kbps) for the user. Audio streams of higher bit rates are
                automatically downsampled to this bit rate. Legal values: 0 (no limit), 32, 40, 48, 56, 64, 80, 96, 112, 128,
                160, 192, 224, 256, 320.
            </td>
        </tr>
    </table>

    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>