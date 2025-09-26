<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>알림 관리</title>
<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/shelter/animal/alert_list.css"></link>
</head>
<body>
    <main>
  <div class="wrap">
    <header class="head">
      <h1>알림 관리</h1>
      <p class="sub">보호소 활동 알림을 확인하고 관리하세요 · <span class="pill"><span id="unreadCnt">0</span>개 미읽음</span></p>
    </header>

    <div class="toolbar">
      <input id="searchInput" type="text" placeholder="알림 검색..." />
      <select id="categoryFilter">
        <option value="all">전체</option>
        <option value="입양">입양</option>
        <option value="봉사">봉사</option>
        <option value="후원">후원</option>
        <option value="문의">문의</option>
        <option value="긴급">긴급</option>
      </select>
      <select id="readFilter">
        <option value="all">전체</option>
        <option value="read">읽음</option>
        <option value="unread">안읽음</option>
      </select>
    </div>

    <ul id="alertList" class="list">
      <li class="card unread" data-cat="입양" data-read="unread">
        <div class="left ico adoption">입</div>
        <div class="mid">
          <div class="top"><span class="badge badge-blue">입양신청</span></div>
          <div class="title">새로운 입양 신청이 접수되었습니다</div>
          <div class="desc">초코에 대한 입양 신청서가 제출되었습니다. (신청자: 김**)</div>
        </div>
        <div class="right"><time class="time">10분 전</time><button class="more" title="더보기">⋯</button></div>
      </li>

      <li class="card unread" data-cat="긴급" data-read="unread">
        <div class="left ico emergency">긴</div>
        <div class="mid">
          <div class="top"><span class="badge badge-red">긴급</span></div>
          <div class="title">응급 상황 발생</div>
          <div class="desc">나비가 간헐성 이상 증상을 보이고 있습니다.</div>
        </div>
        <div class="right"><time class="time">25분 전</time><button class="more" title="더보기">⋯</button></div>
      </li>

      <li class="card read" data-cat="후원" data-read="read">
        <div class="left ico donation">후</div>
        <div class="mid">
          <div class="top"><span class="badge badge-green">후원</span></div>
          <div class="title">정기 후원이 완료되었습니다</div>
          <div class="desc">박희정님 월 5만원 정기 후원이 결제되었습니다.</div>
        </div>
        <div class="right"><time class="time">1시간 전</time><button class="more" title="더보기">⋯</button></div>
      </li>

      <li class="card read" data-cat="봉사" data-read="read">
        <div class="left ico volunteer">봉</div>
        <div class="mid">
          <div class="top"><span class="badge badge-purple">봉사신청</span></div>
          <div class="title">주말 봉사활동 신청이 접수되었습니다</div>
          <div class="desc">이창준님이 1월 27일 봉사활동에 신청하셨습니다.</div>
        </div>
        <div class="right"><time class="time">2시간 전</time><button class="more" title="더보기">⋯</button></div>
      </li>
    </ul>
  </div>
  <script defer src="${pageContext.request.contextPath}/assets/js/shelter/animal/alert_list.js"></script>
</main>
</body>
</html>
