<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Controller에서 전달될 데이터를 시뮬레이션하기 위한 더미 데이터
    // 실제 환경에서는 이 코드는 Controller에 위치해야 합니다.
    java.util.List<java.util.Map<String, Object>> memberList = new java.util.ArrayList<>();

    // 더미 데이터 1
    java.util.Map<String, Object> member1 = new java.util.HashMap<>();
    member1.put("id", "user01");
    member1.put("nickname", "행복한냥이");
    member1.put("email", "catlover@example.com");
    member1.put("joinDate", "2025-09-01");
    member1.put("accountType", "보호소");
    member1.put("status", "활성");
    member1.put("lastLogin", "2025-09-24 11:30");
    member1.put("postCount", 15);
    member1.put("commentCount", 120);
    member1.put("reportCount", 0);
    member1.put("hasSanction", false);
    memberList.add(member1);

    // 더미 데이터 2
    java.util.Map<String, Object> member2 = new java.util.HashMap<>();
    member2.put("id", "admin");
    member2.put("nickname", "관리자");
    member2.put("email", "admin@platform.com");
    member2.put("joinDate", "2024-01-15");
    member2.put("accountType", "관리자");
    member2.put("status", "활성");
    member2.put("lastLogin", "2025-09-24 14:55");
    member2.put("postCount", 5);
    member2.put("commentCount", 88);
    member2.put("reportCount", 0);
    member2.put("hasSanction", false);
    memberList.add(member2);

    // 더미 데이터 3
    java.util.Map<String, Object> member3 = new java.util.HashMap<>();
    member3.put("id", "baduser99");
    member3.put("nickname", "스팸마스터");
    member3.put("email", "spam@bad.net");
    member3.put("joinDate", "2025-08-20");
    member3.put("accountType", "일반");
    member3.put("status", "제재됨");
    member3.put("lastLogin", "2025-09-20 18:00");
    member3.put("postCount", 210);
    member3.put("commentCount", 5);
    member3.put("reportCount", 12);
    member3.put("hasSanction", true);
    memberList.add(member3);

    // 더미 데이터 4
    java.util.Map<String, Object> member4 = new java.util.HashMap<>();
    member4.put("id", "angel1004");
    member4.put("nickname", "천사집사");
    member4.put("email", "angel@good.com");
    member4.put("joinDate", "2024-11-11");
    member4.put("accountType", "일반");
    member4.put("status", "휴면");
    member4.put("lastLogin", "2025-03-10 09:15");
    member4.put("postCount", 3);
    member4.put("commentCount", 25);
    member4.put("reportCount", 0);
    member4.put("hasSanction", false);
    memberList.add(member4);
    
    request.setAttribute("memberList", memberList);
    request.setAttribute("totalMembers", 123); // 총 회원 수 예시
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        :root {
            /* 신규 컬러 테마 */
            --bg-main: #F9F9F9;
            --bg-card: #FFFFFF;
            --bg-table-header: #FFF8EA;
            --bg-subtle: #F1DEC9;

            --text-primary: #3C2A21;
            --text-secondary: #777777;
            --text-disabled: #666666;
            --text-on-highlight: #FFFFFF;
            --text-black: #000000;

            --border-color: #F1DEC9;
            --highlight-primary: #8D7B68;
            --highlight-secondary: #A4907C;

            /* 상태별 색상 */
            --status-active: #28a745;
            --status-dormant: #ffc107;
            --status-banned: #dc3545;
            --status-withdrawn: #6c757d;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: var(--bg-main);
            color: var(--text-primary);
            margin: 0;
            padding: 24px;
        }

        .member-container {
            max-width: 1400px;
            margin: 0 auto;
        }

        h1 {
            font-size: 28px;
            font-weight: 700;
            color: var(--text-black);
            margin-bottom: 24px;
        }

        /* 필터링 및 검색 영역 */
        .filter-box {
            background-color: var(--bg-card);
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            margin-bottom: 24px;
        }

        .filter-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
        }

        .filter-group label {
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
            color: var(--text-secondary);
        }

        .input-group {
            display: flex;
        }

        .filter-group select,
        .filter-group input[type="text"],
        .filter-group input[type="date"],
        .filter-group input[type="number"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            background-color: #fff;
            font-size: 14px;
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        
        .input-group select {
            flex-shrink: 0;
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
            border-right: none;
        }
        .input-group input[type="text"] {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
        }

        .date-range-group {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .date-range-group input {
            flex: 1;
        }

        .filter-group select:focus,
        .filter-group input:focus {
            outline: none;
            border-color: var(--highlight-secondary);
            box-shadow: 0 0 0 3px rgba(164, 144, 124, 0.2);
        }

        .filter-actions {
            grid-column: 1 / -1; /* 그리드의 모든 열을 차지하도록 설정 */
            display: flex;
            justify-content: flex-end;
            gap: 12px;
            margin-top: 16px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
        }

        .btn-primary {
            background-color: var(--highlight-primary);
            color: var(--text-on-highlight);
        }
        .btn-primary:hover {
            background-color: var(--highlight-secondary);
        }

        .btn-secondary {
            background-color: var(--bg-card);
            color: var(--text-secondary);
            border: 1px solid var(--border-color);
        }
        .btn-secondary:hover {
            background-color: var(--bg-main);
        }
        
        /* 회원 목록 테이블 */
        .member-list-box {
            background-color: var(--bg-card);
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        
        .list-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 16px;
        }
        
        .list-header p { margin: 0; }
        
        .table-container {
            overflow-x: auto;
        }

        .member-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
            white-space: nowrap;
        }

        .member-table th, .member-table td {
            padding: 12px 16px;
            text-align: left;
            vertical-align: middle;
        }

        .member-table thead {
            background-color: var(--bg-table-header);
        }

        .member-table th {
            font-weight: 500;
            color: var(--text-secondary);
        }
        
        .member-table tbody tr {
            border-bottom: 1px solid var(--border-color);
        }
        
        .member-table tbody tr:last-child {
            border-bottom: none;
        }

        .member-table tbody tr:hover {
            background-color: #fcf8f3;
        }
        
        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
            color: #fff;
        }
        .status-active { background-color: var(--status-active); }
        .status-dormant { background-color: var(--status-dormant); }
        .status-banned { background-color: var(--status-banned); }
        .status-withdrawn { background-color: var(--status-withdrawn); }
        
        .sanction-yes {
            color: var(--status-banned);
            font-weight: bold;
        }
        
        .btn-manage {
            padding: 5px 12px;
            font-size: 13px;
            background-color: var(--highlight-secondary);
            color: var(--text-on-highlight);
        }
        .btn-manage:hover {
            background-color: var(--highlight-primary);
        }

        /* 페이지네이션 */
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 24px;
            gap: 8px;
        }
        .pagination a {
            color: var(--text-secondary);
            padding: 8px 14px;
            text-decoration: none;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            transition: all 0.2s;
        }
        .pagination a:hover {
            background-color: var(--bg-subtle);
            color: var(--text-primary);
        }
        .pagination a.active {
            background-color: var(--highlight-primary);
            color: var(--text-on-highlight);
            border-color: var(--highlight-primary);
            font-weight: bold;
        }
        .pagination a.disabled {
            pointer-events: none;
            opacity: 0.6;
        }
        
        @media (max-width: 768px) {
            body {
                padding: 16px;
            }
            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>

    <div class="member-container">
        <h1>회원 관리</h1>

        <!-- 검색 및 필터링 영역 -->
        <div class="filter-box">
            <form action="/admin/members" method="get">
                <div class="filter-grid">
                    <!-- 검색 조건 -->
                    <div class="filter-group">
                        <label for="search-keyword">통합 검색</label>
                        <div class="input-group">
                            <select name="search-condition" id="search-condition">
                                <option value="id">ID</option>
                                <option value="nickname">닉네임</option>
                                <option value="email">이메일</option>
                            </select>
                            <input type="text" id="search-keyword" name="search-keyword" placeholder="검색어 입력">
                        </div>
                    </div>

                    <!-- 가입일 범위 -->
                    <div class="filter-group">
                        <label>가입일 범위</label>
                        <div class="date-range-group">
                            <input type="date" name="join-start-date">
                            <span>-</span>
                            <input type="date" name="join-end-date">
                        </div>
                    </div>

                    <!-- 계정 유형 -->
                    <div class="filter-group">
                        <label for="account-type">계정 유형</label>
                        <select id="account-type" name="account-type">
                            <option value="">전체</option>
                            <option value="general">일반</option>
                            <option value="shelter">보호소</option>
                            <option value="admin">관리자</option>
                        </select>
                    </div>

                    <!-- 계정 상태 -->
                    <div class="filter-group">
                        <label for="account-status">계정 상태</label>
                        <select id="account-status" name="account-status">
                            <option value="">전체</option>
                            <option value="active">활성</option>
                            <option value="dormant">휴면</option>
                            <option value="withdrawn">탈퇴</option>
                            <option value="banned">제재됨</option>
                        </select>
                    </div>
                    
                    <!-- 제재 이력 여부 -->
                    <div class="filter-group">
                        <label for="sanction-history">제재 이력</label>
                        <select id="sanction-history" name="sanction-history">
                            <option value="">전체</option>
                            <option value="yes">있음</option>
                            <option value="no">없음</option>
                        </select>
                    </div>
                    
                    <!-- 최근 로그인 일시 -->
                    <div class="filter-group">
                        <label>최근 로그인</label>
                        <div class="date-range-group">
                            <input type="date" name="login-start-date">
                            <span>-</span>
                            <input type="date" name="login-end-date">
                        </div>
                    </div>
                    
                    <!-- 게시글 수 -->
                    <div class="filter-group">
                        <label>게시글 수</label>
                         <div class="date-range-group">
                            <input type="number" name="min-posts" placeholder="최소">
                            <span>-</span>
                            <input type="number" name="max-posts" placeholder="최대">
                        </div>
                    </div>
                    
                    <!-- 댓글 수 -->
                    <div class="filter-group">
                        <label>댓글 수</label>
                         <div class="date-range-group">
                            <input type="number" name="min-comments" placeholder="최소">
                            <span>-</span>
                            <input type="number" name="max-comments" placeholder="최대">
                        </div>
                    </div>
                    
                </div>
                <div class="filter-actions">
                    <button type="reset" class="btn btn-secondary"><i class="fas fa-rotate-left"></i> 초기화</button>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> 검색</button>
                </div>
            </form>
        </div>

        <!-- 회원 목록 -->
        <div class="member-list-box">
            <div class="list-header">
                <p>총 <strong>${totalMembers}</strong>명의 회원이 검색되었습니다.</p>
            </div>
            <div class="table-container">
                <table class="member-table">
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>ID</th>
                            <th>닉네임</th>
                            <th>이메일</th>
                            <th>가입일</th>
                            <th>계정 유형</th>
                            <th>상태</th>
                            <th>최근 로그인</th>
                            <th>게시글</th>
                            <th>댓글</th>
                            <th>신고</th>
                            <th>제재 이력</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty memberList}">
                                <c:forEach var="member" items="${memberList}">
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td><c:out value="${member.id}"/></td>
                                        <td><c:out value="${member.nickname}"/></td>
                                        <td><c:out value="${member.email}"/></td>
                                        <td><c:out value="${member.joinDate}"/></td>
                                        <td><c:out value="${member.accountType}"/></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${member.status == '활성'}"><span class="status-badge status-active">활성</span></c:when>
                                                <c:when test="${member.status == '휴면'}"><span class="status-badge status-dormant">휴면</span></c:when>
                                                <c:when test="${member.status == '제재됨'}"><span class="status-badge status-banned">제재됨</span></c:when>
                                                <c:when test="${member.status == '탈퇴'}"><span class="status-badge status-withdrawn">탈퇴</span></c:when>
                                            </c:choose>
                                        </td>
                                        <td><c:out value="${member.lastLogin}"/></td>
                                        <td><c:out value="${member.postCount}"/></td>
                                        <td><c:out value="${member.commentCount}"/></td>
                                        <td><c:out value="${member.reportCount}"/></td>
                                        <td>
                                            <c:if test="${member.hasSanction}">
                                                <span class="sanction-yes">있음</span>
                                            </c:if>
                                            <c:if test="${not member.hasSanction}">
                                                <span>없음</span>
                                            </c:if>
                                        </td>
                                        <td><button class="btn btn-manage">수정</button></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="13" style="text-align: center; padding: 40px 0;">검색된 회원이 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

            <!-- 페이지네이션 -->
            <div class="pagination">
                <a href="#" class="disabled"><i class="fas fa-angle-double-left"></i></a>
                <a href="#" class="disabled"><i class="fas fa-angle-left"></i></a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#"><i class="fas fa-angle-right"></i></a>
                <a href="#"><i class="fas fa-angle-double-right"></i></a>
            </div>
        </div>
    </div>
</body>
</html>