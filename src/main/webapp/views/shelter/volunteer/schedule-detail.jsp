<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>봉사 일정 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/volunteer/schedule_viewdetails.css">
</head>
<body>
  <div class="container">
    <!-- Page header -->
    <div class="page-head">
      <button class="back" title="뒤로가기" onclick="history.back()">
        <!-- arrow-left -->
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M15 18l-6-6 6-6"/>
        </svg>
      </button>
      <div class="page-title">
        <h1>봉사 일정 상세</h1>
        <div class="sub">봉사 일정 정보를 확인하고 관리하세요</div>
      </div>
      <div class="head-actions">
        <button class="btn" type="button" aria-label="공유">
          <!-- share -->
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <circle cx="18" cy="5" r="3"></circle>
            <circle cx="6" cy="12" r="3"></circle>
            <circle cx="18" cy="19" r="3"></circle>
            <path d="M8.59 13.51l6.83 3.98M15.41 6.51L8.59 10.49"/>
          </svg>
          공유
        </button>
        <button class="btn" type="button">
          <!-- pencil -->
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M12 20h9"/>
            <path d="M16.5 3.5a2.12 2.12 0 1 1 3 3L7 19l-4 1 1-4 12.5-12.5z"/>
          </svg>
          수정
        </button>
        <button class="btn-danger btn" type="button">
          <!-- x -->
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M18 6L6 18M6 6l12 12"/>
          </svg>
          취소
        </button>
      </div>
    </div>

    <!-- Top info card -->
    <div class="card">
      <div class="card-head">
        <h3>주말 동물 돌봄 봉사</h3>
        <div class="chips">
          <span class="chip success">모집중</span>
          <span class="chip gray">글 등록</span>
        </div>
      </div>
      <div class="card-body">
        <!-- ✅ 깔끔한 정렬로 교체된 정보 영역 -->
        <div class="info">
          <!-- 기본 정보 -->
          <div class="section">
            <h4>기본 정보</h4>
            <div class="dl">
              <div class="dt">
                <!-- building -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 21V7a2 2 0 0 1 2-2h3V3h8v2h3a2 2 0 0 1 2 2v14"/><path d="M3 21h18"/><path d="M7 21v-4h4v4M13 21v-6h4v6"/></svg>
                모집기관:
              </div>
              <div class="dd">사랑보호소</div>

              <div class="dt">
                <!-- map-pin -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 21s-6-4.35-6-10a6 6 0 1 1 12 0c0 5.65-6 10-6 10z"/><circle cx="12" cy="11" r="2.5"/></svg>
                지역:
              </div>
              <div class="dd"><strong>서울특별시 강남구</strong></div>

              <div class="dt">
                <!-- users -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H7a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                봉사자유형:
              </div>
              <div class="dd">성인, 청소년</div>
            </div>

            <div class="divider"></div>

            <h4>일정 정보</h4>
            <div class="dl">
              <div class="dt">
                <!-- calendar -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M16 2v4M8 2v4M3 10h18"/></svg>
                날짜:
              </div>
              <div class="dd"><strong>2024.01.27</strong></div>

              <div class="dt">
                <!-- clock -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>
                시간:
              </div>
              <div class="dd"><strong>09:00 - 17:00</strong></div>
            </div>
          </div>

          <!-- 위치 정보 & 담당자 정보 -->
          <div class="section">
            <h4>위치 정보</h4>
            <div class="dl">
              <div class="dt">
                <!-- map -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 18l-6 3V6l6-3 6 3 6-3v15l-6 3-6-3z"/><path d="M9 3v15M15 6v15"/></svg>
                주소:
              </div>
              <div class="dd"><strong>서울시 강남구 테헤란로 123</strong></div>

              <div class="dt">
                <!-- home -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 12l9-9 9 9"/><path d="M9 21V9h6v12"/></svg>
                상세위치:
              </div>
              <div class="dd subtle">1층 보호소</div>
            </div>

            <div class="divider"></div>

            <h4>담당자 정보</h4>
            <div class="dl">
              <div class="dt">
                <!-- id -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="M7 8h8M7 12h10M7 16h6"/></svg>
                이름:
              </div>
              <div class="dd">김관리</div>

              <div class="dt">
                <!-- phone -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2A19.86 19.86 0 0 1 3.1 5.18 2 2 0 0 1 5.05 3h3a2 2 0 0 1 2 1.72c.1.75.25 1.49.45 2.2a2 2 0 0 1-.45 1.95l-1.27 1.27a16 16 0 0 0 6.88 6.88l1.27-1.27a2 2 0 0 1 1.95-.45c.71.2 1.45.35 2.2.45A2 2 0 0 1 22 16.92z"/></svg>
                전화:
              </div>
              <div class="dd">02-1234-5678</div>

              <div class="dt">
                <!-- mail -->
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 4h16v16H4z"/><path d="M22 6l-10 7L2 6"/></svg>
                이메일:
              </div>
              <div class="dd">manager@shelter.com</div>
            </div>
          </div>
        </div>
        <!-- /info -->
      </div>
    </div>

    <!-- 활동 상세 정보 -->
    <div class="card">
      <div class="card-head"><h3>활동 상세 정보</h3></div>
      <div class="card-body">
        <div class="block">
          <h5>활동내용</h5>
          <div class="muted">
            보호소 내 강아지들의 일상 돌봄, 산책, 놀이 활동을 도와주시게 됩니다.
            개별 강아지들과의 교감 시간을 가지며, 건강 상태 모니터링도 함께 진행합니다.
          </div>
        </div>
        <div class="block">
          <h5>준비물</h5>
          <div class="muted">편한 운동복, 운동화, 개인 물병, 간단한 간식(선택사항)</div>
        </div>
        <div class="block">
          <h5>유의사항</h5>
          <div class="muted">
            동물 알레르기가 있으신 분은 사전에 말씀해 주세요. 강아지들이 놀랄 수 있으니 큰 소리나
            급작스러운 움직임은 피해주세요.
          </div>
        </div>
      </div>
    </div>

    <!-- 모집 현황 -->
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="stat">모집 현황</div>
        </div>
        <div class="divider" style="margin:12px 0 10px"></div>
        <div class="row">
          <div class="grow">
            <span class="muted">참여 인원:</span> <strong>15명</strong> 중 <strong>8명</strong> 신청
          </div>
          <button class="btn" type="button" title="신청자 관리">
            <!-- users -->
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H7a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
            신청자 관리 (3명)
          </button>
          <div class="right-note">승인: 2명 / 대기: 1명</div>
        </div>
      </div>
    </div>

    <!-- 신청자 목록 -->
    <div class="card">
      <div class="list-head">
        <h3>신청자 목록</h3>
        <button class="ghost" type="button">전체 관리</button>
      </div>
      <div class="list">
        <!-- item -->
        <div class="item">
          <div class="item-main">
            <div class="name">김봉사</div>
            <div class="time">2024.01.16 09:00</div>
          </div>
          <div class="spacer"></div>
          <span class="badge ok">승인</span>
          <a class="tel" href="tel:0212345678" title="연락하기">
            <button class="btn-outline">
              <!-- phone -->
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2A19.86 19.86 0 0 1 3.1 5.18 2 2 0 0 1 5.05 3h3a2 2 0 0 1 2 1.72c.1.75.25 1.49.45 2.2a2 2 0 0 1-.45 1.95l-1.27 1.27a16 16 0 0 0 6.88 6.88l1.27-1.27a2 2 0 0 1 1.95-.45c.71.2 1.45.35 2.2.45A2 2 0 0 1 22 16.92z"/></svg>
              연락
            </button>
          </a>
        </div>

        <div class="item">
          <div class="item-main">
            <div class="name">이도움</div>
            <div class="time">2024.01.17 15:30</div>
          </div>
          <div class="spacer"></div>
          <span class="badge wait">대기</span>
          <a class="tel" href="tel:0212345678">
            <button class="btn-outline">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2A19.86 19.86 0 0 1 3.1 5.18 2 2 0 0 1 5.05 3h3a2 2 0 0 1 2 1.72c.1.75.25 1.49.45 2.2a2 2 0 0 1-.45 1.95l-1.27 1.27a16 16 0 0 0 6.88 6.88l1.27-1.27a2 2 0 0 1 1.95-.45c.71.2 1.45.35 2.2.45A2 2 0 0 1 22 16.92z"/></svg>
              연락
            </button>
          </a>
        </div>

        <div class="item">
          <div class="item-main">
            <div class="name">박나눔</div>
            <div class="time">2024.01.18 11:20</div>
          </div>
          <div class="spacer"></div>
          <span class="badge ok">승인</span>
          <a class="tel" href="tel:0212345678">
            <button class="btn-outline">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 0 1-2.18 2A19.86 19.86 0 0 1 3.1 5.18 2 2 0 0 1 5.05 3h3a2 2 0 0 1 2 1.72c.1.75.25 1.49.45 2.2a2 2 0 0 1-.45 1.95l-1.27 1.27a16 16 0 0 0 6.88 6.88l1.27-1.27a2 2 0 0 1 1.95-.45c.71.2 1.45.35 2.2.45A2 2 0 0 1 22 16.92z"/></svg>
              연락
            </button>
          </a>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
