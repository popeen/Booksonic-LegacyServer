<a name="createPodcastChannel"></a>
<section class="box">
    <h3>createPodcastChannel</h3>

    <p>
        <code>http://your-server/rest/createPodcastChannel.view</code>
        Since <a href="#versions">1.9.0</a>
    </p>

    <p>
        Adds a new Podcast channel.
        Note: The user must be authorized for Podcast administration (see Settings &gt; Users &gt; User is allowed to
        administrate Podcasts).
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>url</code></td>
            <td>Yes</td>
            <td></td>
            <td>The URL of the Podcast to add.</td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>