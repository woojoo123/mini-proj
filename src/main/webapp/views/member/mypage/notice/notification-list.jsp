<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>알림</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <style>
  /* ===== (공용) dashboard/app.css ===== */
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

  /* 레이아웃 */
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
  aside > div{height:36px; margin-bottom:10px;}

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
  /* 배지 */
  aside a span{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:20px; height:20px; padding:0 6px;
    border-radius:999px;
    background:var(--danger); color:#fff; font-weight:700; font-size:12px;
  }

  /* 반응형 */
  @media (max-width:960px){
    main > div{grid-template-columns:1fr; gap:var(--gap-xl)}
  }

  /* ===== (페이지 전용) Notifications-list page ===== */

  /* 페이지 헤더: 제목(좌) + 검색/필터(우) 한 줄 */
  section > div:first-of-type{
    display:flex; align-items:center; justify-content:space-between;
    margin-bottom:24px;
  }
  section > div:first-of-type h1{font-size:22px;font-weight:700;margin:0}
  section > div:first-of-type > div{display:flex; align-items:center; gap:10px}
  section > div:first-of-type input[placeholder]{
    width:240px; height:36px; padding:0 12px; border:1px solid var(--border);
    border-radius:10px; background:#fff; color:var(--text);
  }
  section > div:first-of-type button,
  section > div:first-of-type label[for="multi-select-mode"]{
    height:36px; padding:0 12px; border:1px solid var(--border);
    border-radius:999px; background:#fff; cursor:pointer;
  }
  section > div:first-of-type button:hover,
  section > div:first-of-type label[for="multi-select-mode"]:hover{
    background:rgba(0,0,0,.03);
  }

  /* 알림 리스트 컨테이너 */
  section > div:nth-of-type(2){
    display:flex; flex-direction:column; gap:16px;
  }

  /* 각 알림 article의 기본 레이아웃 */
  section > div:nth-of-type(2) article{
    position:relative;
  }
  section > div:nth-of-type(2) article > a{
    display:grid; grid-template-columns:42px 1fr auto auto; gap:12px; align-items:center;
    padding:14px; border:1px solid var(--border); border-radius:14px;
    background:#fff; box-shadow:var(--shadow-sm);
    transition:box-shadow .15s ease, transform .15s ease, border-color .15s ease;
  }
  section > div:nth-of-type(2) article > a:hover{
    transform:translateY(-2px); box-shadow:var(--shadow-md); border-color:transparent;
  }

  /* 아이콘 자리 */
  section > div:nth-of-type(2) article > a > div:first-child{
    width:42px; height:42px; border-radius:12px; border:1px solid var(--border);
    display:flex; align-items:center; justify-content:center; color:var(--text-muted);
    background:#fff;
  }

  /* 제목/설명 블록 */
  section > div:nth-of-type(2) article > a > div:nth-child(2) p{
    margin:0 0 4px 0; font-weight:700; color:var(--text);
  }
  section > div:nth-of-type(2) article > a > div:nth-child(2) div{
    color:var(--text-muted); font-size:14px;
  }

  /* 카테고리 pill */
  section > div:nth-of-type(2) article > a > span:nth-of-type(1){
    justify-self:start;
    padding:4px 10px; border-radius:999px; border:1px solid var(--border);
    font-size:13px; color:var(--brand-strong); background:var(--accent);
  }

  /* 시간 */
  section > div:nth-of-type(2) article > a > span:nth-of-type(2){
    justify-self:end; color:var(--text-muted); font-size:13px;
  }

  /* 읽음/안읽음 토글 */
  section > div:nth-of-type(2) article input[id^="read-"]:checked ~ a{
    background:#fff; border-color:var(--border);
    opacity:.65;
  }

  /* 샘플 배경 톤 */
  section > div:nth-of-type(2) article:nth-child(1) > a,
  section > div:nth-of-type(2) article:nth-child(2) > a{
    background:#F1F7FF; border-color:#DFEBFF;
  }
  section > div:nth-of-type(2) article:nth-child(3) > a{
    background:#FFF6EA; border-color:#F5E3CC;
  }

  /* 점(⋯) 버튼과 드롭다운 메뉴 */
  section > div:nth-of-type(2) article > div:last-of-type{
    position:absolute; top:10px; right:12px;
  }
  section > div:nth-of-type(2) article > div:last-of-type > label{
    display:inline-flex; align-items:center; justify-content:center;
    width:28px; height:28px; border-radius:8px; cursor:pointer; color:#555;
  }
  section > div:nth-of-type(2) article > div:last-of-type > label:hover{
    background:rgba(0,0,0,.06);
  }
  section > div:nth-of-type(2) article > div:last-of-type > div{
    display:none; position:absolute; top:32px; right:0; z-index:5;
    background:#fff; border:1px solid var(--border); border-radius:10px;
    min-width:140px; box-shadow:var(--shadow-md); overflow:hidden;
  }
  section > div:nth-of-type(2) article > div:last-of-type > div label{
    display:block; padding:10px 12px; cursor:pointer; font-size:14px;
  }
  section > div:nth-of-type(2) article > div:last-of-type > div label:hover{
    background:rgba(0,0,0,.04);
  }
  /* 메뉴 토글 */
  section > div:nth-of-type(2) article input[id^="menu-"]:checked ~ div > div{display:block}

  /* 삭제 확인 모달 */
  section > div:nth-of-type(2) article input[id^="delete-"] ~ div{
    display:none; position:fixed; inset:0; z-index:20;
    background:rgba(0,0,0,.25);
  }
  section > div:nth-of-type(2) article input[id^="delete-"]:checked ~ div{
    display:flex; align-items:center; justify-content:center;
  }
  section > div:nth-of-type(2) article input[id^="delete-"] ~ div > div{
    background:#fff; width:min(92vw, 360px); border-radius:14px; box-shadow:var(--shadow-md);
    padding:18px; border:1px solid var(--border);
  }
  section > div:nth-of-type(2) article input[id^="delete-"] ~ div p{margin:0 0 14px 0}
  section > div:nth-of-type(2) article input[id^="delete-"] ~ div > div > div{
    display:flex; gap:8px; justify-content:flex-end;
  }
  section > div:nth-of-type(2) article input[id^="delete-"] ~ div label{
    padding:8px 12px; border-radius:10px; cursor:pointer; border:1px solid var(--border);
  }
  section > div:nth-of-type(2) article input[id^="delete-"] ~ div label:last-child{
    background:#FAEAEA; border-color:#F2C0C0; color:#B94B4B;
  }

  /* 멀티 선택 모드 토글 */
  #multi-select-mode:checked ~ main section > div:nth-of-type(2) article > label[for^="select-"]{
    display:flex;
  }
  #multi-select-mode ~ main section > div:nth-of-type(2) article > label[for^="select-"]{
    display:none; position:absolute; left:-2px; top:50%; transform:translateY(-50%);
    width:22px; height:22px; border:1px solid var(--border); background:#fff; border-radius:6px; cursor:pointer;
  }
  /* 체크 표시 */
  #multi-select-mode:checked ~ main section > div:nth-of-type(2) article input[id^="select-"]:checked + label{
    background:var(--brand); border-color:var(--brand);
  }
  #multi-select-mode:checked ~ main section > div:nth-of-type(2) article input[id^="select-"]:checked + label::after{
    content:"✓"; color:#fff; font-size:14px; line-height:22px; text-align:center; width:100%;
  }

  /* 멀티 선택 모드일 때 본문 a에 왼쪽 여백 확보 */
  #multi-select-mode:checked ~ main section > div:nth-of-type(2) article > a{
    padding-left:40px;
  }

  /* 모바일 보완 */
  @media (max-width:640px){
    section > div:first-of-type{
      flex-direction:column; align-items:stretch; gap:12px;
    }
    section > div:first-of-type > div{justify-content:space-between}
    section > div:first-of-type input[placeholder]{flex:1; width:auto}
    section > div:nth-of-type(2) article > a{
      grid-template-columns:36px 1fr auto; gap:10px;
    }
    section > div:nth-of-type(2) article > a > span:nth-of-type(1){display:none}
  }
  </style>
</head>
<body>

<!-- 멀티 선택 모드 토글 -->
<input type="checkbox" id="multi-select-mode" hidden>
<!-- 멀티 선택 삭제 버튼(향후용) -->
<input type="checkbox" id="multi-delete" hidden>

<main>
  <div>

    <aside>
      <ul>
        <li><a href="dashboard.jsp">한눈에 보기</a></li>
        <li><a href="notification-list.jsp" class="active">알림 <span>12</span></a></li>
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
      <!-- 제목(좌) · 검색 + 필터(우) -->
      <div>
        <h1>알림</h1>
        <div>
          <input placeholder="알림 검색…" aria-label="알림 검색 입력">
          <button type="button" aria-label="필터 열기">필터</button>
          <!-- 멀티 선택 모드 토글 -->
          <label for="multi-select-mode" role="button" aria-pressed="false">선택</label>
        </div>
      </div>

      <div>
        <!-- 알림 201 -->
        <article>
          <!-- 멀티 선택 체크박스 -->
          <input type="checkbox" id="select-201" hidden>
          <label for="select-201" aria-label="알림 201 선택"></label>

          <!-- 읽음/읽지 않음 토글 -->
          <input type="checkbox" id="read-201" hidden>

          <a href="notification-detail.html?id=201">
            <div aria-hidden="true">🔔</div>
            <div>
              <p>입양 신청서가 승인되었습니다</p>
              <div>행복보호소 · 면접 일정을 조율해 주세요</div>
            </div>
            <span>입양</span>
            <span>2시간 전</span>
          </a>

          <div>
            <!-- 우클릭 메뉴 -->
            <input type="checkbox" id="menu-201" hidden>
            <label for="menu-201" aria-label="메뉴 열기">⋯</label>

            <!-- 컨텍스트 메뉴 -->
            <div role="menu" aria-label="알림 201 메뉴">
              <label for="read-201" role="menuitem">읽음으로 표시</label>
              <label for="read-201" role="menuitem">읽지 않음으로 표시</label>
              <label for="delete-201" role="menuitem">삭제</label>
            </div>
          </div>

          <!-- 삭제 확인 다이얼로그 -->
          <input type="checkbox" id="delete-201" hidden>
          <div role="dialog" aria-modal="true" aria-labelledby="confirm-201-title">
            <div>
              <p id="confirm-201-title">정말 삭제하시겠습니까?</p>
              <div>
                <label for="delete-201">취소</label>
                <label for="delete-201">삭제</label>
              </div>
            </div>
          </div>
        </article>

        <!-- 알림 202 -->
        <article>
          <input type="checkbox" id="select-202" hidden>
          <label for="select-202" aria-label="알림 202 선택"></label>

          <input type="checkbox" id="read-202" hidden>

          <a href="notification-detail.html?id=202">
            <div aria-hidden="true">📅</div>
            <div>
              <p>봉사 일정이 변경되었습니다</p>
              <div>오늘 2시 → 3시</div>
            </div>
            <span>봉사</span>
            <span>1일 전</span>
          </a>

          <div>
            <input type="checkbox" id="menu-202" hidden>
            <label for="menu-202" aria-label="메뉴 열기">⋯</label>

            <div role="menu" aria-label="알림 202 메뉴">
              <label for="read-202" role="menuitem">읽음으로 표시</label>
              <label for="read-202" role="menuitem">읽지 않음으로 표시</label>
              <label for="delete-202" role="menuitem">삭제</label>
            </div>
          </div>

          <input type="checkbox" id="delete-202" hidden>
          <div role="dialog" aria-modal="true" aria-labelledby="confirm-202-title">
            <div>
              <p id="confirm-202-title">정말 삭제하시겠습니까?</p>
              <div>
                <label for="delete-202">취소</label>
                <label for="delete-202">삭제</label>
              </div>
            </div>
          </div>
        </article>

        <!-- 알림 203 -->
        <article>
          <input type="checkbox" id="select-203" hidden>
          <label for="select-203" aria-label="알림 203 선택"></label>

          <input type="checkbox" id="read-203" hidden>

          <a href="notification-detail.html?id=203">
            <div aria-hidden="true">📢</div>
            <div>
              <p>새로운 입양 공고</p>
              <div>골든 리트리버 공고가 등록되었습니다</div>
            </div>
            <span>공지</span>
            <span>2일 전</span>
          </a>

          <div>
            <input type="checkbox" id="menu-203" hidden>
            <label for="menu-203" aria-label="메뉴 열기">⋯</label>

            <div role="menu" aria-label="알림 203 메뉴">
              <label for="read-203" role="menuitem">읽음으로 표시</label>
              <label for="read-203" role="menuitem">읽지 않음으로 표시</label>
              <label for="delete-203" role="menuitem">삭제</label>
            </div>
          </div>

          <input type="checkbox" id="delete-203" hidden>
          <div role="dialog" aria-modal="true" aria-labelledby="confirm-203-title">
            <div>
              <p id="confirm-203-title">정말 삭제하시겠습니까?</p>
              <div>
                <label for="delete-203">취소</label>
                <label for="delete-203">삭제</label>
              </div>
            </div>
          </div>
        </article>
      </div>
    </section>

  </div>
</main>

</body>
</html>

