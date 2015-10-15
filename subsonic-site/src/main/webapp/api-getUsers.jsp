<a name="getUser"></a>
<section class="box">
    <h3>getUsers</h3>

    <p>
        <code>http://your-server/rest/getUsers.view</code>
        Since <a href="#versions">1.8.0</a>
    </p>

    <p>
        Get details about all users, including which authorization roles and folder access they have.
        Only users with admin privileges are allowed to call this method.
    </p>

    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;users&gt;</code>
        element on success. <a href="inc/api/examples/users_example_1.xml">Example</a>.
    </p>
</section>