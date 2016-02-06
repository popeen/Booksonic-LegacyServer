<%--
  ~ This file is part of Subsonic.
  ~
  ~  Subsonic is free software: you can redistribute it and/or modify
  ~  it under the terms of the GNU General Public License as published by
  ~  the Free Software Foundation, either version 3 of the License, or
  ~  (at your option) any later version.
  ~
  ~  Subsonic is distributed in the hope that it will be useful,
  ~  but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~  GNU General Public License for more details.
  ~
  ~  You should have received a copy of the GNU General Public License
  ~  along with Subsonic.  If not, see <http://www.gnu.org/licenses/>.
  ~
  ~  Copyright 2015 (C) Sindre Mehus
  --%>

<a name="getAlbumInfo"></a>
<section class="box">
    <h3>getAlbumInfo</h3>

    <p>
        <code>http://your-server/rest/getAlbumInfo.view</code>
        Since <a href="#versions">1.14.0</a>
    </p>

    <p>
        Returns album notes, image URLs etc, using data from <a href="http://last.fm" target="_blank">last.fm</a>.
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
            <td>The album or song ID.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;albumInfo&gt;</code>
        element on success.
        <a href="inc/api/examples/albumInfo_example_1.xml">Example</a>.
    </p>
</section>