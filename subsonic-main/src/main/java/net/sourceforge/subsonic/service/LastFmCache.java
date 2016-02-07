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
 *  Copyright 2014 (C) Sindre Mehus
 */

package net.sourceforge.subsonic.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import org.apache.commons.io.IOUtils;

import de.umass.lastfm.cache.FileSystemCache;

/**
 * Based on {@link FileSystemCache}, but properly closes files.
 *
 * @author Sindre Mehus
 * @version $Id$
 */
public class LastFmCache extends FileSystemCache {

    private final File cacheDir;

    public LastFmCache(File cacheDir) {
        super(cacheDir);
        this.cacheDir = cacheDir;
        setExpirationPolicy(new LastFmExpirationPolicy());
    }

    @Override
    public InputStream load(String cacheEntryName) {
        FileInputStream in = null;
        try {
            in = new FileInputStream(getXmlFile(cacheEntryName));
            return new ByteArrayInputStream(IOUtils.toByteArray(in));
        } catch (Exception e) {
            return null;
        } finally {
            IOUtils.closeQuietly(in);
        }
    }

    @Override
    public void store(String cacheEntryName, InputStream inputStream, long expirationDate) {
        createCache();

        OutputStream xmlOut = null;
        OutputStream metaOut = null;
        try {
            File xmlFile = getXmlFile(cacheEntryName);
            xmlOut = new FileOutputStream(xmlFile);
            IOUtils.copy(inputStream, xmlOut);

            File metaFile = getMetaFile(cacheEntryName);
            Properties properties = new Properties();

            properties.setProperty("expiration-date", String.valueOf(expirationDate));

            metaOut = new FileOutputStream(metaFile);
            properties.store(metaOut, null);
        } catch (Exception e) {
            // we ignore the exception. if something went wrong we just don't cache it.
        } finally {
            IOUtils.closeQuietly(xmlOut);
            IOUtils.closeQuietly(metaOut);
        }
    }

    private void createCache() {
        if (!cacheDir.exists()) {
            cacheDir.mkdirs();
        }
    }

    @Override
    public boolean isExpired(String cacheEntryName) {
        File f = getMetaFile(cacheEntryName);
        if (!f.exists()) {
            return false;
        }
        InputStream in = null;
        try {
            Properties p = new Properties();
            in = new FileInputStream(f);
            p.load(in);
            long expirationDate = Long.valueOf(p.getProperty("expiration-date"));
            return expirationDate < System.currentTimeMillis();
        } catch (Exception e) {
            return false;
        } finally {
            IOUtils.closeQuietly(in);
        }
    }

    public boolean isCached(String cacheEntryName) {
        return getXmlFile(cacheEntryName).exists() &&
               getMetaFile(cacheEntryName).exists() &&
               !isExpired(cacheEntryName);
    }

    private File getXmlFile(String cacheEntryName) {
        return new File(cacheDir, cacheEntryName + ".xml");
    }

    private File getMetaFile(String cacheEntryName) {
        return new File(cacheDir, cacheEntryName + ".meta");
    }
}
