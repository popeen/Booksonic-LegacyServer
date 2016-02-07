<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>
<%@ include file="include.jsp" %>

<%--
PARAMETERS
  id: ID of file.
  video: Whether the file is a video (default false).
  playEnabled: Whether to show play button (default true).
  addEnabled: Whether to show add next/last buttons (default true).
  downloadEnabled: Whether to show download button (default false).
  starEnabled: Whether to show star/unstar controls (default false).
  starred: Whether the file is currently starred.
  asTable: Whether to put the images in td tags.
  onPlay: Overrides the javascript used for the play action.
--%>

<c:if test="${param.starEnabled}">
    <c:if test="${param.asTable}"><td class="fit"></c:if>
    <i class="fa ${param.starred ? 'fa-star starred' : 'fa-star-o'} clickable" onclick="toggleStar(${param.id}, this)"></i>
    <c:if test="${param.asTable}"></td></c:if>
</c:if>

<c:if test="${param.asTable}"><td class="fit"></c:if>
<c:if test="${empty param.playEnabled or param.playEnabled}">
    <c:choose>
        <c:when test="${param.video}">
            <sub:url value="/videoPlayer.view" var="videoUrl">
                <sub:param name="id" value="${param.id}"/>
            </sub:url>
            <i class="fa fa-play clickable icon" onclick="parent.frames.main.location.href='${videoUrl}'" title="<fmt:message key="common.play"/>"></i>
        </c:when>
        <c:when test="${not empty param.onPlay}">
            <i class="fa fa-play clickable icon" onclick="${param.onPlay}" title="<fmt:message key="common.play"/>"></i>
        </c:when>
        <c:otherwise>
            <i class="fa fa-play clickable icon" onclick="top.playQueue.onPlay(${param.id})" title="<fmt:message key="common.play"/>"></i>
        </c:otherwise>
    </c:choose>
</c:if>
<c:if test="${param.asTable}"></td></c:if>

<c:if test="${param.asTable}"><td class="fit"></c:if>
<c:if test="${(empty param.addEnabled or param.addEnabled) and not param.video}">
    <i class="fa fa-plus clickable icon" title="<fmt:message key="main.addlast"/>"
       onclick="top.playQueue.onAdd(${param.id}); $().toastmessage('showSuccessToast', '<fmt:message key="main.addlast.toast"/>')"></i>
</c:if>
<c:if test="${param.asTable}"></td></c:if>

<c:if test="${param.asTable}"><td class="fit"></c:if>
<c:if test="${(empty param.addEnabled or param.addEnabled) and not param.video}">
    <i class="fa fa-arrow-right clickable icon" title="<fmt:message key="main.addnext"/>"
       onclick="top.playQueue.onAddNext(${param.id}); $().toastmessage('showSuccessToast', '<fmt:message key="main.addnext.toast"/>')"></i>
</c:if>
<c:if test="${param.asTable}"></td></c:if>

<c:if test="${param.asTable}"><td class="fit"></c:if>
<c:if test="${param.downloadEnabled}">
    <sub:url value="/download.view" var="downloadUrl">
        <sub:param name="id" value="${param.id}"/>
    </sub:url>
    <i class="fa fa-download clickable icon" title="<fmt:message key="common.download"/>" onclick="location.href='${downloadUrl}'"></i>
</c:if>
<c:if test="${param.asTable}"></td></c:if>
