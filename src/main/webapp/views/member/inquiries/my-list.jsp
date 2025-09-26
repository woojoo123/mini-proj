<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>1:1 문의 내역</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
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
    
    --accent-bar:#FFF6E9;
    --brand:#B08968;
    --brand-strong:#8C6A4E;
    
    --pill-green:#DDF5E6;         /* 답변완료 */
    --pill-green-text:#2E8B57;
    --pill-yellow:#FBF0CC;        /* 미답변 */
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
  main{
    max-width:1280px;
    margin:0 auto;
    padding:24px;
  }

  /* ===== 페이지 헤더 ===== */
  main > div:first-of-type{
    display:flex; align-items:center; justify-content:space-between;
    gap:12px; margin-bottom:24px;
  }
  main > div:first-of-type h1{
    font-size:24px; font-weight:800;
  }
  main > div:first-of-type a{
    display:inline-flex; align-items:center; justify-content:center;
    height:40px; padding:0 16px; border-radius:10px;
    background:var(--brand); color:#fff; font-weight:700;
    transition:background .2s ease;
  }
  main > div:first-of-type a:hover{ background:var(--brand-strong) }

  /* ===== 테이블 컨테이너 ===== */
  section{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    overflow:hidden;
  }

  /* ===== 테이블 헤더 ===== */
  section > div:first-child{
    display:grid;
    grid-template-columns:2fr 1fr 1fr 1fr;
    gap:16px;
    background:var(--accent-bar);
    padding:16px 20px;
    font-weight:700; font-size:14px;
    color:var(--brand-strong);
    border-bottom:1px solid var(--border);
  }

  /* ===== 테이블 행 ===== */
  section > div:not(:first-child){
    display:grid;
    grid-template-columns:2fr 1fr 1fr 1fr;
    gap:16px;
    padding:16px 20px;
    border-bottom:1px solid var(--border);
    transition:background .2s ease;
  }
  section > div:not(:first-child):hover{
    background:rgba(0,0,0,.02);
  }
  section > div:not(:first-child):last-child{
    border-bottom:none;
  }

  /* ===== 제목 링크 ===== */
  section > div:not(:first-child) > div:first-child a{
    color:var(--text); font-weight:600;
    transition:color .2s ease;
  }
  section > div:not(:first-child) > div:first-child a:hover{
    color:var(--brand);
  }

  /* ===== 날짜 ===== */
  section > div:not(:first-child) > div:nth-child(2){
    color:var(--muted); font-size:14px;
    display:flex; align-items:center;
  }

  /* ===== 상태 배지 ===== */
  section > div:not(:first-child) > div:nth-child(3){
    display:flex; align-items:center;
  }
  section > div:not(:first-child) > div:nth-child(3) span{
    padding:4px 8px; border-radius:999px; font-size:12px; font-weight:700;
  }
  /* 답변완료 */
  section > div:nth-child(2) > div:nth-child(3) span,
  section > div:nth-child(4) > div:nth-child(3) span{
    background:var(--pill-green); color:var(--pill-green-text);
  }
  /* 미답변 */
  section > div:nth-child(3) > div:nth-child(3) span{
    background:var(--pill-yellow); color:var(--pill-yellow-text);
  }

  /* ===== 액션 버튼들 ===== */
  section > div:not(:first-child) > div:last-child{
    display:flex; align-items:center; gap:8px;
  }
  section > div:not(:first-child) > div:last-child a{
    display:inline-flex; align-items:center; justify-content:center;
    height:32px; padding:0 12px; border-radius:8px;
    border:1px solid var(--border); background:#fff; color:#4B4B4B; font-weight:600; font-size:14px;
    transition:all .2s ease;
  }
  section > div:not(:first-child) > div:last-child a:hover{
    background:rgba(0,0,0,.04); border-color:var(--brand);
  }
  section > div:not(:first-child) > div:last-child button{
    height:32px; padding:0 12px; border-radius:8px; cursor:pointer;
    background:#fff; color:#C84E4E; border:1px solid #F0B7B7; font-weight:600; font-size:14px;
    transition:all .2s ease;
  }
  section > div:not(:first-child) > div:last-child button:hover{
    background:#FCEEEE; border-color:#E86060;
  }

  /* ===== 더보기 버튼 ===== */
  main > div:last-child{
    display:flex; justify-content:center; margin-top:24px;
  }
  main > div:last-child button{
    height:40px; padding:0 24px; border-radius:10px; cursor:pointer;
    background:var(--surface); color:var(--text); border:1px solid var(--border); font-weight:600;
    transition:all .2s ease;
  }
  main > div:last-child button:hover{
    background:var(--accent-bar); border-color:var(--brand);
  }

  /* ===== 반응형 ===== */
  @media (max-width:768px){
    main{ padding:16px; }
    section > div:first-child,
    section > div:not(:first-child){
      grid-template-columns:1fr;
      gap:8px;
    }
    section > div:first-child > div:not(:first-child){
      display:none;
    }
    section > div:not(:first-child) > div:not(:first-child){
      font-size:12px; color:var(--muted);
    }
    section > div:not(:first-child) > div:not(:first-child)::before{
      content:attr(data-label) ": ";
      font-weight:600;
    }
    section > div:not(:first-child) > div:nth-child(2)::before{ content:"작성일: "; }
    section > div:not(:first-child) > div:nth-child(3)::before{ content:"상태: "; }
    section > div:not(:first-child) > div:last-child{
      justify-content:flex-end; margin-top:8px;
    }
  }
  </style>
</head>
<body>
<main>
  <div>
    <h1>1:1 문의 내역</h1>
    <a href="create.jsp">새 문의 작성</a>
  </div>

  <section>
    <div>
      <div>제목</div>
      <div>작성일</div>
      <div>답변 여부</div>
      <div>액션</div>
    </div>

    <div>
      <div><a href="detail.html?id=1">입양 절차 문의</a></div>
      <div>2024-01-15</div>
      <div><span>답변완료</span></div>
      <div>
        <a href="detail.html?id=1">상세</a>
      </div>
    </div>

    <div>
      <div><a href="detail.html?id=2">봉사 신청 관련 문의</a></div>
      <div>2024-01-14</div>
      <div><span>미답변</span></div>
      <div>
        <a href="detail.html?id=2">상세</a>
        <a href="edit.html?id=2">수정</a>
        <button>삭제</button>
      </div>
    </div>

    <div>
      <div><a href="detail.html?id=3">보호소 운영 시간 문의</a></div>
      <div>2024-01-13</div>
      <div><span>답변완료</span></div>
      <div>
        <a href="detail.html?id=3">상세</a>
      </div>
    </div>
  </section>

  <div>
    <button>더보기</button>
  </div>
</main>
</body>
</html>
