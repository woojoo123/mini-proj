<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    String contextPath = request.getContextPath();
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 회원 관리</title>
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/common.css">
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/dashboard/userManagement.css">
</head>
<body>
<%-- 
    <jsp:include page="/WEB-INF/views/admin/dashboard/common/sidebar.jsp"></jsp:include>
 --%>
    <main class="main-content">
        <header class="header">
            <h2>회원 관리</h2>
            <p>회원 현황을 확인하고 회원을 관리할 수 있습니다.</p>
        </header>

        <section class="stats">
            <div class="stat-card">
                <div class="value">2,847</div>
                <div class="label">전체 회원</div>
            </div>
            <div class="stat-card">
                <div class="value">156</div>
                <div class="label">신규 회원</div>
            </div>
            <div class="stat-card">
                <div class="value">23</div>
                <div class="label">제재 회원</div>
            </div>
        </section>

        <section class="card filter-section">
            <h3 class="card-header">회원 검색 및 필터</h3>
            <div class="basic-search form-group">
                <select class="custom-select" style="width: 120px;">
                    <option value="all">전체</option>
                    <option value="name">이름</option>
                    <option value="email">이메일</option>
                </select>
                <input type="text" class="search-input" placeholder="검색어를 입력하세요.">
            </div>
            <div class="details-search">
                <div class="form-group">
                    <label for="user-type" class="form-label">계정 유형</label>
                    <select id="user-type" class="custom-select">
                        <option value="all">전체</option>
                        <option value="general">일반회원</option>
                        <option value="shelter">보호소</option>
                        <option value="admin">관리자</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="user-status" class="form-label">계정 상태</label>
                    <select id="user-status" class="custom-select">
                        <option value="all">전체</option>
                        <option value="active">활성</option>
                        <option value="suspended">제재</option>
                        <option value="dormant">휴면</option>
                        <option value="withdrawn">탈퇴</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="last-login" class="form-label">최근 로그인</label>
                    <select id="last-login" class="custom-select">
                        <option value="all">전체</option>
                        <option value="today">오늘</option>
                        <option value="week">1주일 이내</option>
                        <option value="month">1개월 이내</option>
                    </select>
                </div>
                <div class="form-group date-range">
                    <label for="join-date" class="form-label">가입일 범위</label>
                     <input type="date" id="join-date-start"> ~ <input type="date" id="join-date-end">
                </div>
            </div>
            <div class="filter-buttons">
                <button class="btn btn-secondary">초기화</button>
                <button class="btn btn-primary">검색</button>
            </div>
        </section>
        
        <section class="card member-list">
             <div class="member-list-header">
                <h3>회원 목록</h3>
                <span id="total-members">총 2,847명</span>
            </div>
            <table class="member-table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check-all"></th>
                        <th>회원 정보</th>
                        <th>유형</th>
                        <th>상태</th>
                        <th>가입일</th>
                        <th>최근 로그인</th>
                        <th>활동 현황</th>
                        <th>신고/제재</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    </tbody>
            </table>
            
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">&raquo;</a>
            </div>
        </section>
    </main>
-
    <script src="<%= contextPath %>/static/js/admin/dashboard/userManagement.js"></script>

</body>
</html>