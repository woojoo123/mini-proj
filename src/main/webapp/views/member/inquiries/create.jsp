<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>문의 작성</title>
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

  /* ===== 페이지 헤더 ===== */
  main > h1{
    font-size:24px; font-weight:800;
    margin-bottom:24px;
  }

  /* ===== 폼 컨테이너 ===== */
  form{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:32px;
  }

  /* ===== 섹션 헤더 ===== */
  form h3{
    font-size:18px; font-weight:700;
    color:var(--brand-strong);
    margin-bottom:24px;
    padding-bottom:12px;
    border-bottom:2px solid var(--accent-bar);
  }

  /* ===== 폼 그룹 ===== */
  form > div{
    margin-bottom:24px;
  }
  form > div:last-of-type{
    margin-bottom:0;
  }

  /* ===== 라벨 ===== */
  form label{
    display:block;
    font-weight:600; font-size:14px;
    color:var(--text);
    margin-bottom:8px;
  }

  /* ===== 입력 필드 ===== */
  form input[type="text"],
  form textarea{
    width:100%;
    padding:12px 16px;
    border:1px solid var(--border);
    border-radius:var(--radius-lg);
    background:#fff;
    color:var(--text);
    font-size:16px;
    transition:border-color .2s ease, box-shadow .2s ease;
  }
  form input[type="text"]:focus,
  form textarea:focus{
    outline:none;
    border-color:var(--brand);
    box-shadow:0 0 0 3px rgba(176, 137, 104, 0.1);
  }
  form input::placeholder,
  form textarea::placeholder{
    color:var(--muted);
  }

  /* ===== 텍스트에어리어 ===== */
  form textarea{
    min-height:120px;
    resize:vertical;
  }

  /* ===== 파일 업로드 영역 ===== */
  form > div:has(input[type="file"]){
    border:2px dashed var(--border);
    border-radius:var(--radius-lg);
    padding:24px;
    text-align:center;
    background:var(--accent-bar);
    transition:border-color .2s ease, background .2s ease;
  }
  form > div:has(input[type="file"]):hover{
    border-color:var(--brand);
    background:rgba(255, 246, 233, 0.5);
  }
  form > div:has(input[type="file"]) > div:first-child{
    font-weight:600; color:var(--brand-strong);
    margin-bottom:4px;
  }
  form > div:has(input[type="file"]) > div:nth-child(2){
    font-size:14px; color:var(--muted);
    margin-bottom:16px;
  }
  form input[type="file"]{
    width:100%;
    padding:8px;
    border:1px solid var(--border);
    border-radius:8px;
    background:#fff;
    cursor:pointer;
  }

  /* ===== 버튼 그룹 ===== */
  form > div:last-of-type{
    display:flex; justify-content:flex-end; gap:12px;
    margin-top:32px;
    padding-top:24px;
    border-top:1px solid var(--border);
  }

  /* ===== 버튼 ===== */
  form button{
    height:44px; padding:0 24px; border-radius:var(--radius-lg);
    font-weight:600; font-size:16px;
    cursor:pointer;
    transition:all .2s ease;
  }
  form button[type="button"]{
    background:#fff; color:var(--muted);
    border:1px solid var(--border);
  }
  form button[type="button"]:hover{
    background:var(--accent-bar); color:var(--text);
    border-color:var(--brand);
  }
  form button[type="submit"]{
    background:var(--brand); color:#fff;
    border:1px solid var(--brand);
  }
  form button[type="submit"]:hover{
    background:var(--brand-strong);
    border-color:var(--brand-strong);
  }

  /* ===== 반응형 ===== */
  @media (max-width:768px){
    main{ padding:16px; }
    form{ padding:24px; }
    form > div:last-of-type{
      flex-direction:column;
    }
    form button{
      width:100%;
    }
  }
  </style>
</head>
<body>
<main>
  <h1>문의 작성</h1>

  <form method="get" action="" enctype="multipart/form-data">
    <h3>문의 정보</h3>
    
    <div>
      <label for="title">제목 *</label>
      <input type="text" id="title" name="title" placeholder="문의 제목을 입력해주세요" required maxlength="150">
    </div>

    <div>
      <label for="content">내용 *</label>
      <textarea id="content" name="content" placeholder="문의 내용을 자세히 입력해주세요" required maxlength="500"></textarea>
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
      <button type="submit">문의하기</button>
    </div>
  </form>
</main>
</body>
</html>
