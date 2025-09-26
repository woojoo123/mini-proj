<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<style>
  <style>
  /* ===== 1:1 문의 (단일 파일) ===== */
  *,*::before,*::after{box-sizing:border-box}
  html,body{margin:0;padding:0}
  a{text-decoration:none;color:inherit}
  button,input,select,textarea{font:inherit}
  img{max-width:100%;display:block}

  :root{
    --bg:#F6F4F0;
    --surface:#FFFFFF;
    --text:#2B2B2B;
    --muted:#8B857E;
    --border:#E6E1DB;
    --shadow:0 4px 16px rgba(0,0,0,.06);

    --brand:#B08968;
    --brand-strong:#8C6A4E;

    --pill-green:#DDF5E6;
    --pill-green-text:#2E8B57;
    --pill-yellow:#FBF0CC;
    --pill-yellow-text:#8A6D2A;

    --danger:#E86060;

    --radius-xl:16px;
  }

  body{
    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
  }

  /* 레이아웃 */
  main > div{
    max-width:1280px;
    margin:0 auto;
    padding:24px;
    display:grid;
    grid-template-columns:240px 1fr;
    gap:32px;
  }

  /* 사이드바 */
  aside{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    box-shadow:var(--shadow);
    padding:18px;
  }
  aside > div{height:36px;margin-bottom:8px}
  aside ul{list-style:none;margin:0;padding:0}
  aside li{margin:6px 0}
  aside li ul{margin-top:6px;margin-left:8px}
  aside a{
    display:flex; align-items:center; justify-content:space-between;
    padding:10px 12px; border-radius:12px; color:#6B6460;
  }
  aside a:hover{background:rgba(0,0,0,.04); color:var(--text)}
  aside a span{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:22px; height:22px; padding:0 6px; border-radius:999px;
    background:var(--danger); color:#fff; font-weight:800; font-size:12px;
  }
  /* 현재 메뉴 강조 */
  aside a[href="inquiry-list.jsp"]{background:#9B8978;color:#fff}

  /* 헤더: 제목 + 버튼 */
  section > div:first-of-type{
    display:flex; align-items:center; justify-content:space-between;
    margin-bottom:12px;
  }
  section > div:first-of-type h1{
    margin:0; font-size:24px; font-weight:900;
  }
  section > div:first-of-type > button{
    height:38px; padding:0 14px; border-radius:10px; cursor:pointer;
    border:none; background:var(--brand-strong); color:#fff; font-weight:800;
    box-shadow:0 4px 12px rgba(0,0,0,.12);
  }
  section > div:first-of-type > button:hover{filter:brightness(1.05)}

  /* 리스트 컨테이너 */
  section > div:nth-of-type(2){
    display:flex; flex-direction:column; gap:12px;
  }

  /* 카드 */
  section > div:nth-of-type(2) article{
    position:relative;
    display:grid;
    grid-template-columns:1fr auto auto;
    align-items:center; gap:16px;
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:14px;
    box-shadow:var(--shadow);
    padding:14px 16px 14px 64px; /* 왼쪽 아이콘 자리 */
  }

  /* 왼쪽 말풍선 아이콘 */
  section > div:nth-of-type(2) article::before{
    content:"💬";
    position:absolute; left:16px; top:50%; transform:translateY(-50%);
    width:36px; height:36px; border-radius:50%;
    display:flex; align-items:center; justify-content:center;
    background:#F1EDE7; border:1px solid #E6DBCF; color:#8C7763; font-size:18px;
  }

  /* 제목/서브텍스트 */
  section > div:nth-of-type(2) article > div:first-child p{
    margin:0 0 6px 0; font-weight:900;
  }
  section > div:nth-of-type(2) article > div:first-child > div{
    color:#8F8A83; font-size:14px;
  }

  /* 상태 배지 */
  section > div:nth-of-type(2) article > span{
    justify-self:start; padding:6px 10px; border-radius:999px;
    font-size:13px; font-weight:800; border:1px solid transparent;
  }
  /* 첫 카드=답변완료(초록) / 둘째=미답변(노랑)  */
  section > div:nth-of-type(2) article:nth-child(1) > span{
    background:var(--pill-green); color:var(--pill-green-text); border-color:#CBEBD7;
  }
  section > div:nth-of-type(2) article:nth-child(2) > span{
    background:var(--pill-yellow); color:var(--pill-yellow-text); border-color:#F1E2B9;
  }

  /* 우측 액션 */
  section > div:nth-of-type(2) article > div:last-child{
    display:flex; align-items:center; gap:8px; justify-self:end;
  }
  section > div:nth-of-type(2) article a,
  section > div:nth-of-type(2) article button{
    height:34px; padding:0 12px; border-radius:10px; cursor:pointer;
    border:1px solid var(--border); background:#fff; color:#4B4B4B; font-weight:800;
    display:inline-flex; align-items:center; gap:6px;
  }
  section > div:nth-of-type(2) article a:hover,
  section > div:nth-of-type(2) article button:hover{ background:rgba(0,0,0,.04) }
  /* 아이콘 느낌 */
  section > div:nth-of-type(2) article a::before{content:"👁️"; font-size:14px}
  section > div:nth-of-type(2) article button:nth-of-type(1)::before{content:"✏️"; font-size:14px}
  section > div:nth-of-type(2) article button:nth-of-type(2){
    color:#C84E4E; border-color:#F0B7B7;
  }
  section > div:nth-of-type(2) article button:nth-of-type(2)::before{content:"🗑️"; font-size:14px}

  /* 반응형 */
  @media (max-width:960px){
    main > div{grid-template-columns:1fr; gap:24px}
  }
  @media (max-width:600px){
    section > div:nth-of-type(2) article{
      grid-template-columns:1fr auto; row-gap:8px;
    }
    section > div:nth-of-type(2) article > span{justify-self:flex-start}
    section > div:nth-of-type(2) article > div:last-child{justify-content:flex-end}
  }
  </style>
 
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