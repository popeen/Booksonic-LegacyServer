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

<a name="getTopSongs"></a>
<section class="box">
    <h3>getTopSongs</h3>

    <p>
        <code>http://your-server/rest/getTopSongs.view</code>
        Since <a href="#versions">1.13.0</a>
    </p>

    <p>
        Returns top songs for the given artist, using data from <a href="http://last.fm" target="_blank">last.fm</a>.
    </p>
    <table>
        <tr>
            <th>Parameter</th>
            <th>Required</th>
            <th>Default</th>
            <th>Comment</th>
        </tr>
        <tr>
            <td><code>artist</code></td>
            <td>Yes</td>
            <td></td>
            <td>The artist name.</td>
        </tr>
        <tr>
            <td><code>count</code></td>
            <td>No</td>
            <td>50</td>
            <td>Max number of songs to return.</td>
        </tr>
    </table>
    <p>
        Returns a <code>&lt;subsonic-response&gt;</code> element with a nested <code>&lt;topSongs&gt;</code>
        element on success.
        <a href="inc/api/examples/topSongs_example_1.xml">Example</a>.
    </p>
</section>