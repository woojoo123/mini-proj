<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>봉사활동 검색</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/volunteer/search.css">
</head>
<body>
  <main class="container">
    <header>
      <h1>봉사활동 검색</h1>
      <div class="subtitle">조건에 맞는 봉사활동을 찾아보세요</div>
    </header>

    <!-- 검색 폼 -->
    <section class="card filters">
      <div class="grid g2">
        <div>
          <label>봉사명 검색</label>
          <input id="qTitle" type="search" placeholder="봉사활동 이름을 입력하세요" />
        </div>
        <div>
          <label>보호소 이름</label>
          <input id="qShelter" type="search" placeholder="보호소명을 입력하세요" />
        </div>
      </div>

      <div class="grid g4" style="margin-top:10px">
        <div>
          <label>봉사지역(시/도)</label>
          <select id="qSido" class="select">
            <option value="">전체</option>
            <option>서울특별시</option><option>부산광역시</option><option>인천광역시</option>
            <option>대구광역시</option><option>대전광역시</option><option>광주광역시</option>
            <option>울산광역시</option><option>경기도</option>
          </select>
        </div>
        <div>
          <label>봉사지역(구/군)</label>
          <select id="qGugun" class="select" disabled>
            <option value="">전체</option>
          </select>
        </div>
        <div>
          <label>봉사분야</label>
          <select id="qCategory" class="select">
            <option value="">전체</option>
            <option>돌봄</option><option>청소/환경정비</option><option>사진/콘텐츠 제작</option>
            <option>이동/차량지원</option><option>행사/부스 운영</option><option>미용</option><option>상담</option><option>의료지원</option>
          </select>
        </div>
        <div>
          <label>모집상태</label>
          <select id="qStatus" class="select">
            <option value="">전체</option>
            <option>모집중</option><option>상시</option><option>마감임박</option><option>모집완료</option>
          </select>
        </div>
      </div>

      <div class="grid g4" style="margin-top:10px">
        <div>
          <label>봉사기간</label>
          <div class="sep">
            <input id="qStart" type="date">
            <span>~</span>
            <input id="qEnd" type="date">
          </div>
        </div>
        <div>
          <label>봉사자유형</label>
          <div class="inline" style="padding-top:6px">
            <label class="inline"><input type="checkbox" id="qAdult"> 성인</label>
            <label class="inline"><input type="checkbox" id="qTeen"> 청소년</label>
          </div>
        </div>
        <div>
          <label>봉사시간</label>
          <select id="qTimeType" class="select">
            <option value="">전체</option>
            <option value="2시간">2시간</option>
            <option value="4시간">4시간</option>
            <option value="6시간">6시간</option>
            <option value="8시간">8시간</option>
          </select>
        </div>
        <div style="display:flex;align-items:flex-end;justify-content:flex-start">
          <div class="actions">
            <button id="btnSearch" class="btn icon primary">🔎 검색</button>
            <button id="btnReset" class="btn icon ghost">🧹 초기화</button>
          </div>
        </div>
      </div>
    </section>

    <!-- 툴바 -->
    <div class="toolbar">
      <div class="count" id="resultCount">전체 0건</div>
      <div>
        <select id="sortBy" class="select" style="min-width:120px">
          <option value="latest">최신순</option>
          <option value="endSoon">마감임박</option>
          <option value="oldest">오래된순</option>
        </select>
      </div>
    </div>

    <!-- 결과 리스트 -->
    <section id="list"></section>

    <!-- 페이지네이션 -->
    <div id="pager" class="pager"></div>
    <script src="${pageContext.request.contextPath}/assets/js/shelter/volunteer/search.js"></script>
  </main>


</body>
</html>
