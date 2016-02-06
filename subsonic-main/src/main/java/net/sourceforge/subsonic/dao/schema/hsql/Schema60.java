/*
 * This file is part of Subsonic.
 *
 *  Subsonic is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  Subsonic is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Subsonic.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  Copyright 2016 (C) Sindre Mehus
 */

package net.sourceforge.subsonic.dao.schema.hsql;

import org.springframework.jdbc.core.JdbcTemplate;

import net.sourceforge.subsonic.Logger;
import net.sourceforge.subsonic.dao.schema.Schema;

/**
 * Used for creating and evolving the database schema.
 * This class implements the database schema for Subsonic version 6.0.
 *
 * @author Sindre Mehus
 */
public class Schema60 extends Schema {

    private static final Logger LOG = Logger.getLogger(Schema60.class);

    @Override
    public void execute(JdbcTemplate template) {

        if (template.queryForInt("select count(*) from version where version = 26") == 0) {
            LOG.info("Updating database schema to version 26.");
            template.execute("insert into version values (26)");

            LOG.info("Deleting obsolete video transcodings.");
            template.execute("delete from transcoding2 where name in ('flv/h264 video', 'mkv video')");
        }

        if (!tableExists(template, "video_conversion")) {
            LOG.info("Database table 'video_conversion' not found.  Creating it.");
            template.execute("create table video_conversion (" +
                             "id identity," +
                             "media_file_id int not null," +
                             "audio_track_id int," +
                             "username varchar not null," +
                             "status varchar not null," +
                             "progress_seconds int," +
                             "created datetime not null," +
                             "changed datetime not null," +
                             "started datetime," +
                             "foreign key (media_file_id) references media_file(id) on delete cascade,"+
                             "foreign key (username) references user(username) on delete cascade)");

            template.execute("create index idx_video_conversion_media_file_id on video_conversion(media_file_id)");
            template.execute("create index idx_video_conversion_status on video_conversion(status)");

            LOG.info("Database table 'video_conversion' was created successfully.");
        }

        if (template.queryForInt("select count(*) from role where id = 12") == 0) {
            LOG.info("Role 'video_conversion' not found in database. Creating it.");
            template.execute("insert into role values (12, 'video_conversion')");
            template.execute("insert into user_role " +
                             "select distinct u.username, 12 from user u, user_role ur " +
                             "where u.username = ur.username and ur.role_id = 1");
            LOG.info("Role 'video_conversion' was created successfully.");
        }
    }
}