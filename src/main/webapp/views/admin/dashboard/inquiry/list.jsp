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
    <title>관리자 - 고객 문의 관리</title>
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/common.css?after">
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/dashboard/userInquiry.css?after">
</head>
<body>

<%-- 
    <jsp:include page="/WEB-INF/views/admin/dashboard/common/sidebar.jsp"></jsp:include>
 --%>
    <main class="main-content">
        <header class="header">
            <h2>고객 문의 관리</h2>
            <p>고객 문의 및 메모 현황을 관리할 수 있습니다.</p>
        </header>

        <section class="stats">
            <div class="stat-card">
                <div class="value">342</div>
                <div class="label">전체 문의</div>
            </div>
            <div class="stat-card">
                <div class="value high-priority">45</div>
                <div class="label">높은 우선순위</div>
            </div>
            <div class="stat-card">
                <div class="value">89</div>
                <div class="label">비공개 문의</div>
            </div>
            <div class="stat-card">
                <div class="value">156</div>
                <div class="label">이번 달 작성</div>
            </div>
        </section>

        <section class="card filter-section">
            <h3 class="card-header">고객 문의 검색 및 필터</h3>
            <div class="basic-search form-group">
                <select class="custom-select" style="width: 120px;">
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="member">회원</option>
                </select>
                <input type="text" class="search-input" placeholder="Q 검색어를 입력하세요...">
            </div>
            <div class="details-search">
                <div class="form-group">
                    <label for="category" class="form-label">카테고리</label>
                    <select id="category" class="custom-select">
                        <option value="all">전체</option>
                        <option value="adoption">입양 상담</option>
                        <option value="certification">인증 관리</option>
                        <option value="report">신고 처리</option>
                        <option value="account">계정 관리</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="priority" class="form-label">우선순위</label>
                    <select id="priority" class="custom-select">
                        <option value="all">전체</option>
                        <option value="high">높음</option>
                        <option value="medium">중간</option>
                        <option value="low">낮음</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="author" class="form-label">작성자</label>
                    <select id="author" class="custom-select">
                        <option value="all">전체</option>
                        <option value="admin">관리자</option>
                        <option value="system">시스템</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="public-status" class="form-label">공개 여부</label>
                    <select id="public-status" class="custom-select">
                        <option value="all">전체</option>
                        <option value="public">공개</option>
                        <option value="private">비공개</option>
                    </select>
                </div>
            </div>
            <div class="filter-buttons">
                <button class="btn btn-secondary">초기화</button>
                <button class="btn btn-primary">검색</button>
            </div>
        </section>
        
        <section class="card memo-list">
             <div class="memo-list-header">
                <h3>메모 목록</h3>
                <div>
                    <span class="total-count">총 5개의 메모</span>
                    <div class="bulk-actions">
                        <button class="btn btn-secondary btn-small">카테고리 변경</button>
                        <button class="btn btn-secondary btn-small">우선순위 변경</button>
                        <button class="btn btn-secondary btn-small">일괄 삭제</button>
                        <button class="btn btn-secondary btn-small">일괄 내보내기</button>
                    </div>
                </div>
            </div>
            <table class="memo-table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check-all" class="checkbox-select-all"></th>
                        <th>대상 회원</th>
                        <th>메모 제목</th>
                        <th>카테고리</th>
                        <th>우선순위</th>
                        <th>작성일</th>
                        <th>작성자</th>
                        <th>공개 여부</th>
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
            <button type="button" id="myButton">전송</button>
        </section>
    </main>

    <script src="<%= contextPath %>/static/js/admin/dashboard/user-inquiry.js"></script>
</body>
</html>
