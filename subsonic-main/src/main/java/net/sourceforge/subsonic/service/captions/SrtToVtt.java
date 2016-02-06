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

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;

/**
 * Converts closed captions from SRT to WebVTT format.
 *
 * @author Sindre Mehus
 * @version $Id$
 */
public class SrtToVtt {

    public static void convert(Reader reader, Writer writer) throws IOException {

        BufferedWriter bufferedWriter = new BufferedWriter(writer);
        BufferedReader bufferedReader = new BufferedReader(reader);

        bufferedWriter.append("WEBVTT");
        bufferedWriter.newLine();
        bufferedWriter.newLine();

        String line = bufferedReader.readLine();
        while (line != null) {

            line = line.replaceFirst("(\\d+:\\d+:\\d+),(\\d+) --> (\\d+:\\d+:\\d+),(\\d+)", "$1.$2 --> $3.$4");

            bufferedWriter.append(line);
            bufferedWriter.newLine();

            line = bufferedReader.readLine();
        }
        bufferedWriter.flush();

    }
}
