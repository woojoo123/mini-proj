<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Meta Tags for All Pages -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<!-- Basic Meta Information -->
<meta name="description" content="${not empty pageDescription ? pageDescription : '전국 보호소 정보와 유기동물 입양, 후원, 봉사활동을 위한 통합 플랫폼'}">
<meta name="keywords" content="보호소, 유기동물, 입양, 후원, 봉사활동, 동물보호, 반려동물, 구조동물">
<meta name="author" content="보호소 관리 시스템">
<meta name="robots" content="index, follow">
<meta name="theme-color" content="#007bff">

<!-- Open Graph Meta Tags for Social Sharing -->
<meta property="og:title" content="${not empty pageTitle ? pageTitle : '보호소 관리 시스템'}">
<meta property="og:description" content="${not empty pageDescription ? pageDescription : '전국 보호소 정보와 유기동물 입양, 후원, 봉사활동을 위한 통합 플랫폼'}">
<meta property="og:image" content="${pageContext.request.contextPath}/resources/images/og-image.jpg">
<meta property="og:url" content="${pageContext.request.scheme}://${pageContext.request.serverName}${pageContext.request.contextPath}${pageContext.request.requestURI}">
<meta property="og:type" content="website">
<meta property="og:site_name" content="보호소 관리 시스템">
<meta property="og:locale" content="ko_KR">

<!-- Twitter Card Meta Tags -->
<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="${not empty pageTitle ? pageTitle : '보호소 관리 시스템'}">
<meta name="twitter:description" content="${not empty pageDescription ? pageDescription : '전국 보호소 정보와 유기동물 입양, 후원, 봉사활동을 위한 통합 플랫폼'}">
<meta name="twitter:image" content="${pageContext.request.contextPath}/resources/images/og-image.jpg">

<!-- Mobile App Meta Tags -->
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="apple-mobile-web-app-title" content="보호소 관리">

<!-- Favicon and App Icons -->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico">
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/resources/images/favicon-16x16.png">
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/resources/images/favicon-32x32.png">
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon.png">

<!-- Web App Manifest -->
<link rel="manifest" href="${pageContext.request.contextPath}/resources/manifest.json">

<!-- CSS Framework and Custom Styles -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">

<!-- Custom Page Styles -->
<c:if test="${not empty customCSS}">
    <c:forEach items="${customCSS}" var="css">
        <link href="${pageContext.request.contextPath}/resources/css/${css}" rel="stylesheet">
    </c:forEach>
</c:if>