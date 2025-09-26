<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle} - 보호소 관리</title>
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
<body class="shelter-admin-layout">
    <!-- Shelter Admin Header -->
    <header class="shelter-admin-header">
        <div class="shelter-admin-header-content">
            <h1 class="shelter-admin-title">${sessionScope.shelter.name} 관리</h1>
            <div class="shelter-admin-user-info">
                <span>환영합니다, ${sessionScope.user.name}님 (${sessionScope.user.shelterRole})</span>
                <a href="${contextPath}/auth/logout" class="logout-btn">로그아웃</a>
            </div>
        </div>
    </header>

    <div class="shelter-admin-container">
        <!-- Shelter Admin Sidebar -->
        <nav class="shelter-admin-sidebar">
            <ul class="shelter-admin-menu">
                <li><a href="${contextPath}/shelter-admin/dashboard" class="menu-item">대시보드</a></li>
                <li class="menu-group">
                    <span class="menu-group-title">동물 관리</span>
                    <ul>
                        <li><a href="${contextPath}/shelter-admin/animals/list">동물 목록</a></li>
                        <li><a href="${contextPath}/shelter-admin/animals/register">동물 등록</a></li>
                        <li><a href="${contextPath}/shelter-admin/animals/blog-manage">블로그 관리</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">입양 관리</span>
                    <ul>
                        <li><a href="${contextPath}/shelter-admin/adoption/applications">입양 신청서</a></li>
                        <li><a href="${contextPath}/shelter-admin/adoption/process">입양 처리</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">봉사자 관리</span>
                    <ul>
                        <li><a href="${contextPath}/shelter-admin/volunteer/schedule-manage">일정 관리</a></li>
                        <li><a href="${contextPath}/shelter-admin/volunteer/applicants">신청자 관리</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">후원 관리</span>
                    <ul>
                        <li><a href="${contextPath}/shelter-admin/donation/donors">후원자 관리</a></li>
                        <li><a href="${contextPath}/shelter-admin/donation/statistics">후원 통계</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">멤버 관리</span>
                    <ul>
                        <li><a href="${contextPath}/shelter-admin/members/list">멤버 목록</a></li>
                        <li><a href="${contextPath}/shelter-admin/members/invite">멤버 초대</a></li>
                        <li><a href="${contextPath}/shelter-admin/members/role-manage">역할 관리</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">콘텐츠 관리</span>
                    <ul>
                        <li><a href="${contextPath}/shelter-admin/content/activities">활동 내역</a></li>
                        <li><a href="${contextPath}/shelter-admin/content/news">소식 관리</a></li>
                    </ul>
                </li>
                <li class="menu-group">
                    <span class="menu-group-title">보호소 설정</span>
                    <ul>
                        <li><a href="${contextPath}/shelter-admin/profile/settings">보호소 설정</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <!-- Shelter Admin Content -->
        <main class="shelter-admin-content">
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