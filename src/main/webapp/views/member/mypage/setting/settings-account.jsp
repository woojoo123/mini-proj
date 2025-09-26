<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>설정 - 계정</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <style>
  /* ========= 공용 토큰/베이스 (스코프 적용) ========= */
  .settings-account *, .settings-account *::before, .settings-account *::after{ box-sizing:border-box; }
  .settings-account img{ max-width:100%; display:block; }
  .settings-account button, .settings-account input, .settings-account select, .settings-account textarea{ font:inherit; }
  .settings-account a{ text-decoration:none; color:inherit; }
  .settings-account :focus-visible{ outline:2px solid #B08968; outline-offset:2px; }

  .settings-account{
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

    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
    min-height:100dvh; margin:0;
  }
  .settings-account h1,.settings-account h2,.settings-account h3{ margin:0; }

  /* 레이아웃 (사이드바 + 본문) */
  .settings-account main > div{
    max-width:1280px;
    margin:0 auto;
    padding:24px;
    display:grid;
    grid-template-columns:240px 1fr;
    gap:32px;
  }

  /* 사이드바 */
  .settings-account aside{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:16px;
    padding:20px;
    box-shadow:var(--shadow-sm);
  }
  .settings-account aside > div{ height:36px; margin-bottom:10px; font-weight:800; }
  .settings-account aside ul{ list-style:none; margin:0; padding:0; }
  .settings-account aside li{ margin:6px 0; }
  .settings-account aside li ul{ margin-top:6px; margin-left:8px; }
  .settings-account aside a{
    display:flex; align-items:center; justify-content:space-between;
    padding:10px 12px; border-radius:10px; color:var(--text-muted);
  }
  .settings-account aside a:hover{ background:rgba(0,0,0,.03); color:var(--text); }
  .settings-account aside a.active{
    background:var(--accent); color:var(--brand-strong); border-left:4px solid var(--brand);
  }
  .settings-account aside a span{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:20px; height:20px; padding:0 6px; border-radius:999px;
    background:var(--danger); color:#fff; font-weight:700; font-size:12px;
  }

  /* 반응형(사이드바 1열) */
  @media (max-width:960px){
    .settings-account main > div{ grid-template-columns:1fr; gap:24px; }
  }

  /* ========= Settings – Account page (스코프) ========= */

  /* 탭: 기본은 전부 비활성 */
  .settings-account section > div:first-of-type{
    display:flex; flex-direction:column; gap:12px; margin-bottom:18px;
  }
  .settings-account section > div:first-of-type h1{
    font-size:22px; font-weight:800;
  }
  .settings-account section > div:first-of-type nav{
    background:#FBF2E3;
    border:1px solid #F1E5D3;
    border-radius:12px;
    padding:6px;
    display:flex; gap:6px; flex-wrap:wrap;
  }
  .settings-account section > div:first-of-type nav a{
    display:inline-flex; align-items:center; justify-content:center;
    padding:10px 18px; border-radius:10px;
    color:#6B6460; font-weight:700; font-size:14px;
    background:transparent; border:none; box-shadow:none;
  }

  /* 계정 탭(2번째) 활성 */
  .settings-account section > div:first-of-type nav a:nth-child(2),
  .settings-account section > div:first-of-type nav a.active{
    background:#fff;
    border:1px solid var(--border);
    box-shadow:0 2px 8px rgba(0,0,0,.06);
    color:var(--text);
  }
  /* 혹시 남아있는 '첫 탭 흰색' 규칙 무력화 */
  .settings-account section > div:first-of-type nav a:first-child{
    background:transparent !important;
    border:none !important;
    box-shadow:none !important;
    color:#6B6460 !important;
  }

  /* 카드 패널 공통 */
  .settings-account section > article{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:16px;
    box-shadow:var(--shadow-sm);
    padding:18px 18px 22px;
  }
  .settings-account section > article > h3{
    margin:0 0 14px 0; font-size:16px; font-weight:800;
  }

  /* 폼 행: 좌측 라벨, 우측 컨트롤 */
  .settings-account section > article >form > div > div{
    display:grid;
    grid-template-columns:160px 1fr;
    align-items:start;
    gap:14px;
    padding:10px 0;
  }
  .settings-account section > article >form > div > div > div:first-child{
    color:#7A746E; font-weight:700; font-size:14px; line-height:36px;
  }
  .settings-account section > article >form > div > div > div:last-child{
    font-size:15px; color:var(--text);
  }

  /* 상단 이메일 블록: 주소 + 안내문 */
  .settings-account section > article >form > div > div:first-child > div:last-child > div:first-child{
    color:#3b3b3b; font-weight:700; margin-bottom:4px;
  }
  .settings-account section > article >form > div > div:first-child > div:last-child > div:last-child{
    color:#9AA0A6; font-size:13.5px;
  }

  /* 인풋(비밀번호/텍스트) */
  .settings-account section input[type="password"],
  .settings-account section input[type="text"]{
    width:100%; height:36px; padding:0 12px;
    border:1px solid var(--border); border-radius:10px; background:#fff; color:var(--text);
  }
  .settings-account section input::placeholder{ color:#B0B0B0; }

  /* 비밀번호 변경 버튼 */
  .settings-account section > article >form > div > div:nth-of-type(5) > button{
    height:38px; padding:0 16px; border-radius:10px; cursor:pointer;
    background:#F5E9DC; border:1px solid #EAD8C5; color:#6F553D; font-weight:800;
    box-shadow:0 2px 8px rgba(0,0,0,.05);
  }
  .settings-account section > article >form > div > div:nth-of-type(5) > button:hover{ filter:brightness(1.03); }

  /* 구분선 */
  .settings-account section > article >form > div > hr{
    border:0; height:1px; background:#F1E5D3; margin:8px 0 6px;
  }

  /* 마케팅 수신 동의 영역 */
  .settings-account section > article >form > div > div:last-of-type > div:last-child{
    display:flex; flex-direction:column; gap:10px;
  }
  .settings-account section > article >form > div > div:last-of-type > div:last-child > div{
    display:grid; grid-template-columns:1fr auto; align-items:center;
  }

  /* 스위치 토글(체크박스 커스텀) */
  .settings-account section input[type="checkbox"]{
    appearance:none; -webkit-appearance:none; outline:none;
    width:40px; height:24px; border-radius:999px;
    background:#E9E4DD; border:1px solid var(--border);
    position:relative; cursor:pointer; transition:.18s ease;
  }
  .settings-account section input[type="checkbox"]::after{
    content:""; position:absolute; top:2px; left:2px;
    width:20px; height:20px; border-radius:999px; background:#fff;
    box-shadow:0 1px 2px rgba(0,0,0,.12); transition:.18s ease;
  }
  .settings-account section input[type="checkbox"]:checked{
    background:#E7D7C5; border-color:#D8C5AF;
  }
  .settings-account section input[type="checkbox"]:checked::after{ left:18px; }

  /* 프로필 페이지용 아바타 스타일이 섞이지 않도록 예외 처리 */
  .settings-account section > article >form > div > div:first-child:has(button) > div:last-child > div:first-child{
    width:56px; height:56px; border-radius:50%;
    display:flex; align-items:center; justify-content:center;
    background:#FFF3E1; color:#6F553D; font-weight:800;
    border:1px solid #F2E3CF;
  }
  .settings-account section > article >form > div > div:first-child:not(:has(button)) > div:last-child > div:first-child{
    width:auto; height:auto; border-radius:0; background:transparent; border:none;
    color:inherit; font-weight:700; display:inline;
  }

  /* 이메일/안내문 나란히 정렬(프로필 아바타 케이스 제외) */
  .settings-account section > article >form > div > div:first-child > div:last-child:not(:has(button)){
    display:flex; align-items:baseline; column-gap:16px; row-gap:4px; flex-wrap:wrap;
  }
  .settings-account section > article >form > div > div:first-child > div:last-child:not(:has(button)) > div:first-child{
    font-weight:700; color:#2b2b2b; white-space:nowrap;
  }
  .settings-account section > article >form > div > div:first-child > div:last-child:not(:has(button)) > div:last-child{
    color:#9AA0A6; font-size:13.5px; line-height:1.5; white-space:nowrap;
  }
  @media (max-width:560px){
    .settings-account section > article >form > div > div:first-child > div:last-child:not(:has(button)){
      flex-direction:column; align-items:flex-start;
    }
    .settings-account section > article >form > div > div:first-child > div:last-child:not(:has(button)) > div:last-child{
      white-space:normal;
    }
  }

  /* 반응형 */
  @media (max-width:840px){
    .settings-account section > article >form > div > div{ grid-template-columns:1fr; }
    .settings-account section > article >form > div > div > div:first-child{ line-height:1; margin-bottom:4px; }
  }
  </style>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
  function btnClick() {
	  $("#form").submit();
  }
  $(function() {
  		$("#form").submit(function(e) {
  			if($("#newPassword1").val()!=$("#newPassword2").val()) {
  				alert("새 비밀번호와 비밀번호 확인이 같지 않습니다.")
  				e.preventDefault();
  			}
  		})
  	})
  </script>
</head>

<body class="settings-account">
<main>
  <div>
    <!-- 사이드바 -->
    <aside>
      <div>동반자</div>
      <ul>
        <li><a href="../dashboard.jsp">한눈에 보기</a></li>
        <li><a href="../notice/notification-list.jsp">알림 <span>12</span></a></li>
        <li><a href="../adopt-list.jsp">입양 신청 내역</a></li>
        <li><a href="../volunteer-list.jsp">봉사 신청 내역</a></li>
        <li><a href="../donation-history.jsp">후원 내역</a></li>
        <li><a href="../follow-animals.jsp">팔로우 관리</a></li>
        <li>
          <a href="../shelter-management.jsp">보호소 관리</a>
          <ul>
            <li><a href="../shelter-notice-create.jsp">공지사항 등록</a></li>
            <li><a href="../shelter-timeline-create.jsp">타임라인 작성</a></li>
            <li><a href="../shelter-diary-create.jsp">보호일지 작성</a></li>
            <li><a href="../shelter-volunteer-schedule.jsp">봉사일정 등록</a></li>
          </ul>
        </li>
        <li><a href="../inquiry-list.jsp">1:1 문의</a></li>
        <li><a href="settings-profile.jsp" class="active">설정</a></li>
      </ul>
    </aside>

    <!-- 본문 -->
    <section>
      <div>
        <h1>설정</h1>
        <nav>
          <a href="settings-profile.jsp">프로필</a>
          <a href="settings-account.jsp" class="active">계정</a>
          <a href="settings-notifications.jsp">알림</a>
          <a href="settings-security.jsp">보안</a>
          <a href="settings-connections.jsp">연동</a>
          <a href="settings-withdraw.jsp">탈퇴</a>
        </nav>
      </div>

      <article>
        <h3>계정 설정</h3>
          <form action="${contextPath}/member/mypage/settingAccount" method="POST" id="form">
		
        <div>
          <div>
            <div>로그인 이메일</div>
            <div>
              <div>${user.email }</div>
              <div>이메일 변경이 필요하면 고객센터에 문의해주세요.</div>
            </div>
          </div>
          

          <div>
            <div>현재 비밀번호</div>
            <div><input type="password" placeholder="********" aria-label="현재 비밀번호" name="curPassword"></div>
          </div>

          <div>
            <div>새 비밀번호</div>
            <div><input type="password" placeholder="8자 이상, 영문/숫자/특수문자 2종 이상" aria-label="새 비밀번호" name="newPassword" id="newPassword1"></div>
          </div>

          <div>
            <div>새 비밀번호 확인</div>
            <div><input type="password" placeholder="다시 입력" aria-label="새 비밀번호 확인" id="newPassword2"></div>
          </div>

          <div>
            <button type="button" onclick="btnClick()">비밀번호 변경</button>
            
          </div>
          <hr>

         </div>
		  </form>
      </article>
    </section>
  </div>
</main>
</body>
</html>

