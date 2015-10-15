<a name="getPlayQueue"></a>
<section class="box">
    <h3>getPlayQueue</h3>

    <p>
        <code>http://your-server/rest/getPlayQueue.view</code>
        Since <a href="#versions">1.12.0</a>
    </p>

    <p>
        Returns the state of the play queue for this user (as set by <code>savePlayQueue</code>). This includes the
        tracks in the play queue, the currently playing track, and the position within this track. Typically used
        to allow a user to move between different clients/apps while retaining the same play queue (for instance when
        listening to an audio book).
    </p>

    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;playQueue&gt;</code>
        element on success, or an empty <code>&lt;subsonic-response&gt;</code> if no play queue has been saved.
        <a href="inc/api/examples/playQueue_example_1.xml">Example</a>.
    </p>
</section>