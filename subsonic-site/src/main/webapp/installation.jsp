<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>
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
  ~  Copyright 2014 (C) Sindre Mehus
  --%>

<!DOCTYPE HTML>
<html>
<%@ include file="head.jsp" %>

<body>

<c:import url="header.jsp"/>

<section id="main" class="container">
<header>
    <h2>How to Install</h2>
</header>
<div class="row">
<div class="12u">

<section class="box">

    <div class="row">
        <div class="6u 12u(3)">
            <a href="#windows" class="button special icon fit fa-windows">Windows installation</a>
            <a href="#mac" class="button special icon fit fa-apple">Mac installation</a>
            <a href="#debian" class="button special icon fit fa-linux">Debian / Ubuntu installation</a>
        </div>

        <div class="6u 12u(3)">
            <a href="#rpm" class="button special icon fit fa-linux">Red Hat / Fedora installation</a>
            <a href="#standalone" class="button special icon fit fa-archive">Stand-alone installation</a>
            <a href="#war" class="button special icon fit fa-coffee">WAR installation</a>
        </div>
    </div>

    <p><strong>Important!</strong>
        Immediately after installing Subsonic you should change the admin password to secure the server.
        Point your browser to the Subsonic web page (see URL below), and log in with username <strong>admin</strong> and password
        <strong>admin</strong>.  Go to <strong>Settings &gt; Users</strong> to change password and create new users.
    </p>

</section>

    <a name="windows"></a>
    <section class="box">
        <h3>Windows installation</h3>

        <p>
            <span class="image right"><a href="inc/img/windows-installer.png"><img src="inc/img/windows-installer-small.png" alt="" /></a></span>
            On Windows, the easiest way to install Subsonic is using the provided Windows Installer:
            <a href="download.jsp"><strong>subsonic-x.x-setup.exe</strong></a>.
        </p>
        <p>
            It installs Subsonic as a service, available in <strong>Control Panel &gt; Administrative Tools &gt; Services</strong>, that is started automatically when you log on to Windows.
        </p>
        <p>
            It also creates links in the Start Menu: <strong>Start &gt; All Programs &gt; Subsonic</strong>. From this menu you can start/stop the Subsonic service, open the Subsonic web page, or
            change basic settings such as which port number Subsonic should use. You can also click on the little yellow submarine tray icon.
        </p>
        <p>
            If you're upgrading an existing Subsonic installation, you don't have to uninstall the old version first. In any case, the existing Subsonic settings are preserved.
        </p>
        <p>
            After installing and starting Subsonic, open the Subsonic web page on <a href="http://localhost:4040">http://localhost:4040</a>.
        </p>
    </section>

    <a name="mac"></a>
    <section class="box">
        <h3>Mac installation</h3>
        <p>
            <span class="image right"><a href="inc/img/mac-installer.png"><img src="inc/img/mac-installer-small.png" alt="" /></a></span>
            Download the installation package and run it. This installs Subsonic.app in Applications. Start it by opening Applications and
            click the Subsonic icon.  A small headset icon will appear in the menu bar. If you want Subsonic to start automatically when you log in,
            open <strong>System Preferences &gt; Users &amp; Groups</strong> and add Subsonic to the list of <strong>Login Items</strong>.
        </p>
        <p>
            After installing and starting Subsonic, open the Subsonic web page on <a href="http://localhost:4040">http://localhost:4040</a>.
        </p>
        <h4>Advanced configuration</h4>
        <p>
            To change the port number, Java memory settings or other startup parameters, edit <strong>/Applications/Subsonic.app/Contents/Info.plist</strong>.
        </p>
        <h4>Troubleshooting</h4>
        <p>
            If Subsonic doesn't start properly you can troubleshoot it by starting it from the command line:
            <strong>/Applications/Subsonic.app/Contents/MacOS/JavaAppLauncher</strong>.
        </p>
        <p>
            Also check the logs in <strong>/Library/Application Support/Subsonic</strong>.
        </p>
    </section>

    <a name="debian"></a>
    <section class="box">
        <h3>Debian / Ubuntu installation</h3>
        <p>
            This installation option applies to Debian Linux, including Ubuntu.
        </p>
        <ul>
            <li>First, install Java: <strong>sudo apt-get install openjdk-7-jre</strong></li>
            <li><a href="download.jsp">Download</a> the Subsonic .deb package and install it: <strong>sudo dpkg -i subsonic-x.x.deb</strong></li>
        </ul>
        <p>
            Notice that the installer configures your system to start Subsonic automatically when booting.
            After installing, open the Subsonic web page on <a href="http://localhost:4040">http://localhost:4040</a>.
        </p>

        <h4>Change user</h4>
        <p>
            By default the Subsonic process is run as the root user. To improve security it is strongly advised that you run it as a
            dedicated user with less powerful privileges. You can specify this user by setting the SUBSONIC_USER variable in
            <strong>/etc/default/subsonic</strong>.
        </p>
        <p>
            Note that non-root users are by default not allowed to use ports below 1024. Also make sure to grant the user write permissions in
            the music directories, otherwise changing album art and tags will fail.
        </p>

        <h4>Advanced configuration</h4>
        <p>
            To change the port number, Java memory settings or other startup parameters, edit the SUBSONIC_ARGS variable in
            <strong>/etc/default/subsonic</strong>. To restart Subsonic, do
            <strong>sudo service subsonic restart</strong>
        </p>

        <h4>Troubleshooting</h4>
        <p>
            Check the logs in <strong>/var/subsonic</strong>.
        </p>

    </section>

    <a name="rpm"></a>
    <section class="box">
        <h3>Red Hat / Fedora installation</h3>
        <p>
            This installation option applies to Red Hat Linux, including Fedora.
        </p>
        <ul>
            <li>First, install Java: <strong>sudo yum install java-1.7.0-openjdk</strong></li>
            <li><a href="download.jsp">Download</a> the Subsonic .rpm installation package and install it: <strong>sudo yum install --nogpgcheck subsonic-x.x.rpm</strong></li>
            <li>If nothing happens, try to remove the old version first (all settings will be retained): <strong>sudo yum remove subsonic</strong></li>
        </ul>
        <p>
            Notice that the installer configures your system to start Subsonic automatically when booting.
            After installing, open the Subsonic web page on <a href="http://localhost:4040">http://localhost:4040</a>.
        </p>

        <h4>Change user</h4>
        <p>
            By default the Subsonic process is run as the root user. To improve security it is strongly advised that you run it as a
            dedicated user with less powerful privileges. You can specify this user by setting the SUBSONIC_USER variable in
            <strong>/etc/sysconfig/subsonic</strong>.
        </p>
        <p>
            Note that non-root users are by default not allowed to use ports below 1024. Also make sure to grant the user write permissions in
            the music directories, otherwise changing album art and tags will fail.
        </p>

        <h4>Advanced configuration</h4>
        <p>
            To change the port number, Java memory settings or other startup parameters, edit the SUBSONIC_ARGS variable in
            <strong>/etc/sysconfig/subsonic</strong>. To restart Subsonic, do <strong>sudo service subsonic restart</strong>
        </p>

        <h4>Troubleshooting</h4>
        <p>
            Check the logs in <strong>/var/subsonic</strong>.
        </p>
    </section>

    <a name="standalone"></a>
    <section class="box">
        <h3>Stand-alone installation</h3>
        <p><strong>Requirements: </strong>Java 7 or later (<a href="http://www.java.com">Download</a>)</p>
        <p>
            This is Subsonic with an embedded Jetty server, and can be installed on any Windows, Linux, Unix, FreeNAS, unRAID etc operating system.
        </p>
        <ul>
            <li>Unpack <strong>subsonic-x.x-standalone.tar.gz</strong> to <strong>SUBSONIC_HOME/standalone</strong>.
                <strong>SUBSONIC_HOME</strong> is typically <strong>c:\subsonic</strong> on Windows, and <strong>/var/subsonic</strong> on Unix-based operating systems.</li>
            <li>Optionally configure the startup script <strong>SUBSONIC_HOME/standalone/subsonic.sh</strong></li>
            <li>Execute the startup script. (Typically you will configure your operating system to execute the script automatically at start-up.)</li>
            <li>Open the Subsonic web page. The default address is <a href="http://localhost:4040">http://localhost:4040</a>.</li>
        </ul>
    </section>

    <a name="war"></a>
    <section class="box">
        <h3>WAR installation</h3>
        <p><strong>Requirements: </strong>Java 7 or later (<a href="http://www.java.com">Download</a>). A servlet container supporting Servlet 2.4 and JSP 2.0.</p>

        <p>
            Use this option if you want to deploy Subsonic in an external server, such as Tomcat, Jetty, GlassFish or Geronimo. Subsonic comes
            packaged as a standard Java web application, <strong>subsonic.war</strong>, which can be easily deployed in any compatible servlet container.
            The most commonly used server is Tomcat, and the rest of this section describes how to install or upgrade Subsonic on a Tomcat server.
        </p>

        <ul>
            <li>Stop Tomcat if it's running.</li>
            <li>Remove these files and directories if they exist:
                <ul>
                    <li><strong>TOMCAT_HOME/webapps/subsonic.war</strong></li>
                    <li><strong>TOMCAT_HOME/webapps/subsonic</strong></li>
                    <li><strong>TOMCAT_HOME/work</strong></li>
                </ul>
            </li>
            <li>Copy the file <strong>subsonic.war</strong> to <strong>TOMCAT_HOME/webapps</strong>.</li>
            <li>Start Tomcat.</li>
            <li>Point your web browser to <a href="http://localhost/subsonic">http://localhost/subsonic</a> (or
                <a href="http://localhost:8080/subsonic">http://localhost:8080/subsonic</a> if you installed Tomcat on port 8080.)</li>
        </ul>

        <p><b>Notes</b></p>
        <ul>
            <li> If you installed Tomcat as a Windows Service, you can start and stop it from the service manager: <strong>Control Panel &gt; Administrative Tools &gt; Services</strong>.</li>
            <li><strong>TOMCAT_HOME</strong> refers to the directory in which you installed Tomcat. On Windows this is normally <strong>C:\Program Files\Apache Software Foundation\Tomcat 5.5</strong></li>
            <li>On Linux, Subsonic keeps its files in <strong>/var/subsonic</strong>. Depending on your configuration, Tomcat may not be permitted to create this directory, in which case
                you have to create it manually: <strong>mkdir /var/subsonic; chown tomcat:tomcat /var/subsonic</strong></li>
        </ul>

        <p><b>Troubleshooting</b></p>
        <p>
            If you experience any problems, please make sure you follow the installation instructions above. Here's a list of suggestions of what to do if it still doesn't work:
        </p>
        <ul>
            <li>Restart Tomcat.</li>
            <li>Reinstall Subsonic.</li>
            <li>Upgrade to the latest Tomcat version (at least if you're using Tomcat 5.0 or earlier).</li>
            <li>Look for errors in the Subsonic log, <strong>c:\subsonic\subsonic.log</strong> or <strong>/var/subsonic/subsonic.log</strong>.</li>
            <li>Look for errors in the Tomcat logs, <strong>TOMCAT_HOME/logs</strong>.</li>
        </ul>
    </section>

</div>
</div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>