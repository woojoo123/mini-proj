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
    <title>관리자 - 신고 관리</title>
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/common.css">
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/dashboard/report.css">
</head>
<body>
<%-- 
    <jsp:include page="/WEB-INF/views/admin/dashboard/common/sidebar.jsp"></jsp:include>
 --%>
    <main class="main-content">
        <header class="header">
            <h2>신고 관리</h2>
            <p>접수된 신고를 검토하고 처리할 수 있습니다.</p>
        </header>

        <section class="stats">
            <div class="stat-card"><div class="value">847</div><div class="label">전체 신고</div></div>
            <div class="stat-card"><div class="value">56</div><div class="label">처리 대기</div></div>
            <div class="stat-card"><div class="value">23</div><div class="label">처리 완료</div></div>
            <div class="stat-card"><div class="value">768</div><div class="label">처리 반려</div></div>
        </section>

        <section class="card filter-section">
            <h3 class="card-header">신고 필터링</h3>
            <div class="filter-grid">
                <div><label class="form-label">신고 유형</label><select class="custom-select"><option>전체</option></select></div>
                <div><label class="form-label">처리 상태</label><select class="custom-select"><option>전체</option></select></div>
                <div><label class="form-label">우선순위</label><select class="custom-select"><option>전체</option></select></div>
                <div><label class="form-label">신고 대상</label><select class="custom-select"><option>전체</option></select></div>
            </div>
            <div class="detail-search-grid">
                <div class="search-group">
                    <label class="form-label">신고자 검색</label>
                    <div class="search-bar">
                        <select class="custom-select"><option>전체</option></select>
                        <input type="text" class="search-input" placeholder="신고자 검색">
                    </div>
                </div>
                <div class="search-group">
                    <label class="form-label">피신고자 검색</label>
                    <div class="search-bar">
                        <select class="custom-select"><option>전체</option></select>
                        <input type="text" class="search-input" placeholder="피신고자 검색">
                    </div>
                </div>
            </div>
            <div class="filter-buttons">
                <button class="btn btn-secondary">초기화</button>
                <button class="btn btn-primary">검색</button>
            </div>
        </section>
        
        <section class="card report-list">
             <div class="list-header">
                <h3>신고 목록</h3>
                <div class="list-header-right">
                    <span class="total-count">총 5건의 신고</span>
                    <div class="bulk-actions">
                        <span class="selected-count">선택된 항목: <span id="selectedCount">0</span>건</span>
                        <button class="btn btn-danger" id="bulkSanctionBtn" disabled>일괄 제재</button>
                    </div>
                </div>
            </div>
            <table class="report-table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="selectAll" class="checkbox-select-all"></th>
                        <th>신고일시</th>
                        <th>신고자</th>
                        <th>피신고자</th>
                        <th>신고 유형</th>
                        <th style="width: 30%;">신고 내용</th>
                        <th>상태</th>
                        <th>우선순위</th>
                        <th>조치사항</th>
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
    </main>

    <!-- 제재 모달창 -->
    <div id="sanctionModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h3>일괄 제재</h3>
                <span class="close" id="closeModal">&times;</span>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="form-label">제재 유형</label>
                    <select id="sanctionType" class="custom-select">
                        <option value="">제재 유형을 선택하세요</option>
                        <option value="warning">경고</option>
                        <option value="post_restriction">게시제한</option>
                        <option value="comment_restriction">댓글제한</option>
                        <option value="account_suspension">계정 정지</option>
                        <option value="permanent_ban">영구정지</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label">제재 기간</label>
                    <select id="sanctionPeriod" class="custom-select">
                        <option value="">제재 기간을 선택하세요</option>
                        <option value="1">1일</option>
                        <option value="3">3일</option>
                        <option value="7">7일</option>
                        <option value="14">14일</option>
                        <option value="30">30일</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label class="form-label">제재 사유</label>
                    <textarea id="sanctionReason" class="form-textarea" placeholder="제재 사유를 입력하세요" rows="4"></textarea>
                </div>
                
                <div class="selected-targets">
                    <label class="form-label">제재 대상</label>
                    <div id="selectedTargetsList" class="targets-list"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary" id="cancelSanction">취소</button>
                <button class="btn btn-danger" id="confirmSanction">제재 실행</button>
            </div>
        </div>
    </div>
    <script src="<%= contextPath %>/static/js/admin/dashboard/report.js"></script>
</body>
</html>