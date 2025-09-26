<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>알림 상세</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <style>
  /* ========= 공용 토큰/베이스 (스코프 적용) ========= */
  .notification-detail *, .notification-detail *::before, .notification-detail *::after{ box-sizing:border-box; }
  .notification-detail img{ max-width:100%; display:block; }
  .notification-detail button, .notification-detail input, .notification-detail select, .notification-detail textarea{ font:inherit; }
  .notification-detail a{ text-decoration:none; color:inherit; }
  .notification-detail :focus-visible{ outline:2px solid #B08968; outline-offset:2px; }

  .notification-detail{
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

    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
    min-height:100dvh;
  }
  .notification-detail h1,.notification-detail h2,.notification-detail h3{ margin:0; }

  /* 레이아웃 */
  .notification-detail main > div{
    max-width:var(--maxw);
    margin:0 auto;
    padding:var(--gap-xl);
    display:grid;
    grid-template-columns:240px 1fr;
    gap:var(--gap-xxl);
  }

  /* 사이드바 */
  .notification-detail aside{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    padding:20px;
    box-shadow:var(--shadow-sm);
  }
  .notification-detail aside ul{ list-style:none; margin:0; padding:0; }
  .notification-detail aside li{ margin:6px 0; }
  .notification-detail aside li ul{ margin-top:6px; margin-left:8px; }
  .notification-detail aside a{
    display:flex; align-items:center; justify-content:space-between;
    padding:10px 12px; border-radius:10px; color:var(--text-muted);
  }
  .notification-detail aside a:hover{ background:rgba(0,0,0,.03); color:var(--text); }
  .notification-detail aside a.active{
    background:var(--accent); color:var(--brand-strong); border-left:4px solid var(--brand);
  }
  .notification-detail aside a span{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:20px; height:20px; padding:0 6px; border-radius:999px;
    background:var(--danger); color:#fff; font-weight:700; font-size:12px;
  }

  /* 반응형(사이드바 1열) */
  @media (max-width:960px){
    .notification-detail main > div{ grid-template-columns:1fr; gap:var(--gap-xl); }
  }

  /* ========= 알림 상세 전용 스타일 ========= */

  /* 페이지 제목 */
  .notification-detail section > div:first-of-type h1{
    font-size:22px; font-weight:700; margin:0 0 20px 0;
  }

  /* 상세 카드 */
  .notification-detail section > article{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow-sm);
    padding:18px;
  }

  /* 상단 헤더: 좌(분류+제목)/우(시간) */
  .notification-detail section > article > header{
    display:flex; align-items:center; justify-content:space-between;
    gap:12px; margin-bottom:14px;
  }

  /* 왼쪽 묶음: 분류 pill + 제목 */
  .notification-detail section > article > header > div:first-child{
    display:flex; align-items:center; gap:10px; flex-wrap:wrap;
  }

  /* 분류 pill */
  .notification-detail section > article > header > div:first-child > span{
    padding:4px 10px; border-radius:999px;
    background:#F7EFE7; border:1px solid #F0E3D7;
    color:#9A6F51; font-weight:600; font-size:13px;
  }

  /* 제목 */
  .notification-detail section > article > header h2{
    margin:0; font-size:18px; font-weight:800; letter-spacing:-.2px; color:var(--text);
  }

  /* 시간 */
  .notification-detail section > article > header > div:last-child{
    color:#9AA0A6; font-size:13.5px; white-space:nowrap;
  }

  /* 본문 */
  .notification-detail section > article > div{
    color:var(--text); font-size:15.5px; line-height:1.6;
  }
  .notification-detail section > article > div p{ margin:0 0 12px 0; }
  .notification-detail section > article > div a{
    display:inline-block; margin-top:4px;
    color:var(--brand); font-weight:600;
  }
  .notification-detail section > article > div a:hover{
    color:var(--brand-strong); text-decoration:underline;
  }

  /* 하단 버튼 */
  .notification-detail section > article > footer{
    margin-top:18px; display:flex; gap:8px; flex-wrap:wrap;
  }

  /* 기본 버튼 */
  .notification-detail section > article > footer button{
    height:36px; padding:0 14px; border-radius:10px;
    border:1px solid var(--border); background:#fff; cursor:pointer;
    font-weight:600; font-size:14px;
  }
  .notification-detail section > article > footer button:hover{ background:rgba(0,0,0,.03); }

  /* 삭제(위험) 버튼 */
  .notification-detail section > article > footer button:nth-of-type(2){
    background:#FAEAEA; border-color:#F2C0C0; color:#B94B4B;
  }
  .notification-detail section > article > footer button:nth-of-type(2):hover{
    background:#F6D9D9;
  }

  /* 목록 링크(유령 버튼) */
  .notification-detail section > article > footer a{
    height:36px; display:inline-flex; align-items:center;
    padding:0 12px; border-radius:10px; border:1px dashed var(--border);
    color:var(--text-muted); font-weight:600;
  }
  .notification-detail section > article > footer a:hover{
    color:var(--brand-strong); border-style:solid; background:#fff;
  }

  /* 좁은 화면 헤더 줄바꿈 */
  @media (max-width:640px){
    .notification-detail section > article{ padding:16px; }
    .notification-detail section > article > header{
      flex-direction:column; align-items:flex-start; gap:8px;
    }
    .notification-detail section > article > header h2{ font-size:17px; }
  }
  </style>
</head>

<body class="notification-detail">
<main>
  <div>

    <aside>
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
      <div><h1>알림 상세</h1></div>

      <!-- 카드 -->
      <article>
        <!-- 상단: 분류 · 제목 · 시간 -->
        <header>
          <div>
            <span>입양</span>
            <h2>입양 신청서가 승인되었습니다</h2>
          </div>
          <div>2시간 전</div>
        </header>

        <!-- 본문 -->
        <div>
          <p>행복보호소에서 입양 신청서가 승인되었습니다.</p>
          <a href="adopt-application-detail.html?id=55">입양 신청 #55 상세로 이동</a>
        </div>

        <!-- 하단 버튼 -->
        <footer>
          <button type="button">읽음 처리</button>
          <button type="button">삭제</button>
          <a href="notifications.jsp">목록</a>
        </footer>
      </article>
    </section>

  </div>
</main>
</body>
</html>

