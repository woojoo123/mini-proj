<%-- JSTL(JSP Standard Tag Library)을 사용하기 위한 선언부 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // JSP 코드 예시: 서블릿(Servlet)에서 전달된 데이터를 변수로 설정
    // 실제로는 MVC 패턴에 따라 컨트롤러(서블릿)에서 이 데이터를 request 객체에 담아 전달합니다.
    // request.setAttribute("totalUsers", 1350);
    // request.setAttribute("monthlyVisitors", 18000);
    
    // JSTL <c:forEach> 예제를 위한 더미 데이터 생성
    java.util.List<java.util.Map<String, String>> userLogs = new java.util.ArrayList<>();
    
    java.util.Map<String, String> log1 = new java.util.HashMap<>();
    log1.put("user", "김민준 (user123)");
    log1.put("icon", "fa-sign-in-alt");
    log1.put("activity", "로그인");
    log1.put("details", "IP: 211.123.45.67");
    log1.put("time", "2025-09-24 14:50:12");
    userLogs.add(log1);

    java.util.Map<String, String> log2 = new java.util.HashMap<>();
    log2.put("user", "이서연 (happycat)");
    log2.put("icon", "fa-pencil-alt");
    log2.put("activity", "게시글 작성");
    log2.put("details", "\"새로운 가족을 찾아요\" (게시글 ID: 812)");
    log2.put("time", "2025-09-24 14:48:55");
    userLogs.add(log2);

    request.setAttribute("userLogs", userLogs);
    request.setAttribute("pageTitle", "관리자 대시보드");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%-- 페이지 타이틀을 동적으로 설정 --%>
    <title>${pageTitle}</title>
    
    <%-- EL을 사용하여 Context Path를 동적으로 설정 (안정적인 경로 보장) --%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
    <%-- 외부 CSS 파일을 사용할 경우의 예시 --%>
    <%-- <link rel="stylesheet" href="${contextPath}/static/css/admin/dashboard/statistics.css"> --%>
    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        /* CSS 코드는 HTML과 동일하므로 생략합니다. */
        :root {
            --bg-color: #f5f5f5;
            --card-bg-color: #ffffff;
            --text-color: #333333;
            --secondary-text-color: #666666;
            --highlight-color: #7b6f65;
            --highlight-dark-color: #5d554d;
            --up-change-color: #8c867f;
            --border-color: #e0e0e0;
            --icon-color: #888888;
        }
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: var(--bg-color);
            margin: 0;
            padding: 20px;
            color: var(--text-color);
        }
        .dashboard-container {
            max-width: 1200px;
            margin: auto;
            background-color: var(--bg-color);
        }
        /* Header */
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
            border-bottom: 1px solid var(--border-color);
            flex-wrap: wrap;
        }
        .header-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .back-link {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: var(--secondary-text-color);
            font-size: 14px;
        }
        .back-link i {
            margin-right: 5px;
        }
        .header-left h1 {
            font-size: 24px;
            font-weight: 700;
            margin: 0;
        }
        .header-left p {
            font-size: 14px;
            color: var(--secondary-text-color);
            margin: 0;
        }
        .header-right {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 10px;
        }
        .admin-label {
            background-color: var(--highlight-color);
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
        }
        .header-button {
            text-decoration: none;
            color: var(--text-color);
            padding: 5px 10px;
            border-radius: 5px;
            font-weight: 500;
            border: 1px solid var(--border-color);
        }
        /* Main Sections */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .stats-grid .stat-card {
            background-color: var(--card-bg-color);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }
        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .stat-header h2 {
            font-size: 16px;
            font-weight: 500;
            color: var(--secondary-text-color);
            margin: 0;
        }
        .stat-header i {
            color: var(--icon-color);
        }
        .stat-body {
            margin-top: 15px;
        }
        .stat-number {
            font-size: 32px;
            font-weight: 700;
            margin: 0;
            color: var(--highlight-dark-color);
        }
        .stat-change {
            font-size: 12px;
            color: var(--secondary-text-color);
            margin-top: 5px;
            display: block;
        }
        .stat-change.up {
            color: var(--up-change-color);
        }
        /* Charts */
        .charts-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
        }
        .charts-section.charts-flex {
            display: flex;
            gap: 32px;
            justify-content: space-between;
            margin-top: 32px;
            margin-bottom: 32px;
        }
        .chart-card {
            background-color: var(--card-bg-color);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            flex: 1 1 0;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.07);
            padding: 24px 20px 20px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-width: 0;
        }
        .chart-header {
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 10px;
        }
        .chart-header h2 {
            font-size: 1.15rem;
            font-weight: 600;
            margin-bottom: 18px;
            color: #222;
            letter-spacing: -1px;
        }
        .chart-placeholder {
            width: 100%;
            height: 250px;
            background-color: #f0f0f0;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ccc;
            font-size: 14px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .placeholder-img {
            width: 100%;
            max-width: 340px;
            border-radius: 10px;
            background: #f5f6fa;
            border: 1px solid #e5e7eb;
            box-shadow: 0 1px 4px rgba(0,0,0,0.04);
        }

        /* User Log Section */
        .user-log-section {
            margin-top: 20px;
        }
        .log-card {
            background-color: var(--card-bg-color);
            padding: 24px;
            border-radius: 16px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.07);
        }
        .log-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .log-header h2 {
            font-size: 1.15rem;
            font-weight: 600;
            margin: 0;
            color: #222;
            letter-spacing: -1px;
        }
        .log-table-container {
            overflow-x: auto;
        }
        .log-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }
        .log-table th, .log-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
            white-space: nowrap;
        }
        .log-table thead th {
            background-color: #f9fafb;
            font-weight: 500;
            color: var(--secondary-text-color);
        }
        .log-table tbody tr:hover {
            background-color: #f5f5f5;
        }
        .log-table td:last-child {
            color: var(--secondary-text-color);
            font-size: 13px;
        }
        .log-activity {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .log-activity i {
            color: var(--icon-color);
        }
        .log-footer {
            margin-top: 20px;
            text-align: center;
        }
        .log-footer a {
            text-decoration: none;
            color: var(--highlight-color);
            font-weight: 500;
            font-size: 14px;
            transition: color 0.2s;
        }
        .log-footer a:hover {
            color: var(--highlight-dark-color);
            text-decoration: underline;
        }
        
        /* Responsiveness */
        @media (max-width: 768px) {
            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .header-right {
                margin-top: 15px;
            }
            .charts-section, .charts-section.charts-flex {
                grid-template-columns: 1fr;
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <header class="dashboard-header">
            <div class="header-left">
                <a href="#" class="back-link">
                    <i class="fas fa-arrow-left"></i>
                    <span>뒤로가기</span>
                </a>
                <h1>관리자 대시보드</h1>
                <p>동반자 플랫폼 통계 및 관리</p>
            </div>
        </header>
        <main class="dashboard-main">
            <section class="stats-grid">
                <div class="stat-card">
                    <div class="stat-header">
                        <h2>총 가입자 수</h2>
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <div class="stat-body">
                        <%-- 서블릿에서 전달된 'totalUsers' 값을 EL로 출력 --%>
                        <p class="stat-number"><c:out value="${totalUsers}" default="1,350"/>명</p>
                        <span class="stat-change up">전월 대비 +14.4%</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <h2>월 방문자 수</h2>
                        <i class="fas fa-eye"></i>
                    </div>
                    <div class="stat-body">
                        <%-- 값이 없을 경우 기본값(default)을 보여줌 --%>
                        <p class="stat-number"><c:out value="${monthlyVisitors}" default="18,000"/>명</p>
                        <span class="stat-change up">전월 대비 +11.1%</span>
                    </div>
                </div>
                <%-- 다른 stat-card들도 위와 같이 동적으로 변경 가능 --%>
                <div class="stat-card">
                    <div class="stat-header">
                        <h2>누적 입양 수</h2>
                        <i class="fas fa-heart"></i>
                    </div>
                    <div class="stat-body">
                        <p class="stat-number">621마리</p>
                        <span class="stat-change">이번 달 89마리</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <h2>등록된 보호소</h2>
                        <i class="fas fa-building"></i>
                    </div>
                    <div class="stat-body">
                        <p class="stat-number">457소</p>
                        <span class="stat-change up">전월 대비 +7.1%</span>
                    </div>
                </div>
            </section>
            
            <section class="stats-grid new-stats">
                <%-- 이 섹션의 카드들도 위와 동일한 방식으로 동적 데이터로 채울 수 있습니다 --%>
                <div class="stat-card">
                    <div class="stat-header">
                        <h2>신고/제재</h2>
                        <i class="fas fa-user-slash"></i>
                    </div>
                    <div class="stat-body">
                        <p class="stat-number">123건</p>
                        <span class="stat-change">오늘 접수 5건</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <h2>블랙리스트</h2>
                        <i class="fas fa-ban"></i>
                    </div>
                    <div class="stat-body">
                        <p class="stat-number">5명</p>
                        <span class="stat-change">이번 달 2명 추가</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <h2>문의사항</h2>
                        <i class="fas fa-question-circle"></i>
                    </div>
                    <div class="stat-body">
                        <p class="stat-number">34건</p>
                        <span class="stat-change">미처리 7건</span>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <h2>알림</h2>
                        <i class="fas fa-bell"></i>
                    </div>
                    <div class="stat-body">
                        <p class="stat-number">10개</p>
                        <span class="stat-change">읽지 않은 알림</span>
                    </div>
                </div>
            </section>
            <section class="charts-section charts-flex">
                <div class="chart-card">
                    <div class="chart-header">
                        <h2>사용자 증가 추이</h2>
                    </div>
                    <div class="chart-placeholder">
                         <img src="https://via.placeholder.com/400x300.png?text=사용자+증가+추이" alt="사용자 증가 추이 그래프" class="placeholder-img">
                    </div>
                </div>
                <div class="chart-card">
                    <div class="chart-header">
                        <h2>방문자 수 추이</h2>
                    </div>
                    <div class="chart-placeholder">
                         <img src="https://via.placeholder.com/400x300.png?text=방문자+수+추이" alt="방문자 수 추이 막대 그래프" class="placeholder-img">
                    </div>
                </div>
                <div class="chart-card">
                    <div class="chart-header">
                        <h2>입양 통계</h2>
                    </div>
                    <div class="chart-placeholder">
                         <img src="https://via.placeholder.com/400x300.png?text=입양+통계" alt="입양 통계 그래프" class="placeholder-img">
                    </div>
                </div>
            </section>
            
            <section class="user-log-section">
                <div class="log-card">
                    <div class="log-header">
                        <h2>최근 사용자 이용 로그</h2>
                    </div>
                    <div class="log-table-container">
                        <table class="log-table">
                            <thead>
                                <tr>
                                    <th>사용자</th>
                                    <th>활동</th>
                                    <th>세부 정보</th>
                                    <th>시간</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%-- JSTL의 forEach를 사용하여 request에 담긴 로그 리스트를 반복 출력 --%>
                                <c:forEach var="log" items="${userLogs}">
                                    <tr>
                                        <td><c:out value="${log.user}" /></td>
                                        <td>
                                            <div class="log-activity">
                                                <i class="fas ${log.icon}"></i>
                                                <span><c:out value="${log.activity}" /></span>
                                            </div>
                                        </td>
                                        <td><c:out value="${log.details}" /></td>
                                        <td><c:out value="${log.time}" /></td>
                                    </tr>
                                </c:forEach>
                                
                                <%-- 데이터가 없을 경우 표시할 내용 --%>
                                <c:if test="${empty userLogs}">
                                    <tr>
                                        <td colspan="4" style="text-align: center;">최근 로그 기록이 없습니다.</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="log-footer">
                        <a href="${contextPath}/admin/logs">전체 로그 보기 <i class="fas fa-arrow-right"></i></a>
                    </div>
                </div>
            </section>
        </main>
    </div>
</body>
</html>