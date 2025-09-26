<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>문의 상세</title>
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
    margin-bottom:32px;
  }

  /* ===== 컨텐츠 컨테이너 ===== */
  main > div:nth-child(3){
    display:flex; flex-direction:column; gap:24px;
  }

  /* ===== 섹션 ===== */
  main > div:nth-child(3) > div{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:24px;
  }

  /* ===== 섹션 헤더 ===== */
  main > div:nth-child(3) > div h2{
    font-size:18px; font-weight:700;
    color:var(--brand-strong);
    margin-bottom:16px;
    padding-bottom:12px;
    border-bottom:2px solid var(--accent-bar);
  }

  /* ===== 문의 정보 ===== */
  main > div:nth-child(3) > div:first-child > div{
    display:grid;
    grid-template-columns:auto 1fr;
    gap:12px 16px;
    margin-bottom:8px;
  }
  main > div:nth-child(3) > div:first-child > div:last-child{
    margin-bottom:0;
  }
  main > div:nth-child(3) > div:first-child > div > div:first-child{
    font-weight:600; color:var(--muted);
    min-width:80px;
  }
  main > div:nth-child(3) > div:first-child > div > div:last-child{
    color:var(--text);
  }
  main > div:nth-child(3) > div:first-child span{
    padding:4px 8px; border-radius:999px; font-size:12px; font-weight:700;
    background:var(--pill-green); color:var(--pill-green-text);
  }

  /* ===== 문의 내용 ===== */
  main > div:nth-child(3) > div:nth-child(2) > div:first-child{
    white-space:pre-line;
    line-height:1.6;
    margin-bottom:20px;
  }

  /* ===== 첨부 파일 ===== */
  main > div:nth-child(3) > div:nth-child(2) > div:last-child h3{
    font-size:16px; font-weight:600;
    color:var(--brand-strong);
    margin-bottom:12px;
  }
  main > div:nth-child(3) > div:nth-child(2) > div:last-child > div{
    display:flex; flex-direction:column; gap:8px;
  }
  main > div:nth-child(3) > div:nth-child(2) > div:last-child > div > div{
    display:inline-flex; align-items:center; gap:8px;
    padding:8px 12px;
    background:var(--accent-bar);
    border-radius:8px;
    font-size:14px; font-weight:600;
    color:var(--brand-strong);
  }

  /* ===== 보호소 답변 ===== */
  main > div:nth-child(3) > div:last-child{
    background:linear-gradient(135deg, #F8F9FA 0%, #E9ECEF 100%);
    border-color:var(--brand);
  }
  main > div:nth-child(3) > div:last-child h2{
    color:var(--brand-strong);
    border-bottom-color:var(--brand);
  }
  main > div:nth-child(3) > div:last-child > div:first-child{
    white-space:pre-line;
    line-height:1.6;
    margin-bottom:16px;
  }
  main > div:nth-child(3) > div:last-child > div:nth-child(2),
  main > div:nth-child(3) > div:last-child > div:nth-child(3){
    font-size:14px; color:var(--muted);
    margin-bottom:4px;
  }
  main > div:nth-child(3) > div:last-child > div:last-child{
    margin-bottom:0;
  }

  /* ===== 액션 버튼들 ===== */
  main > div:last-child{
    display:flex; justify-content:flex-end; gap:12px;
    margin-top:32px;
    padding-top:24px;
    border-top:1px solid var(--border);
  }
  main > div:last-child a,
  main > div:last-child button{
    height:40px; padding:0 20px; border-radius:var(--radius-lg);
    font-weight:600; font-size:14px;
    cursor:pointer;
    transition:all .2s ease;
  }
  main > div:last-child a{
    display:inline-flex; align-items:center; justify-content:center;
    background:#fff; color:var(--text);
    border:1px solid var(--border);
  }
  main > div:last-child a:hover{
    background:var(--accent-bar); border-color:var(--brand);
  }
  main > div:last-child button{
    background:#fff; color:var(--danger);
    border:1px solid #F0B7B7;
  }
  main > div:last-child button:hover{
    background:#FCEEEE; border-color:var(--danger);
  }

  /* ===== 반응형 ===== */
  @media (max-width:768px){
    main{ padding:16px; }
    main > div:nth-child(3) > div{ padding:20px; }
    main > div:nth-child(3) > div:first-child > div{
      grid-template-columns:1fr;
      gap:4px;
    }
    main > div:last-child{
      flex-direction:column;
    }
    main > div:last-child a,
    main > div:last-child button{
      width:100%;
    }
  }
  </style>
</head>
<body>
<main>
  <div>
    <a href="my-list.jsp">← 목록으로</a>
  </div>

  <h1>문의 상세</h1>

  <div>
    <div>
      <h2>문의 정보</h2>
      <div>
        <div>제목</div>
        <div>입양 절차 문의</div>
      </div>
      <div>
        <div>작성일</div>
        <div>2024-01-15 14:30</div>
      </div>
      <div>
        <div>상태</div>
        <div><span>답변완료</span></div>
      </div>
    </div>

    <div>
      <h2>문의 내용</h2>
      <div>
        안녕하세요. 입양 절차에 대해 문의드립니다.
        
        입양 신청서를 작성한 후 어떤 과정을 거치게 되나요?
        면접은 언제 진행되며, 승인까지 얼마나 걸리나요?
        
        답변 부탁드립니다.
      </div>
      
      <div>
        <h3>첨부 파일</h3>
        <div>
          <div>📄 입양신청서.pdf</div>
          <div>🖼️ 동물사진.jpg</div>
        </div>
      </div>
    </div>

    <div>
      <h2>보호소 답변</h2>
      <div>
        안녕하세요. 문의해주셔서 감사합니다.
        
        입양 절차는 다음과 같습니다:
        1. 신청서 검토 (1-2일)
        2. 전화 상담 (3-5일)
        3. 면접 일정 조율 (1주일 내)
        4. 최종 승인 (면접 후 2-3일)
        
        추가 문의사항이 있으시면 언제든 연락주세요.
      </div>
      <div>답변일: 2024-01-16 10:15</div>
      <div>담당자: 김보호소</div>
    </div>
  </div>

  <div>
    <a href="my-list.jsp">목록</a>
    <a href="edit.html?id=1">수정</a>
    <button>삭제</button>
  </div>
</main>
</body>
</html>
