<a name="download"></a>
<section class="box">
    <h3>download</h3>

    <p>
        <code>http://your-server/rest/download.view</code>
        Since <a href="#versions">1.0.0</a>
    </p>

    <p>
        Downloads a given media file. Similar to <code>stream</code>, but this method returns the original media data
        without transcoding or downsampling.
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
            <td>A string which uniquely identifies the file to download. Obtained by calls to getMusicDirectory.</td>
        </tr>
    </table>
    <p>
        Returns binary data on success, or an XML document on error (in which case the HTTP content type will start with
        "text/xml").
    </p>
</section>