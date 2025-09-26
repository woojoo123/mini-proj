<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>설정 - 보안</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <style>
  /* ===== 토큰 / 베이스 ===== */
  *,*::before,*::after{ box-sizing:border-box }
  html,body{ margin:0; padding:0 }
  img{ max-width:100%; display:block }
  a{ text-decoration:none; color:inherit }
  button,input,select,textarea{ font:inherit }

  :root{
    --bg:#F6F4F0;
    --surface:#FFFFFF;
    --text:#2B2B2B;
    --muted:#8B857E;
    --border:#E6E1DB;
    --shadow:0 4px 16px rgba(0,0,0,.06);

    --accent-bar:#FFF6E9;          /* 상단 탭 바 */
    --accent-pill:#FFFFFF;          /* 활성 탭 */
    --accent-pill-border:#EADFD0;

    --brand:#B08968;
    --brand-strong:#8C6A4E;

    --row-bg:#FFF7EA;               /* 최근 로그인 행 배경 */
    --row-border:#F4E6D1;

    --toggle-track:#E9E4DD;
    --toggle-on:#B39B84;

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
    height:36px; display:flex; align-items:center;
    font-weight:800; color:#6B6460; margin-bottom:8px;
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
    background:var(--danger); color:#fff; font-weight:800; font-size:12px;
  }
  /* 현재 위치: '설정'을 옅은 갈색으로 강조 */
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
  /* 4번째 탭(보안) 활성 */
  section > div:first-of-type nav a:nth-child(4){
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
  article > div{
    display:flex; flex-direction:column; gap:14px;
  }

  /* --- 최근 로그인 기록 블록 --- */
  /* 구조: div(블록) > div(제목) + div(리스트) */
  article > div > div:first-child > div:first-child{
    font-weight:800; color:var(--text); margin-bottom:10px;
  }
  article > div > div:first-child > div:last-child{
    display:flex; flex-direction:column; gap:8px;
    border:1px solid var(--border); border-radius:12px; overflow:hidden;
  }
  /* 각 행 */
  article > div > div:first-child > div:last-child > div{
    display:grid; grid-template-columns:1fr auto; align-items:center;
    padding:12px 14px; background:var(--row-bg); border-bottom:1px solid var(--row-border);
  }
  article > div > div:first-child > div:last-child > div:last-child{
    border-bottom:none;
  }
  /* 좌측(제목/서브텍스트) */
  article > div > div:first-child > div:last-child > div > div{
    display:flex; flex-direction:column; gap:4px;
  }
  article > div > div:first-child > div:last-child > div > div > div:first-child{
    font-weight:800; color:var(--text);
  }
  article > div > div:first-child > div:last-child > div > div > div:last-child{
    color:var(--muted); font-size:13.5px;
  }
  /* 우측 시간 */
  article > div > div:first-child > div:last-child > div > span{
    color:#AC9E8E; font-size:13.5px; white-space:nowrap;
  }

  /* --- 새 기기 로그인 알림 행 (한 줄) --- */
  /* 구조: article > div > div:nth-child(2) : 좌(제목+설명) + 우(토글) */
  article > div > div:nth-child(2){
    display:grid; grid-template-columns:1fr auto; align-items:center;
    gap:12px; padding:12px 6px; border-top:1px solid var(--border);
  }
  article > div > div:nth-child(2) > div:first-child{
    display:flex; flex-direction:column; gap:6px;
  }
  article > div > div:nth-child(2) > div:first-child > div:first-child{ font-weight:800 }
  article > div > div:nth-child(2) > div:first-child > div:last-child{
    color:var(--muted); font-size:13.5px;
  }

  /* --- 로그아웃 영역 --- */
  article > div > div:nth-child(3){
    display:flex; flex-direction:column; gap:8px; margin-top:4px;
  }
  article > div > div:nth-child(3) > button{
    align-self:flex-start;
    height:40px; padding:0 18px; border-radius:10px; cursor:pointer;
    background:var(--danger-soft); color:var(--danger-text);
    border:1px solid var(--danger-border); font-weight:900;
    box-shadow:0 2px 8px rgba(0,0,0,.05);
  }
  article > div > div:nth-child(3) > button:hover{ filter:brightness(1.02) }
  article > div > div:nth-child(3) > p{
    margin:0; color:#9A948E; font-size:13.5px;
  }

  /* ===== 스위치(체크박스 커스텀) ===== */
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
  input[type="checkbox"]:checked{
    background:var(--toggle-on); border-color:#9D8A77;
  }
  input[type="checkbox"]:checked::after{ left:22px; }

  /* ===== 반응형 ===== */
  @media (max-width:960px){
    main > div{ grid-template-columns:1fr; gap:24px; }
  }
  @media (max-width:560px){
    article > div > div:first-child > div:last-child > div{
      grid-template-columns:1fr; row-gap:6px;
    }
    article > div > div:nth-child(3) > button{ width:100%; align-self:stretch; }
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
        <h3>보안 설정</h3>

        <div>
          <!-- 최근 로그인 기록 -->
          <div>
            <div>최근 로그인 기록</div>
            <div>
              <div>
                <div>
                  <div>현재 세션</div>
                  <div>Chrome · 서울, 대한민국</div>
                </div>
                <span>지금</span>
              </div>

              <div>
                <div>
                  <div>모바일 앱</div>
                  <div>iPhone · 서울, 대한민국</div>
                </div>
                <span>2시간 전</span>
              </div>
            </div>
          </div>

          <!-- 새 기기 로그인 알림 -->
          <div>
            <div>
              <div>새 기기 로그인 알림</div>
              <div>새로운 기기에서 로그인할 때 알림</div>
            </div>
            <span><input type="checkbox"></span>
          </div>

          <!-- 로그아웃 버튼 -->
          <div>
            <button type="button">모든 세션에서 로그아웃</button>
            <p>다른 모든 기기에서 로그아웃됩니다.</p>
          </div>
        </div>
      </article>
    </section>
  </div>
</main>

