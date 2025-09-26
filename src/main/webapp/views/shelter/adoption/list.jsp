<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>입양 신청서 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/animal/adopt_list.css">
</head>
<body>
<div class="wrap">
  <div class="page-head">
    <h1>입양 신청서 관리</h1>
    <p class="sub">접수된 입양 신청서를 확인하고 관리하세요</p>
  </div>

  <!-- counters -->
  <div class="stats">
    <div class="stat">
      <div class="label">전체 신청</div>
      <div class="num"><span class="dot">🗂️</span><span id="cntTotal">0</span></div>
    </div>
    <div class="stat">
      <div class="label">심사 대기</div>
      <div class="num"><span class="dot">🕒</span><span id="cntWait">0</span></div>
    </div>
    <div class="stat">
      <div class="label">승인 완료</div>
      <div class="num"><span class="dot">✅</span><span id="cntOk">0</span></div>
    </div>
  </div>

  <!-- toolbar -->
  <div class="toolbar">
    <input id="search" type="text" placeholder="신청자명, 동물명으로 검색...">
    <select id="statusFilter" aria-label="상태">
      <option value="전체">전체</option>
      <option value="승인">승인</option>
      <option value="거절">거절</option>
      <option value="보류">보류</option>
      <option value="대기">대기</option>
    </select>
    <select id="sorter" aria-label="정렬">
      <option value="status">상태순</option>
      <option value="date">신청일순</option>
    </select>
  </div>

  <!-- list -->
  <ul id="list" class="list">
    <!-- 1 -->
    <li class="card" data-status="대기" data-date="2024-01-25T14:30:00" data-name="김**" data-pet="초코">
      <div class="left"><img src="https://picsum.photos/seed/dog1/96/96" alt="초코"></div>
      <div class="mid">
        <div class="line1">
          <span class="name">김**</span>
          <span class="pet">· 초코 (3살)</span>
        </div>
        <div class="title">아이들이 동물을 너무 좋아해서 입양을 결정했습니다.</div>
        <div class="snippet">가족과 상의 끝에 반려동물 입양을 결정했고, 평일에는 보호자가 재택근무 중이라 돌봄 공백이 크지 않습니다. 아파트 거주, 실내 배변 훈련 경험 있습니다.</div>
        <div class="meta">신청일: 2024.01.25 14:30 · 주거형태: 아파트 · 근무시간: 9–18시</div>
      </div>
      <div class="right">
        <button class="btn">상세보기</button>
        <button class="btn dark">연락하기</button>
      </div>
    </li>

    <!-- 2 -->
    <li class="card" data-status="대기" data-date="2024-01-24T16:45:00" data-name="범**" data-pet="호프">
      <div class="left"><img src="https://picsum.photos/seed/dog2/96/96" alt="호프"></div>
      <div class="mid">
        <div class="line1">
          <span class="name">범**</span>
          <span class="pet">· 호프 (2살)</span>
        </div>
        <div class="title">반려동물을 함께 살고 싶어서 신청했습니다.</div>
        <div class="snippet">반려경험은 없지만 충분한 시간을 투자해 기본 교육부터 차근차근 배우고자 합니다. 단독주택 거주, 실외 활동을 자주 합니다.</div>
        <div class="meta">신청일: 2024.01.24 16:45 · 주거형태: 단독주택 · 근무지: 재택근무</div>
      </div>
      <div class="right">
        <button class="btn">상세보기</button>
        <button class="btn dark">연락하기</button>
      </div>
    </li>

    <!-- 3 -->
    <li class="card" data-status="보류" data-date="2024-01-23T10:20:00" data-name="이**" data-pet="초롱">
      <div class="left"><img src="https://picsum.photos/seed/dog3/96/96" alt="초롱"></div>
      <div class="mid">
        <div class="line1">
          <span class="name">이**</span>
          <span class="pet">· 초롱 (2살)</span>
        </div>
        <div class="title">가족 모두가 동물을 키우고 싶어합니다.</div>
        <div class="snippet">아이들과 충분한 시간을 보낼 수 있는 환경이며, 가정방문 일정 조율 가능합니다. 빌라 거주, 반려경험 없음.</div>
        <div class="meta">신청일: 2024.01.23 10:20 · 거주형태: 빌라</div>
      </div>
      <div class="right">
        <button class="btn">상세보기</button>
        <button class="btn dark">연락하기</button>
      </div>
    </li>

    <!-- 4 -->
    <li class="card" data-status="승인" data-date="2024-01-22T13:15:00" data-name="정**" data-pet="장복">
      <div class="left"><img src="https://picsum.photos/seed/dog4/96/96" alt="장복"></div>
      <div class="mid">
        <div class="line1">
          <span class="name">정**</span>
          <span class="pet">· 장복 (1살)</span>
        </div>
        <div class="title">혼자 살면서 반려동물과 함께하고 싶습니다.</div>
        <div class="snippet">성묘 입양 경험이 있으며 근거리 동물병원 이용이 편리합니다. 주 2회 산책 가능, 주거 환경 안정적입니다.</div>
        <div class="meta">신청일: 2024.01.22 13:15 · 주거형태: 아파트</div>
      </div>
      <div class="right">
        <button class="btn">상세보기</button>
        <button class="btn dark">연락하기</button>
      </div>
    </li>

    <!-- 5 -->
    <li class="card" data-status="거절" data-date="2024-01-21T09:05:00" data-name="박**" data-pet="모카">
      <div class="left"><img src="https://picsum.photos/seed/dog5/96/96" alt="모카"></div>
      <div class="mid">
        <div class="line1">
          <span class="name">박**</span>
          <span class="pet">· 모카 (4살)</span>
        </div>
        <div class="title">근무 시간으로 돌봄 공백 우려로 반려되었습니다.</div>
        <div class="snippet">현재는 장시간 외출이 많으나, 추후 근무 형태가 바뀌면 다시 신청하고 싶습니다.</div>
        <div class="meta">신청일: 2024.01.21 09:05</div>
      </div>
      <div class="right">
        <button class="btn">상세보기</button>
        <button class="btn dark">연락하기</button>
      </div>
    </li>
  </ul>
</div>

<script defer src="${pageContext.request.contextPath}/assets/js/shelter/animal/adopt_list.js"></script>
</body>
</html>
