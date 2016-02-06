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
        <h2>Getting Started</h2>
    </header>
    <div class="row">
        <div class="12u">

            <section class="box">

                <p>
                    This guide assumes that you have successfully installed the Subsonic server on your computer. If not,
                    please refer to the <a href="installation.jsp">installation instructions</a>.
                </p>
                <p>
                    After installing and starting Subsonic, open the Subsonic web page. The web address may differ depending
                    on your installation options, but is typically <a href="http://localhost:4040" target="_blank">http://localhost:4040</a>.
                </p>

                <ul class="actions fit small">
                    <li><a class="button small alt fit" href="#1">Setting up media folders</a></li>
                    <li><a class="button small alt fit" href="#2">Setting up remote access</a></li>
                    <li><a class="button small alt fit" href="#3">Registering your license key</a></li>
                    <li><a class="button small alt fit" href="#4">Using https</a></li>
                </ul>

            </section>

            <a name="1"></a>
            <section class="box">
                <h3>Setting up media folders</h3>
                <p>
                    <span class="image right"><a href="inc/img/gettingstarted/mediafolders.png"><img src="inc/img/gettingstarted/mediafolders.png" class="dropshadow" alt="" style="max-height:250px"/></a></span>
                    You must tell Subsonic where you keep your music and videos. Select <strong>Settings &gt; Media folders</strong> to add folders.</p>

                <p>Also note that Subsonic will organize your music according to how they are organized on your disk.
                    Unlike many other music applications, Subsonic does not organize the music according to the tag information
                    embedded in the files. (It does, however, also read the tags for presentation and search purposes.)</p>

                <p>Consequently, it's recommended that the music folders you add to Subsonic are organized in an
                    <span style="white-space:nowrap;">"artist/album/song"</span> manner. There are music managers, like
                    <a href="http://www.mediamonkey.com/" target="_blank">MediaMonkey</a>, that can help you achieve this.</p>

                <h4>Using network disks in Windows</h4>
                <span class="image right"><a href="inc/img/gettingstarted/windows-service.png"><img src="inc/img/gettingstarted/windows-service.png" height="250" alt="" /></a></span>
                <p>Subsonic runs as a <a href="http://en.wikipedia.org/wiki/Windows_service" target="_blank">service</a> on Windows. By default,
                    mapped networks disks are not visible to services. To fix this you can change the Subsonic service to run as the
                    <strong>logged-on</strong> user instead of the <strong>System</strong> user.</p>
                <ol>
                    <li>Open <strong>Services</strong> in Windows.</li>
                    <li>Right-click the Subsonic service and select <strong>Properties</strong>.</li>
                    <li>Click the <strong>Log On</strong> tab.</li>
                    <li>Activate <strong>This account</strong> and enter your Windows username and password.</li>
                    <li>Click OK and restart the service.</li>
                </ol>

            </section>

            <a name="2"></a>
            <section class="box">
                <h3>Setting up remote access</h3>
                <p>With Subsonic you can access your music anywhere on the internet or from your iPhone or Android phone.
                    However, in order to do that certain conditions must be met:</p>

                <ul>
                    <li>Your router must have a public IP address and must be accessible from the internet. This is true for most home internet connections.</li>
                    <li>Your router must support the UPnP or NAT-PMP protocol so that Subsonic can setup the appropriate port forwarding. If your router doesn't support
                        this you will have to configure the port forwarding manually.</li>
                </ul>

                <h4>Automatic port forwarding</h4>
                <p>To enable automatic port forwarding in Subsonic, go to <strong>Settings &gt; Network</strong> and enable the
                    "Automatically configure your router..." option. Click the Save button and pay close attention to the status message
                    that is displayed. If you get an error message, you should first try to configure your router to enable UPnP
                    (or NAT-PMP if you have an AirPort from Apple).
                    If it still fails, or your router doesn't support UPnP, follow the instructions below.
                    If it works, the Subsonic server will at regular intervals (every hour) contact the router and tell it to
                    forward incoming connections (from the internet) to the Subsonic server.
                </p>

                <h4>Manual port forwarding</h4>
                <p>If the automatic option didn't work you can still set it up manually. Consult <a href="http://portforward.com/" target="_blank">portforward.com</a>
                    to get instructions specific to your router. Note that the instructions contain important steps on how to
                    configure a <em>static IP address</em> for your computer. You should follow these. Later in the process, you
                    will find that Subsonic is not on the list of applications, so select the "Default Guide" instead.
                </p>
                <p>
                    When you get to the point where the router asks for <em>private and public ports</em>, enter the port number the
                    Subsonic server is using (normally port 4040) for both values. If asked for a <em>protocol</em>, select TCP.
                </p>

                <p>If you are unsure what any of this means you will probably need to consult someone with network configuration
                    experience.</p>

                <h4>Setting up your personal subsonic.org address</h4>
                <p>Once you get the port forwarding set up correctly, the next step is to get yourself an easy-to-remember web address.
                    You will use this address to access your Subsonic server from the internet.</p>

                <p>From <strong>Settings &gt; Network</strong> you can register your address. (Remember to log on with admin rights).
                    Enable the "Access your server over the internet..." option,
                    and enter your preferred address, for instance http://joe.subsonic.org.</p>

                <p>Click the Save button, and pay attention to the status message that is displayed. Note that Subsonic will also perform
                    a test to ensure that the web address works properly. If the test fails it might be an indication that the port
                    forwarding is not set up correctly.</p>

                <p>If you don't want to use a subsonic.org address you can get similar services from dynamic DNS providers such as dyndns.com.</p>


                <h4>Troubleshooting</h4>
                <p>This section describes some common network problems and how to fix them.</p>
                <ul>
                    <li><strong>Multiple routers.</strong> There might be more than one router on your network, for instance both an "inner"
                        wireless router and an "outer" (closest to the internet) cable/fiber modem with routing enabled. You must
                        make sure that incoming traffic received by the outermost router is forwarded to the inner router (which
                        in turn forwards the traffic on to your Subsonic server).  You can do this by configuring port forwarding on the
                        outer router (forward traffic to the inner router), or setting it in <em>bridge mode</em>. Your ISP should
                        be able to help you if you have problems with this. </li>
                    <li><strong>Port blocked by ISP.</strong> Many ISPs (Internet Service Providers) block incoming traffic on certain ports.
                        Subsonic uses port 4040 by default, which is normally not blocked. It could still be worth trying to run
                        Subsonic on a different port. Open the Subsonic Control Panel by clicking on the Subsonic tray icon.
                        Change the port number to any random number between 1025 and 65,000.  If you set up manual port forwarding
                        (see above), remember to update that as well.</li>
                    <li><strong>Firewall.</strong> You might be running firewall software (on the Subsonic server) which blocks incoming traffic.
                        If this is the case, try first to turn the firewall off. If this helps, turn the firewall back on and configure it
                        to allow incoming traffic to Subsonic. Note: The Windows installer version of Subsonic will automatically
                        configure the built-in Windows Firewall.</li>
                </ul>
            </section>

            <a name="3"></a>
            <section class="box">
                <h3>Registering your license key</h3>
                <p>
                    <span class="image right"><a href="inc/img/gettingstarted/license.png"><img src="inc/img/gettingstarted/license.png" alt=""
                                                                                                class="dropshadow" style="max-height:200px"/></a></span>
                    Most features in Subsonic are free, but some (like mobile phone streaming) require that you upgrade to
                    <a href="premium.jsp">Subsonic Premium</a> after the 30-day free trial. After you receive the license key
                    by email, you must register it on your server as follows:</p>

                <ul>
                    <li>Click the "Get Subsonic Premium" link in the top right corner of the Subsonic web interface.</li>
                    <li>Enter the email address and license key you received by email.</li>
                </ul>
            </section>

            <a name="4"></a>
            <section class="box">
                <h3>Using https</h3>
                <p>For improved security you can turn on https encryption.  On Windows, open the Subsonic Control Panel by clicking
                    on the Subsonic tray icon, then enable https on the specified port (default 443).
                </p>
                <p>On Linux, add <strong>--https-port=4443</strong> (or any other port) to SUBSONIC_ARGS in
                    <strong>/etc/default/subsonic</strong> (Ubuntu/Debian) or <strong>/etc/sysconfig/subsonic</strong> (Fedora/RPM).
                </p>
                <p>On Mac, look for <strong>-Dsubsonic.httpsPort=0</strong> in <strong>/Applications/Subsonic.app/Contents/Info.plist</strong>
                    and change it to the desired port number.</p>
                <p>
                    Note that Subsonic uses a self-signed https certificate by default. This provides encryption but not
                    proper authentication.  To use your own certificate you must put it in a Java keystore, then specify the
                    following Java system properties: <strong>subsonic.ssl.keystore</strong> (path to an alternate SSL keystore), and
                    <strong>subsonic.ssl.password</strong> (password of the alternate SSL keystore). On Windows, you can set these system
                    properties in <strong>C:\Program Files (x86)\Subsonic\booksonic-service.exe.vmoptions</strong>. On Mac, you can
                    add them to <strong>/Applications/Subsonic.app/Contents/Info.plist</strong>.
                </p>
            </section>

        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>