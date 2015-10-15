<a name="jukeboxControl"></a>
<section class="box">
    <h3>jukeboxControl</h3>

    <p>
        <code>http://your-server/rest/jukeboxControl.view</code>
        Since <a href="#versions">1.2.0</a>
    </p>

    <p>
        Controls the jukebox, i.e., playback directly on the server's audio hardware. Note: The user must
        be authorized to control the jukebox (see Settings &gt; Users &gt; User is allowed to play files in jukebox
        mode).
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>action</code></td>
            <td>Yes</td>
            <td></td>
            <td>The operation to perform. Must be one of: <code>get</code>, <code>status</code> (since <a
                    href="#versions">1.7.0</a>),
                <code>set</code> (since <a href="#versions">1.7.0</a>),
                <code>start</code>, <code>stop</code>, <code>skip</code>, <code>add</code>, <code>clear</code>,
                <code>remove</code>, <code>shuffle</code>, <code>setGain</code>
            </td>
        </tr>
        <tr>
            <td><code>index</code></td>
            <td>No</td>
            <td></td>
            <td>Used by <code>skip</code> and <code>remove</code>. Zero-based index of the song to skip to or remove.
            </td>
        </tr>
        <tr>
            <td><code>offset</code></td>
            <td>No</td>
            <td></td>
            <td>(Since <a href="#versions">1.7.0</a>) Used by <code>skip</code>. Start playing this many seconds into
                the
                track.
            </td>
        </tr>
        <tr>
            <td><code>id</code></td>
            <td>No</td>
            <td></td>
            <td>Used by <code>add</code> and <code>set</code>. ID of song to add to the jukebox playlist. Use multiple
                <code>id</code> parameters
                to add many songs in the same request. (<code>set</code> is similar to a <code>clear</code> followed by
                a
                <code>add</code>, but
                will not change the currently playing track.)
            </td>
        </tr>
        <tr>
            <td><code>gain</code></td>
            <td>No</td>
            <td></td>
            <td>Used by <code>setGain</code> to control the playback volume. A float value between 0.0 and 1.0.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;jukeboxStatus&gt;</code> element on success, unless the <code>get</code>
        action is used, in which case a nested <code>&lt;jukeboxPlaylist&gt;</code> element is returned.
        <a href="inc/api/examples/jukeboxStatus_example_1.xml">Example 1</a>.
        <a href="inc/api/examples/jukeboxPlaylist_example_1.xml">Example 2</a>.
    </p>
</section>