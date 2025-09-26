<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>봉사 일정 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/volunteer/schedule_list.css">
</head>
<body>
<div class="wrap">
  <!-- Header -->
  <div class="head">
    <div class="back">←</div>
    <div style="flex:1">
      <h1>봉사 일정 관리</h1>
      <div class="sub">봉사활동 일정을 등록하고 관리하세요</div>
    </div>
    <div class="top-actions"><button class="btn brown">＋ 일정 등록</button></div>
  </div>

  <!-- Toolbar -->
  <div class="toolbar">
    <div class="search">🔎 <input id="q" placeholder="일정명, 설명으로 검색..." /></div>
    <select id="statusSel" class="select" title="상태">
      <option value="all">전체</option>
      <option value="open">모집중</option>
      <option value="done">모집완료</option>
    </select>
    <select id="sortSel" class="select" title="정렬">
      <option value="date_desc">날짜순</option>
      <option value="created_desc">등록순</option>
    </select>
  </div>
  <div class="count">총 <span id="totalCnt">0</span>개 일정</div>

  <!-- List -->
  <section id="list" class="list">
    <!-- 1 -->
    <article class="card" data-status="open" data-title="강아지 급식 도우미" data-created="2024-01-10" data-date="2024-01-28" data-time="07:00-09:00" data-apply="4/4">
      <div>
        <div class="title">강아지 급식 도우미 <span class="badge b-open">모집중</span></div>
        <div class="desc">아침 급식 시간에 강아지들의 식사를 도와주는 봉사활동입니다.</div>
        <div class="meta">
          <div>📅 <span class="muted">2024.01.28</span></div>
          <div>⏰ <span class="muted">07:00 - 09:00</span></div>
          <div>👥 <span class="muted">4명 중 4명 신청</span></div>
        </div>
        <div class="foot">등록일: 2024.01.10</div>
      </div>
      <div class="right">
        <button class="pill">👁 상세보기</button>
        <button class="pill">👤 신청관리</button>
        <button class="dots">…</button>
      </div>
    </article>

    <!-- 2 -->
    <article class="card" data-status="open" data-title="주말 강아지 산책 봉사" data-created="2024-01-20" data-date="2024-02-03" data-time="10:00-12:00" data-apply="5/8">
      <div>
        <div class="title">주말 강아지 산책 봉사 <span class="badge b-open">모집중</span></div>
        <div class="desc">보호소 강아지들과 함께 산책하며 운동량을 채워주는 봉사활동입니다.</div>
        <div class="meta">
          <div>📅 <span class="muted">2024.02.03</span></div>
          <div>⏰ <span class="muted">10:00 - 12:00</span></div>
          <div>👥 <span class="muted">8명 중 5명 신청</span></div>
        </div>
        <div class="foot">등록일: 2024.01.20</div>
      </div>
      <div class="right">
        <button class="pill">👁 상세보기</button>
        <button class="pill">👤 신청관리</button>
        <button class="dots">…</button>
      </div>
    </article>

    <!-- 3 -->
    <article class="card" data-status="open" data-title="보호소 대청소 및 환경정리" data-created="2024-01-15" data-date="2024-02-10" data-time="09:00-15:00" data-apply="12/12">
      <div>
        <div class="title">보호소 대청소 및 환경정리 <span class="badge b-open">모집중</span></div>
        <div class="desc">보호소 내부 청소와 환경 정리를 도와주는 봉사활동입니다.</div>
        <div class="meta">
          <div>📅 <span class="muted">2024.02.10</span></div>
          <div>⏰ <span class="muted">09:00 - 15:00</span></div>
          <div>👥 <span class="muted">12명 중 12명 신청</span></div>
        </div>
        <div class="foot">등록일: 2024.01.15</div>
      </div>
      <div class="right">
        <button class="pill">👁 상세보기</button>
        <button class="pill">👤 신청관리</button>
        <button class="dots">…</button>
      </div>
    </article>

    <!-- 4 -->
    <article class="card" data-status="done" data-title="입양박람회 준비 봉사" data-created="2024-01-18" data-date="2024-02-15" data-time="14:00-18:00" data-apply="2/10">
      <div>
        <div class="title">입양박람회 준비 봉사 <span class="badge b-done">모집완료</span></div>
        <div class="desc">다음 주 입양박람회를 위한 준비 작업을 도와주세요.</div>
        <div class="meta">
          <div>📅 <span class="muted">2024.02.15</span></div>
          <div>⏰ <span class="muted">14:00 - 18:00</span></div>
          <div>👥 <span class="muted">10명 중 2명 신청</span></div>
        </div>
        <div class="foot">등록일: 2024.01.18</div>
      </div>
      <div class="right">
        <button class="pill">👁 상세보기</button>
        <button class="pill">👤 신청관리</button>
        <button class="dots">…</button>
      </div>
    </article>
  </section>
</div>

<script src="${pageContext.request.contextPath}/assets/js/shelter/volunteer/schedule_list.js"></script>
</body>
</html>
