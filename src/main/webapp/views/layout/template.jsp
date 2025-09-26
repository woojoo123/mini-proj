<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle} - 보호소 관리 시스템</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <link rel="stylesheet" href="${contextPath}/assets/css/pages/home/home.css">

    <!-- Page specific CSS -->
    <c:if test="${not empty pageCss}">
        <link rel="stylesheet" href="${contextPath}/${pageCss}">
    </c:if>

    <!-- Additional CSS -->
    <c:if test="${not empty additionalCss}">
        <style>${additionalCss}</style>
    </c:if>
</head>
<body>

<c:forEach var="contentPage" items="${contentPages}">
    <c:import url="${contentPage}" />
</c:forEach>

</body>
</html>
