<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>설정 - 알림</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <style>
  /* ========= 토큰 / 베이스 ========= */
  *,*::before,*::after{ box-sizing:border-box }
  html,body{ margin:0; padding:0 }
  img{ max-width:100%; display:block }
  a{ color:inherit; text-decoration:none }
  button,input,select,textarea{ font:inherit }
  :root{
    --bg:#F6F4F0;
    --surface:#FFFFFF;
    --text:#2B2B2B;
    --text-muted:#88847E;
    --border:#E6E1DB;
    --shadow:0 4px 16px rgba(0,0,0,.06);

    --accent-bar:#FFF6E9;          /* 상단 탭 바 배경 */
    --accent-pill:#FFFFFF;          /* 활성 탭 */
    --accent-pill-border:#EADFD0;

    --brand:#B08968;
    --brand-strong:#8C6A4E;

    --toggle-track:#E9E4DD;
    --toggle-on:#B39B84;            /* 켜짐(회색+베이지) */
    --toggle-on-soft:#EEDFC9;       /* 소프트 케이스 */

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

  /* ========= 레이아웃 ========= */
  main > div{
    max-width:1280px;
    margin:0 auto;
    padding:24px;
    display:grid;
    grid-template-columns:240px 1fr;
    gap:32px;
  }

  /* ========= 사이드바 ========= */
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
  /* 배지 */
  aside a span{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:22px; height:22px; padding:0 6px; border-radius:999px;
    background:#E86060; color:#fff; font-weight:800; font-size:12px;
  }
  /* 현재 페이지: '설정' 강조 (href로 매칭) */
  aside a[href$="settings-profile.jsp"]{
    background:#EDE3D8;
    color:#5E4B3C;
    border:1px solid #E2D4C4;
  }

  /* ========= 본문 헤더 + 탭 ========= */
  section > div:first-of-type{
    display:flex; flex-direction:column; gap:12px; margin-bottom:18px;
  }
  section > div:first-of-type h1{
    font-size:22px; font-weight:800;
  }
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
  /* 3번째 탭(알림) 활성 */
  section > div:first-of-type nav a:nth-child(3){
    background:var(--accent-pill);
    border:1px solid var(--accent-pill-border);
    box-shadow:0 2px 8px rgba(0,0,0,.06);
    color:var(--text);
  }

  /* ========= 카드(알림 설정) ========= */
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

  /* 목록 래퍼 */
  article > div{
    display:flex; flex-direction:column; gap:8px;
  }

  /* 행: 좌(타이틀/설명) + 우(스위치) */
  article > div > div{
    display:grid; grid-template-columns: 1fr auto; align-items:center;
    gap:12px; padding:10px 8px; border-radius:12px;
  }
  article > div > div:hover{
    background:#FAF7F1;
  }
  /* 좌측: 제목 + 설명(스샷의 연한 회색) */
  article > div > div > div:first-child{
    display:flex; flex-direction:column; gap:4px;
    color:var(--text);
    font-weight:700;
  }
  article > div > div > div:first-child small{
    color:var(--text-muted); font-weight:500;
  }

  /* ========= 스위치(체크박스 커스텀) ========= */
  input[type="checkbox"]{
    appearance:none; -webkit-appearance:none; outline:none;
    width:46px; height:28px; border-radius:999px; cursor:pointer;
    background:var(--toggle-track);
    border:1px solid var(--border);
    position:relative; transition:.18s ease;
  }
  input[type="checkbox"]::after{
    content:""; position:absolute; top:2px; left:2px;
    width:22px; height:22px; border-radius:999px; background:#fff;
    box-shadow:0 1px 2px rgba(0,0,0,.12); transition:.18s ease;
  }
  /* 기본 ON 스타일(진한 톤) */
  input[type="checkbox"]:checked{
    background:var(--toggle-on);
    border-color:#9D8A77;
  }
  input[type="checkbox"]:checked::after{ left:22px; }

  /* 항목별 색감(스샷처럼 살짝씩 다르게) */
  /* 공지사항(1행) — 기본(진한) */
  /* 입양 정보(2행) — 기본(진한) */
  /* 활동글(3행) — 소프트 톤 */
  article > div > div:nth-child(3) input[type="checkbox"]:checked{
    background:var(--toggle-on-soft); border-color:#E2D3BE;
  }
  /* 블로그 글(4행) — 더 소프트 */
  article > div > div:nth-child(4) input[type="checkbox"]:checked{
    background:#F4E6D3; border-color:#E8D7BF;
  }
  /* 시스템 알림(5행) — 기본(진한) */

  /* ========= 반응형 ========= */
  @media (max-width:960px){
    main > div{ grid-template-columns:1fr; gap:24px; }
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
        <h3>알림 설정</h3>

        <div>
          <div>
            <div>
              공지사항
              <small>중요한 공지사항 알림</small>
            </div>
            <div><label><input type="checkbox" checked></label></div>
          </div>

          <div>
            <div>
              입양 정보
              <small>새로운 입양 공고 알림</small>
            </div>
            <div><label><input type="checkbox" checked></label></div>
          </div>

          <div>
            <div>
              활동글
              <small>팔로우한 보호소의 활동글 알림</small>
            </div>
            <div><label><input type="checkbox"></label></div>
          </div>

          <div>
            <div>
              블로그 글
              <small>팔로우한 보호소의 블로그 글 알림</small>
            </div>
            <div><label><input type="checkbox"></label></div>
          </div>

          <div>
            <div>
              시스템 알림
              <small>시스템 업데이트 및 중요 안내</small>
            </div>
            <div><label><input type="checkbox" checked></label></div>
          </div>
        </div>
      </article>
    </section>
  </div>
</main>
</body>
</html>

