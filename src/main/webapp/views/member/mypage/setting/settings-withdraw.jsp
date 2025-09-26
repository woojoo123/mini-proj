<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>설정 - 탈퇴</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <style>
  /* ===== 토큰 / 베이스 ===== */
  *,*::before,*::after{ box-sizing:border-box }
  html,body{ margin:0; padding:0 }
  img{ max-width:100%; display:block }
  a{ color:inherit; text-decoration:none }
  button,input,select,textarea{ font:inherit }
  :root{
    --bg:#F6F4F0;
    --surface:#FFFFFF;
    --text:#2B2B2B;
    --muted:#8B857E;
    --border:#E6E1DB;
    --shadow:0 4px 16px rgba(0,0,0,.06);

    --accent-bar:#FFF6E9;            /* 상단 탭 바 */
    --accent-pill:#FFFFFF;            /* 활성 탭 */
    --accent-pill-border:#EADFD0;

    --brand:#B08968;                  /* 프로젝트 톤 */
    --brand-strong:#8C6A4E;

    --danger:#E44B4B;                 /* 강조 빨강 */
    --danger-soft:#FDF1F1;            /* 연한 경고 배경 */
    --danger-border:#F2C7C7;          /* 카드 테두리 */
    --danger-btn:#DF3E3E;             /* 버튼 배경 */

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
  /* 6번째 탭(탈퇴) 활성 */
  section > div:first-of-type nav a:nth-child(6){
    background:var(--accent-pill);
    border:1px solid var(--accent-pill-border);
    box-shadow:0 2px 8px rgba(0,0,0,.06);
    color:var(--text);
  }

  /* ===== 카드 ===== */
  article{
    background:var(--surface);
    border:1px solid var(--danger-border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:18px;
  }
  article > h3{
    color:var(--danger); font-size:16px; font-weight:800; margin-bottom:12px;
  }

  /* 경고 상자 (연분홍) */
  article > div:first-of-type{
    background:var(--danger-soft);
    border-radius:12px;
    padding:16px;
    border:1px solid #F6DADA;
    margin-bottom:18px;
  }
  article > div:first-of-type > strong{
    display:block; color:var(--danger); margin-bottom:10px;
  }
  article > div:first-of-type ul{
    margin:0; padding-left:22px; color:#B33D3D; font-weight:700;
  }
  article > div:first-of-type li{ margin:8px 0 }

  /* 폼 블록 (비밀번호/동의/버튼) */
  article > div:last-of-type{
    display:flex; flex-direction:column; gap:14px;
  }
  /* 행: 좌 라벨 / 우 컨트롤 */
  article > div:last-of-type > div{
    display:grid; grid-template-columns:140px 1fr; gap:12px; align-items:center;
  }
  article > div:last-of-type > div > div:first-child{
    font-weight:800; color:var(--text);
  }
  input[type="password"]{
    width:100%; height:38px; padding:0 12px;
    border:1px solid var(--border); border-radius:10px; background:#fff;
    color:var(--text);
  }
  input::placeholder{ color:#B0B0B0 }

  /* 동의 체크 */
  label{ cursor:pointer }
  input[type="checkbox"]{
    width:16px; height:16px; vertical-align:-2px; margin-right:6px;
    accent-color:var(--danger);
  }

  /* 탈퇴 버튼 (빨강) */
  article > div:last-of-type > div:last-child{
    grid-template-columns:140px auto; align-items:center;
  }
  article > div:last-of-type > div:last-child > button{
    justify-self:start;
    height:40px; padding:0 18px; border-radius:10px; cursor:pointer;
    background:var(--danger-btn); color:#fff; font-weight:900;
    border:1px solid #C93C3C; box-shadow:0 2px 8px rgba(0,0,0,.05);
  }
  article > div:last-of-type > div:last-child > button:hover{
    filter:brightness(1.03);
  }

  /* 반응형 */
  @media (max-width:960px){
    main > div{ grid-template-columns:1fr; gap:24px; }
  }
  @media (max-width:640px){
    article > div:last-of-type > div{ grid-template-columns:1fr }
    article > div:last-of-type > div:last-child > button{ width:100% }
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
        <h3>회원 탈퇴</h3>

        <div>
          <strong>탈퇴 시 주의사항</strong>
          <ul>
            <li>모든 개인정보가 삭제되며 복구할 수 없습니다.</li>
            <li>입양신청, 봉사활동, 후원 내역이 모두 삭제됩니다.</li>
            <li>작성한 게시글과 댓글은 익명 처리됩니다.</li>
            <li>동일한 이메일로 재가입할 수 없습니다.</li>
          </ul>
        </div>

        <div>
          <div>
            <div>비밀번호 확인</div>
            <div><input type="password" placeholder="현재 비밀번호를 입력하세요"></div>
          </div>
          <div>
            <div>동의</div>
            <div><label><input type="checkbox"> 위 내용을 모두 확인했으며 회원탈퇴에 동의합니다</label></div>
          </div>
          <div>
            <button type="button">회원 탈퇴하기</button>
          </div>
        </div>
      </article>
    </section>
  </div>
</main>
</body>
</html>

