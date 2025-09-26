<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>1:1 문의 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/qna/list.css">
</head>
<body>
    <main>
  <div class="wrap">
    <h1 class="h1">1:1 문의 관리</h1>
    <p class="sub">접수된 문의사항을 확인하고 답변하세요 · <span class="pill"><span id="pendingTotal">0</span>건 미답변</span></p>

    <div class="toolbar">
      <input id="search" type="text" placeholder="제목, 내용, 문의자명으로 검색..." />
      <!-- 1) 카테고리: 입양문의 · 후원문의 · 봉사문의 · 기타 · 전체 -->
      <select id="catFilter" aria-label="카테고리">
        <option value="입양문의">일반문의</option>
        <option value="입양문의">입양문의</option>
        <option value="후원문의">후원문의</option>
        <option value="봉사문의">봉사문의</option>
        <option value="기타">기타</option>
        <option value="all">전체</option>
      </select>
      <!-- 2) 답변 상태: 전체 · 미답변 · 답변 -->
      <select id="ansFilter" aria-label="답변상태">
        <option value="all">전체</option>
        <option value="pending">미답변</option>
        <option value="done">답변</option>
      </select>
      <!-- 3) 정렬: 상태순 · 접수일자순 -->
      <select id="sortFilter" aria-label="정렬">
        <option value="status">상태순</option>
        <option value="date">접수일자순</option>
      </select>
    </div>

    <ul id="list" class="list">
      <!-- 카드 1 -->
      <li class="card" data-cat="입양문의" data-status="pending" data-time="2024-01-25T14:30:00">
        <div class="bar cat-입양문의"></div>
        <div>
          <div class="topline">
            <span class="badge b-red">입양문의</span>
            <span class="badge b-orange">미답변</span>
            <span class="badge b-gray">첨부</span>
          </div>
          <div class="title">초코 입양 절차 문의</div>
          <div class="content">안녕하세요. 초코 입양을 희망하는데 필요한 서류와 절차에 대해 문의드립니다. 가족 모두가 동의한 상태이며…</div>
          <div class="meta">
            <span>문의자: 김**</span>
            <span>kim****@example.com</span>
            <span>010-1234-5678</span>
          </div>
        </div>
        <div class="right">
          <span class="time">2024.01.25 14:30</span>
          <button class="btn primary">답변하기</button>
        </div>
      </li>

      <!-- 카드 2 -->
      <li class="card" data-cat="후원문의" data-status="pending" data-time="2024-01-24T09:20:00">
        <div class="bar cat-후원문의"></div>
        <div>
          <div class="topline">
            <span class="badge b-green">후원문의</span>
            <span class="badge b-orange">미답변</span>
          </div>
          <div class="title">정기 후원 신청 방법</div>
          <div class="content">정기 후원을 신청하고 싶은데 방법을 알려주세요.</div>
          <div class="meta">
            <span>문의자: 박**</span>
            <span>parks**@example.com</span>
          </div>
        </div>
        <div class="right">
          <span class="time">2024.01.24 09:20</span>
          <button class="btn primary">답변하기</button>
        </div>
      </li>

      <!-- 카드 3 -->
      <li class="card" data-cat="입양문의" data-status="pending" data-time="2024-01-23T11:30:00">
        <div class="bar cat-입양문의"></div>
        <div>
          <div class="topline">
            <span class="badge b-red">입양문의</span>
            <span class="badge b-orange">미답변</span>
            <span class="badge b-gray">첨부</span>
          </div>
          <div class="title">나비 건강 상태 문의</div>
          <div class="content">나비의 최근 건강 상태와 필요한 치료에 대해 자세히 알고 싶습니다.</div>
          <div class="meta">
            <span>문의자: 장**</span>
            <span>jungs**@example.com</span>
          </div>
        </div>
        <div class="right">
          <span class="time">2024.01.23 11:30</span>
          <button class="btn primary">답변하기</button>
        </div>
      </li>

      <!-- 카드 4 -->
      <li class="card" data-cat="봉사문의" data-status="done" data-time="2024-01-24T10:15:00" data-replied="2024-01-24T16:30:00">
        <div class="bar cat-봉사문의"></div>
        <div>
          <div class="topline">
            <span class="badge b-purple">봉사문의</span>
            <span class="badge b-green">답변완료</span>
          </div>
          <div class="title">주말 봉사활동 참여 문의</div>
          <div class="content">주말에 봉사활동에 참여하고 싶습니다. 어떤 절차를 거쳐야 하나요?</div>
          <div class="meta">
            <span>문의자: 이**</span>
            <span>lee****@example.com</span>
            <span>010-2345-6789</span>
          </div>
          <div class="reply">답변: 2024.01.24 16:30 (관리자)</div>
        </div>
        <div class="right">
          <span class="time">2024.01.24 10:15</span>
          <button class="btn">보기</button>
        </div>
      </li>

      <!-- 카드 5 -->
      <li class="card" data-cat="기타" data-status="done" data-time="2024-01-23T15:45:00" data-replied="2024-01-23T18:20:00">
        <div class="bar cat-기타"></div>
        <div>
          <div class="topline">
            <span class="badge b-blue">기타</span>
            <span class="badge b-green">답변완료</span>
          </div>
          <div class="title">보호소 방문 시간 문의</div>
          <div class="content">직접 보호소를 방문해서 동물들을 보고 싶은데 방문 가능한 시간이 언제인가요?</div>
          <div class="meta">
            <span>문의자: 최**</span>
            <span>choimy**@example.com</span>
            <span>010-4567-8901</span>
          </div>
          <div class="reply">답변: 2024.01.23 18:20 (관리자)</div>
        </div>
        <div class="right">
          <span class="time">2024.01.23 15:45</span>
          <button class="btn">보기</button>
        </div>
      </li>

      <!-- 카드 6 -->
      <li class="card" data-cat="기타" data-status="done" data-time="2024-01-22T20:15:00" data-replied="2024-01-23T09:00:00">
        <div class="bar cat-기타"></div>
        <div>
          <div class="topline">
            <span class="badge b-blue">기타</span>
            <span class="badge b-green">답변완료</span>
          </div>
          <div class="title">홈페이지 오류 신고</div>
          <div class="content">동물 프로필 페이지에서 사진이 제대로 로드되지 않는 문제가 있습니다.</div>
          <div class="meta">
            <span>문의자: 한**</span>
            <span>harjs**@example.com</span>
          </div>
          <div class="reply">답변: 2024.01.23 09:00 (기술팀)</div>
        </div>
        <div class="right">
          <span class="time">2024.01.22 20:15</span>
          <button class="btn">보기</button>
        </div>
      </li>
    </ul>
  </div>
  <script src="${pageContext.request.contextPath}/assets/js/shelter/qna/list.js"></script>
</main>
</body>
</html>
