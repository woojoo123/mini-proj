<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 - 보호소 관리</title>
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/common.css">
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/dashboard/shelter.css">
</head>
<body>

    <jsp:include page="<%= contextPath %>/admin/dashboard/common/sidebar.jsp"></jsp:include>

    <main class="main-content">
        <header class="header">
            <h2>보호소 관리</h2>
            <p>등록된 보호소를 관리하고 승인 처리를 진행할 수 있습니다.</p>
        </header>

        <section class="stats">
            <div class="stat-card"><div class="value">156</div><div class="label">전체 보호소</div></div>
            <div class="stat-card"><div class="value">12</div><div class="label">승인 대기</div></div>
            <div class="stat-card"><div class="value">118</div><div class="label">승인 완료</div></div>
            <div class="stat-card"><div class="value">26</div><div class="label">승인 거부</div></div>
        </section>

        <section class="card filter-section">
            <h3 class="card-header">검색 및 필터</h3>
            <div class="basic-search form-group">
                <select class="custom-select" style="width: 140px;">
                    <option value="all">전체</option>
                    <option value="name">보호소명</option>
                    <option value="region">지역</option>
                </select>
                <input type="text" class="search-input" placeholder="검색어를 입력하세요.">
            </div>
            <div class="filter-grid">
                <div class="form-group">
                    <label class="form-label">승인 상태</label>
                    <select class="custom-select">
                        <option>전체</option>
                        <option>승인 대기</option>
                        <option>승인 완료</option>
                        <option>승인 거부</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">지역</label>
                    <select class="custom-select">
                        <option>전체 지역</option>
                        <option>서울</option>
                        <option>경기</option>
                        <option>인천</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">보호소 종류</label>
                    <select class="custom-select">
                        <option>전체</option>
                        <option>대형견 전문</option>
                        <option>소형견 전문</option>
                        <option>종합 보호소</option>
                    </select>
                </div>
            </div>
            <div class="filter-buttons">
                <button class="btn btn-secondary">초기화</button>
                <button class="btn btn-primary">검색</button>
            </div>
        </section>

        <section class="card shelter-list">
            <div class="shelter-list-header">
                <h3>보호소 목록</h3>
                <span class="total-count">총 156개의 보호소</span>
            </div>
            <table class="shelter-table">
                <thead>
                    <tr>
                        <th>보호소 정보</th>
                        <th>위치</th>
                        <th>연락처</th>
                        <th>보호 동물</th>
                        <th>등록일</th>
                        <th>상태</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>

            <div class="pagination">
                <a href="#">이전</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">다음</a>
            </div>
        </section>
    </main>
    <script src="<%= contextPath %>/static/js/admin/dashboard/shelter.js"></script>

</body>
</html>
