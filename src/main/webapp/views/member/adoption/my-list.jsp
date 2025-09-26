<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>입양 신청 내역</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
  *,*::before,*::after{box-sizing:border-box}
  html,body{margin:0;padding:0}
  a{text-decoration:none;color:inherit}
  button,input{font:inherit}

  :root{
    --bg:#F6F4F0;
    --surface:#FFFFFF;
    --text:#2B2B2B;
    --border:#E6E1DB;
    --shadow:0 10px 28px rgba(0,0,0,.08);

    --brand-strong:#8C6A4E;

    --th-bg:#EFDCC8;
    --row-sep:#E9E4DD;

    --pill-gray:#EEEEF0;    --pill-gray-text:#5D6068;
    --pill-green:#DDF5E6;   --pill-green-text:#2E8B57;
    --pill-beige:#F6E9D7;   --pill-beige-text:#8A6D2A;

    --btn-ghost-bg:#F5E9DC; --btn-ghost-bd:#EAD8C5;
  }

  body{
    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
  }

  main{max-width:1060px;margin:36px auto 48px;padding:0 18px}
  main>h1{margin:0 0 18px;font-size:40px;font-weight:900;letter-spacing:-.5px}

  section{
    background:var(--surface); border:1px solid var(--border);
    border-radius:20px; box-shadow:var(--shadow); overflow:hidden;
  }
  section>div:first-child{
    display:grid; grid-template-columns:1.1fr 1.6fr 1.2fr .9fr 1.1fr;
    padding:16px 22px; background:var(--th-bg); color:#573F2D; font-weight:800; font-size:18px;
  }
  section>div:not(:first-child){
    display:grid; grid-template-columns:1.1fr 1.6fr 1.2fr .9fr 1.1fr;
    align-items:center; padding:22px; border-top:1px solid var(--row-sep); font-size:18px;
  }

  .badge{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:52px; height:32px; padding:0 12px; border-radius:999px;
    font-size:15px; font-weight:800; border:1px solid #ddd;
    background:var(--pill-gray); color:var(--pill-gray-text);
  }
  .badge--approved{background:var(--pill-green);border-color:#CBEBD7;color:var(--pill-green-text)}
  .badge--rejected{background:var(--pill-beige);border-color:#ECD9BD;color:var(--pill-beige-text)}
  .badge--canceled{background:var(--pill-gray);border-color:#DADDE2;color:#6B6F76}

  .actions{display:flex;gap:10px}
  .btn{display:inline-flex;align-items:center;justify-content:center;height:38px;padding:0 16px;border-radius:12px;cursor:pointer;font-weight:800;white-space:nowrap}
  .btn--primary{border:none;background:var(--brand-strong);color:#fff;box-shadow:0 3px 10px rgba(0,0,0,.12)}
  .btn--primary:hover{filter:brightness(1.05)}
  .btn--ghost{border:1px solid var(--btn-ghost-bd);background:var(--btn-ghost-bg);color:#6F553D}
  .btn--ghost:hover{filter:brightness(1.03)}

  .more{display:flex;justify-content:center;margin-top:18px}
  .more>button{height:40px;padding:0 22px;border-radius:12px;border:1px dashed var(--border);background:#fff;color:#6B6460;font-weight:800}
  .more>button:hover{border-style:solid}

  @media (max-width:800px){
    section>div:first-child{display:none}
    section>div:not(:first-child){grid-template-columns:1fr auto;row-gap:10px;padding:16px;font-size:16px}
    section>div:not(:first-child)>div:nth-child(1){grid-column:1 / -1;font-weight:900}
    section>div:not(:first-child)>div:nth-child(2){grid-column:1 / -1;color:#4b4b4b}
    section>div:not(:first-child)>div:nth-child(3){grid-column:1 / -1;color:#6f6b66}
    section>div:not(:first-child)>div:nth-child(4){grid-column:1}
    section>div:not(:first-child)>div:nth-child(5){grid-column:2;justify-content:flex-end}
  }
  </style>
</head>
<body>
  <main>
    <h1>입양 신청 내역</h1>

    <section>
      <div>
        <div>동물이름</div><div>보호소</div><div>신청일</div><div>상태</div><div> </div>
      </div>

      <div>
        <div>초코</div>
        <div>해피동물보호소</div>
        <div>2023.10.15</div>
        <div><span class="badge">대기</span></div>
        <div class="actions">
          <a class="btn btn--primary" href="detail.html?id=55">상세</a>
          <button class="btn btn--ghost" type="button">취소</button>
        </div>
      </div>

      <div>
        <div>몽치</div>
        <div>사랑동물보호센터</div>
        <div>2023.09.22</div>
        <div><span class="badge badge--approved">승인</span></div>
        <div class="actions">
          <a class="btn btn--primary" href="detail.html?id=54">상세</a>
          <button class="btn btn--ghost" type="button">취소</button>
        </div>
      </div>

      <div>
        <div>감자</div>
        <div>포근한보호소</div>
        <div>2023.08.05</div>
        <div><span class="badge badge--rejected">거부</span></div>
        <div class="actions">
          <a class="btn btn--primary" href="detail.html?id=53">상세</a>
          <button class="btn btn--ghost" type="button">취소</button>
        </div>
      </div>

      <div>
        <div>벼리</div>
        <div>둥그미보호소</div>
        <div>2023.07.18</div>
        <div><span class="badge badge--canceled">취소</span></div>
        <div class="actions">
          <a class="btn btn--primary" href="detail.html?id=52">상세</a>
          <button class="btn btn--ghost" type="button">취소</button>
        </div>
      </div>
    </section>

    <div class="more">
      <button type="button">더보기</button>
    </div>
  </main>
</body>
</html>

