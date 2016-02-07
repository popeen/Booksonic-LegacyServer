<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table style="padding-top:0.3em; padding-bottom:0.25em">
    <tr>
        <c:if test="${fn:length(model.musicFolders) > 1}">
            <td style="padding-right: 2em">

                <i class="fa fa-folder-open-o fa-fw icon"></i>&nbsp;<select name="musicFolderId" onchange="changeMusicFolder(options[selectedIndex].value);" style="margin-right:2em">
                <option value="-1"><fmt:message key="left.allfolders"/></option>
                <c:forEach items="${model.musicFolders}" var="musicFolder">
                    <option ${model.selectedMusicFolder.id == musicFolder.id ? "selected" : ""} value="${musicFolder.id}">${fn:escapeXml(musicFolder.name)}</option>
                </c:forEach>
            </select>
            </td>
        </c:if>

        <c:choose>
            <c:when test="${model.listType eq 'random'}">
                <td><i class="fa fa-plus fa-lg fa-fw icon"></i>&nbsp;<a href="home.view?listType=random"><fmt:message key="common.more"/></a></td>
            </c:when>
            <c:otherwise>
                <sub:url value="home.view" var="previousUrl">
                    <sub:param name="listType" value="${model.listType}"/>
                    <sub:param name="listOffset" value="${model.listOffset - model.listSize}"/>
                    <sub:param name="genre" value="${model.genre}"/>
                    <sub:param name="decade" value="${model.decade}"/>
                </sub:url>
                <sub:url value="home.view" var="nextUrl">
                    <sub:param name="listType" value="${model.listType}"/>
                    <sub:param name="listOffset" value="${model.listOffset + model.listSize}"/>
                    <sub:param name="genre" value="${model.genre}"/>
                    <sub:param name="decade" value="${model.decade}"/>
                </sub:url>

                <c:if test="${model.listOffset gt 0}">
                    <td onclick="location.href='${previousUrl}'"><i class="fa fa-arrow-left fa-lg fa-fw icon clickable"></i></td>
                </c:if>

                <c:if test="${fn:length(model.albums) gt 0}">
                    <td style="padding-left:0.5em; padding-right:0.5em">
                        <fmt:message key="home.albums">
                            <fmt:param value="${model.listOffset + 1}"/>
                            <fmt:param value="${model.listOffset + fn:length(model.albums)}"/>
                        </fmt:message>
                    </td>
                </c:if>

                <c:if test="${fn:length(model.albums) eq model.listSize}">
                    <td onclick="location.href='${nextUrl}'"><i class="fa fa-arrow-right fa-lg fa-fw icon clickable"></i></td>
                </c:if>

                <c:if test="${model.listType eq 'decade'}">
                    <td style="padding-left: 2em">
                        <fmt:message key="home.decade.text"/>
                    </td>
                    <td>
                        <select name="decade" onchange="location='home.view?listType=${model.listType}&amp;decade=' + options[selectedIndex].value">
                            <c:forEach items="${model.decades}" var="decade">
                                <option
                                ${decade eq model.decade ? "selected" : ""} value="${decade}">${decade}</option>
                            </c:forEach>
                        </select>
                    </td>
                </c:if>
                <c:if test="${model.listType eq 'genre'}">
                    <td style="padding-left: 2em">
                        <fmt:message key="home.genre.text"/>
                    </td>
                    <td>
                        <select name="genre" onchange="location='home.view?listType=${model.listType}&amp;genre=' + encodeURIComponent(options[selectedIndex].value)">
                            <c:forEach items="${model.genres}" var="genre">
                                <option ${genre.name eq model.genre ? "selected" : ""} value="${genre.name}">${genre.name} (${genre.albumCount})</option>
                            </c:forEach>
                        </select>
                    </td>
                </c:if>
            </c:otherwise>
        </c:choose>
    </tr>
</table>