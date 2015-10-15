<a name="createUser"></a>
<section class="box">
    <h3>createUser</h3>

    <p>
        <code>http://your-server/rest/createUser.view</code>
        Since <a href="#versions">1.1.0</a>
    </p>

    <p>
        Creates a new Subsonic user, using the following parameters:
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
            <td>The name of the new user.</td>
        </tr>
        <tr>
            <td><code>password</code></td>
            <td>Yes</td>
            <td></td>
            <td>The password of the new user, either in clear text of hex-encoded (see above).</td>
        </tr>
        <tr>
            <td><code>email</code></td>
            <td>Yes</td>
            <td></td>
            <td>The email address of the new user.</td>
        </tr>
        <tr>
            <td><code>ldapAuthenticated</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether the user is authenicated in LDAP.</td>
        </tr>
        <tr>
            <td><code>adminRole</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether the user is administrator.</td>
        </tr>
        <tr>
            <td><code>settingsRole</code></td>
            <td>No</td>
            <td>true</td>
            <td>Whether the user is allowed to change personal settings and password.</td>
        </tr>
        <tr>
            <td><code>streamRole</code></td>
            <td>No</td>
            <td>true</td>
            <td>Whether the user is allowed to play files.</td>
        </tr>
        <tr>
            <td><code>jukeboxRole</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether the user is allowed to play files in jukebox mode.</td>
        </tr>
        <tr>
            <td><code>downloadRole</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether the user is allowed to download files.</td>
        </tr>
        <tr>
            <td><code>uploadRole</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether the user is allowed to upload files.</td>
        </tr>
        <tr>
            <td><code>playlistRole</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether the user is allowed to create and delete playlists. Since 1.8.0, changing this role has no
                effect.
            </td>
        </tr>
        <tr>
            <td><code>coverArtRole</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether the user is allowed to change cover art and tags.</td>
        </tr>
        <tr>
            <td><code>commentRole</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether the user is allowed to create and edit comments and ratings.</td>
        </tr>
        <tr>
            <td><code>podcastRole</code></td>
            <td>No</td>
            <td>false</td>
            <td>Whether the user is allowed to administrate Podcasts.</td>
        </tr>
        <tr>
            <td><code>shareRole</code></td>
            <td>No</td>
            <td>false</td>
            <td>(Since <a href="#versions">1.8.0</a>) Whether the user is allowed to share files with anyone.</td>
        </tr>
        <tr>
            <td><code>musicFolderId</code></td>
            <td>No</td>
            <td>All folders</td>
            <td>(Since <a href="#versions">1.12.0</a>) IDs of the music folders the user is allowed access to. Include the parameter once for each folder.</td>
        </tr>
    </table>

    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>