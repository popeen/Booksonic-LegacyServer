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

package net.sourceforge.subsonic.service.captions;

import java.io.StringReader;
import java.io.StringWriter;

import junit.framework.TestCase;

public class SrtToVttTestCase extends TestCase {

    public void testConvert() throws Exception {

        StringReader reader = new StringReader(
                "1\n" +
                "00:00:00,010 --> 00:00:04,500\n" +
                "Armed Police! Get on the ground!\n" +
                "Armed police! Get your hands up.\n" +
                "\n" +
                "2\n" +
                "00:00:05,500 --> 00:00:07,500\n" +
                "Man down!\n" +
                "\n" +
                "3\n" +
                "00:00:09,160 --> 00:00:10,310\n" +
                "It's a girl.");
        StringWriter writer = new StringWriter();
        SrtToVtt.convert(reader, writer);

        String sep = System.getProperty("line.separator");
        
        assertEquals("WEBVTT" + sep +
                     sep +
                     "1" + sep +
                     "00:00:00.010 --> 00:00:04.500" + sep +
                     "Armed Police! Get on the ground!" + sep +
                     "Armed police! Get your hands up." + sep +
                     "" + sep +
                     "2" + sep +
                     "00:00:05.500 --> 00:00:07.500" + sep +
                     "Man down!" + sep +
                     sep +
                     "3" + sep +
                     "00:00:09.160 --> 00:00:10.310" + sep +
                     "It's a girl." + sep, 
                     writer.toString());
    }
}