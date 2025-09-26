<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>봉사활동 공고 등록</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/volunteer/schedule_upload.css">
</head>

<body>
  <main class="container">
    <header>
      <h1>봉사활동 공고 등록</h1>
      <div class="subtitle">보호소 봉사활동 모집 공고를 등록해주세요.</div>
    </header>

    <form id="volunteerForm" class="card">
      <!-- 기본 정보 -->
      <section class="section">
        <h2 class="section-title">기본 정보</h2>
        <div class="grid">
          <div>
            <label for="title">활동명</label>
            <input id="title" name="title" type="text" placeholder="봉사활동 제목을 입력하세요" required>
          </div>
          <div class="g2">
            <div>
              <label for="org">모집기관</label>
              <input id="org" name="org" type="text" placeholder="보호소명을 입력하세요">
            </div>
            <div>
              <label for="status">모집상태</label>
              <select id="status" name="status">
                <option>모집중</option>
                <option>모집완료</option>
                <option>일시중지</option>
              </select>
            </div>
          </div>
        </div>
      </section>

      <div class="hr"></div>

      <!-- 위치정보 -->
      <section class="section">
        <h2 class="section-title">위치정보</h2>
        <div class="g2 grid">
          <div>
            <label for="addr">주소</label>
            <input id="addr" name="addr" type="text" placeholder="활동 장소 주소를 입력하세요">
          </div>
          <div>
            <label for="addrDetail">상세 위치</label>
            <input id="addrDetail" name="addrDetail" type="text" placeholder="건물명, 층수 등">
          </div>
        </div>
      </section>

      <div class="hr"></div>

      <!-- 담당자정보 -->
      <section class="section">
        <h2 class="section-title">담당자정보</h2>
        <div class="g3 grid">
          <div>
            <label for="manager">담당자명</label>
            <input id="manager" name="manager" type="text" placeholder="이름">
          </div>
          <div>
            <label for="phone">연락처</label>
            <input id="phone" name="phone" type="tel" placeholder="010-0000-0000"
              pattern="^(01[0|1|6-9])-?\d{3,4}-?\d{4}$">
          </div>
          <div>
            <label for="email">이메일</label>
            <input id="email" name="email" type="email" placeholder="email@example.com">
          </div>
        </div>
      </section>

      <div class="hr"></div>

      <!-- 활동 정보 -->
      <section class="section">
        <h2 class="section-title">활동 정보</h2>

        <div class="g3 grid">
          <div>
            <label for="sido">봉사지역</label>
            <div class="g2 grid">
              <select id="sido">
                <option value="">시/도 선택</option>
                <option>서울특별시</option>
                <option>부산광역시</option>
                <option>인천광역시</option>
                <option>대구광역시</option>
                <option>대전광역시</option>
                <option>광주광역시</option>
                <option>울산광역시</option>
                <option>경기도</option>
              </select>
              <select id="gugun" disabled>
                <option>구/군 선택</option>
              </select>
            </div>
          </div>

          <div>
            <label for="category">봉사분야</label>
            <select id="category">
              <option>돌봄분야</option>
              <option>청소/환경정비</option>
              <option>사진/콘텐츠 제작</option>
              <option>이동/차량지원</option>
              <option>행사/부스 운영</option>
              <option>기타</option>
            </select>
          </div>

          <div>
            <label>모집기간</label>
            <div class="inline" style="margin-top:4px">
              <label class="inline"><input type="checkbox" id="rangeChk"> 연속 기간</label>
              <label class="inline"><input type="checkbox" id="multiChk"> 특정 날짜 선택</label>
            </div>

            <!-- 연속기간 UI -->
            <div class="g2 grid" style="margin-top:8px" id="rangeWrap" hidden>
              <input type="date" id="startDate" aria-label="시작일">
              <input type="date" id="endDate" aria-label="종료일">
            </div>

            <!-- 특정 날짜: 작은 date 입력 + 칩 -->
            <div id="multiWrap" hidden>
              <label for="multiDate" style="margin-top:8px">날짜 선택</label>
              <div class="inline">
                <input type="date" id="multiDate" />
                <!-- <button type="button" id="openMultiDate" class="btn" style="padding:8px 10px">📅 달력</button> -->
                <span class="chip">여러 날짜를 연속으로 선택</span>
              </div>
              <div class="chips" id="multiChips" aria-live="polite"></div>
              <input type="hidden" id="multiDatesValue">
            </div>

          </div>
        </div>

        <div class="g3 grid" style="margin-top:12px">
          <div>
            <label>봉사자유형</label>
            <div class="inline" style="margin-top:6px">
              <label class="inline"><input type="checkbox" id="adult"> 성인</label>
              <label class="inline"><input type="checkbox" id="teen"> 청소년</label>
            </div>
          </div>

          <div class="suffix">
            <label for="capacity">모집인원</label>
            <input id="capacity" type="number" min="1" placeholder="0">
            <span>명</span>
          </div>

          <div class="g2 grid">
            <div>
              <label for="startTime">활동시간</label>
              <input id="startTime" type="time">
            </div>
            <div style="display:flex;align-items:end;gap:8px">
              <span style="margin:0 2px 10px;color:#8e7f75">—</span>
              <input id="endTime" type="time" style="flex:1">
            </div>
          </div>
        </div>
      </section>

      <div class="hr"></div>

      <!-- 활동 상세 정보 -->
      <section class="section">
        <h2 class="section-title">활동 상세 정보</h2>

        <div class="grid">
          <div>
            <label for="desc">활동내용</label>
            <textarea id="desc" placeholder="구체적인 활동 내용을 설명해주세요"></textarea>
          </div>
          <div>
            <label for="items">준비물</label>
            <textarea id="items" placeholder="봉사자가 준비해야 할 물품이나 복장을 설명해주세요"></textarea>
          </div>
          <div>
            <label for="notes">유의사항</label>
            <textarea id="notes" placeholder="안전 수칙이나 기타 유의사항을 설명해주세요"></textarea>
          </div>
        </div>
      </section>

      <!-- Actions -->
      <div class="actions">
        <button type="button" class="btn" id="cancelBtn">
          <svg class="ico" viewBox="0 0 24 24">
            <path
              d="M18.3 5.71a1 1 0 0 0-1.41 0L12 10.59 7.11 5.7A1 1 0 0 0 5.7 7.11L10.59 12l-4.9 4.89a1 1 0 1 0 1.41 1.41L12 13.41l4.89 4.9a1 1 0 0 0 1.41-1.41L13.41 12l4.9-4.89a1 1 0 0 0-.01-1.4z" />
          </svg>
          취소
        </button>
        <button type="button" class="btn" id="previewBtn">
          <svg class="ico" viewBox="0 0 24 24">
            <path d="M12 5c-7 0-10 7-10 7s3 7 10 7 10-7 10-7-3-7-10-7zm0 12a5 5 0 1 1 0-10 5 5 0 0 1 0 10z" />
          </svg>
          미리보기
        </button>
        <button type="submit" class="btn primary" id="saveBtn">
          <svg class="ico" viewBox="0 0 24 24">
            <path d="M5 5h14v14H5z" opacity=".15"></path>
            <path d="M17 3H7a2 2 0 0 0-2 2v14l7-3 7 3V5a2 2 0 0 0-2-2z" />
          </svg>
          등록하기
        </button>
      </div>
    </form>
    <script src="${pageContext.request.contextPath}/assets/js/shelter/volunteer/schedule_upload.js"></script>
  </main>

  <!-- Preview Modal -->
  <div class="modal" id="previewModal" aria-hidden="true" role="dialog" aria-label="미리보기">
    <div class="modal-card">
      <div class="inline" style="justify-content:space-between">
        <h3>등록 내용 미리보기</h3>
        <button class="btn" id="closePreview">닫기</button>
      </div>
      <div id="previewBody"></div>
    </div>
  </div>

 
</body>

</html>