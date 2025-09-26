<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>입양 신청서 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<style>
/* ========== Reset & Tokens ========== */
*,*::before,*::after{box-sizing:border-box}
html,body{margin:0;padding:0}
button,input,select,textarea{font:inherit}
a{text-decoration:none;color:inherit}

:root{
  --bg:#F7F5F2;          /* 화면 배경 */
  --surface:#FFFFFF;     /* 카드/폼 배경 */
  --line:#EBE6DF;        /* 얇은 구분선 */
  --text:#2B2B2B;
  --muted:#8B857E;

  --brand:#8C6A4E;       /* 버튼 메인 톤 */
  --brand-strong:#6F523B;

  --header-bg:#F4EBDD;   /* 상단 요약 박스(연베이지) */
  --thumb-bg:#EADCCB;

  --field-bg:#FFFFFF;
  --field-bd:#E6E1DB;
  --field-focus:#B08968;

  --ghost-bg:#F4F1EC;
  --ghost-bd:#E7E1D9;
  --ghost-text:#5E5852;

  --radius:12px;
  --radius-sm:10px;
}

/* ========== Base ========== */
body{
  background:var(--bg);
  color:var(--text);
  font-family:system-ui,-apple-system,"Segoe UI",Roboto,"Noto Sans KR",sans-serif;
  font-size:15px; line-height:1.55;
}
main{
  max-width:720px;
  margin:28px auto 64px;
  padding:0 18px;
}
h1{
  margin:0 0 16px;
  text-align:center;
  font-size:22px; font-weight:900;
  letter-spacing:-.2px;
}

/* ========== Animal Summary Box ========== */
.summary{
  background:var(--header-bg);
  border:1px solid var(--line);
  border-radius:var(--radius);
  padding:14px;
  display:grid;
  grid-template-columns:72px 1fr;
  gap:12px;
  align-items:center;
  margin:0 0 14px;
}
.thumb{
  width:72px; height:72px; border-radius:10px;
  background:var(--thumb-bg);
  border:1px solid #E2D5C6;
}
.summary strong{font-weight:900}
.summary small{color:var(--muted)}

/* ========== Form Card ========== */
.card{
  background:var(--surface);
  border:1px solid var(--line);
  border-radius:var(--radius);
  padding:0 16px 16px;
}

/* 섹션 타이틀 + 구분선 */
.section-title{
  font-weight:900; color:#5E5852; font-size:14.5px;
  padding:16px 0 8px;
  border-bottom:1px solid var(--line);
  margin:0 0 10px;
}

/* 필드 */
.field{margin:10px 0}
.field label{
  display:block; font-weight:700; font-size:13.5px; color:#6F6962;
  margin-bottom:6px;
}
.input, select, textarea{
  width:100%;
  height:40px;
  padding:0 12px;
  border-radius:var(--radius-sm);
  background:var(--field-bg);
  border:1px solid var(--field-bd);
  color:var(--text);
}
textarea{height:auto; padding:10px 12px; resize:vertical; min-height:100px}
.input::placeholder, select::placeholder, textarea::placeholder{color:#B0AAA3}
.input:focus, select:focus, textarea:focus{
  outline:none; border-color:var(--field-focus);
  box-shadow:0 0 0 2px color-mix(in srgb, var(--field-focus) 28%, transparent);
}

/* 라디오 / 체크박스 라인 */
.inline{
  display:flex; gap:22px; align-items:center; flex-wrap:wrap;
  padding:2px 0 0;
}
.inline label{font-weight:600; color:#3b3b3b}

/* ========== Actions ========== */
.actions{
  display:flex; gap:8px; justify-content:flex-end;
  padding-top:8px;
}
.btn{
  height:38px; padding:0 16px; border-radius:10px;
  font-weight:800; display:inline-flex; align-items:center; justify-content:center;
  border:1px solid transparent;
}
.btn-primary{
  background:var(--brand); color:#fff;
  border-color:var(--brand);
}
.btn-primary:hover{ filter:brightness(1.05) }
.btn-ghost{
  background:var(--ghost-bg); color:var(--ghost-text);
  border-color:var(--ghost-bd);
}
.btn-ghost:hover{ filter:brightness(1.02) }

/* 반응형 */
@media (max-width:520px){
  .summary{ grid-template-columns:56px 1fr }
}
</style>
</head>
<body>
  <main>
    <h1>입양 신청서 작성</h1>

    <!-- 대상 동물 요약 -->
    <div class="summary" role="group" aria-label="대상 동물">
      <div class="thumb" aria-label="동물 썸네일"></div>
      <div>
        <strong>초코</strong><br>
        <small>말티즈 / 암컷 / 2세</small><br>
        <small>해피동물보호소</small>
      </div>
    </div>

    <form class="card" method="get" action="" enctype="multipart/form-data">
      <!-- 개인정보 -->
      <h2 class="section-title">개인정보</h2>

      <div class="field">
        <label for="name">이름</label>
        <input id="name" name="name" class="input" required />
      </div>

      <div class="field">
        <label for="phone">연락처</label>
        <input id="phone" name="phone" class="input" placeholder="010-1234-5678" required />
      </div>

      <div class="field">
        <label for="addr">주소</label>
        <input id="addr" name="address" class="input" />
      </div>

      <div class="field">
        <label for="email">이메일</label>
        <input id="email" name="email" class="input" placeholder="example@email.com" />
      </div>

      <!-- 주거환경 -->
      <h2 class="section-title">주거환경</h2>

      <div class="field">
        <label for="house">주거형태</label>
        <select id="house" name="houseType" required>
          <option value="">선택해주세요</option>
          <option>아파트</option>
          <option>주택</option>
          <option>원룸/오피스텔</option>
        </select>
      </div>

      <div class="field">
        <label>반려 경험 여부</label>
        <div class="inline">
          <label><input type="radio" name="exp" value="Y" required> 예</label>
          <label><input type="radio" name="exp" value="N"> 아니오</label>
        </div>
      </div>

      <div class="field">
        <label>가족 동의 여부</label>
        <div class="inline">
          <label><input type="radio" name="familyAgree" value="Y" required> 예</label>
          <label><input type="radio" name="familyAgree" value="N"> 아니오</label>
        </div>
      </div>

      <!-- 돌봄 계획 -->
      <h2 class="section-title">돌봄 계획</h2>

      <div class="field">
        <label for="alone">주간 부재 시간(시간)</label>
        <input id="alone" name="aloneHours" class="input" placeholder="예: 4~6" />
      </div>

      <div class="field">
        <label for="walk">산책 빈도(하루 횟수)</label>
        <input id="walk" name="walkPerDay" class="input" placeholder="예: 2" />
      </div>

      <!-- 동의 항목 -->
      <h2 class="section-title">동의 항목</h2>

      <div class="field">
        <label>
          <input type="checkbox" name="agreePrivacy" required>
          개인정보 수집 및 이용에 동의합니다. (필수)
        </label>
      </div>
      <div class="field" style="margin-top:6px">
        <label>
          <input type="checkbox" name="agreeNoAbandon" required>
          입양 후 파양하지 않을 것을 서약합니다. (필수)
        </label>
      </div>

      <div class="actions">
        <button type="button" class="btn btn-ghost">취소</button>
        <button type="submit" class="btn btn-primary">신청하기</button>
      </div>
    </form>
  </main>
</body>
</html>

