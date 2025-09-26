<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle} - 시스템 관리자</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />

    <!-- Page specific CSS -->
    <c:if test="${not empty pageCss}">
        <link rel="stylesheet" href="${contextPath}/assets/css/pages/${pageCss}.css">
    </c:if>

    <!-- Additional CSS -->
    <c:if test="${not empty additionalCss}">
        ${additionalCss}
    </c:if>
</head>
<body class="admin-layout">
    <!-- Admin Header -->
    <header class="admin-header">
        <div class="admin-header-content">
            <h1 class="admin-title">시스템 관리자</h1>
            <div class="admin-user-info">
                <span>환영합니다, ${sessionScope.user.name}님</span>
                <a href="${contextPath}/auth/logout" class="logout-btn">로그아웃</a>
            </div>
        </div>
    </header>

    <div class="admin-container">
        <!-- Admin Sidebar -->
        <nav class="admin-sidebar">
            <ul class="admin-menu">
                <li><a href="${contextPath}/admin/dashboard" class="menu-item">대시보드</a></li>
                <li class="menu-group">
                    <span class="menu-group-title">사용자 관리</span>
                    <ul>
                        <li><a href="${contextPath}/admin/users/list">사용자 목록</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">보호소 관리</span>
                    <ul>
                        <li><a href="${contextPath}/admin/shelters/list">보호소 목록</a></li>
                        <li><a href="${contextPath}/admin/shelters/approval">보호소 승인</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">동물 관리</span>
                    <ul>
                        <li><a href="${contextPath}/admin/animals/list">동물 목록</a></li>
                        <li><a href="${contextPath}/admin/animals/statistics">통계</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">신고 처리</span>
                    <ul>
                        <li><a href="${contextPath}/admin/reports/list">신고 목록</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">공지사항</span>
                    <ul>
                        <li><a href="${contextPath}/admin/notices/list">공지 목록</a></li>
                        <li><a href="${contextPath}/admin/notices/write">공지 작성</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">시스템 설정</span>
                    <ul>
                        <li><a href="${contextPath}/admin/system/settings">시스템 설정</a></li>
                        <li><a href="${contextPath}/admin/system/logs">로그 조회</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <!-- Admin Content -->
        <main class="admin-content">
            <jsp:include page="${contentPage}" />
        </main>
    </div>

    <!-- Common JavaScript -->
    <script src="${contextPath}/assets/js/vendor/jquery.min.js"></script>
    <script src="${contextPath}/assets/js/common/utils.js"></script>
    <script src="${contextPath}/assets/js/common/components.js"></script>

    <!-- Page specific JavaScript -->
    <c:if test="${not empty pageJs}">
        <script src="${contextPath}/assets/js/pages/${pageJs}.js"></script>
    </c:if>

    <!-- Additional JavaScript -->
    <c:if test="${not empty additionalJs}">
        ${additionalJs}
    </c:if>
</body>
</html>