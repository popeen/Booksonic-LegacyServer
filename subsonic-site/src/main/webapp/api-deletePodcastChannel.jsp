<a name="deletePodcastChannel"></a>
<section class="box">
    <h3>deletePodcastChannel</h3>

    <p>
        <code>http://your-server/rest/deletePodcastChannel.view</code>
        Since <a href="#versions">1.9.0</a>
    </p>

    <p>
        Deletes a Podcast channel.
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
            <td><code>id</code></td>
            <td>Yes</td>
            <td></td>
            <td>The ID of the Podcast channel to delete.</td>
        </tr>
    </table>
    <p>
        Returns an empty <code>&lt;subsonic-response&gt;</code> element on success.
    </p>
</section>