<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1"/>
<title>봉사 신청자 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/volunteer/list.css">
</head>
<body>
<div class="wrap">
  <!-- Header -->
  <div class="head">
    <div class="back">←</div>
    <div>
      <h1>봉사 신청자 관리</h1>
      <div class="sub">전체 봉사 신청자를 확인하고 관리하세요</div>
    </div>
  </div>

  <!-- Summary -->
  <div class="summary">
    <div class="sbox"><div class="ico">👥</div><div class="k">전체 신청자</div><div class="v" id="totalCount">0명</div></div>
    <div class="sbox"><div class="ico">⏳</div><div class="k">승인 대기</div><div class="v" id="pendingCount">0명</div></div>
  </div>

  <!-- Toolbar -->
  <div class="toolbar">
    <div class="search">🔎 <input id="q" placeholder="신청자명, 이메일, 일정명으로 검색..." /></div>
    <select id="statusSel" class="select" title="상태">
      <option value="all">전체</option><option value="approved">승인</option><option value="pending">대기</option><option value="rejected">반려</option>
    </select>
    <button id="rangeBtn" class="range-btn select" title="기간"><span id="rangeLabel">기간 선택</span></button>
    <div id="rangePop" class="popover">
      <div style="font-weight:800; margin-bottom:6px">조회 기간</div>
      <div class="row"><input type="date" id="startDate"><input type="date" id="endDate"></div>
      <div class="quick"><button type="button" data-preset="thisMonth">이번 달</button><button type="button" data-preset="lastMonth">지난 달</button><button type="button" data-preset="all">전체</button></div>
      <div class="actions"><button id="rangeCancel" class="pill white">취소</button><button id="rangeApply" class="pill">적용</button></div>
    </div>
    <select id="sortSel" class="select" title="정렬">
      <option value="date_desc">신청일순</option><option value="status">상태순</option><option value="name">이름순</option>
    </select>
  </div>

  <!-- Bulk row -->
  <div class="bulk-row">
    <label><input type="checkbox" id="selectAll"> 전체 선택 (<span id="selCount">0</span>/<span id="visibleCount">0</span>)</label>
    <span class="hint">총 <span id="listCount">0</span>명의 신청자</span>
    <span style="flex:1"></span>
    <button class="btn green" id="bulkApprove" disabled>일괄 승인</button>
    <button class="btn red" id="bulkReject" disabled>일괄 반려</button>
  </div>

  <!-- List -->
  <section class="list" id="list">
    <!-- 서민지 : 대기 -->
    <article class="card" data-status="pending" data-name="서민지" data-email="seomj@example.com" data-title="정기 건강검진 도우미" data-date="2024-03-02 09:00" data-applied="2024-02-20 16:45">
      <input type="checkbox" class="rowcheck" aria-label="선택">

      <div>
        <div class="name">서민지 <span class="badge b-wait">대기</span></div>
        <div class="row"><span class="muted">봉사 일정:</span> 정기 건강검진 도우미</div>
        <div class="row"><span class="muted">연락처:</span> 010-7890-1234</div>
        <div class="row"><span class="muted">이메일:</span> seomj@example.com</div>
      </div>

      <div class="right">
        <div class="actions">
          <button class="btn green ok">승인</button>
          <button class="btn red no">반려</button>
        </div>
      </div>
    </article>

    <!-- 최동훈 : 승인(결석) -->
    <article class="card" data-status="approved" data-name="최동훈" data-email="choidh@example.com" data-title="구조 활동 지원" data-date="2024-02-10 08:00" data-applied="2024-01-26 09:20" data-attend="absent">
      <input type="checkbox" class="rowcheck" aria-label="선택">

      <div>
        <div class="name">최동훈 <span class="badge b-approve">승인</span> <span class="badge b-absent">결석</span></div>
        <div class="row"><span class="muted">봉사 일정:</span> 구조 활동 지원</div>
        <div class="row"><span class="muted">연락처:</span> 010-6789-0123</div>
        <div class="row"><span class="muted">이메일:</span> choidh@example.com</div>
        <div class="row muted">승인일: 2024.01.27 14:00</div>
      </div>

      <div class="right">
        <div class="actions">
          <button class="pill">🕘 출석</button>
          <button class="pill white">✖ 결석</button>
        </div>
      </div>
    </article>

    <!-- 한지원 : 대기 -->
    <article class="card" data-status="pending" data-name="한지원" data-email="hanjw@example.com" data-title="보호소 청소 봉사" data-date="2024-02-03 09:00" data-applied="2024-01-25 11:30">
      <input type="checkbox" class="rowcheck" aria-label="선택">

      <div>
        <div class="name">한지원 <span class="badge b-wait">대기</span></div>
        <div class="row"><span class="muted">봉사 일정:</span> 보호소 청소 봉사</div>
        <div class="row"><span class="muted">연락처:</span> 010-5678-9012</div>
        <div class="row"><span class="muted">이메일:</span> hanjw@example.com</div>
      </div>

      <div class="right">
        <div class="actions">
          <button class="btn green ok">승인</button>
          <button class="btn red no">반려</button>
        </div>
      </div>
    </article>

    <!-- 이미영 : 대기 -->
    <article class="card" data-status="pending" data-name="이미영" data-email="leeha@example.com" data-title="주말 동물 돌봄 봉사" data-date="2024-01-27 09:00" data-applied="2024-01-22 10:15">
      <input type="checkbox" class="rowcheck" aria-label="선택">

      <div>
        <div class="name">이미영 <span class="badge b-wait">대기</span></div>
        <div class="row"><span class="muted">봉사 일정:</span> 주말 동물 돌봄 봉사</div>
        <div class="row"><span class="muted">연락처:</span> 010-2345-6789</div>
        <div class="row"><span class="muted">이메일:</span> leeha@example.com</div>
      </div>

      <div class="right">
        <div class="actions">
          <button class="btn green ok">승인</button>
          <button class="btn red no">반려</button>
        </div>
      </div>
    </article>

    <!-- 박민수 : 승인(출석) -->
    <article class="card" data-status="approved" data-name="박민수" data-email="parkms@example.com" data-title="산책 및 운동 봉사" data-date="2024-01-28 10:00" data-applied="2024-01-21 16:45" data-attend="came">
      <input type="checkbox" class="rowcheck" aria-label="선택">

      <div>
        <div class="name">박민수 <span class="badge b-approve">승인</span> <span class="badge b-attend">출석</span></div>
        <div class="row"><span class="muted">봉사 일정:</span> 산책 및 운동 봉사</div>
        <div class="row"><span class="muted">연락처:</span> 010-3456-7890</div>
        <div class="row"><span class="muted">이메일:</span> parkms@example.com</div>
        <div class="row muted">승인일: 2024.01.22 10:00</div>
      </div>

      <div class="right">
        <div class="actions">
          <button class="pill">⟳ 출석</button>
          <button class="pill white">✖ 결석</button>
        </div>
      </div>
    </article>

    <!-- 김영수 : 승인(출석) -->
    <article class="card" data-status="approved" data-name="김영수" data-email="kimys@example.com" data-title="주말 동물 돌봄 봉사" data-date="2024-01-27 09:00" data-applied="2024-01-20 14:30" data-attend="came">
      <input type="checkbox" class="rowcheck" aria-label="선택">

      <div>
        <div class="name">김영수 <span class="badge b-approve">승인</span> <span class="badge b-attend">출석</span></div>
        <div class="row"><span class="muted">봉사 일정:</span> 주말 동물 돌봄 봉사</div>
        <div class="row"><span class="muted">연락처:</span> 010-1234-5678</div>
        <div class="row"><span class="muted">이메일:</span> kimys@example.com</div>
        <div class="row muted">승인일: 2024.01.21 09:00</div>
      </div>

      <div class="right">
        <div class="actions">
          <button class="pill">⟳ 출석</button>
          <button class="pill white">✖ 결석</button>
        </div>
      </div>
    </article>
  </section>
</div>

    <script src="${pageContext.request.contextPath}/assets/js/shelter/volunteer/list.js"></script>
</body>
</html>
