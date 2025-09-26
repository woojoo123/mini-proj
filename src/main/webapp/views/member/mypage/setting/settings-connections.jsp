<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>설정 - 연동</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <style>
  /* ===== 토큰 / 베이스 ===== */
  *,*::before,*::after{ box-sizing:border-box }
  html,body{ margin:0; padding:0 }
  a{ color:inherit; text-decoration:none }
  button,input,select,textarea{ font:inherit }
  img{ max-width:100%; display:block }

  :root{
    --bg:#F6F4F0;
    --surface:#FFFFFF;
    --text:#2B2B2B;
    --muted:#88847E;
    --border:#E6E1DB;
    --shadow:0 4px 16px rgba(0,0,0,.06);

    --accent-bar:#FFF6E9;          /* 상단 탭 바 배경 */
    --accent-pill:#FFFFFF;          /* 활성 탭 */
    --accent-pill-border:#EADFD0;

    --brand:#B08968;
    --brand-strong:#8C6A4E;

    --danger:#E86060;
    --danger-soft:#FCE9E9;
    --danger-border:#F5C3C3;
    --danger-text:#C84E4E;

    --radius-xl:16px;
    --radius-lg:12px;
  }

  body{
    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
  }
  h1,h2,h3{ margin:0 }

  /* ===== 레이아웃 ===== */
  main > div{
    max-width:1280px;
    margin:0 auto;
    padding:24px;
    display:grid;
    grid-template-columns:240px 1fr;
    gap:32px;
  }

  /* ===== 사이드바 ===== */
  aside{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:18px;
  }
  aside > div{
    height:36px; display:flex; align-items:center; font-weight:800; color:#6B6460; margin-bottom:8px;
  }
  aside ul{ list-style:none; margin:0; padding:0 }
  aside li{ margin:6px 0 }
  aside li ul{ margin-top:6px; margin-left:8px }
  aside a{
    display:flex; align-items:center; justify-content:space-between;
    padding:10px 12px; border-radius:12px; color:#6B6460;
  }
  aside a:hover{ background:rgba(0,0,0,.04); color:var(--text) }
  aside a span{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:22px; height:22px; padding:0 6px; border-radius:999px;
    background:#E86060; color:#fff; font-weight:800; font-size:12px;
  }
  /* 현재 위치: '설정' 강조 */
  aside a[href$="settings-profile.jsp"]{
    background:#EDE3D8; color:#5E4B3C; border:1px solid #E2D4C4;
  }

  /* ===== 본문 헤더 + 탭 ===== */
  section > div:first-of-type{
    display:flex; flex-direction:column; gap:12px; margin-bottom:18px;
  }
  section > div:first-of-type h1{ font-size:22px; font-weight:800 }
  section > div:first-of-type nav{
    background:var(--accent-bar);
    border:1px solid #F1E5D3;
    border-radius:14px;
    padding:6px;
    display:flex; gap:6px; flex-wrap:wrap;
  }
  section > div:first-of-type nav a{
    display:inline-flex; align-items:center; justify-content:center;
    padding:10px 18px; border-radius:10px;
    color:#6B6460; font-weight:700; font-size:14px;
  }
  /* 5번째 탭(연동) 활성 */
  section > div:first-of-type nav a:nth-child(5){
    background:var(--accent-pill);
    border:1px solid var(--accent-pill-border);
    box-shadow:0 2px 8px rgba(0,0,0,.06);
    color:var(--text);
  }

  /* ===== 카드 ===== */
  article{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:18px;
  }
  article > h3{
    font-size:16px; font-weight:800; margin-bottom:14px;
  }

  /* ===== 리스트 ===== */
  article > div{
    display:flex; flex-direction:column; gap:12px;
  }
  /* 행: 좌(프로바이더 아이콘/이름/상태) + 우(버튼) */
  article > div > div{
    display:grid; grid-template-columns:1fr auto; align-items:center;
    gap:12px; padding:14px;
    background:#fff; border:1px solid var(--border); border-radius:12px;
  }

  /* 좌측 묶음(아이콘 + 텍스트) */
  article > div > div > div:first-child{
    display:flex; align-items:center; gap:14px;
  }

  /* 아이콘 상자 (브랜드 배경 + 이미지) */
  .brand-icon{
    width:52px; height:52px;
    border-radius:12px;
    display:flex; align-items:center; justify-content:center;
    overflow:hidden; border:1px solid rgba(0,0,0,.06);
  }
  .brand-icon img{ width:28px; height:28px; object-fit:contain }

  /* 각 브랜드 배경 */
  .kakao{ background:#FFEB3B; }     /* 노란색 */
  .naver{ background:#03C754; }     /* 녹색 */
  .google{ background:#4285F4; }     /* 파란색 */

  /* 이름/상태 */
  .provider-info{ display:flex; flex-direction:column; gap:4px }
  .provider-info .name{ font-weight:800; color:var(--text) }
  .provider-info .status{ color:#9AA0A6; font-size:13.5px }

  /* ===== 버튼 ===== */
  .btn{
    height:36px; padding:0 14px; border-radius:10px; cursor:pointer;
    font-weight:800;
    background:#fff; color:#4B4B4B; border:1px solid var(--border);
  }
  .btn:hover{ filter:brightness(1.03) }
  /* ‘연동 해제’ (위험톤) */
  .btn-danger{
    background:var(--danger-soft);
    color:var(--danger-text);
    border:1px solid var(--danger-border);
    box-shadow:0 2px 8px rgba(0,0,0,.05);
  }
  /* ‘연동하기’ 기본 */
  .btn-outline{ background:#fff; border:1px solid var(--border); color:#5C5C5C }

  /* 반응형 */
  @media (max-width:960px){
    main > div{ grid-template-columns:1fr; gap:24px; }
  }
  @media (max-width:560px){
    article > div > div{ grid-template-columns:1fr; row-gap:8px; }
    .btn,.btn-danger,.btn-outline{ width:100% }
  }
  </style>
</head>
<body>
<main>
  <div>
    <aside>
      <div>동반자</div>
      <ul>
        <li><a href="../dashboard.jsp">한눈에 보기</a></li>
        <li><a href="../notice/notification-list.jsp">알림 <span>12</span></a></li>
        <li><a href="../adopt-list.jsp">입양 신청 내역</a></li>
        <li><a href="../volunteer-list.jsp">봉사 신청 내역</a></li>
        <li><a href="../donation-history.jsp">후원 내역</a></li>
        <li><a href="../follow-animals.jsp">팔로우 관리</a></li>
        <li>
          <a href="../shelter-management.jsp">보호소 관리</a>
          <ul>
            <li><a href="../shelter-notice-create.jsp">공지사항 등록</a></li>
            <li><a href="../shelter-timeline-create.jsp">타임라인 작성</a></li>
            <li><a href="../shelter-diary-create.jsp">보호일지 작성</a></li>
            <li><a href="../shelter-volunteer-schedule.jsp">봉사일정 등록</a></li>
          </ul>
        </li>
        <li><a href="../inquiry-list.jsp">1:1 문의</a></li>
        <li><a href="settings-profile.jsp">설정</a></li>
      </ul>
    </aside>

    <section>
      <div>
        <h1>설정</h1>
        <nav>
          <a href="settings-profile.jsp">프로필</a>
          <a href="settings-account.jsp">계정</a>
          <a href="settings-notifications.jsp">알림</a>
          <a href="settings-security.jsp">보안</a>
          <a href="settings-connections.jsp">연동</a>
          <a href="settings-withdraw.jsp">탈퇴</a>
        </nav>
      </div>

      <article>
        <h3>소셜 로그인 연동</h3>

        <div>
          <!-- Kakao -->
          <div>
            <div>
              <div class="brand-icon kakao">
                <img src="/member/img/kakao.png" alt="카카오">
              </div>
              <div class="provider-info">
                <div class="name">카카오</div>
                <div class="status">연동됨</div>
              </div>
            </div>
            <button type="button" class="btn btn-danger">연동 해제</button>
          </div>

          <!-- Naver -->
          <div>
            <div>
              <div class="brand-icon naver">
                <img src="/member/img/naver.png" alt="네이버">
              </div>
              <div class="provider-info">
                <div class="name">네이버</div>
                <div class="status">미연동</div>
              </div>
            </div>
            <button type="button" class="btn btn-outline">연동하기</button>
          </div>

          <!-- Google -->
          <div>
            <div>
              <div class="brand-icon google">
                <img src="/member/img/google.png" alt="구글">
              </div>
              <div class="provider-info">
                <div class="name">구글</div>
                <div class="status">미연동</div>
              </div>
            </div>
            <button type="button" class="btn btn-outline">연동하기</button>
          </div>
        </div>
      </article>
    </section>
  </div>
</main>
</body>
</html>

