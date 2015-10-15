<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>
<!DOCTYPE HTML>
<html>
<%@ include file="head.jsp" %>

<body onload="setTimeout('redirect()', 1500);">
<!-- Google Code for Download Conversion Page -->
<script type="text/javascript">
    /* <![CDATA[ */
    var google_conversion_id = 1068027807;
    var google_conversion_language = "en";
    var google_conversion_format = "3";
    var google_conversion_color = "ffffff";
    var google_conversion_label = "REx2CIW81AEQn5-j_QM";
    var google_conversion_value = 0;
    /* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1068027807/?label=REx2CIW81AEQn5-j_QM&amp;guid=ON&amp;script=0"/>
    </div>
</noscript>

<script type="text/javascript">
    function redirect() {
        window.location = "http://subsonic.org/download/<%=request.getParameter("target")%>";
    }
</script>

<c:import url="header.jsp"/>

<section id="main" class="container">
    <header>
        <h2>Thank you for downloading Subsonic</h2>
        <p>
            <a href="http://subsonic.org/download/<%=request.getParameter("target")%>"><%=request.getParameter("target")%></a>
            is now being downloaded to your computer.
            <br>
            In the mean time, please check out the <a href="installation.jsp">installation instructions</a>.
        </p>
    </header>
</section>

<%@ include file="footer.jsp" %>
</body>
</html>