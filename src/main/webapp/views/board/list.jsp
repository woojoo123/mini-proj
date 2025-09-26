<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>회원 게시판</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
  /* ===== Tokens / Reset ===== */
  *,*::before,*::after{box-sizing:border-box}
  html,body{margin:0;padding:0}
  button,input,select{font:inherit}
  a{text-decoration:none;color:inherit}

  :root{
    --bg:#F7F5F1;
    --surface:#FFFFFF;
    --text:#2B2B2B;
    --muted:#8B857E;
    --border:#E6E1DB;
    --shadow:0 6px 18px rgba(0,0,0,.06);

    --brand:#B08968;
    --brand-strong:#8C6A4E;

    --tabbar:#FFF6E6;
    --tab-active:#FFFFFF;
    --tab-active-border:#EADFD0;

    --badge:#F2E8D8;
    --badge-text:#7B6148;

    --radius-xl:16px;
    --radius-lg:12px;
  }

  body{
    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
  }

  /* ===== Layout ===== */
  main{
    max-width:1080px;
    margin:28px auto 48px;
    padding:0 18px;
  }
  main > h1{
    margin:0 0 12px 0;
    font-size:24px; font-weight:900;
    letter-spacing:-.2px;
  }

  /* ===== Category Tabs (1st div) ===== */
  main > div:nth-of-type(1){
    background:var(--tabbar);
    border:1px solid #F1E5D3;
    border-radius:999px;
    padding:6px;
    display:flex; gap:6px; flex-wrap:wrap;
    margin-bottom:10px;
  }
  main > div:nth-of-type(1) button{
    padding:8px 14px; border-radius:999px; cursor:pointer;
    border:none; background:transparent; color:#6B6460; font-weight:700;
  }
  /* active */
  main > div:nth-of-type(1) button.active{
    background:var(--tab-active);
    border:1px solid var(--tab-active-border);
    box-shadow:0 2px 8px rgba(0,0,0,.06);
    color:var(--text);
  }

  /* ===== Filter Bar (2nd div) ===== */
  main > div:nth-of-type(2){
    display:flex; align-items:center; gap:8px; flex-wrap:wrap;
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:999px;
    padding:8px;
    box-shadow:var(--shadow);
    margin-bottom:14px;
  }
  main > div:nth-of-type(2) select{
    height:36px; min-width:120px;
    padding:0 12px; border:1px solid var(--border);
    border-radius:999px; background:#fff; color:#4B4B4B;
  }
  main > div:nth-of-type(2) input{
    flex:1 1 260px; height:36px; padding:0 12px;
    border:1px solid var(--border); border-radius:999px; background:#fff;
  }
  main > div:nth-of-type(2) button{
    height:36px; padding:0 14px; border-radius:999px; cursor:pointer;
    border:none; background:var(--brand-strong); color:#fff; font-weight:800;
  }
  main > div:nth-of-type(2) button:hover{ filter:brightness(1.05) }

  /* ===== Table (3rd div) ===== */
  main > div:nth-of-type(3){
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    overflow:hidden;
  }

  /* Header row */
  main > div:nth-of-type(3) > div:first-child{
    display:grid;
    grid-template-columns: 1fr 140px 120px 90px 90px 90px;
    gap:0;
    padding:12px 16px;
    font-size:14px; font-weight:800; color:#6B6460;
    background:#FBF7F1;
    border-bottom:1px solid var(--border);
  }

  /* Body rows wrapper: we used multiple wrapper divs in markup; normalize */
  main > div:nth-of-type(3) > div:not(:first-child){
    border-bottom:1px solid var(--border);
  }
  main > div:nth-of-type(3) > div:not(:first-child) > div{
    display:grid;
    grid-template-columns: 1fr 140px 120px 90px 90px 90px;
    gap:0;
    padding:14px 16px;
    align-items:center;
  }
  main > div:nth-of-type(3) > div:not(:first-child):hover{
    background:linear-gradient(0deg, rgba(0,0,0,.02), rgba(0,0,0,.02));
  }

  /* Title cell: badge + link */
  main > div:nth-of-type(3) > div:not(:first-child) > div > div:first-child{
    display:flex; align-items:center; gap:8px;
    min-width:0; /* ellipsis base */
  }
  /* small badge before title (카테고리 느낌, 예시로 ‘일반’) */
  main > div:nth-of-type(3) > div:not(:first-child) > div > div:first-child::before{
    content:"일반";
    padding:4px 8px; border-radius:6px;
    background:var(--badge); color:var(--badge-text);
    font-size:12px; font-weight:800;
    border:1px solid #E6D8C5;
    flex:0 0 auto;
  }
  /* title link ellipsis */
  main > div:nth-of-type(3) a{
    color:#2b2b2b; font-weight:700; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;
    display:inline-block; max-width:100%;
  }
  main > div:nth-of-type(3) a:hover{ color:var(--brand-strong); text-decoration:underline }

  /* Right columns alignment */
  main > div:nth-of-type(3) > div > div > div:nth-child(n+2){ color:#555; }

  /* ===== Pagination (4th div) ===== */
  main > div:nth-of-type(4){
    display:flex; justify-content:center; align-items:center; gap:8px;
    margin:14px 0 6px;
  }
  main > div:nth-of-type(4) button{
    height:34px; min-width:34px; padding:0 8px;
    border-radius:8px; border:1px solid var(--border);
    background:#fff; cursor:pointer; color:#4b4b4b; font-weight:700;
  }
  main > div:nth-of-type(4) span{
    display:flex; gap:6px;
  }
  main > div:nth-of-type(4) span > b,
  main > div:nth-of-type(4) span > i{
    height:34px; min-width:34px; display:inline-flex; align-items:center; justify-content:center;
    border-radius:8px; border:1px solid var(--border); background:#fff; font-style:normal;
  }
  /* 현재 페이지 강조 (1) */
  main > div:nth-of-type(4) span > b{
    background:#FFF6E9; border-color:#EADFD0; color:#7B6148; font-weight:900;
    box-shadow:0 2px 6px rgba(0,0,0,.06);
  }

  /* ===== Write button (5th div) ===== */
  main > div:nth-of-type(5){
    display:flex; justify-content:flex-end;
  }
  main > div:nth-of-type(5) a{
    display:inline-flex; align-items:center; gap:8px;
    height:40px; padding:0 16px; border-radius:10px;
    background:var(--brand-strong); color:#fff; font-weight:800;
    box-shadow:0 6px 16px rgba(0,0,0,.12);
  }
  main > div:nth-of-type(5) a::before{ content:"✍️" }
  main > div:nth-of-type(5) a:hover{ filter:brightness(1.05) }

  /* ===== Responsive ===== */
  @media (max-width:880px){
    /* hide header and stack rows */
    main > div:nth-of-type(3) > div:first-child{ display:none }
    main > div:nth-of-type(3) > div:not(:first-child) > div{
      grid-template-columns: 1fr auto;
      row-gap:6px;
    }
    /* columns remap: title left, others in small chips */
    main > div:nth-of-type(3) > div:not(:first-child) > div > div:first-child{ grid-column:1 / -1 }
    main > div:nth-of-type(3) > div:not(:first-child) > div > div:nth-child(2),
    main > div:nth-of-type(3) > div:not(:first-child) > div > div:nth-child(3),
    main > div:nth-of-type(3) > div:not(:first-child) > div > div:nth-child(4),
    main > div:nth-of-type(3) > div:not(:first-child) > div > div:nth-child(5),
    main > div:nth-of-type(3) > div:not(:first-child) > div > div:nth-child(6){
      justify-self:end; color:#6B6460; font-size:14px;
    }
  }
  </style>
</head>
<body>
<main>
  <h1>회원 게시판</h1>

  <!-- Category Tabs -->
  <div>
    <button class="active">전체</button>
    <button>입양</button>
    <button>봉사</button>
    <button>후기</button>
    <button>질문</button>
    <button>일반</button>
  </div>

  <!-- Filter Bar -->
  <div>
    <select>
      <option>전체</option>
      <option>입양</option>
      <option>봉사</option>
      <option>후기</option>
      <option>질문</option>
      <option>일반</option>
    </select>
    <select>
      <option>전체 기간</option>
      <option>1주일</option>
      <option>1개월</option>
      <option>3개월</option>
    </select>
    <input type="text" placeholder="검색어를 입력하세요" />
    <button type="button">검색</button>
  </div>

  <!-- Table -->
  <div>
    <div>
      <div>제목</div>
      <div>작성자</div>
      <div>작성일</div>
      <div>조회</div>
      <div>댓글</div>
      <div>추천</div>
    </div>

    <div>
      <div>
        <div><a href="detail.html">봉사 후기 - 행복동물보호소에서의 봉사 경험</a></div>
        <div>김봉사</div>
        <div>2024-01-15</div>
        <div>156</div>
        <div>12</div>
        <div>8</div>
      </div>
    </div>

    <div>
      <div>
        <div><a href="detail.html">입양 문의 - 강아지 입양 절차가 궁금합니다</a></div>
        <div>이입양</div>
        <div>2024-01-14</div>
        <div>89</div>
        <div>5</div>
        <div>3</div>
      </div>
    </div>

    <div>
      <div>
        <div><a href="detail.html">정보 공유 - 동물병원 추천해주세요</a></div>
        <div>박정보</div>
        <div>2024-01-13</div>
        <div>234</div>
        <div>18</div>
        <div>15</div>
      </div>
    </div>
  </div>

  <!-- Pagination -->
  <div>
    <button type="button">〈</button>
    <span>
      <b>1</b><i>2</i><i>3</i><i>4</i><i>5</i>
    </span>
    <button type="button">〉</button>
  </div>

  <!-- Write -->
  <div>
    <a href="create.html">글쓰기</a>
  </div>
</main>
</body>
</html>
