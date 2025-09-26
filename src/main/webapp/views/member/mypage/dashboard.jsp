<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>   
  <meta charset="UTF-8" />
  <title>한눈에 보기</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <style>
  /* ===== dashboard page ===== */
  *,*::before,*::after{box-sizing:border-box}
  html,body{margin:0;padding:0}
  img{max-width:100%;display:block}
  button,input,select,textarea{font:inherit}
  a{text-decoration:none;color:inherit}
  :focus-visible{outline:2px solid #B08968; outline-offset:2px}

  /* 토큰 */
  :root{
    --bg:#F6F4F0;
    --surface:#FFFFFF;
    --brand:#B08968;
    --brand-strong:#8C6A4E;
    --text:#2B2B2B;
    --text-muted:#666666;
    --border:#E6E1DB;
    --accent:#F5E9DC;
    --danger:#E86060;
    --radius-xl:16px;
    --shadow-sm:0 1px 2px rgba(0,0,0,.05);
    --shadow-md:0 6px 18px rgba(0,0,0,.06);
    --gap-xxl:32px;
    --gap-xl:24px;
    --gap-lg:16px;
    --gap-md:12px;
    --gap-sm:8px;
    --maxw:1280px;
  }

  /* 기본 */
  body{
    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
  }
  h1,h2,h3{margin:0}

  /* 레이아웃: main > div 를 그리드 컨테이너로 사용 */
  main > div{
    max-width:var(--maxw);
    margin:0 auto;
    padding:var(--gap-xl);
    display:grid;
    grid-template-columns:240px 1fr;
    gap:var(--gap-xxl);
  }

  /* 사이드바 */
  aside{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    padding:20px;
    box-shadow:var(--shadow-sm);
  }
  aside > div{height:36px; margin-bottom:10px;} /* 로고/공백 자리 */

  aside ul{list-style:none;margin:0;padding:0}
  aside li{margin:6px 0}
  aside li ul{margin-top:6px;margin-left:8px}
  aside a{
    display:flex; align-items:center; justify-content:space-between;
    padding:10px 12px; border-radius:10px; color:var(--text-muted);
  }
  aside a:hover{background:rgba(0,0,0,.03); color:var(--text)}
  aside a.active{
    background:var(--accent);
    color:var(--brand-strong);
    border-left:4px solid var(--brand);
  }

  /* 사이드바 배지(알림 12) */
  aside a span{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:20px; height:20px; padding:0 6px;
    border-radius:999px;
    background:var(--danger); color:#fff; font-weight:700; font-size:12px;
  }

  /* 본문 타이틀 */
  section h1{
    font-size:22px; font-weight:700;
    margin-bottom:var(--gap-xl);
  }

  /* 통계 카드 그리드 */
  .stats-grid{
    display:grid;
    grid-template-columns:repeat(3, minmax(0,1fr));
    gap:var(--gap-xl);
  }

  /* 통계 카드 */
  .stat-card{
    position:relative;
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    padding:16px 16px 14px 16px;
    box-shadow:var(--shadow-sm);
    transition:transform .15s ease, box-shadow .15s ease, border-color .15s ease;
  }
  .stat-card:hover{
    transform:translateY(-2px);
    box-shadow:var(--shadow-md);
    border-color:transparent;
  }
  .stat-card h3{
    color:var(--text-muted);
    font-size:14px; font-weight:600;
    margin-bottom:8px;
    display:flex; align-items:center; gap:8px;
  }
  .stat-card .value{
    font-weight:800; font-size:22px;
    margin-bottom:8px;
  }
  .stat-card .icon{
    position:absolute; right:14px; top:12px;
    font-size:18px; opacity:.7;
  }
  .stat-card .link{
    display:inline-flex; align-items:center; gap:6px;
    color:var(--brand); font-weight:600; font-size:14px;
  }
  .stat-card .link:hover{color:var(--brand-strong)}

  /* 최근 활동 패널 */
  .recent-activities{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow-sm);
    padding:16px;
    margin-top:var(--gap-xxl);
  }
  .recent-activities h2{
    font-weight:700; font-size:18px;
    padding-bottom:12px; border-bottom:1px solid var(--border);
    margin-bottom:12px;
  }

  /* 탭(정적 표시용) */
  .tabs{display:flex; gap:8px; padding:4px 2px 10px}
  .tab{
    padding:6px 10px; border-radius:999px;
    border:1px solid var(--border);
    background:#fff; color:var(--text-muted);
    cursor:default;
  }
  .tab.active{
    background:var(--accent);
    color:var(--brand-strong);
    border-color:transparent;
  }

  /* 활동 리스트 */
  .activity-list{
    list-style:none; margin:0; padding:0;
    display:flex; flex-direction:column; gap:8px;
  }
  .activity-item{
    display:grid; grid-template-columns:1fr auto; align-items:center;
    border:1px solid var(--border); border-radius:12px;
    background:#fff; padding:10px 14px;
  }
  .activity-item:nth-child(even){
    background:color-mix(in srgb, var(--accent) 22%, #fff);
  }
  .activity-text{font-size:15px}
  .activity-time{color:var(--text-muted); font-size:14px}

  /* 반응형 */
  @media (max-width:1200px){
    .stats-grid{grid-template-columns:repeat(2, minmax(0,1fr))}
  }
  @media (max-width:960px){
    main > div{grid-template-columns:1fr; gap:var(--gap-xl)}
  }
  @media (max-width:640px){
    section h1{font-size:20px}
    .stats-grid{grid-template-columns:1fr}
    .activity-item{grid-template-columns:1fr}
    .activity-time{margin-top:6px}
  }
  </style>
</head>
<body>
<main>
  <div>
    <!-- 사이드바 -->
    <aside>
      <div></div>
      <ul>
        <li><a href="dashboard.jsp" class="active">한눈에 보기</a></li>
        <li><a href="notification-list.jsp">알림 <span>12</span></a></li>
        <li><a href="adopt-list.jsp">입양 신청 내역</a></li>
        <li><a href="volunteer-list.jsp">봉사 신청 내역</a></li>
        <li><a href="donation-history.jsp">후원 내역</a></li>
        <li><a href="follow-animals.jsp">팔로우 관리</a></li>
        <li>
          <a href="shelter-management.jsp">보호소 관리</a>
          <ul>
            <li><a href="shelter-notice-create.jsp">공지사항 등록</a></li>
            <li><a href="shelter-timeline-create.jsp">타임라인 작성</a></li>
            <li><a href="shelter-diary-create.jsp">보호일지 작성</a></li>
            <li><a href="shelter-volunteer-schedule.jsp">봉사일정 등록</a></li>
          </ul>
        </li>
        <li><a href="inquiry-list.jsp">1:1 문의</a></li>
        <li><a href="settings-profile.jsp">설정</a></li>
      </ul>
    </aside>

    <!-- 본문 -->
    <section>
      <h1>한눈에 보기</h1>

      <!-- 통계 카드 그리드 -->
      <div class="stats-grid">
        <div class="stat-card">
          <h3>미확인 알림</h3>
          <div class="value">12</div>
          <div class="icon" aria-hidden="true">🔔</div>
          <a href="notification-list.jsp" class="link">바로가기 →</a>
        </div>

        <div class="stat-card">
          <h3>진행 중 입양 신청</h3>
          <div class="value">2</div>
          <div class="icon" aria-hidden="true">❤️</div>
          <a href="adopt-list.jsp" class="link">바로가기 →</a>
        </div>

        <div class="stat-card">
          <h3>예정 봉사 일정</h3>
          <div class="value">1</div>
          <div class="icon" aria-hidden="true">📅</div>
          <a href="volunteer-list.jsp" class="link">바로가기 →</a>
        </div>

        <div class="stat-card">
          <h3>누적 후원액</h3>
          <div class="value">₩450,000</div>
          <div class="icon" aria-hidden="true">💰</div>
          <a href="donation-history.jsp" class="link">바로가기 →</a>
        </div>

        <div class="stat-card">
          <h3>팔로우 수</h3>
          <div class="value">8</div>
          <div class="icon" aria-hidden="true">👥</div>
          <a href="follow-animals.jsp" class="link">바로가기 →</a>
        </div>

        <div class="stat-card">
          <h3>미답변 문의</h3>
          <div class="value">0</div>
          <div class="icon" aria-hidden="true">💬</div>
          <a href="inquiry-list.jsp" class="link">바로가기 →</a>
        </div>
      </div>

      <!-- 최근 활동 -->
      <div class="recent-activities">
        <h2>최근 활동</h2>
        <div class="tabs" role="tablist" aria-label="최근 활동 카테고리">
          <button class="tab active" role="tab" aria-selected="true">알림</button>
          <button class="tab" role="tab" aria-selected="false">입양신청</button>
          <button class="tab" role="tab" aria-selected="false">봉사</button>
          <button class="tab" role="tab" aria-selected="false">후원</button>
        </div>
        <ul class="activity-list">
          <li class="activity-item">
            <div class="activity-text">새로운 입양 공고가 등록되었습니다</div>
            <div class="activity-time">2시간 전</div>
          </li>
          <li class="activity-item">
            <div class="activity-text">팔로우한 동물의 새 소식이 있습니다</div>
            <div class="activity-time">5일 전</div>
          </li>
        </ul>
      </div>
    </section>

  </div>
</main>
</body>
</html>

