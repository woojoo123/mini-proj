<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.stream.Collectors" %>

<%
    /*
      ================================================================================
      [데이터 시뮬레이션]
      이 부분은 원래 서블릿(Servlet)에서 처리되어야 할 로직입니다.
      실제 프로젝트 연동 시 이 <.% ... %.> 블록은 제거되어야 합니다.
      ================================================================================
    */

    // 1. 일반 통계 데이터
    request.setAttribute("totalUsers", 1234);
    request.setAttribute("userGrowthRate", 5.2);
    request.setAttribute("userGrowthClass", "positive"); // "positive" or "negative"

    request.setAttribute("todayVisitors", 456);
    request.setAttribute("visitorDifference", -20);
    request.setAttribute("visitorDiffClass", "negative");

    request.setAttribute("totalAdoptions", 789);
    request.setAttribute("adoptionIncrease", 30);
    request.setAttribute("adoptionIncreaseClass", "positive");
    
    request.setAttribute("monthlyPosts", 58);
    request.setAttribute("monthlyReviews", 12);

    // 2. 월별 동물 상태 변화 차트 데이터 (JavaScript에서 사용하기 좋게 문자열로 가공)
    List<String> monthLabels = Arrays.asList("6월", "7월", "8월", "9월");
    List<Integer> adoptionData = Arrays.asList(12, 19, 15, 22);
    List<Integer> euthanasiaData = Arrays.asList(2, 3, 1, 2);
    List<Integer> naturalDeathData = Arrays.asList(1, 0, 2, 1);
    
    String monthLabelsJs = "['" + String.join("','", monthLabels) + "']"; 
    String adoptionDataJs = adoptionData.stream().map(String::valueOf).collect(Collectors.joining(",", "[", "]"));
    String euthanasiaDataJs = euthanasiaData.stream().map(String::valueOf).collect(Collectors.joining(",", "[", "]"));
    String naturalDeathDataJs = naturalDeathData.stream().map(String::valueOf).collect(Collectors.joining(",", "[", "]"));

    request.setAttribute("monthLabelsJs", monthLabelsJs);
    request.setAttribute("adoptionDataJs", adoptionDataJs);
    request.setAttribute("euthanasiaDataJs", euthanasiaDataJs);
    request.setAttribute("naturalDeathDataJs", naturalDeathDataJs);
    
    // 3. 방문자 유입 경로 차트 데이터
    List<String> trafficLabels = Arrays.asList("검색 엔진", "인스타그램", "페이스북", "직접 접속", "기타");
    List<Integer> trafficData = Arrays.asList(300, 200, 150, 100, 50);

    String trafficLabelsJs = "['" + String.join("','", trafficLabels) + "']";
    String trafficDataJs = trafficData.stream().map(String::valueOf).collect(Collectors.joining(",", "[", "]"));

    request.setAttribute("trafficLabelsJs", trafficLabelsJs);
    request.setAttribute("trafficDataJs", trafficDataJs);

    // 4. 인기 입양 동물 목록 (List<Map> 또는 List<VO> 형태)
    List<Map<String, Object>> popularAnimals = new ArrayList<>();
    Map<String, Object> animal1 = new HashMap<>();
    animal1.put("rank", 1);
    animal1.put("name", "행복이");
    animal1.put("breed", "믹스견");
    animal1.put("viewCount", 1204);
    animal1.put("regDate", "2025-09-10");
    popularAnimals.add(animal1);

    Map<String, Object> animal2 = new HashMap<>();
    animal2.put("rank", 2);
    animal2.put("name", "나비");
    animal2.put("breed", "코리안 숏헤어");
    animal2.put("viewCount", 987);
    animal2.put("regDate", "2025-09-05");
    popularAnimals.add(animal2);
    
    Map<String, Object> animal3 = new HashMap<>();
    animal3.put("rank", 3);
    animal3.put("name", "초코");
    animal3.put("breed", "푸들");
    animal3.put("viewCount", 850);
    animal3.put("regDate", "2025-08-28");
    popularAnimals.add(animal3);

    request.setAttribute("popularAnimals", popularAnimals);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 통계</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        /* 기본 스타일 (전체적으로 폰트 크기 조정) */
        body {
            font-family: 'Malgun Gothic', sans-serif;
            background-color: #F9F9F9;
            color: #3C2A21;
            margin: 0;
            padding: 15px; /* 여백 줄임 */
            font-size: 14px; /* 기본 폰트 크기 줄임 */
        }

        /* 컨테이너 (최대 너비 및 여백 축소) */
        .container {
            max-width: 1100px; /* 최대 너비 줄임 */
            margin: 0 auto;
            padding: 15px; /* 여백 줄임 */
            background-color: #FFFFFF;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        /* 헤더 (폰트 크기 및 하단 여백 축소) */
        header h1 {
            color: #3C2A21;
            border-bottom: 2px solid #F1DEC9;
            padding-bottom: 8px; /* 여백 줄임 */
            margin-bottom: 20px; /* 여백 줄임 */
            font-size: 24px; /* 폰트 크기 줄임 */
        }
        
        /* 섹션 제목 (폰트 크기 및 여백 축소) */
        h2 {
            color: #8D7B68;
            border-left: 4px solid #A4907C;
            padding-left: 10px;
            margin-top: 30px; /* 여백 줄임 */
            margin-bottom: 15px; /* 여백 줄임 */
            font-size: 18px; /* 폰트 크기 줄임 */
        }

        /* 그리드 레이아웃 (간격 축소) */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 15px; /* 간격 줄임 */
        }
        
        .grid-full {
             grid-column: 1 / -1;
        }

        /* 통계 카드 (여백 및 폰트 크기 축소) */
        .stat-card {
            background-color: #FFF8EA;
            padding: 15px; /* 여백 줄임 */
            border-radius: 8px;
            border: 1px solid #F1DEC9;
        }
        
        .stat-card h3 {
            margin-top: 0;
            margin-bottom: 8px;
            color: #3C2A21;
            font-size: 16px; /* 폰트 크기 줄임 */
        }
        
        .stat-card .value {
            font-size: 24px; /* 폰트 크기 줄임 */
            font-weight: bold;
            color: #000000;
        }
        
        .stat-card .description {
            font-size: 12px; /* 폰트 크기 줄임 */
            color: #777777;
        }
        
        .stat-card .change {
            font-size: 12px; /* 폰트 크기 줄임 */
            margin-top: 5px;
        }

        .change.positive { color: #3C2A21; }
        .change.negative { color: #8D7B68; }
        
        /* 차트 컨테이너 (여백 축소) */
        .chart-container {
            background-color: #FFFFFF;
            padding: 15px; /* 여백 줄임 */
            border-radius: 8px;
            border: 1px solid #F1DEC9;
            margin-top: 15px;
        }

        /* 테이블 스타일 (여백 축소) */
        .stat-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        .stat-table th, .stat-table td {
            border: 1px solid #F1DEC9;
            padding: 10px; /* 셀 여백 줄임 */
            text-align: left;
        }
        .stat-table th {
            background-color: #A4907C;
            color: #FFFFFF;
            font-weight: bold;
        }
        .stat-table td { background-color: #FFFFFF; color: #3C2A21; }
        .stat-table tr:nth-child(even) td { background-color: #F9F9F9; }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>동물 보호소 통계 대시보드</h1>
        </header>

        <main>
            <!-- 일반 통계 -->
            <h2>일반 통계</h2>
            <div class="grid-container">
                <div class="stat-card">
                    <h3>총 사이트 가입자 수</h3>
                    <p class="value"><fmt:formatNumber value="${totalUsers}" pattern="#,##0" /> 명</p>
                    <p class="description change ${userGrowthClass}">
                        <c:if test="${userGrowthRate > 0}">+</c:if>${userGrowthRate}% (전월 대비)
                    </p>
                </div>
                <div class="stat-card">
                    <h3>일일 방문자 수</h3>
                    <p class="value"><fmt:formatNumber value="${todayVisitors}" pattern="#,##0" /> 명</p>
                    <p class="description change ${visitorDiffClass}">
                        <c:if test="${visitorDifference > 0}">+</c:if><fmt:formatNumber value="${visitorDifference}" pattern="#,##0" /> 명 (어제 대비)
                    </p>
                </div>
                <div class="stat-card">
                    <h3>누적 입양된 동물 수</h3>
                    <p class="value"><fmt:formatNumber value="${totalAdoptions}" pattern="#,##0" /> 마리</p>
                    <p class="description change ${adoptionIncreaseClass}">
                        <c:if test="${adoptionIncrease > 0}">+</c:if><fmt:formatNumber value="${adoptionIncrease}" pattern="#,##0" /> 마리 (전월 대비)
                    </p>
                </div>
                <div class="stat-card">
                    <h3>월간 공고 등록 수</h3>
                    <p class="value"><fmt:formatNumber value="${monthlyPosts}" pattern="#,##0" /> 건</p>
                    <p class="description">유기/입양 공고 (최근 30일)</p>
                </div>
                <div class="stat-card">
                    <h3>월간 입양 후기 수</h3>
                    <p class="value"><fmt:formatNumber value="${monthlyReviews}" pattern="#,##0" /> 건</p>
                    <p class="description">입양 만족도 (최근 30일)</p>
                </div>
            </div>

            <!-- 동물 상태 통계 -->
            <h2>보호소 동물 상태 통계</h2>
            <div class="grid-container grid-full">
                <div class="chart-container">
                    <h3>월별 동물 상태 변화 (입양/안락사/자연사)</h3>
                    <canvas id="animalStatusChart"></canvas>
                </div>
            </div>

            <!-- 방문자 유입 통계 -->
            <h2>방문자 유입 경로</h2>
            <div class="grid-container grid-full">
                <div class="chart-container">
                    <h3>유입 경로별 방문자 수</h3>
                     <canvas id="trafficSourceChart"></canvas>
                </div>
            </div>
            
            <!-- 인기 입양 동물 -->
            <h2>인기 입양 동물 (최근 30일)</h2>
            <div class="grid-container grid-full">
                <table class="stat-table">
                    <thead>
                        <tr>
                            <th>순위</th>
                            <th>동물 이름</th>
                            <th>품종</th>
                            <th>조회수</th>
                            <th>공고 등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty popularAnimals}">
                                <c:forEach var="animal" items="${popularAnimals}">
                                    <tr>
                                        <td>${animal.rank}</td>
                                        <td><c:out value="${animal.name}"/></td>
                                        <td><c:out value="${animal.breed}"/></td>
                                        <td><fmt:formatNumber value="${animal.viewCount}" pattern="#,##0" /></td>
                                        <td>${animal.regDate}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" style="text-align: center;">데이터가 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

        </main>
    </div>

    <script>
        // 1. 월별 동물 상태 변화 차트
        const animalStatusCtx = document.getElementById('animalStatusChart').getContext('2d');
        new Chart(animalStatusCtx, {
            type: 'bar',
            data: {
                labels: ${monthLabelsJs},
                datasets: [
                    { label: '입양', data: ${adoptionDataJs}, backgroundColor: '#A4907C' },
                    { label: '안락사', data: ${euthanasiaDataJs}, backgroundColor: '#666666' },
                    { label: '자연사', data: ${naturalDeathDataJs}, backgroundColor: '#F1DEC9' }
                ]
            },
            options: { responsive: true, scales: { x: { stacked: true }, y: { stacked: true, beginAtZero: true } } }
        });

        // 2. 방문자 유입 경로 차트
        const trafficSourceCtx = document.getElementById('trafficSourceChart').getContext('2d');
        new Chart(trafficSourceCtx, {
            type: 'doughnut',
            data: {
                labels: ${trafficLabelsJs},
                datasets: [{
                    label: '방문자 수',
                    data: ${trafficDataJs},
                    backgroundColor: ['#8D7B68', '#A4907C', '#F1DEC9', '#777777', '#3C2A21'],
                    borderColor: '#FFFFFF',
                    borderWidth: 2
                }]
            },
            options: { responsive: true, plugins: { legend: { position: 'top' } } }
        });
    </script>
</body>
</html>