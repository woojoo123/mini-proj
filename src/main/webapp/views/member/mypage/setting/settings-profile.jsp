<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>설정 - 프로필</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <style>
  /* ========= 공용 토큰/베이스 (스코프 적용) ========= */
  .settings-profile *, .settings-profile *::before, .settings-profile *::after{ box-sizing:border-box; }
  .settings-profile img{ max-width:100%; display:block; }
  .settings-profile button, .settings-profile input, .settings-profile select, .settings-profile textarea{ font:inherit; }
  .settings-profile a{ text-decoration:none; color:inherit; }
  .settings-profile :focus-visible{ outline:2px solid #B08968; outline-offset:2px; }

  .settings-profile{
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
    --gap-xxl:32px;
    --gap-xl:24px;
    --gap-lg:16px;
    --gap-md:12px;
    --gap-sm:8px;
    --maxw:1280px;

    background:var(--bg);
    color:var(--text);
    font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
    line-height:1.5; font-size:16px;
    min-height:100dvh;
    margin:0;
  }
  .settings-profile h1,.settings-profile h2,.settings-profile h3{ margin:0; }

  /* 레이아웃 (사이드바 + 본문) */
  .settings-profile main > div{
    max-width:var(--maxw);
    margin:0 auto;
    padding:var(--gap-xl);
    display:grid;
    grid-template-columns:240px 1fr;
    gap:var(--gap-xxl);
  }

  /* 사이드바 */
  .settings-profile aside{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:var(--radius-xl);
    padding:20px;
    box-shadow:var(--shadow-sm);
  }
  .settings-profile aside > div{ height:36px; margin-bottom:10px; font-weight:800; }
  .settings-profile aside ul{ list-style:none; margin:0; padding:0; }
  .settings-profile aside li{ margin:6px 0; }
  .settings-profile aside li ul{ margin-top:6px; margin-left:8px; }
  .settings-profile aside a{
    display:flex; align-items:center; justify-content:space-between;
    padding:10px 12px; border-radius:10px; color:var(--text-muted);
  }
  .settings-profile aside a:hover{ background:rgba(0,0,0,.03); color:var(--text); }
  .settings-profile aside a.active{
    background:var(--accent); color:var(--brand-strong); border-left:4px solid var(--brand);
  }
  .settings-profile aside a span{
    display:inline-flex; align-items:center; justify-content:center;
    min-width:20px; height:20px; padding:0 6px; border-radius:999px;
    background:var(--danger); color:#fff; font-weight:700; font-size:12px;
  }

  /* 반응형(사이드바 1열) */
  @media (max-width:960px){
    .settings-profile main > div{ grid-template-columns:1fr; gap:var(--gap-xl); }
  }

  /* ========= Settings – Profile page (스코프) ========= */

  /* 상단: 제목 + 탭바 */
  .settings-profile section > div:first-of-type{
    display:flex; flex-direction:column; gap:12px; margin-bottom:18px;
  }
  .settings-profile section > div:first-of-type h1{
    font-size:22px; font-weight:800; margin:0;
  }

  /* 탭바 래퍼(연한 베이지 바) */
  .settings-profile section > div:first-of-type nav{
    background:#FBF2E3;
    border:1px solid #F1E5D3;
    border-radius:12px;
    padding:6px;
    display:flex; gap:6px; flex-wrap:wrap;
  }

  /* 탭 버튼 */
  .settings-profile section > div:first-of-type nav a{
    display:inline-flex; align-items:center; justify-content:center;
    padding:10px 18px;
    border-radius:10px;
    color:#6B6460;
    font-weight:700; font-size:14px;
  }

  /* 활성 탭 */
  .settings-profile section > div:first-of-type nav a.active{
    background:#fff;
    border:1px solid var(--border);
    box-shadow:0 2px 8px rgba(0,0,0,.06);
    color:var(--text);
  }

  /* 상세 카드 패널 */
  .settings-profile section > article{
    background:var(--surface);
    border:1px solid var(--border);
    border-radius:16px;
    box-shadow:var(--shadow-sm);
    padding:18px 18px 22px;
  }

  /* 패널 제목 */
  .settings-profile section > article > h3{
    margin:0 0 16px 0;
    font-size:16px; font-weight:800; color:var(--text);
  }

  /* 폼 영역 래퍼 */
  .settings-profile section > article > div{
    display:flex; flex-direction:column; gap:18px;
  }

  /* 행 공통: 좌측 라벨/타이틀, 우측 컨트롤 */
  .settings-profile section > article > div > div{
    display:grid;
    grid-template-columns:160px 1fr;
    align-items:start;
    gap:14px;
  }

  /* 라벨(좌측) */
  .settings-profile section > article > div > div > div:first-child{
    color:#7A746E; font-weight:700; font-size:14px; line-height:36px;
  }

  /* 인풋/텍스트/버튼 쪽(우측) 공통 타이포 */
  .settings-profile section > article > div > div > div:last-child{
    color:var(--text); font-size:15px;
  }

  /* ─ 프로필 영역(첫 행) ─ */
  .settings-profile section > article > div > div:first-child > div:last-child{
    display:flex; align-items:center; gap:14px;
  }
  .settings-profile section > article > div > div:first-child > div:last-child > div:first-child{
    /* 원형 아바타: '김' 이니셜 */
    width:56px; height:56px; border-radius:50%;
    display:flex; align-items:center; justify-content:center;
    background:#FFF3E1; color:#6F553D; font-weight:800;
    border:1px solid #F2E3CF;
  }
  .settings-profile section > article > div > div:first-child > div:last-child > div:last-child strong{
    font-size:16px;
  }
  .settings-profile section > article > div > div:first-child > div:last-child button{
    height:34px; padding:0 14px; margin-left:10px;
    border:1px solid var(--border); border-radius:10px; background:#fff; cursor:pointer;
    font-weight:700; font-size:13.5px; color:#4B4B4B;
  }
  .settings-profile section > article > div > div:first-child > div:last-child button::before{
    content:"📷"; margin-right:6px;
  }
  .settings-profile section > article > div > div:first-child > div:last-child button:hover{
    background:rgba(0,0,0,.03);
  }

  /* 입력 컨트롤 스타일 */
  .settings-profile section input[type="text"],
  .settings-profile section input[placeholder],
  .settings-profile section textarea{
    width:100%;
    height:36px;
    padding:0 12px;
    border:1px solid var(--border);
    border-radius:10px;
    background:#fff;
    color:var(--text);
  }
  .settings-profile section textarea{ height:auto; padding:10px 12px; resize:vertical; }

  /* placeholder 색 */
  .settings-profile section input::placeholder,
  .settings-profile section textarea::placeholder{
    color:#B0B0B0;
  }

  /* 지역(주소) 행: 두 입력 세로 간격 */
  .settings-profile section > article > div > div:nth-last-child(2) > div:last-child{
    display:flex; flex-direction:column; gap:8px;
  }

  /* 저장 버튼 행 */
  .settings-profile section > article > div > div:last-child{
    grid-template-columns:160px auto; align-items:center;
  }
  .settings-profile section > article > div > div:last-child > button{
    justify-self:start;
    height:38px; padding:0 18px;
    border:none; border-radius:10px; cursor:pointer;
    background:var(--brand-strong); color:#fff; font-weight:800;
    box-shadow:0 4px 12px rgba(0,0,0,.12);
  }
  .settings-profile section > article > div > div:last-child > button:hover{
    filter: brightness(1.05);
  }

  /* 반응형 */
  @media (max-width:840px){
    .settings-profile section > article > div > div{
      grid-template-columns:1fr;
    }
    .settings-profile section > article > div > div > div:first-child{
      line-height:1; margin-bottom:4px;
    }
    .settings-profile section > article > div > div:last-child > button{
      justify-self:stretch; width:100%;
    }
  }
  </style>
</head>

<body class="settings-profile">
<main>
  <div>
    <!-- Sidebar -->
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

    <!-- Content -->
    <section>
      <div>
        <h1>설정</h1>
        <nav>
          <a href="settings-profile.jsp" class="active">프로필</a>
          <a href="settings-account.jsp">계정</a>
          <a href="settings-notifications.jsp">알림</a>
          <a href="settings-security.jsp">보안</a>
          <a href="settings-connections.jsp">연동</a>
          <a href="settings-withdraw.jsp">탈퇴</a>
        </nav>
      </div>

      <article>
        <h3>프로필 설정</h3>

        <div>
          <div>
            <div>프로필</div>
            <div>
              <div aria-hidden="true">김</div>
              <div>
                <strong>김지수</strong><br>
                <button type="button">프로필 이미지 변경</button>
              </div>
            </div>
          </div>

          <div>
            <div>닉네임</div>
            <div><input type="text" placeholder="닉네임" value="김지수" aria-label="닉네임"></div>
          </div>

          <div>
            <div>연락처</div>
            <div><input type="text" placeholder="010-1234-5678" value="010-1234-5678" aria-label="연락처"></div>
          </div>

          <div>
            <div>한줄소개</div>
            <div><textarea rows="3" placeholder="소개를 입력하세요" aria-label="한줄소개">동물을 사랑하는 마음으로 보호소 봉사와 후원에 참여하고 있습니다.</textarea></div>
          </div>

          <div>
            <div>지역</div>
            <div>
              <input type="text" placeholder="서울시 강남구" aria-label="시/군/구">
              <input type="text" placeholder="상세 주소를 입력하세요" aria-label="상세주소">
            </div>
          </div>

          <div>
            <button type="button">저장하기</button>
          </div>
        </div>
      </article>
    </section>
  </div>
</main>
</body>
</html>

