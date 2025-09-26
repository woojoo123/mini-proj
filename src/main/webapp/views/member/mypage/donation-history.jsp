<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>후원 내역</title>
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
    --muted:#8B857E;
    --border:#E6E1DB;
    --shadow:0 4px 16px rgba(0,0,0,.06);

    --brand:#B08968;
    --brand-strong:#8C6A4E;

    --stat-bg:#FCFAF7;
    --pill-green:#DDF5E6;        /* 정기후원 */
    --pill-green-text:#2E8B57;
    --pill-gray:#EEEFF2;         /* 일시후원 */
    --pill-gray-text:#6B7280;

    --accent-icon:#7ACB91;       /* 리스트 아이콘 상자 */
    --accent-icon-border:#CBEBD7;

    --radius-xl:16px;
    --radius-lg:12px;
  }

  body{
    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
  }
  h1,h2,h3,h4{ margin:0 }

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
  aside > div{ height:36px; margin-bottom:8px }
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
  /* 현재 메뉴 강조(후원 내역) */
  aside a[href="donation-history.jsp"]{
    background:#9B8978; color:#fff;
  }

  /* ===== 페이지 타이틀 ===== */
  section > h1{
    font-size:24px; font-weight:800; margin:0 0 14px 0;
  }

  /* ===== 통계 카드 그리드 =====
     구조: section > div:nth-of-type(1) > article (4개) */
  section > div:nth-of-type(1){
    display:grid; grid-template-columns:repeat(4,minmax(0,1fr));
    gap:12px; margin-bottom:16px;
  }
  section > div:nth-of-type(1) article{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:12px;
    box-shadow:var(--shadow);
    padding:12px 14px;
  }
  section > div:nth-of-type(1) article h4{
    font-size:12.5px; letter-spacing:.2px;
    color:#8E857C; font-weight:800; margin-bottom:6px;
  }
  section > div:nth-of-type(1) article > div{
    font-size:22px; font-weight:900;
    color:#2C2C2C;
  }

  /* ===== 후원 리스트 =====
     구조: section > div:nth-of-type(2) > article */
  section > div:nth-of-type(2){
    display:flex; flex-direction:column; gap:12px;
  }
  section > div:nth-of-type(2) article{
    position:relative;
    display:grid; grid-template-columns:1fr auto auto auto; align-items:center;
    gap:16px;
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:14px;
    box-shadow:var(--shadow);
    padding:14px 16px 14px 64px; /* 아이콘 상자 공간 */
  }
  /* 좌측 아이콘 상자 */
  section > div:nth-of-type(2) article::before{
    content:"₩";
    position:absolute; left:16px; top:50%; transform:translateY(-50%);
    width:36px; height:36px; border-radius:10px;
    display:flex; align-items:center; justify-content:center;
    background:var(--pill-green); color:#267A4C; font-weight:900;
    border:1px solid var(--accent-icon-border);
    box-shadow:0 1px 3px rgba(0,0,0,.04);
  }

  /* 첫 열(보호소명/설명) */
  section > div:nth-of-type(2) article > div:first-child{
    display:flex; flex-direction:column; gap:4px;
  }
  section > div:nth-of-type(2) article > div:first-child strong{
    font-size:15.5px; font-weight:900; color:#2b2b2b;
    display:inline-flex; align-items:center; gap:8px;
  }
  section > div:nth-of-type(2) article > div:first-child > div{
    color:#8F8A83; font-size:13.5px;
  }

  /* 보호소명 옆 배지: 1행=정기후원(초록), 2행=일시후원(회색) */
  section > div:nth-of-type(2) article:nth-child(1) strong::after{
    content:"정기후원";
    margin-left:6px; padding:4px 8px; border-radius:999px;
    background:var(--pill-green); color:var(--pill-green-text);
    border:1px solid #CBEBD7; font-size:12px; font-weight:800;
  }
  section > div:nth-of-type(2) article:nth-child(2) strong::after{
    content:"일시후원";
    margin-left:6px; padding:4px 8px; border-radius:999px;
    background:var(--pill-gray); color:var(--pill-gray-text);
    border:1px solid #E3E5EA; font-size:12px; font-weight:800;
  }

  /* 금액/날짜 */
  section > div:nth-of-type(2) article > div:nth-child(2){
    font-weight:900; color:#2c2c2c;
  }
  section > div:nth-of-type(2) article > div:nth-child(3){
    color:#9AA0A6; font-size:13.5px; white-space:nowrap;
  }

  /* 우측 버튼(영수증) */
  section > div:nth-of-type(2) article > div:last-child{
    display:flex; justify-content:flex-end;
  }
  section > div:nth-of-type(2) article > div:last-child > button{
    height:34px; padding:0 12px; border-radius:10px; cursor:pointer;
    background:#fff; color:#4B4B4B;
    border:1px solid var(--border); font-weight:800;
    display:inline-flex; align-items:center; gap:8px;
  }
  section > div:nth-of-type(2) article > div:last-child > button::before{
    content:"⬇️"; font-size:14px;
  }
  section > div:nth-of-type(2) article > div:last-child > button:hover{
    background:rgba(0,0,0,.04);
  }

  /* 반응형 */
  @media (max-width:1080px){
    section > div:nth-of-type(1){ grid-template-columns:repeat(2,minmax(0,1fr)) }
  }
  @media (max-width:960px){
    main > div{ grid-template-columns:1fr; gap:24px; }
  }
  @media (max-width:600px){
    section > div:nth-of-type(1){ grid-template-columns:1fr }
    section > div:nth-of-type(2) article{
      grid-template-columns:1fr auto; row-gap:6px;
    }
    section > div:nth-of-type(2) article > div:nth-child(3){
      grid-column:1/2; order:3;
    }
    section > div:nth-of-type(2) article > div:last-child{
      grid-column:2/3; order:4; justify-content:flex-end;
    }
  }
  </style>
</head>
<body>
<main>
  <div>

    <aside>
      <div></div>
      <ul>
        <li><a href="dashboard.jsp">한눈에 보기</a></li>
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
        <li><a href="#">설정</a></li>
      </ul>
    </aside>

    <section>
      <h1>후원 내역</h1>

      <!-- 통계 카드 4개 -->
      <div>
        <article><h4>이번 달 후원액</h4><div>₩80,000</div></article>
        <article><h4>올해 누적</h4><div>₩450,000</div></article>
        <article><h4>전체 누적</h4><div>₩1,250,000</div></article>
        <article><h4>정기 후원</h4><div>3개</div></article>
      </div>

      <!-- 후원 내역 리스트 -->
      <div>
        <article>
          <div><strong>행복보호소</strong><div>사료 및 간식</div></div>
          <div>₩50,000</div>
          <div>2024.01.25</div>
          <div><button type="button">영수증</button></div>
        </article>

        <article>
          <div><strong>사랑보호소</strong><div>겨울점퍼 구매</div></div>
          <div>₩30,000</div>
          <div>2024.01.15</div>
          <div><button type="button">영수증</button></div>
        </article>
      </div>
    </section>

  </div>
</main>
</body>
</html>

