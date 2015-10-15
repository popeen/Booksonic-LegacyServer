package net.sourceforge.subsonic.backend;

import org.apache.log4j.Logger;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.Reader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

/**
 * @author Sindre Mehus
 */
public class Util {

    private static final File BACKEND_HOME = new File("/var/subsonic-backend");
    private static final Logger LOG = Logger.getLogger(Util.class);

    private Util() {
    }

    public static synchronized File getBackendHome() {
        if (!BACKEND_HOME.exists() || !BACKEND_HOME.isDirectory()) {
            boolean success = BACKEND_HOME.mkdirs();
            if (!success) {
                String message = "The directory " + BACKEND_HOME + " does not exist. Please create it and make it writable.";
                LOG.error(message);
                throw new RuntimeException(message);
            }
        }
        return BACKEND_HOME;
    }

    public static String getPassword(String filename) throws IOException {
        File pwdFile = new File(getBackendHome(), filename);
        Reader reader = new FileReader(pwdFile);
        try {
            return StringUtils.trimToNull(IOUtils.toString(reader));
        } finally {
            IOUtils.closeQuietly(reader);
        }
    }

    public static Date latest(Date... dates) {
        Date result = null;
        for (Date date : dates) {
            if (date != null && (result == null || result.before(date))) {
                result = date;
            }
        }
        return result;
    }

    public static ScheduledExecutorService singleThreadExecutor(String name) {
        return Executors.newSingleThreadScheduledExecutor(new SubsonicThreadFactory(name));
    }
}
