<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1" %>
<%@ include file="include.jsp" %>
<c:if test="${toast}">
    <script type="text/javascript">
        $(document).ready(function () {
            $().toastmessage("showSuccessToast", "<fmt:message key="common.settingssaved"/>");
        });
    </script>
</c:if>

<c:choose>
    <c:when test="${empty user or user.adminRole}">
        <c:set var="categories" value="musicFolder general advanced personal user player network share dlna sonos transcoding podcast"/>
    </c:when>
    <c:otherwise>
        <c:set var="categories" value="personal password player share premium"/>
    </c:otherwise>
</c:choose>
<h1><i class="fa fa-cog fa-lg icon"></i>&nbsp;&nbsp;<fmt:message key="settingsheader.title"/></h1>

<h2>
<c:forTokens items="${categories}" delims=" " var="cat" varStatus="loopStatus">
    <c:choose>
        <c:when test="${loopStatus.count > 1 and  (loopStatus.count - 1) % 8 != 0}">&nbsp;|&nbsp;</c:when>
        <c:otherwise></h2><h2></c:otherwise>
    </c:choose>

    <c:url var="url" value="${cat}Settings.view?"/>

    <c:choose>
        <c:when test="${category eq cat}">
            <span class="headerSelected"><fmt:message key="settingsheader.${cat}"/></span>
        </c:when>
        <c:otherwise>
            <span class="header"><a href="${url}"><fmt:message key="settingsheader.${cat}"/></a></span>
        </c:otherwise>
    </c:choose>

</c:forTokens>
</h2>

<p></p>
