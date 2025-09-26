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
    <title>관리자 - 이용자 제재</title>
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/common.css">
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/dashboard/userSanction.css">
</head>
<body>
<%-- 
    <jsp:include page="/WEB-INF/views/admin/dashboard/common/sidebar.jsp"></jsp:include>
 --%>
    <main class="main-content">
        <header class="header">
            <h2>이용자 제재</h2>
            <p>이용자 제재 현황을 확인하고 관리할 수 있습니다.</p>
        </header>

        <section class="stats">
            <div class="stat-card">
                <div class="value">234</div>
                <div class="label">전체 제재</div>
            </div>
            <div class="stat-card">
                <div class="value">45</div>
                <div class="label">진행 중</div>
            </div>
            <div class="stat-card">
                <div class="value">189</div>
                <div class="label">완료</div>
            </div>
        </section>

        <section class="card filter-section">
            <h3 class="card-header">제재 검색 및 필터</h3>
            <div class="basic-search">
                <select class="custom-select" style="width: 120px;">
                    <option value="all">전체</option>
                    <option value="name">이름</option>
                    <option value="username">아이디</option>
                    <option value="email">이메일</option>
                </select>
                <input type="text" class="search-input" placeholder="검색어를 입력하세요.">
            </div>
            <div class="details-search">
                <div class="form-group">
                    <label for="sanction-type" class="form-label">제재 유형</label>
                    <select id="sanction-type" class="custom-select">
                        <option value="all">전체</option>
                        <option value="post-restriction">게시 제한</option>
                        <option value="comment-restriction">댓글 제한</option>
                        <option value="account-suspension">계정 정지</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="sanction-status" class="form-label">제재 상태</label>
                    <select id="sanction-status" class="custom-select">
                        <option value="all">전체</option>
                        <option value="in-progress">진행 중</option>
                        <option value="completed">완료</option>
                        <option value="cancelled">취소</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="sanction-period" class="form-label">제재 기간</label>
                    <select id="sanction-period" class="custom-select">
                        <option value="all">전체</option>
                        <option value="1">1일</option>
                        <option value="3">3일</option>
                        <option value="7">7일</option>
                        <option value="14">14일</option>
                        <option value="30">30일</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="registration-date" class="form-label">등록일</label>
                    <select id="registration-date" class="custom-select">
                        <option value="all">전체</option>
                        <option value="week">최근 1주</option>
                        <option value="month">최근 1개월</option>
                        <option value="quarter">최근 3개월</option>
                    </select>
                </div>
            </div>
            <div class="filter-buttons">
                <button class="btn btn-secondary">초기화</button>
                <button class="btn btn-primary">검색</button>
            </div>
        </section>
        
        <section class="card sanction-list">
             <div class="sanction-list-header">
                <h3>제재 목록</h3>
                <span id="total-sanctions">총 3건의 제재</span>
            </div>
            <table class="sanction-table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check-all"></th>
                        <th>대상 회원</th>
                        <th>제재 유형</th>
                        <th>제재 사유</th>
                        <th>기간</th>
                        <th>시작일</th>
                        <th>종료일</th>
                        <th>상태</th>
                        <th>등록자</th>
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
                <a href="#">&raquo;</a>
            </div>
        </section>

        <!-- 제재 등록 섹션 (선택 시 표시) -->
        <section class="sanction-registration" id="sanctionRegistration" style="display: none;">
            <h2>+ 제재 등록 (<span id="selectedCount">0</span>건 선택됨)</h2>
            
            <div class="selected-members">
                <h3>선택된 제재 대상</h3>
                <div id="selectedMembersList" class="selected-tags"></div>
            </div>

            <div class="registration-form">
                <div class="form-group">
                    <label>제재 유형</label>
                    <select id="sanctionType" class="form-select">
                        <option value="">제재 유형 선택</option>
                        <option value="post-restriction">게시 제한</option>
                        <option value="comment-restriction">댓글 제한</option>
                        <option value="account-suspension">계정 정지</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>제재 기간</label>
                    <select id="sanctionDuration" class="form-select">
                        <option value="">기간 선택</option>
                        <option value="1">1일</option>
                        <option value="3">3일</option>
                        <option value="7">7일</option>
                        <option value="14">14일</option>
                        <option value="30">30일</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>제재 코드</label>
                    <select id="sanctionCode" class="form-select">
                        <option value="">제재 코드 선택</option>
                        <option value="REP-001">REP-001</option>
                        <option value="REP-002">REP-002</option>
                        <option value="REP-003">REP-003</option>
                        <option value="REP-004">REP-004</option>
                        <option value="REP-005">REP-005</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>제재 사유</label>
                    <textarea id="sanctionReason" class="form-textarea" placeholder="제재 사유를 상세히 입력하세요"></textarea>
                </div>

                <div class="form-buttons">
                    <button class="btn-cancel" onclick="cancelRegistration()">취소</button>
                    <button class="btn-register" onclick="registerSanction()">▲ 제재 등록</button>
                </div>
            </div>
        </section>
    </main>
    <script src="<%= contextPath %>/static/js/admin/dashboard/userSanction.js"></script>
</body>
</html>
