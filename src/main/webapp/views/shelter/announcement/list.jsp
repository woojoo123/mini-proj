<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>공지사항 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/notice/list.css">
</head>
<body>
  <div class="wrap">
    <h1>공지사항 관리</h1>
    <div class="subtitle">보호소 공지사항을 작성하고 관리하세요</div>

    <div class="topbar">
      <div class="searchbar">
        <input type="text" placeholder="제목이나 내용으로 검색..." />
        <button class="btn">검색</button>
      </div>
      <button class="btn primary">+ 새 공지사항 작성</button>
    </div>

    <div class="filter-row">
      <select>
        <option>전체 카테고리</option>
        <option>일반공지</option>
        <option>의료공지</option>
        <option>입양공지</option>
        <option>후원공지</option>
        <option>이벤트</option>
      </select>
      <select>
        <option>전체</option>
        <option>게시 중</option>
        <option>임시저장</option>
        <option>상단고정</option>
      </select>
    </div>

    <!-- 공지사항 카드 예시 -->
    <div class="card">
      <div class="card-head">
        <div>
          <span class="badge red">중요공지</span>
          <h2 class="title">[중요] 겨울철 보호소 운영시간 변경 안내</h2>
          <div class="meta">2024.01.25 14:20 · 조회수 320</div>
        </div>
        <button class="small-btn">수정</button>
      </div>
      <div class="content">
        12월부터 겨울철 운영시간은 오전 9시에서 오후 5시로 변경됩니다. 강아지들의 건강과 안전을 위해 양해 부탁드립니다.
      </div>
    </div>

    <div class="card">
      <div class="card-head">
        <div>
          <span class="badge blue">입양공지</span>
          <h2 class="title">새로운 강아지들이 입양을 기다리고 있어요!</h2>
          <div class="meta">2024.01.24 10:15 · 조회수 185</div>
        </div>
        <button class="small-btn">수정</button>
      </div>
      <div class="content">
        이번 주에 구조된 골든 리트리버와 믹스견 2마리가 건강검진을 마치고 입양을 기다리고 있습니다.
      </div>
    </div>

    <div class="card">
      <div class="card-head">
        <div>
          <span class="badge orange">후원공지</span>
          <h2 class="title">2024년 1월 후원 현황 및 감사 인사</h2>
          <div class="meta">2024.01.22 16:05 · 조회수 210</div>
        </div>
        <button class="small-btn">수정</button>
      </div>
      <div class="content">
        1월 한 달간 총 48분의 따뜻한 마음이 모였습니다. 덕분에 강아지들이 따뜻한 겨울을 보낼 수 있었습니다.
      </div>
    </div>

    <!-- 하단 통계 -->
    <div class="stats">
      <span>전체 공지사항 <b>8</b></span>
      <span>게시 중 <b>7</b></span>
      <span>임시저장 <b>1</b></span>
      <span>상단 고정 <b>2</b></span>
    </div>
  </div>
</body>
</html>
