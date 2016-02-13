<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>

<html>
<head>
    <%@ include file="head.jsp" %>
</head>

<body>

<div>
    <%--<audio id="demo" controls src="stream?player=2&id=1100&auth=853310180" style="width:600px"></audio>--%>
    <audio id="demo" controls src="stream?player=2&id=6940&auth=293331382" style="width:600px"></audio>
    <div>
        <button onclick="player.play()">Play the Audio</button>
        <button onclick="player.pause()">Pause the Audio</button>
        <button onclick="player.volume+=0.1">Increase Volume</button>
        <button onclick="player.volume-=0.1">Decrease Volume</button>
    </div>
</div>

<script>

    var player = document.getElementById("demo");
</script>
</body>
</html>