<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="iso-8859-1"%>
<%@ include file="include.jsp" %>

<%--
Creates HTML for displaying the rating stars.
PARAMETERS
  id: Album ID. May be null if readonly.
  readonly: Whether rating can be changed.
  rating: The rating, an integer from 0 (no rating), through 10 (lowest rating), to 50 (highest rating).
--%>

<c:forEach var="i" begin="1" end="5">

    <sub:url value="setRating.view" var="ratingUrl">
        <sub:param name="id" value="${param.id}"/>
        <sub:param name="action" value="rating"/>
        <sub:param name="rating" value="${i}"/>
    </sub:url>

    <c:choose>
        <c:when test="${param.rating ge i * 10}">
            <c:set var="icon" value="fa-star starred"/>
        </c:when>
        <c:when test="${param.rating ge i*10 - 7 and param.rating le i*10 - 3}">
            <c:set var="icon" value="fa-star-half-o starred"/>
        </c:when>
        <c:otherwise>
            <c:set var="icon" value="fa-star-o"/>
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${param.readonly}">
            <i class="fa ${icon} clickable" title="<fmt:message key="rating.rating"/> ${param.rating/10}"></i>
        </c:when>
        <c:otherwise>
            <i class="fa ${icon} clickable" title="<fmt:message key="rating.rating"/> ${param.rating/10}"
               style="margin-right:-2px" onclick="location.href='${ratingUrl}'"></i>
        </c:otherwise>
    </c:choose>

</c:forEach>

<sub:url value="setRating.view" var="clearRatingUrl">
    <sub:param name="id" value="${param.id}"/>
    <sub:param name="action" value="rating"/>
    <sub:param name="rating" value="0"/>
</sub:url>

<c:if test="${not param.readonly}">
    &nbsp;| <i class="fa fa-remove clickable" title="<fmt:message key="rating.clearrating"/>" onclick="location.href='${clearRatingUrl}'"></i>

</c:if>
