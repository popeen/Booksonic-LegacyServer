<a name="createShare"></a>
<section class="box">
    <h3>createShare</h3>

    <p>
        <code>http://your-server/rest/createShare.view</code>
        Since <a href="#versions">1.6.0</a>
    </p>

    <p>
        Creates a public URL that can be used by anyone to stream music or video from the Subsonic server. The URL is
        short and
        suitable for posting on Facebook, Twitter etc. Note: The user must be authorized to share (see Settings &gt;
        Users
        &gt; User is allowed to share files with anyone).
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
            <td>ID of a song, album or video to share. Use one <code>id</code> parameter for each entry to share.</td>
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
            <td>The time at which the share expires. Given as milliseconds since 1970.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;shares&gt;</code>
        element on success, which in turns contains a single <code>&lt;share&gt;</code> element for the newly created
        share.
        <a href="inc/api/examples/shares_example_1.xml">Example</a>.
    </p>
</section>