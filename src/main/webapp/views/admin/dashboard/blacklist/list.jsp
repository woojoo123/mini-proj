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
    <title>관리자 - 블랙리스트 관리</title>
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/common.css">
    <link rel="stylesheet" href="<%= contextPath %>/static/css/admin/dashboard/blacklist.css">
</head>
<body>

<%-- 
    <jsp:include page="/WEB-INF/views/admin/dashboard/common/sidebar.jsp"></jsp:include>
 --%>
    <main class="main-content">
        <header class="header">
            <h2>블랙리스트 관리</h2>
            <p>블랙리스트 현황을 확인하고 관리할 수 있습니다.</p>
        </header>

        <section class="stats">
            <div class="stat-card">
                <div class="value">156</div>
                <div class="label">전체 블랙리스트</div>
            </div>
            <div class="stat-card">
                <div class="value">89</div>
                <div class="label">활성</div>
            </div>
            <div class="stat-card">
                <div class="value">67</div>
                <div class="label">만료</div>
            </div>
        </section>

        <section class="card filter-section">
            <h3 class="card-header">블랙리스트 검색 및 필터</h3>
            <div class="basic-search">
                <select class="custom-select" style="width: 120px;">
                    <option value="all">전체</option>
                    <option value="name">이름</option>
                    <option value="username">아이디</option>
                    <option value="email">이메일</option>
                    <option value="ip">IP 주소</option>
                </select>
                <input type="text" class="search-input" placeholder="검색어를 입력하세요.">
            </div>
            <div class="details-search">
                <div class="form-group">
                    <label for="ban-type" class="form-label">차단 유형</label>
                    <select id="ban-type" class="custom-select">
                        <option value="all">전체</option>
                        <option value="permanent">영구 차단</option>
                        <option value="temporary">임시 차단</option>
                        <option value="ip-ban">IP 차단</option>
                        <option value="device-ban">기기 차단</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="ban-status" class="form-label">차단 상태</label>
                    <select id="ban-status" class="custom-select">
                        <option value="all">전체</option>
                        <option value="active">활성</option>
                        <option value="expired">만료</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="ban-reason" class="form-label">차단 사유</label>
                    <select id="ban-reason" class="custom-select">
                        <option value="all">전체</option>
                        <option value="spam">스팸</option>
                        <option value="abuse">욕설/비방</option>
                        <option value="fraud">사기</option>
                        <option value="inappropriate">부적절한 내용</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="ban-date" class="form-label">차단일</label>
                    <select id="ban-date" class="custom-select">
                        <option value="all">전체</option>
                        <option value="today">오늘</option>
                        <option value="week">최근 1주</option>
                        <option value="month">최근 1개월</option>
                    </select>
                </div>
            </div>
            <div class="filter-buttons">
                <button class="btn btn-secondary">초기화</button>
                <button class="btn btn-primary">검색</button>
            </div>
        </section>
        
        <section class="card blacklist-list">
             <div class="blacklist-list-header">
                <h3>블랙리스트 목록</h3>
                <span id="total-blacklist">총 5건의 블랙리스트</span>
            </div>
            <table class="blacklist-table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check-all"></th>
                        <th>대상 회원</th>
                        <th>차단 유형</th>
                        <th>차단 사유</th>
                        <th>차단일</th>
                        <th>만료일</th>
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

        <!-- 블랙리스트 등록 섹션 -->
        <section class="blacklist-registration">
            <h2>+ 블랙리스트 등록</h2>
            
            <div class="registration-form">
                <div class="form-group">
                    <label>대상 회원</label>
                    <input type="text" class="form-input" placeholder="회원명 또는 아이디를 입력하세요">
                </div>

                <div class="form-group">
                    <label>차단 유형</label>
                    <select class="form-select">
                        <option value="">차단 유형 선택</option>
                        <option value="permanent">영구 차단</option>
                        <option value="temporary">임시 차단</option>
                        <option value="ip-ban">IP 차단</option>
                        <option value="device-ban">기기 차단</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>차단 기간</label>
                    <select class="form-select">
                        <option value="">기간 선택</option>
                        <option value="1">1일</option>
                        <option value="7">7일</option>
                        <option value="30">30일</option>
                        <option value="90">90일</option>
                        <option value="permanent">영구</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>차단 사유</label>
                    <select class="form-select">
                        <option value="">차단 사유 선택</option>
                        <option value="spam">스팸</option>
                        <option value="abuse">욕설/비방</option>
                        <option value="fraud">사기</option>
                        <option value="inappropriate">부적절한 내용</option>
                        <option value="other">기타</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>상세 사유</label>
                    <textarea class="form-textarea" placeholder="차단 사유를 상세히 입력하세요"></textarea>
                </div>

                <div class="form-buttons">
                    <button class="btn-cancel" onclick="cancelRegistration()">취소</button>
                    <button class="btn-register" onclick="registerBlacklist()">▲ 블랙리스트 등록</button>
                </div>
            </div>
        </section>
    </main>
    <script src="<%= contextPath %>/static/js/admin/dashboard/blacklist.js"></script>
</body>
</html>
