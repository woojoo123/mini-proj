<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>게시글 상세</title>
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
    
    --pill-blue:#E3F2FD;         /* 봉사후기 */
    --pill-blue-text:#1976D2;
    --pill-green:#E8F5E8;        /* 입양후기 */
    --pill-green-text:#2E8B57;
    --pill-orange:#FFF3E0;       /* 정보 */
    --pill-orange-text:#F57C00;
    --pill-purple:#F3E5F5;       /* 후기 */
    --pill-purple-text:#7B1FA2;
    --pill-red:#FFEBEE;          /* 질문 */
    --pill-red-text:#D32F2F;
    --pill-gray:#F5F5F5;         /* 일반 */
    --pill-gray-text:#616161;
    
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

  /* ===== 게시글 헤더 ===== */
  main > div:nth-child(2){
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:24px;
    margin-bottom:24px;
  }
  main > div:nth-child(2) h1{
    font-size:20px; font-weight:800;
    margin-bottom:12px;
    line-height:1.4;
  }
  main > div:nth-child(2) > div:first-of-type{
    display:flex; flex-wrap:wrap; gap:16px;
    color:var(--muted); font-size:14px;
    margin-bottom:8px;
  }
  main > div:nth-child(2) > div:last-of-type{
    display:flex; gap:16px;
    color:var(--muted); font-size:14px;
  }

  /* ===== 게시글 본문 ===== */
  main > div:nth-child(3){
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:24px;
    margin-bottom:24px;
  }
  main > div:nth-child(3) p{
    margin:0 0 16px 0; line-height:1.6;
  }
  main > div:nth-child(3) p:last-child{
    margin-bottom:0;
  }

  /* ===== 첨부 미디어 ===== */
  main > div:nth-child(4){
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:24px;
    margin-bottom:24px;
  }
  main > div:nth-child(4) h3{
    font-size:16px; font-weight:600;
    color:var(--brand-strong);
    margin-bottom:16px;
  }
  main > div:nth-child(4) > div{
    display:grid;
    grid-template-columns:repeat(auto-fit, minmax(120px, 1fr));
    gap:12px;
  }
  main > div:nth-child(4) > div > div{
    aspect-ratio:1;
    background:var(--accent-bar);
    border:1px solid var(--border);
    border-radius:8px;
    display:flex; align-items:center; justify-content:center;
    font-size:14px; font-weight:600;
    color:var(--brand-strong);
  }

  /* ===== 액션 버튼들 ===== */
  main > div:nth-child(5){
    display:flex; gap:12px; margin-bottom:24px;
  }
  main > div:nth-child(5) form,
  main > div:nth-child(5) > div{
    flex:1;
  }
  main > div:nth-child(5) button{
    width:100%; height:44px; border-radius:var(--radius-lg);
    font-weight:600; font-size:16px;
    cursor:pointer; transition:all .2s ease;
  }
  main > div:nth-child(5) form button{
    background:var(--brand); color:#fff;
    border:1px solid var(--brand);
  }
  main > div:nth-child(5) form button:hover{
    background:var(--brand-strong);
    border-color:var(--brand-strong);
  }
  main > div:nth-child(5) > div button{
    background:#fff; color:var(--text);
    border:1px solid var(--border);
  }
  main > div:nth-child(5) > div button:hover{
    background:var(--accent-bar); border-color:var(--brand);
  }

  /* ===== 댓글 섹션 ===== */
  main > div:last-child{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:24px;
  }
  main > div:last-child h2{
    font-size:18px; font-weight:700;
    color:var(--brand-strong);
    margin-bottom:20px;
    padding-bottom:12px;
    border-bottom:2px solid var(--accent-bar);
  }

  /* ===== 댓글 목록 ===== */
  main > div:last-child > div:not(:last-child){
    margin-bottom:16px;
  }
  main > div:last-child > div:not(:last-child) > div{
    background:var(--accent-bar);
    border:1px solid var(--border);
    border-radius:var(--radius-lg);
    padding:16px;
  }
  main > div:last-child > div:not(:last-child) > div > div:first-child{
    display:flex; justify-content:space-between; align-items:center;
    margin-bottom:8px;
  }
  main > div:last-child > div:not(:last-child) > div > div:first-child > div:first-child{
    font-weight:600; color:var(--brand-strong);
    font-size:14px;
  }
  main > div:last-child > div:not(:last-child) > div > div:first-child > div:last-child{
    display:flex; gap:8px;
  }
  main > div:last-child > div:not(:last-child) > div > div:first-child button{
    height:28px; padding:0 12px; border-radius:6px;
    font-size:12px; font-weight:600; cursor:pointer;
    transition:all .2s ease;
  }
  main > div:last-child > div:not(:last-child) > div > div:first-child button:first-child{
    background:#fff; color:var(--text);
    border:1px solid var(--border);
  }
  main > div:last-child > div:not(:last-child) > div > div:first-child button:first-child:hover{
    background:var(--accent-bar);
  }
  main > div:last-child > div:not(:last-child) > div > div:first-child button:last-child{
    background:#fff; color:var(--danger);
    border:1px solid #F0B7B7;
  }
  main > div:last-child > div:not(:last-child) > div > div:first-child button:last-child:hover{
    background:#FCEEEE;
  }
  main > div:last-child > div:not(:last-child) > div > div:last-child{
    color:var(--text); line-height:1.5;
  }

  /* ===== 삭제된 댓글 ===== */
  main > div:last-child > div:nth-child(3){
    background:var(--accent-bar);
    border:1px solid var(--border);
    border-radius:var(--radius-lg);
    padding:16px;
    text-align:center;
    color:var(--muted); font-style:italic;
  }

  /* ===== 댓글 작성 폼 ===== */
  main > div:last-child > form{
    margin-top:20px; padding-top:20px;
    border-top:1px solid var(--border);
  }
  main > div:last-child > form > div:first-child{
    margin-bottom:12px;
  }
  main > div:last-child > form textarea{
    width:100%; min-height:80px; padding:12px 16px;
    border:1px solid var(--border); border-radius:var(--radius-lg);
    background:#fff; color:var(--text); font-size:14px;
    resize:vertical; transition:border-color .2s ease;
  }
  main > div:last-child > form textarea:focus{
    outline:none; border-color:var(--brand);
    box-shadow:0 0 0 3px rgba(176, 137, 104, 0.1);
  }
  main > div:last-child > form textarea::placeholder{
    color:var(--muted);
  }
  main > div:last-child > form > div:last-child{
    display:flex; justify-content:flex-end;
  }
  main > div:last-child > form button{
    height:36px; padding:0 20px; border-radius:8px;
    background:var(--brand); color:#fff;
    border:1px solid var(--brand); font-weight:600;
    cursor:pointer; transition:all .2s ease;
  }
  main > div:last-child > form button:hover{
    background:var(--brand-strong);
    border-color:var(--brand-strong);
  }

  /* ===== 반응형 ===== */
  @media (max-width:768px){
    main{ padding:16px; }
    main > div:nth-child(2),
    main > div:nth-child(3),
    main > div:nth-child(4),
    main > div:last-child{
      padding:20px;
    }
    main > div:nth-child(2) > div:first-of-type{
      flex-direction:column; gap:8px;
    }
    main > div:nth-child(5){
      flex-direction:column;
    }
    main > div:nth-child(4) > div{
      grid-template-columns:repeat(auto-fit, minmax(100px, 1fr));
    }
  }
  </style>
</head>
<body>
<main>
  <div>
    <a href="list.html">← 목록으로</a>
  </div>

  <div>
    <h1>봉사 후기 - 행복동물보호소에서의 봉사 경험</h1>
    <div>작성자: 김봉사 | 작성일: 2024-01-15 | 수정일: 2024-01-16</div>
    <div>조회 156 | 댓글 12 | 좋아요 8</div>
  </div>

  <div>
    <p>안녕하세요! 지난 주말에 행복동물보호소에서 봉사활동을 하고 왔습니다.</p>
    <p>정말 뜻깊은 시간이었고, 동물들과 함께한 시간이 너무 행복했습니다.</p>
    <p>보호소 직원분들도 정말 친절하시고, 동물들도 모두 건강하고 활발했습니다.</p>
  </div>

  <div>
    <h3>첨부 미디어</h3>
    <div>
      <div>이미지 1</div>
      <div>이미지 2</div>
      <div>이미지 3</div>
    </div>
  </div>

  <div>
    <div>
      <form method="get" action="">
        <input type="hidden" name="action" value="like">
        <button type="submit">❤️ 좋아요 8</button>
      </form>
    </div>
    <div>
      <button>💬 댓글 12</button>
    </div>
  </div>

  <div>
    <h2>댓글 (12)</h2>
    
    <div>
      <div>
        <div>
          <div>김댓글 | 2024-01-15 14:30</div>
          <div>
            <button>수정</button>
            <button>삭제</button>
          </div>
        </div>
        <div>정말 좋은 경험이었겠네요! 저도 다음에 참여해보고 싶습니다.</div>
      </div>
    </div>

    <div>
      <div>
        <div>
          <div>이댓글 | 2024-01-15 16:45</div>
          <div>
            <button>신고</button>
          </div>
        </div>
        <div>동물들이 정말 귀여워 보이네요. 보호소 주소 알 수 있을까요?</div>
      </div>
    </div>

    <div>
      <div>삭제된 댓글입니다.</div>
    </div>

    <form method="get" action="">
      <div>
        <textarea name="content" placeholder="댓글을 입력해주세요" required maxlength="500"></textarea>
      </div>
      <div>
        <button type="submit">댓글 작성</button>
      </div>
    </form>
  </div>
</main>
</body>
</html>
