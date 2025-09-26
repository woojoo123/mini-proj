<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>후원자 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/donation/viewdetails.css">
</head>
<body>
<main class="wrap">
  <!-- 상단 -->
  <div class="topbar">
    <div>
      <h1>후원자 상세</h1>
      <div class="sub">후원자의 상세 정보와 후원 내역을 확인하세요</div>
    </div>
    <div class="actions">
      <button class="btn">감사 메시지</button>
      <button class="btn main">내역 다운로드</button>
    </div>
  </div>

  <!-- 프로필 -->
  <section class="profile">
    <div class="ava">김</div>
    <div class="info">
      <h2>김** <span class="tag">정기후원</span></h2>
      <div class="stats">
        <div class="stat"><div class="label">총 후원금</div><div class="val">1,200,000원</div></div>
        <div class="stat"><div class="label">후원 횟수</div><div class="val">24회</div></div>
        <div class="stat"><div class="label">평균 후원금</div><div class="val">50,000원</div></div>
        <div class="stat"><div class="label">첫 후원</div><div class="val">2022.03.15</div></div>
        <div class="stat"><div class="label">최근 후원</div><div class="val">2024.01.25</div></div>
      </div>
    </div>
  </section>

  <!-- 탭 -->
  <div class="tabs">
    <div class="active">후원 내역</div>
    <div>후원 통계</div>
  </div>

  <!-- 툴바 -->
  <div class="toolbar">
    <div class="search">🔎
      <input placeholder="영수증 번호, 메모로 검색…" />
    </div>
    <div class="sel">
      <select>
        <option>전체</option>
        <option>정기</option>
        <option>일시</option>
      </select>
      <select>
        <option>상태: 전체</option>
        <option>완료</option>
        <option>대기</option>
      </select>
      <select>
        <option>날짜순</option>
        <option>최신순</option>
        <option>금액순</option>
      </select>
    </div>
  </div>

  <!-- 후원 내역 -->
  <section>
    <div class="history">
      <div class="top">
        <div class="amount">50,000원</div>
        <span class="state">완료 · 정기</span>
      </div>
      <div class="detail">
        <div>2024.01.25 14:30</div>
        <div>결제방법: 계좌이체</div>
        <div>영수증 번호: RC-2024-001</div>
        <div>메모: 매월 정기 후원</div>
      </div>
    </div>

    <div class="history">
      <div class="top">
        <div class="amount">50,000원</div>
        <span class="state">완료 · 정기</span>
      </div>
      <div class="detail">
        <div>2023.12.25 14:30</div>
        <div>결제방법: 계좌이체</div>
        <div>영수증 번호: RC-2023-145</div>
        <div>메모: 매월 정기 후원</div>
      </div>
    </div>

    <div class="history">
      <div class="top">
        <div class="amount">50,000원</div>
        <span class="state">완료 · 정기</span>
      </div>
      <div class="detail">
        <div>2023.11.25 14:30</div>
        <div>결제방법: 계좌이체</div>
        <div>영수증 번호: RC-2023-132</div>
        <div>메모: 매월 정기 후원</div>
      </div>
    </div>
  </section>
</main>
</body>
</html>
