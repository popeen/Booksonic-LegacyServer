<a name="getChatMessages"></a>
<section class="box">
    <h3>getChatMessages</h3>

    <p>
        <code>http://your-server/rest/getChatMessages.view</code>
        Since <a href="#versions">1.2.0</a>
    </p>

    <p>
        Returns the current visible (non-expired) chat messages.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>since</code></td>
            <td>No</td>
            <td></td>
            <td>Only return messages newer than this time (in millis since Jan 1 1970).</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;chatMessages&gt;</code>
        element on success. <a href="inc/api/examples/chatMessages_example_1.xml">Example</a>.
    </p>
</section>