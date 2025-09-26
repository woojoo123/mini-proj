<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html> 
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>보호소 등록하기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/profile/generation.css">
</head>
<body>
<main class="wrap">

  <!-- 상단 -->
  <div class="top">
    <div>
      <div class="left-head">
        <div class="back" aria-label="뒤로가기">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="M15 18l-6-6 6-6" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </div>
        <h1 class="h1">보호소 등록하기</h1>
      </div>
      <div class="h-sub">보호소 정보를 입력하여 프로필을 완성하세요</div>
    </div>

    <div class="pub-card">
      <div>
        <div class="pub-title">프로필 공개</div>
        <div class="pub-help">다른 사용자가 볼 수 있음</div>
      </div>
      <div id="pubSwitch" class="switch" role="switch" aria-checked="false"></div>
    </div>
  </div>

  <!-- 기본 정보 -->
  <section class="card">
    <h3>기본 정보</h3>
    <div class="grid-2">
      <div class="field">
        <label for="name">보호소 이름 *</label>
        <input id="name" type="text" placeholder="보호소 이름을 입력하세요">
      </div>
      <div class="field">
        <label for="founded">설립일</label>
        <input id="founded" type="date" placeholder="연도-월-일">
      </div>

      <div class="field">
        <label for="bizno">사업자/단체등록번호</label>
        <input id="bizno" type="text" placeholder="000-00-00000">
      </div>
      <div class="field">
        <label for="capacity">수용 가능 동물 수</label>
        <input id="capacity" type="text" placeholder="예) 50마리">
      </div>

      <div class="field" style="grid-column:1 / -1">
        <label for="intro">보호소 소개</label>
        <textarea id="intro" placeholder="보호소에 대한 소개글을 작성해주세요..."></textarea>
      </div>
    </div>
  </section>

  <!-- 연락처 정보 -->
  <section class="card">
    <h3>연락처 정보</h3>
    <div class="grid-2">
      <div class="field input-ic">
        <label for="phone">대표 전화번호 *</label>
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6A19.79 19.79 0 0 1 2.08 4.18 2 2 0 0 1 4.06 2h3a2 2 0 0 1 2 1.72c.12.81.3 1.6.54 2.36a2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.72-1.06a2 2 0 0 1 2.11-.45c.76.24 1.55.42 2.36.54A2 2 0 0 1 22 16.92z" stroke-width="2"/></svg>
        <input id="phone" type="tel" placeholder="02-0000-0000">
      </div>
      <div class="field input-ic">
        <label for="email">이메일</label>
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M4 4h16v16H4z" stroke-width="2"/><path d="M22 6l-10 7L2 6" stroke-width="2"/></svg>
        <input id="email" type="email" placeholder="shelter@example.com">
      </div>

      <div class="field input-ic" style="grid-column:1 / -1">
        <label for="site">웹사이트</label>
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"><circle cx="12" cy="12" r="10" stroke-width="2"/><path d="M2 12h20M12 2a15.3 15.3 0 0 1 0 20M12 2a15.3 15.3 0 0 0 0 20" stroke-width="2"/></svg>
        <input id="site" type="text" placeholder="https://www.shelter.com">
      </div>
    </div>

    <h3 style="margin-top:16px">담당자 정보</h3>
    <div class="grid-2">
      <div class="field">
        <label for="manager">담당자 이름 *</label>
        <input id="manager" type="text" placeholder="담당자 이름">
      </div>
      <div class="field">
        <label for="managerTel">담당자 연락처</label>
        <input id="managerTel" type="tel" placeholder="010-0000-0000">
      </div>
      <div class="field" style="grid-column:1 / -1">
        <label for="managerEmail">담당자 이메일</label>
        <input id="managerEmail" type="email" placeholder="manager@shelter.com">
      </div>
    </div>
  </section>

  <!-- 주소 정보 -->
  <section class="card">
    <h3>주소 정보</h3>
    <div class="grid-2">
      <div class="field">
        <label for="sido">시/도</label>
        <select id="sido">
          <option>시/도 선택</option><option>서울특별시</option><option>부산광역시</option>
          <option>대구광역시</option><option>인천광역시</option><option>경기도</option>
        </select>
      </div>
      <div class="field">
        <label for="sigungu">시/구/군</label>
        <select id="sigungu"><option>시/구/군</option></select>
      </div>

      <div class="field input-ic" style="grid-column:1 / -1">
        <label for="road">도로명 주소</label>
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M21 10c0 7-9 12-9 12S3 17 3 10a9 9 0 1 1 18 0z" stroke-width="2"/><circle cx="12" cy="10" r="3" stroke-width="2"/></svg>
        <input id="road" type="text" placeholder="도로명 주소를 입력하세요">
      </div>

      <div class="field">
        <label for="detail">상세 주소</label>
        <input id="detail" type="text" placeholder="상세 주소 (동, 호수 등)">
      </div>
      <div class="field">
        <label for="zip">우편번호</label>
        <input id="zip" type="text" placeholder="12345">
      </div>

      <div class="field" style="grid-column:1 / -1">
        <label for="direction">오시는길 안내</label>
        <textarea id="direction" placeholder="대중교통 이용방법, 주차 정보, 근처 랜드마크 등 상세한 오시는길을 안내해주세요..."></textarea>
        <div class="example">
예시:
- 지하철: 2호선 강남역 3번 출구에서 도보 5분
- 버스: 147, 462 번 환승 후 'OO동' 하차
- 주차: 보호소 앞 무료 주차 가능 (5대)
- 참고: 보호소 앞 문으로 진입, 2층
        </div>
        <div class="note">방문자들이 헷갈리지 않도록 세부 안내를 작성해주세요</div>
      </div>
    </div>
  </section>

  <!-- 운영 시간 -->
  <section class="card">
    <h3>운영 시간</h3>
    <div class="hours-wrap" id="hoursList">
      <!-- 요일 행들은 JS로 생성 (월~일) -->
    </div>
  </section>

  <!-- 이미지 -->
  <section class="card">
    <h3>이미지</h3>
    <div class="uploader">
      <div>
        <div style="font-weight:700;margin-bottom:6px">보호소 대표 이미지</div>
        <div style="color:#7b716a;font-size:12px;margin-bottom:8px">보호소를 대표하는 이미지를 업로드하세요 (JPG, PNG)</div>
        <label class="btn-file">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <rect x="3" y="4" width="18" height="14" rx="2" ry="2" stroke-width="2"/>
            <path d="M3 13l4-4 3 3 5-5 6 6" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          대표 이미지 선택
          <input id="cover" type="file" accept=".jpg,.jpeg,.png" hidden>
        </label>
      </div>

      <div class="hr"></div>

      <div>
        <div style="font-weight:700;margin-bottom:6px">보호소 내부 시설 사진</div>
        <div style="color:#7b716a;font-size:12px;margin-bottom:8px">보호소 내부, 시설 등의 사진 (최대 10개)</div>
        <label class="btn-file">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor">
            <path d="M12 16V4m0 0l-4 4m4-4l4 4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M20 16v2a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2v-2" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
          시설 이미지 추가 (<span id="imgCount">0</span>/10)
          <input id="gallery" type="file" accept=".jpg,.jpeg,.png" multiple hidden>
        </label>
      </div>
    </div>
  </section>

  <!-- 계좌 정보 -->
  <section class="card">
    <h3>계좌 정보</h3>
    <div class="grid-2">
      <div class="field">
        <label for="bank">은행</label>
        <select id="bank">
          <option>은행 선택</option><option>신한</option><option>국민</option><option>농협</option><option>하나</option><option>우리</option>
        </select>
      </div>
      <div class="field">
        <label for="holder">예금주</label>
        <input id="holder" type="text" placeholder="예금주명">
      </div>
      <div class="field" style="grid-column:1 / -1">
        <label for="account">계좌번호</label>
        <div class="input-ic">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"><rect x="3" y="5" width="18" height="14" rx="2" ry="2" stroke-width="2"/><path d="M3 10h18" stroke-width="2"/></svg>
          <input id="account" type="text" placeholder="계좌번호를 입력하세요">
        </div>
        <div class="note">후원금 수령을 위한 계좌 정보입니다</div>
      </div>
    </div>
  </section>

  <!-- 하단 액션 -->
  <div class="actions">
    <div class="spacer"></div>
    <button class="btn primary" type="button" disabled>등록하기</button>
    <button class="btn" type="button">취소</button>
  </div>
  <script src="${pageContext.request.contextPath}/assets/js/shelter/profile/generation.js"></script>
</main>


</body>
</html>
