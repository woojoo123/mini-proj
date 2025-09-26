<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>문의 수정</title>
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
    
    --danger:#E86060;
    --success:#2E8B57;
    
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
    max-width:800px;
    margin:0 auto;
    padding:24px;
  }

  /* ===== 뒤로가기 ===== */
  main > div:first-child{
    margin-bottom:16px;
  }
  main > div:first-child a{
    display:inline-flex; align-items:center; gap:8px;
    color:var(--muted); font-weight:600;
    transition:color .2s ease;
  }
  main > div:first-child a:hover{
    color:var(--brand);
  }

  /* ===== 페이지 헤더 ===== */
  main > h1{
    font-size:24px; font-weight:800;
    margin-bottom:24px;
  }

  /* ===== 폼 컨테이너 ===== */
  main > form{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:32px;
  }

  /* ===== 섹션 헤더 ===== */
  main > form h3{
    font-size:18px; font-weight:700;
    color:var(--brand-strong);
    margin-bottom:24px;
    padding-bottom:12px;
    border-bottom:2px solid var(--accent-bar);
  }

  /* ===== 폼 그룹 ===== */
  main > form > div{
    margin-bottom:24px;
  }
  main > form > div:last-of-type{
    margin-bottom:0;
  }

  /* ===== 라벨 ===== */
  main > form label{
    display:block;
    font-weight:600; font-size:14px;
    color:var(--text);
    margin-bottom:8px;
  }

  /* ===== 입력 필드 ===== */
  main > form input[type="text"],
  main > form textarea{
    width:100%;
    padding:12px 16px;
    border:1px solid var(--border);
    border-radius:var(--radius-lg);
    background:#fff;
    color:var(--text);
    font-size:16px;
    transition:border-color .2s ease, box-shadow .2s ease;
  }
  main > form input[type="text"]:focus,
  main > form textarea:focus{
    outline:none;
    border-color:var(--brand);
    box-shadow:0 0 0 3px rgba(176, 137, 104, 0.1);
  }
  main > form input::placeholder,
  main > form textarea::placeholder{
    color:var(--muted);
  }

  /* ===== 텍스트에어리어 ===== */
  main > form textarea{
    min-height:120px;
    resize:vertical;
  }

  /* ===== 파일 업로드 영역 ===== */
  main > form > div:has(input[type="file"]){
    border:2px dashed var(--border);
    border-radius:var(--radius-lg);
    padding:24px;
    text-align:center;
    background:var(--accent-bar);
    transition:border-color .2s ease, background .2s ease;
  }
  main > form > div:has(input[type="file"]):hover{
    border-color:var(--brand);
    background:rgba(255, 246, 233, 0.5);
  }
  main > form > div:has(input[type="file"]) > div:first-child{
    font-weight:600; color:var(--brand-strong);
    margin-bottom:4px;
  }
  main > form > div:has(input[type="file"]) > div:nth-child(2){
    font-size:14px; color:var(--muted);
    margin-bottom:16px;
  }
  main > form input[type="file"]{
    width:100%;
    padding:8px;
    border:1px solid var(--border);
    border-radius:8px;
    background:#fff;
    cursor:pointer;
  }

  /* ===== 버튼 그룹 ===== */
  main > form > div:last-of-type{
    display:flex; justify-content:flex-end; gap:12px;
    margin-top:32px;
    padding-top:24px;
    border-top:1px solid var(--border);
  }

  /* ===== 버튼 ===== */
  main > form button{
    height:44px; padding:0 24px; border-radius:var(--radius-lg);
    font-weight:600; font-size:16px;
    cursor:pointer;
    transition:all .2s ease;
  }
  main > form button[type="button"]{
    background:#fff; color:var(--muted);
    border:1px solid var(--border);
  }
  main > form button[type="button"]:hover{
    background:var(--accent-bar); color:var(--text);
    border-color:var(--brand);
  }
  main > form button[type="submit"]{
    background:var(--brand); color:#fff;
    border:1px solid var(--brand);
  }
  main > form button[type="submit"]:hover{
    background:var(--brand-strong);
    border-color:var(--brand-strong);
  }

  /* ===== 반응형 ===== */
  @media (max-width:768px){
    main{ padding:16px; }
    main > form{ padding:24px; }
    main > form > div:last-of-type{
      flex-direction:column;
    }
    main > form button{
      width:100%;
    }
  }
  </style>
</head>
<body>
<main>
  <div>
    <a href="detail.html?id=2">← 상세로</a>
  </div>

  <h1>문의 수정</h1>

  <form method="get" action="">
    <input type="hidden" name="_method" value="PUT">
    
    <div>
      <label for="title">제목 *</label>
      <input type="text" id="title" name="title" value="봉사 신청 관련 문의" required maxlength="150">
    </div>

    <div>
      <label for="content">내용 *</label>
      <textarea id="content" name="content" required maxlength="500">안녕하세요. 봉사 신청에 대해 문의드립니다.

다음 주 봉사 일정이 변경되었다고 하는데, 
새로운 일정을 확인하고 싶습니다.

연락 부탁드립니다.</textarea>
    </div>

    <div>
      <label>파일 첨부 (선택)</label>
      <div>
        <div>클릭하여 파일을 첨부하세요</div>
        <div>이미지, PDF 등 (최대 3개, 각 5MB 이하)</div>
        <input type="file" name="attachments" multiple accept="image/*,.pdf">
      </div>
    </div>

    <div>
      <button type="button">취소</button>
      <button type="submit">수정하기</button>
    </div>
  </form>
</main>
</body>
</html>
