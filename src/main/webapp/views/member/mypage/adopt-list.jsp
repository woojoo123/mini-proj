<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>입양 신청 내역</title>
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

    --accent-bar:#FFF6E9;            /* (다른 페이지들과 톤 맞춤용) */
    --brand:#B08968;
    --brand-strong:#8C6A4E;

    --pill-green:#DDF5E6;            /* 승인됨 */
    --pill-green-text:#2E8B57;
    --pill-yellow:#FBF0CC;           /* 대기중 */
    --pill-yellow-text:#8A6D2A;

    --danger:#E86060;

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
    background:var(--danger); color:#fff; font-weight:800; font-size:12px;
  }
  /* 현재 위치 강조(입양 신청 내역) */
  aside a[href="adopt-list.jsp"]{
    background:#9B8978;              /* 스샷 톤과 유사한 브라운 */
    color:#fff;
  }

  /* ===== 페이지 헤더: 제목(좌) + 검색/필터(우) ===== */
  section > div:first-of-type{
    display:flex; align-items:center; justify-content:space-between;
    gap:12px; margin-bottom:16px;
  }
  section > div:first-of-type h1{
    font-size:24px; font-weight:800;
  }
  section > div:first-of-type > div{
    display:flex; align-items:center; gap:10px;
  }
  section > div:first-of-type input[placeholder]{
    width:280px; height:38px; padding:0 12px;
    border:1px solid var(--border); border-radius:10px; background:#fff; color:var(--text);
  }
  section > div:first-of-type input::placeholder{ color:#B0B0B0 }
  section > div:first-of-type button{
    height:38px; padding:0 14px;
    border:1px solid var(--border); border-radius:10px; background:#fff;
    display:inline-flex; align-items:center; gap:8px; cursor:pointer;
  }
  section > div:first-of-type button::before{
    content:"🔎"; font-size:14px;
  }
  section > div:first-of-type button:hover{ background:rgba(0,0,0,.04) }

  /* ===== 리스트 컨테이너 ===== */
  section > div:nth-of-type(2){
    display:flex; flex-direction:column; gap:12px;
  }

  /* ===== 카드(각 신청) =====
     구조: article > [썸네일div] [텍스트] [상태span] [우측버튼들div] */
  section > div:nth-of-type(2) article{
    display:grid;
    grid-template-columns:64px 1fr auto auto;
    align-items:center;
    gap:14px;
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:14px;
    box-shadow:var(--shadow);
    padding:14px;
  }

  /* 썸네일 자리(이미지 없는 구조라 placeholder 스타일) */
  section > div:nth-of-type(2) article > div:first-child{
    width:64px; height:64px; border-radius:12px; overflow:hidden;
    background:#E8E4DE center/cover no-repeat;
    border:1px solid #E1DBD3;
  }
  /* 첫 번째/두 번째 항목만 샘플 배경(스샷 느낌) */
  section > div:nth-of-type(2) article:nth-child(1) > div:first-child{
    background-image:linear-gradient(120deg,#f7f1ea,#e9e2d9);
  }
  section > div:nth-of-type(2) article:nth-child(2) > div:first-child{
    background-image:linear-gradient(120deg,#e7efe2,#dde8d6);
  }

  /* 이름/부가텍스트 */
  section > div:nth-of-type(2) article > div:nth-child(2) p{
    margin:0 0 4px 0; font-weight:800;
  }
  section > div:nth-of-type(2) article > div:nth-child(2) div{
    color:#8F8A83; font-size:14px;
  }

  /* 상태 Pill */
  section > div:nth-of-type(2) article > span{
    justify-self:start;
    padding:6px 10px; border-radius:999px; font-size:13px; font-weight:800;
    border:1px solid transparent;
  }
  /* 1행: 승인됨(초록) */
  section > div:nth-of-type(2) article:nth-child(1) > span{
    background:var(--pill-green); color:var(--pill-green-text);
    border-color:#CBEBD7;
  }
  /* 2행: 대기중(노랑) */
  section > div:nth-of-type(2) article:nth-child(2) > span{
    background:var(--pill-yellow); color:var(--pill-yellow-text);
    border-color:#F1E2B9;
  }

  /* 우측 버튼 묶음 */
  section > div:nth-of-type(2) article > div:last-child{
    display:flex; align-items:center; gap:8px;
  }
  /* 상세보기(유령 버튼) */
  section > div:nth-of-type(2) article a{
    display:inline-flex; align-items:center; justify-content:center;
    height:34px; padding:0 12px; border-radius:10px;
    border:1px solid var(--border); background:#fff; color:#4B4B4B; font-weight:700;
  }
  section > div:nth-of-type(2) article a:hover{ background:rgba(0,0,0,.04) }

  /* 취소(위험 아웃라인 버튼) */
  section > div:nth-of-type(2) article button{
    height:34px; padding:0 12px; border-radius:10px; cursor:pointer;
    background:#fff; color:#C84E4E; border:1px solid #F0B7B7; font-weight:800;
  }
  section > div:nth-of-type(2) article button:hover{
    background:#FCEEEE;
  }

  /* 간격/톤(스샷처럼 카드 사이 여백, 테두리 얇게) */
  section > div:nth-of-type(2) article + article{
    border-color:#EFE9E1;
  }

  /* 반응형 */
  @media (max-width:960px){
    main > div{ grid-template-columns:1fr; gap:24px; }
  }
  @media (max-width:560px){
    section > div:nth-of-type(2) article{
      grid-template-columns:64px 1fr; grid-auto-rows:auto;
    }
    section > div:nth-of-type(2) article > span{ justify-self:end }
    section > div:nth-of-type(2) article > div:last-child{ grid-column:1/-1; justify-content:flex-end }
    section > div:first-of-type input[placeholder]{ width:200px }
  }
  </style>
</head>
<body>
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
      <!-- 제목(좌) · 검색 + 필터(우) -->
      <div>
        <h1>입양 신청 내역</h1>
        <div>
          <input placeholder="동물이름/보호소 검색…">
          <button>필터</button>
        </div>
      </div>

      <div>
        <article>
          <div></div>
          <div>
            <p>햇살</p>
            <div>믹스 · 행복보호소</div>
          </div>
          <span>승인됨</span>
          <div>
            <a href="#">상세보기</a>
          </div>
        </article>

        <article>
          <div></div>
          <div>
            <p>별이</p>
            <div>리트리버 · 사랑보호소</div>
          </div>
          <span>대기중</span>
          <div>
            <a href="#">상세보기</a>
            <button type="button">취소</button>
          </div>
        </article>
      </div>
    </section>

  </div>
</main>
</body>
</html>

