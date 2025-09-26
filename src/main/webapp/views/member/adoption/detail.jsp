<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>입양 신청 상세</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style>
/* ===== Reset & Tokens ===== */
*,*::before,*::after{box-sizing:border-box}
html,body{margin:0;padding:0}
a{text-decoration:none;color:inherit}
button{font:inherit;cursor:pointer}

:root{
  --bg:#F7F5F2;
  --surface:#FFF;
  --text:#2B2B2B;
  --muted:#8B857E;
  --line:#EBE6DF;
  --title:#5E5852;
  --link:#1F5FAE;         /* 스샷처럼 파란 링크톤 */
  --link-hover:#134D91;

  --pill-bg:#E9EEF6;      /* 대기중 pill(파랑계열) */
  --pill-bd:#CFD9EA;
  --pill-text:#3C6AA6;

  --radius:8px;
}

body{
  background:var(--bg);
  color:var(--text);
  font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
  font-size:15px; line-height:1.55;
}

/* ===== Layout ===== */
.wrap{max-width:980px;margin:26px auto 60px;padding:0 18px}
.breadcrumb{margin-bottom:6px;font-size:13px;color:#8B857E}
h1{margin:0 0 14px;font-size:22px;font-weight:900}

/* ===== Panel ===== */
.panel{
  background:var(--surface);
  border:1px solid var(--line);
  border-radius:var(--radius);
  overflow:hidden;            /* 플랫한 카드 */
  box-shadow:none;
}

/* 제목 라인: 파란 밑줄 + 얇은 구분선 */
.hline{
  padding:12px 14px 10px;
  border-bottom:1px solid var(--line);
}
.hline > a{
  color:var(--link);
  text-decoration:underline;
  font-weight:800;
  font-size:14px;
}
.hline > a:hover{ color:var(--link-hover) }

/* 상태/메타 라인 : pill은 왼쪽, 날짜는 오른쪽 */
.statbar{
  display:flex; align-items:center; justify-content:space-between;
  padding:10px 14px 6px;
}
.pill{
  display:inline-flex; align-items:center; justify-content:center;
  height:26px; padding:0 12px; border-radius:999px;
  background:var(--pill-bg); border:1px solid var(--pill-bd); color:var(--pill-text);
  font-size:12.5px; font-weight:800;
}
.meta{ text-align:right; color:#9C968F; font-size:12.5px; line-height:1.35 }

/* 본문(프로필/보호소) */
.body{ padding:0 14px 14px }
.profile-row{
  display:grid; grid-template-columns:72px 1fr; gap:12px; align-items:center;
  padding:12px 0;
}
.thumb{
  width:72px; height:72px; border-radius:8px;
  background:#EDE3D6; border:1px solid #E3D6C4;
}
.sep{ height:1px; background:var(--line) }

.link{ color:var(--link); text-decoration:underline; font-weight:700; font-size:13.5px }
.link:hover{ color:var(--link-hover) }

/* ===== 아래 '입양 신청서' 패널 ===== */
.bar{
  padding:10px 14px; border-bottom:1px solid var(--line);
  color:var(--title); font-weight:800; font-size:14px;
}
.kv{ display:grid; grid-template-columns:110px 1fr; gap:12px; padding:6px 0 }
.kv .k{ color:#6F6962 }
.kv .v{ color:#2F2F2F }
.section + .section{ border-top:1px solid var(--line) }
.stitle{ font-size:13.5px; font-weight:800; color:var(--title); margin:12px 0 6px }

/* 하단 버튼 */
.actions{ display:flex; gap:8px; padding:12px 14px }
.btn{
  height:36px; padding:0 14px; border-radius:8px; font-weight:800;
  display:inline-flex; align-items:center; justify-content:center;
}
.btn-ghost{ background:#F4F1EC; border:1px solid #E7E1D9; color:#5E5852 }
.btn-soft{ background:#EFE9E0; border:1px solid #E4D9CA; color:#7A5C44 }
.btn-ghost:hover,.btn-soft:hover{ filter:brightness(1.02) }

@media (max-width:640px){
  .profile-row{ grid-template-columns:56px 1fr }
  .kv{ grid-template-columns:1fr; gap:4px }
  .statbar{ flex-direction:column; align-items:flex-start; gap:6px }
  .meta{ text-align:left }
}
</style>
</head>
<body>
  <div class="wrap">
    <div class="breadcrumb">← <a href="my-list.jsp" style="color:inherit">목록으로 돌아가기</a></div>
    <h1>입양 신청 상세</h1>

    <!-- ===== 패널 #1 : 기본 정보 (왼쪽 스샷 레이아웃) ===== -->
    <section class="panel">
      <!-- 파란 밑줄 제목 -->
      <div class="hline"><a href="#">기본 정보</a></div>

      <!-- 상태(왼쪽) + 우측 메타(신청일/처리일시) -->
      <div class="statbar">
        <span class="pill">대기 중</span>
        <div class="meta">
          신청일: 2023.10.15<br/>처리일시: -
        </div>
      </div>

      <!-- 프로필 & 보호소 -->
      <div class="body">
        <div class="profile-row">
          <div class="thumb"></div>
          <div>
            <div style="font-weight:800">초코</div>
            <div style="color:#6F6962;font-size:13.5px">말티즈 / 암컷 / 2세</div>
            <div><a href="#" class="link">강아지 프로필 보기 →</a></div>
          </div>
        </div>

        <div class="sep"></div>

        <div class="profile-row" style="grid-template-columns:1fr">
          <div style="font-weight:800">해피동물보호소</div>
          <div style="color:#2F2F2F">02-1234-5678</div>
          <div style="color:#2F2F2F">서울시 강남구 역삼동 123-45</div>
          <div><a href="#" class="link">보호소 프로필 보기 →</a></div>
        </div>
      </div>
    </section>

    <div style="height:16px"></div>

    <!-- ===== 패널 #2 : 입양 신청서 ===== -->
    <section class="panel">
      <div class="bar">입양 신청서</div>
      <div class="body">
        <div class="section">
          <div class="stitle">개인정보</div>
          <div class="kv"><div class="k">이름</div><div class="v">김입양</div></div>
          <div class="kv"><div class="k">연락처</div><div class="v">010-1234-5678</div></div>
          <div class="kv"><div class="k">주소</div><div class="v">서울시 강남구 테헤란로 123</div></div>
          <div class="kv"><div class="k">이메일</div><div class="v">example@email.com</div></div>
        </div>

        <div class="section">
          <div class="stitle">주거환경</div>
          <div class="kv"><div class="k">주거형태</div><div class="v">아파트</div></div>
          <div class="kv"><div class="k">반려 경험</div><div class="v">예</div></div>
          <div class="kv"><div class="k">가족 동의</div><div class="v">예</div></div>
        </div>

        <div class="section">
          <div class="stitle">돌봄 계획</div>
          <div class="kv"><div class="k">주간 부재 시간</div><div class="v">4~6시간</div></div>
          <div class="kv"><div class="k">산책 빈도</div><div class="v">하루 2회</div></div>
        </div>

        <div class="section">
          <div class="stitle">동의 항목</div>
          <div class="kv"><div class="k">개인정보 처리</div><div class="v">✓ 위 항목에 동의합니다</div></div>
          <div class="kv"><div class="k">파양 금지 서약</div><div class="v">✓ 입양 후 파양하지 않을 것을 서약합니다</div></div>
        </div>

        <div class="section">
          <div class="stitle">처리 메모/피드백</div>
          <div class="kv" style="grid-template-columns:1fr"><div class="v">아직 처리 중입니다.</div></div>
        </div>

        <div class="actions">
          <a href="my-list.jsp" class="btn btn-ghost">목록</a>
          <button type="button" class="btn btn-soft">취소하기</button>
        </div>
      </div>
    </section>
  </div>
</body>
</html>

