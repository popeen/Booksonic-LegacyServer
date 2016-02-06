/*
 This file is part of Subsonic.

 Subsonic is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 Subsonic is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with Subsonic.  If not, see <http://www.gnu.org/licenses/>.

 Copyright 2009 (C) Sindre Mehus
 */
package net.sourceforge.subsonic.util;

import junit.framework.TestCase;

/**
 * Unit test of {@link HttpRange}.
 *
 * @author Sindre Mehus
 */
public class HttpRangeTestCase extends TestCase {

    public void testSize() {
        assertEquals(1, new HttpRange(0L, 0L, null).size());
        assertEquals(2, new HttpRange(0L, 1L, null).size());
        assertEquals(1, new HttpRange(66L, 66L, null).size());
        assertEquals(2, new HttpRange(66L, 67L, null).size());
        assertEquals(10, new HttpRange(66L, 75L, null).size());
        assertEquals(-1, new HttpRange(66L, null, null).size());
    }

    public void testContains() {
        assertFalse(new HttpRange(0L, 0L, null).contains(-1));
        assertTrue(new HttpRange(0L, 0L, null).contains(0));
        assertFalse(new HttpRange(0L, 0L, null).contains(1));

        assertFalse(new HttpRange(5L, 10L, null).contains(-1));
        assertFalse(new HttpRange(5L, 10L, null).contains(4));
        assertTrue(new HttpRange(5L, 10L, null).contains(5));
        assertTrue(new HttpRange(5L, 10L, null).contains(9));
        assertTrue(new HttpRange(5L, 10L, null).contains(10));
        assertFalse(new HttpRange(5L, 10L, null).contains(11));
        assertFalse(new HttpRange(5L, 10L, null).contains(66));

        assertFalse(new HttpRange(5L, null, null).contains(-1));
        assertFalse(new HttpRange(5L, null, null).contains(4));
        assertTrue(new HttpRange(5L, null, null).contains(5));
        assertTrue(new HttpRange(5L, null, null).contains(6));
        assertTrue(new HttpRange(5L, null, null).contains(66));
    }

    public void testParseRange() {
        doTestParseRange(0L, 0L, "bytes=0-0");
        doTestParseRange(0L, 1L, "bytes=0-1");
        doTestParseRange(100L, 100L, "bytes=100-100");
        doTestParseRange(0L, 499L, "bytes=0-499");
        doTestParseRange(500L, 999L, "bytes=500-999");
        doTestParseRange(9500L, null, "bytes=9500-");

        assertNull("Error in parseRange().", HttpRange.of(null));
        assertNull("Error in parseRange().", HttpRange.of("", null));
        assertNull("Error in parseRange().", HttpRange.of("bytes", null));
        assertNull("Error in parseRange().", HttpRange.of("bytes=a-b", null));
        assertNull("Error in parseRange().", HttpRange.of("bytes=-100-500", null));
        assertNull("Error in parseRange().", HttpRange.of("bytes=-500", null));
        assertNull("Error in parseRange().", HttpRange.of("bytes=500-600,601-999", null));
        assertNull("Error in parseRange().", HttpRange.of("bytes=200-100", null));
    }

    private void doTestParseRange(long expectedFrom, Long expectedTo, String range) {
        HttpRange actual = HttpRange.of(range, null);
        assertEquals("Error in parseRange().", expectedFrom, actual.getFirstBytePos());
        assertEquals("Error in parseRange().", expectedTo, actual.getLastBytePos());
    }
}
