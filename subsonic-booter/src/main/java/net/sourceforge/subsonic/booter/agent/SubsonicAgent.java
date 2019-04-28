package net.sourceforge.subsonic.booter.agent;

import java.awt.Desktop;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.swing.JOptionPane;
import javax.swing.UIManager;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import com.jgoodies.looks.plastic.PlasticXPLookAndFeel;

import net.sourceforge.subsonic.booter.deployer.DeploymentStatus;
import net.sourceforge.subsonic.booter.deployer.SubsonicDeployerService;
import org.apache.commons.codec.digest.DigestUtils;

/**
 * Responsible for deploying the Subsonic web app in
 * the embedded Jetty container.
 *
 * @author Sindre Mehus
 */
public class SubsonicAgent {

    private final List<SubsonicListener> listeners = new ArrayList<SubsonicListener>();
    private final TrayController trayController;
    private SubsonicFrame frame;
    private final SubsonicDeployerService service;
    private static final int POLL_INTERVAL_DEPLOYMENT_INFO_SECONDS = 5;
    private static final int POLL_INTERVAL_SERVICE_STATUS_SECONDS = 5;
    private String url;
    private boolean serviceStatusPollingEnabled;
    private boolean elevated;

    public SubsonicAgent(SubsonicDeployerService service) {
        this.service = service;
        setLookAndFeel();
        trayController = new TrayController(this);
        updateCheck();
        startPolling();
    }

    public void setFrame(SubsonicFrame frame) {
        this.frame = frame;
    }

    private void setLookAndFeel() {
        // Set look-and-feel.
        try {
            UIManager.setLookAndFeel(new PlasticXPLookAndFeel());
        } catch (Throwable x) {
            System.err.println("Failed to set look-and-feel.\n" + x);
        }
    }
    
    private void updateCheck(){
        ScheduledExecutorService executor = Executors.newScheduledThreadPool(2);
        Runnable runnable = new Runnable() {
            public void run() {
                String date = new SimpleDateFormat("yy-MM-dd-HH").format(new Date());
                
                if(new SimpleDateFormat("mm").format(new Date()).equals("35")){
                	String updated = ""; 
                	try{ updated = KakaduaUtil.getStringFromFile("versionCheck"); }catch(Exception e){ updated = "error"; }
	            	if(updated.contains("up_to_date_beta")){
	            		try{ 
	            			if(!KakaduaUtil.getStringFromFile("lastUpdateCheck").contains(date)){
	            				startOrStopService(false);
	            				KakaduaUtil.file_write("lastUpdateCheck", date);
	            					            				
	            				String pathNewWar = "newWar.war";
	            				String warMd5 = "7fc346348ad484fe36978bbd409a87f0";
	            				String war = "https://github.com/popeen/Popeens-Subsonic/releases/download/1.1.release/booksonic.war";
	            					            				
	            				saveUrl(pathNewWar, war); 
	            				FileInputStream fis = new FileInputStream(new File(pathNewWar));    				
	            				String downloadedWarMd5 = DigestUtils.md5Hex(fis);
	            				fis.close();
	            				
	            				if(warMd5.equals(downloadedWarMd5)){
	            					try {
	            					    File oldWar = new File("booksonic.war");	            					    
	            					    if(oldWar.delete()){
	            					    	new File("newWar.war").renameTo(oldWar);
	            					    	FileUtils.deleteDirectory(new File("C:\\booksonic\\jetty"));
	            					    }
	            					}catch(Exception e){}
	            				}
            				 	startOrStopService(true);
	            			}
	            			
	            		}catch(Exception e){ JOptionPane.showMessageDialog(null, e.toString()); }
	            	}else if(updated.contains("outdated_beta")){
	
	            	}else if(updated.contains("up_to_date")){
	
	            	}else if(updated.contains("outdated")){
	
	            	}
                }
            }
        };
        executor.scheduleWithFixedDelay(runnable, 0, POLL_INTERVAL_SERVICE_STATUS_SECONDS, TimeUnit.SECONDS);
    
    }
    
    public void saveUrl(final String filename, final String urlString)
            throws MalformedURLException, IOException {
        BufferedInputStream in = null;
        FileOutputStream fout = null;
        try {
            in = new BufferedInputStream(new URL(urlString).openStream());
            fout = new FileOutputStream(filename);

            final byte data[] = new byte[1024];
            int count;
            while ((count = in.read(data, 0, 1024)) != -1) {
                fout.write(data, 0, count);
            }
        } finally {
            if (in != null) {
                in.close();
            }
            if (fout != null) {
                fout.close();
            }
        }
    }
    
    private void startPolling() {
        ScheduledExecutorService executor = Executors.newScheduledThreadPool(2);
        Runnable runnable = new Runnable() {
            public void run() {
                try {
                    notifyDeploymentInfo(service.getDeploymentInfo());
                } catch (Throwable x) {
                    notifyDeploymentInfo(null);
                }
            }
        };
        executor.scheduleWithFixedDelay(runnable, 0, POLL_INTERVAL_DEPLOYMENT_INFO_SECONDS, TimeUnit.SECONDS);

        runnable = new Runnable() {
            public void run() {
                if (serviceStatusPollingEnabled) {
                    try {
                        notifyServiceStatus(getServiceStatus());
                    } catch (Throwable x) {
                        notifyServiceStatus(null);
                    }
                }
            }
        };
        executor.scheduleWithFixedDelay(runnable, 0, POLL_INTERVAL_SERVICE_STATUS_SECONDS, TimeUnit.SECONDS);
    }

    private String getServiceStatus() throws Exception {
        Process process = Runtime.getRuntime().exec("booksonic-service.exe -status");
        return IOUtils.toString(process.getInputStream());
    }

    public void setServiceStatusPollingEnabled(boolean enabled) {
        serviceStatusPollingEnabled = enabled;
    }

    public void startOrStopService(boolean start) {
        try {
            String cmd = "booksonic-service.exe " + (start ? "-start" : "-stop");
            System.err.println("Executing: " + cmd);

            Runtime.getRuntime().exec(cmd);
        } catch (Exception x) {
            x.printStackTrace();
        }
    }

    /**
     * If necessary, restart agent with elevated rights.
     */
    public void checkElevation(String... args) {

        if (isElevationNeeded() && !isElevated()) {
            try {
                List<String> command = new ArrayList<String>();
                command.add("cmd");
                command.add("/c");
                command.add("booksonic-agent-elevated.exe");
                command.addAll(Arrays.asList(args));

                ProcessBuilder builder = new ProcessBuilder();
                builder.command(command);
                System.err.println("Executing: " + command + " with current dir: " + System.getProperty("user.dir"));
                builder.start();
                System.exit(0);
            } catch (Exception x) {
                JOptionPane.showMessageDialog(frame, "Failed to elevate Booksonic Control Panel. " + x, "Error", JOptionPane.WARNING_MESSAGE);
                x.printStackTrace();
            }
        }
    }

    public void setElevated(boolean elevated) {
        this.elevated = elevated;
    }

    private boolean isElevated() {
        return elevated;
    }

    /**
     * Returns whether UAC elevation is necessary (to start/stop services etc).
     */
    private boolean isElevationNeeded() {

        String osVersion = System.getProperty("os.version");
        try {
            int majorVersion = Integer.parseInt(osVersion.substring(0, osVersion.indexOf(".")));

            // Elevation is necessary in Windows Vista (os.version=6.1) and later.
            return majorVersion >= 6;
        } catch (Exception x) {
            System.err.println("Failed to resolve OS version from '" + osVersion + "'\n" + x);
            return false;
        }
    }

    public void addListener(SubsonicListener listener) {
        listeners.add(listener);
    }

    private void notifyDeploymentInfo(DeploymentStatus status) {
        if (status != null) {
            url = status.getURL();
        }

        for (SubsonicListener listener : listeners) {
            listener.notifyDeploymentStatus(status);
        }
    }

    private void notifyServiceStatus(String status) {
        for (SubsonicListener listener : listeners) {
            listener.notifyServiceStatus(status);
        }
    }

    public void showStatusPanel() {
        frame.showStatusPanel();
    }

    public void showSettingsPanel() {
        frame.showSettingsPanel();
    }

    public void showTrayIconMessage() {
        trayController.showMessage();
    }

    public void exit() {
        trayController.uninstallComponents();
        System.exit(0);
    }

    public void openBrowser() {
        try {
            Desktop.getDesktop().browse(new URI(url));
        } catch (Throwable x) {
            x.printStackTrace();
        }
    }
}
