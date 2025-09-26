<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Navigation Component -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <!-- Logo/Brand -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="보호소 관리 시스템" height="40">
        </a>

        <!-- Mobile Toggle Button -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navigation Menu -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="shelterDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        보호소
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shelter/list">보호소 목록</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shelter/search">보호소 검색</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shelter/register">보호소 등록</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="animalDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        동물
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/animal/list">동물 목록</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/animal/missing">실종 동물</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/animal/rescued">구조 동물</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/adoption/list">입양 가능</a></li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/community/list">커뮤니티</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/volunteer/list">봉사활동</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/donation/index">후원</a>
                </li>
            </ul>

            <!-- User Menu -->
            <ul class="navbar-nav ms-auto">
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <sec:authentication property="name" />님
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/profile">마이페이지</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/follow/animal-list">팔로우 목록</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/notification/list">알림</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <sec:authorize access="hasRole('ROLE_SHELTER_ADMIN')">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/shelter-admin/dashboard">보호소 관리</a></li>
                            </sec:authorize>
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/dashboard">시스템 관리</a></li>
                            </sec:authorize>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/auth/logout">로그아웃</a></li>
                        </ul>
                    </li>
                </sec:authorize>

                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/auth/login">로그인</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/auth/register">회원가입</a>
                    </li>
                </sec:authorize>
            </ul>
        </div>
    </div>
</nav>