<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>입양 신청서 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/animal/adopt_list_viewdetails.css">
</head>
<body>
  <div class="wrap">

    <!-- 헤더 (배지 제거) -->
    <div class="head-wrap">
      <div class="back" aria-label="뒤로가기">←</div>
      <div>
        <h1 class="title">입양 신청서 상세</h1>
        <div class="sub">신청서를 검토하고 승인/거절을 결정하세요</div>
      </div>
    </div>

    <!-- 신청자 정보 -->
    <section class="card">
      <h3><span class="i">🧭</span> 신청자 정보</h3>
      <div class="sec-grid kv">
        <div><div class="k">이름</div><div class="v">김**</div></div>
        <div><div class="k">신청일</div><div class="v">2024.01.25 14:30</div></div>
        <div><div class="k">연락처</div><div class="v">010-1234-5678</div></div>
        <div><div class="k">이메일</div><div class="v">kim@example.com</div></div>
        <div style="grid-column:1 / -1">
          <div class="k">주소</div>
          <div class="v">서울시 강남구 테헤란로 123, 101동 1001호</div>
        </div>
      </div>
    </section>

    <!-- 입양 희망 동물 -->
    <section class="card">
      <h3><span class="i">🤍</span> 입양 희망 동물</h3>
      <div class="pet">
        <div class="thumb"><img src="https://images.dog.ceo/breeds/terrier-american/n02093428_11222.jpg" alt="초코"></div>
        <div>
          <p class="name">초코</p>
          <p class="meta">강아지 · 믹스견</p>
        </div>
      </div>
    </section>

    <!-- 주거 환경 -->
    <section class="card">
      <h3><span class="i">🏠</span> 주거 환경</h3>
      <div class="sec-grid kv">
        <div><div class="k">주거 형태</div><div class="v">아파트</div></div>
        <div><div class="k">소유 형태</div><div class="v">자가</div></div>
        <div><div class="k">주거 면적</div><div class="v">84㎡ (3룸)</div></div>
        <div><div class="k">마당 유무</div><div class="v">없음</div></div>
        <div style="grid-column:1 / -1">
          <div class="k">단골 수의사</div>
          <div class="v">동물병원 김수의사 (02-1234-5678)</div>
        </div>
      </div>
    </section>

    <!-- 가족 구성 -->
    <section class="card">
      <h3><span class="i">👨‍👩‍👧</span> 가족 구성</h3>
      <div class="sec-grid kv">
        <div><div class="k">가족 수</div><div class="v">3명</div></div>
        <div><div class="k">자녀 유무</div><div class="v">있음 (7세, 10세)</div></div>
        <div><div class="k">가족 동의</div><div class="v">완료</div></div>
      </div>
    </section>

    <!-- 반려동물 경험 -->
    <section class="card">
      <h3><span class="i">🐾</span> 반려동물 경험</h3>
      <div class="textblock">
        <div class="k">반려동물 경험</div><p>있음</p>
        <div class="k">현재 반려동물</div><p>없음</p>
        <div class="k">이전 반려동물</div><p>고양이 1마리 (5년간 키움)</p>
        <div class="k">단골 수의사</div><p>동물병원 김수의사 (02-1234-5678)</p>
      </div>
    </section>

    <!-- 생활 패턴 -->
    <section class="card">
      <h3><span class="i">🗓</span> 생활 패턴</h3>
      <div class="textblock">
        <div class="k">근무 시간</div><p>9–18시 (주 5일)</p>
        <div class="k">일상 스케줄</div><p>오전 산책, 저녁 가족시간</p>
        <div class="k">운동 계획</div><p>매일 아침, 저녁 산책 (각 30분)</p>
        <div class="k">휴가 계획</div><p>펜션 동반 여행 계획</p>
      </div>
    </section>

    <!-- 경제적 정보 -->
    <section class="card">
      <h3><span class="i">💰</span> 경제적 정보</h3>
      <div class="sec-grid kv">
        <div><div class="k">월 소득</div><div class="v">500만원 이상</div></div>
        <div><div class="k">반려동물 예산</div><div class="v">월 20만원</div></div>
        <div><div class="k">응급자금</div><div class="v">준비됨</div></div>
      </div>
    </section>

    <!-- 입양 동기 및 각오 -->
    <section class="card">
      <h3><span class="i">📝</span> 입양 동기 및 각오</h3>
      <div class="textblock">
        <div class="k">입양 사유</div>
        <p>아이들이 동물을 너무 좋아하고, 가족 모두가 반려동물과 함께 생활하고 싶어합니다. 이전에 고양이를 키운 경험이 있어 반려동물 돌봄의 책임감을 잘 알고 있습니다.</p>
        <div class="k">입양 각오</div>
        <p>끝까지 책임지고 사랑으로 키우겠습니다. 정기적인 건강검진과 예방접종을 받게 하고, 충분한 관심과 애정을 주겠습니다.</p>
        <div class="k">특수 상황 대처</div>
        <p>특별한 건강상 문제가 있어도 끝까지 치료하고 돌보겠습니다.</p>
      </div>
    </section>

    <!-- 첨부 서류 -->
    <section class="card">
      <h3><span class="i">📎</span> 첨부 서류</h3>
      <div class="files">
        <div class="file-row">
          <div class="file-left">
            <div class="file-ico">📄</div>
            <div>
              <div class="file-name">신분증사본.jpg</div>
              <div class="file-sub">신분증 · 2024.01.25</div>
            </div>
          </div>
          <button class="file-btn" onclick="alert('신분증사본.jpg 열기')">보기</button>
        </div>
        <div class="file-row">
          <div class="file-left">
            <div class="file-ico">📄</div>
            <div>
              <div class="file-name">주민등록등본.pdf</div>
              <div class="file-sub">주거증명서 · 2024.01.25</div>
            </div>
          </div>
          <button class="file-btn" onclick="alert('주민등록등본.pdf 열기')">보기</button>
        </div>
        <div class="file-row">
          <div class="file-left">
            <div class="file-ico">📄</div>
            <div>
              <div class="file-name">가족동의서.pdf</div>
              <div class="file-sub">가족동의서 · 2024.01.25</div>
            </div>
          </div>
          <button class="file-btn" onclick="alert('가족동의서.pdf 열기')">보기</button>
        </div>
        <div class="file-row">
          <div class="file-left">
            <div class="file-ico">📄</div>
            <div>
              <div class="file-name">재직증명서.pdf</div>
              <div class="file-sub">소득증명서 · 2024.01.25</div>
            </div>
          </div>
          <button class="file-btn" onclick="alert('재직증명서.pdf 열기')">보기</button>
        </div>
      </div>
    </section>

    <!-- 신청서 심사 결과 -->
    <section class="card">
      <h3><span class="i">✅</span> 신청서 심사 결과</h3>
      <div class="result">
        <button class="btn green" onclick="alert('입양 승인 처리되었습니다.')">✔ 입양 승인</button>
        <button class="btn red"   onclick="alert('입양 거절 처리되었습니다.')">✖ 입양 거절</button>
        <button class="btn gray"  onclick="alert('보류 처리되었습니다.')">⚠ 보류</button>
      </div>
    </section>

  </div>
</body>
</html>
