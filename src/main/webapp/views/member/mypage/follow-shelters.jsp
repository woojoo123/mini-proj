<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>보호소 팔로우 관리</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
  /* ===== 토큰 / 베이스 ===== */
  *,*::before,*::after{ box-sizing:border-box }
  html,body{ margin:0; padding:0 }
  a{ color:inherit; text-decoration:none }
  button,input{ font:inherit }
  :root{
    --bg:#F6F4F0;
    --surface:#FFFFFF;
    --text:#2B2B2B;
    --muted:#8B857E;
    --border:#E6E1DB;
    --shadow:0 4px 16px rgba(0,0,0,.06);

    --accent-bar:#FFF6E9;          /* 탭 바 */
    --accent-pill:#FFFFFF;          /* 활성 탭 */
    --accent-pill-border:#EADFD0;

    --brand:#B08968;
    --brand-strong:#8C6A4E;

    --danger:#E86060;
    --danger-border:#F0B7B7;

    --radius-xl:16px;
    --radius-lg:12px;
  }
  body{
    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
  }
  h1{ margin:0 }

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
  /* 현재 메뉴 강조(팔로우 관리) */
  aside a[href="follow-animals.jsp"]{
    background:#9B8978; color:#fff;
  }

  /* ===== 헤더: 제목 + 탭바(동물 / 보호소) ===== */
  section > div:first-of-type{
    display:flex; align-items:center; justify-content:space-between;
    margin-bottom:12px; gap:12px;
  }
  section > div:first-of-type h1{ font-size:22px; font-weight:800 }

  /* 오른쪽 탭바 래퍼 */
  section > div:first-of-type > div{
    background:var(--accent-bar);
    border:1px solid #F1E5D3;
    border-radius:999px;
    padding:4px; display:flex; gap:6px; align-items:center;
  }
  /* 활성 탭(보호소) — pseudo 로 생성해 표시 */
  section > div:first-of-type > div::before{
    content:"보호소";
    display:inline-flex; align-items:center; justify-content:center;
    padding:8px 14px; border-radius:999px;
    background:var(--accent-pill);
    border:1px solid var(--accent-pill-border);
    box-shadow:0 2px 8px rgba(0,0,0,.06);
    font-weight:800; color:var(--text); font-size:14px;
  }
  /* 비활성 탭(동물) = 기존 링크 */
  section > div:first-of-type > div a{
    display:inline-flex; align-items:center; justify-content:center;
    padding:8px 14px; border-radius:999px; color:#6B6460; font-weight:700; font-size:14px;
  }

  /* ===== 리스트 ===== */
  section > div:nth-of-type(2){
    display:flex; flex-direction:column; gap:12px;
  }
  /* 테이블 헤더 숨김 */
  section > div:nth-of-type(2) > div:first-child{ display:none }

  /* 각 행을 카드처럼 */
  section > div:nth-of-type(2) > div:not(:first-child){
    position:relative;
    display:grid;
    grid-template-columns:72px 1fr auto;   /* 썸네일 / 텍스트 / 버튼 */
    grid-auto-rows:auto;
    align-items:center;
    gap:14px;
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:14px;
    box-shadow:var(--shadow);
    padding:14px 16px;
  }

  /* 썸네일 플레이스홀더 */
  section > div:nth-of-type(2) > div:not(:first-child)::before{
    content:"";
    width:72px; height:72px; border-radius:12px;
    background:linear-gradient(135deg,#f3eee8,#e8e2db);
    border:1px solid #E1DBD3;
    grid-column:1; grid-row:1 / span 2;
  }

  /* 이름(굵게) */
  section > div:nth-of-type(2) > div:not(:first-child) > div:nth-child(1){
    grid-column:2; grid-row:1;
    font-weight:900; color:#2b2b2b;
  }
  /* 주소(연락처/팔로우일/알림설정은 숨김) */
  section > div:nth-of-type(2) > div:not(:first-child) > div:nth-child(2){
    grid-column:2; grid-row:2; color:#8F8A83; font-size:14px;
  }
  section > div:nth-of-type(2) > div:not(:first-child) > div:nth-child(3),
  section > div:nth-of-type(2) > div:not(:first-child) > div:nth-child(4),
  section > div:nth-of-type(2) > div:not(:first-child) > div:nth-child(5){
    display:none;
  }
  /* 주소 뒤에 작은 '보호소' 회색 태그 */
  section > div:nth-of-type(2) > div:not(:first-child) > div:nth-child(2)::after{
    content:"보호소";
    margin-left:10px; padding:4px 8px; border-radius:999px;
    background:#F4F5F7; color:#6B7280; border:1px solid #E3E5EA;
    font-size:12px; font-weight:800;
  }

  /* 버튼 묶음 */
  section > div:nth-of-type(2) > div:not(:first-child) > div:last-child{
    grid-column:3; grid-row:1 / span 2;
    display:flex; align-items:center; gap:8px; justify-self:end;
  }
  section > div:nth-of-type(2) button{
    height:34px; padding:0 12px; border-radius:10px; cursor:pointer;
    border:1px solid var(--border); background:#fff; color:#4B4B4B; font-weight:800;
  }
  /* ‘팔로우 해제’ 빨간 아웃라인 */
  section > div:nth-of-type(2) > div:not(:first-child) > div:last-child > button:last-child{
    color:#C84E4E; border-color:var(--danger-border);
  }
  section > div:nth-of-type(2) > div:not(:first-child) > div:last-child > button:hover{
    background:rgba(0,0,0,.04);
  }

  /* ===== 더보기 버튼 ===== */
  section > div:nth-of-type(3){
    margin-top:4px; display:flex; justify-content:center;
  }
  section > div:nth-of-type(3) > button{
    height:36px; padding:0 16px; border-radius:10px; cursor:pointer;
    border:1px dashed var(--border); background:#fff; color:#6B6460; font-weight:800;
  }
  section > div:nth-of-type(3) > button:hover{ border-style:solid }

  /* 반응형 */
  @media (max-width:960px){
    main > div{ grid-template-columns:1fr; gap:24px; }
  }
  @media (max-width:560px){
    section > div:nth-of-type(2) > div:not(:first-child){
      grid-template-columns:56px 1fr; row-gap:8px;
    }
    section > div:nth-of-type(2) > div:not(:first-child)::before{
      width:56px; height:56px;
    }
    section > div:nth-of-type(2) > div:not(:first-child) > div:last-child{
      grid-column:1 / -1; grid-row:auto; justify-content:flex-end;
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
        <div>
          <h1>팔로우 관리</h1>
          <div>
            <a href="follow-animals.jsp">동물</a>
          </div>
        </div>

        <div>
          <div>
            <div>보호소명</div>
            <div>주소</div>
            <div>연락처</div>
            <div>팔로우일</div>
            <div>알림 설정</div>
            <div>액션</div>
          </div>

          <div>
            <div>희망보호소</div>
            <div>서울시 강남구 역삼동 123-45</div>
            <div>02-1234-5678</div>
            <div>2024-01-10</div>
            <div>
              <label><input type="checkbox" checked> 공지</label>
              <label><input type="checkbox" checked> 입양정보</label>
              <label><input type="checkbox" checked> 활동글</label>
              <label><input type="checkbox" checked> 블로그</label>
            </div>
            <div>
              <button type="button">알림 설정</button>
              <button type="button">팔로우 해제</button>
            </div>
          </div>

          <div>
            <div>사랑동물보호센터</div>
            <div>서울시 서초구 서초동 456-78</div>
            <div>02-2345-6789</div>
            <div>2024-01-08</div>
            <div>
              <label><input type="checkbox" checked> 공지</label>
              <label><input type="checkbox" checked> 입양정보</label>
              <label><input type="checkbox"> 활동글</label>
              <label><input type="checkbox"> 블로그</label>
            </div>
            <div>
              <button type="button">알림 설정</button>
              <button type="button">팔로우 해제</button>
            </div>
          </div>
        </div>

        <div>
          <button type="button">더보기</button>
        </div>
      </section>

    </div>
  </main>
</body>
</html>

