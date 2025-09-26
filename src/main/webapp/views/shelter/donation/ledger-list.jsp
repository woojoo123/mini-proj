<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>후원 내역 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/donation/ledger.css">
</head>
<body>
<main class="wrap">
  <!-- Header -->
  <div class="head">
    <div>
      <h1>후원 내역 관리</h1>
      <div class="sub">후원금 입금 및 사용 내역을 투명하게 관리합니다</div>
    </div>
    <div class="actions">
      <button class="btn">보고서 다운로드</button>
      <button class="btn main">지출 등록</button>
    </div>
  </div>

  <!-- KPIs -->
  <section class="kpis">
    <div class="kpi plus">
      <div class="label">이번 달 후원금</div>
      <div class="val">+400,000원</div>
    </div>
    <div class="kpi minus">
      <div class="label">이번 달 지출</div>
      <div class="val">-495,000원</div>
    </div>
    <div class="kpi minus">
      <div class="label">수지 합계</div>
      <div class="val">-95,000원</div>
    </div>
    <div class="kpi badge">
      <div class="label">영수증 첨부율</div>
      <div class="val">100%</div>
    </div>
  </section>

  <!-- Tabs -->
  <div class="tabs" id="tabs">
    <div class="tab active" data-tab="in">후원 입금 내역</div>
    <div class="tab" data-tab="out">후원금 사용 내역</div>
  </div>

  <!-- Toolbar -->
  <div class="toolbar">
    <div class="search">🔎
      <input placeholder="후원자명, 메모로 검색…" />
    </div>
    <div class="sel">
      <select>
        <option>이번 달</option>
        <option>지난 달</option>
        <option>올해</option>
      </select>
      <select>
        <option>전체</option>
        <option>입금</option>
        <option>지출</option>
      </select>
    </div>
  </div>

  <!-- LIST: 입금 -->
  <section id="list-in">
    <!-- 입금 1 -->
    <div class="card">
      <div class="row">
        <div class="left">
          <div>
            <div class="title">후원 입금 <span class="badge ok">완료</span> <span class="badge reg">정기</span></div>
            <div class="meta">후원자 <b>김**</b></div>
          </div>
        </div>
        <div class="kv">
          <div class="amount plus">+50,000원</div>
          <div>결제방법: <b>계좌이체</b></div>
          <div>입금일시: <b>2024.01.25 14:30</b></div>
        </div>
      </div>
      <div class="memo">메모: 매월 정기 후원</div>
    </div>

    <!-- 입금 2 -->
    <div class="card">
      <div class="row">
        <div class="left">
          <div>
            <div class="title">후원 입금 <span class="badge ok">완료</span> <span class="badge reg">정기</span></div>
            <div class="meta">후원자 <b>이**</b></div>
          </div>
        </div>
        <div class="kv">
          <div class="amount plus">+100,000원</div>
          <div>결제방법: <b>카드결제</b></div>
          <div>입금일시: <b>2024.01.25 10:15</b></div>
        </div>
      </div>
      <div class="memo">메모: 겨울물품 구매에 사용해주세요</div>
    </div>

    <!-- 입금 3 -->
    <div class="card">
      <div class="row">
        <div class="left">
          <div>
            <div class="title">후원 입금 <span class="badge ok">완료</span> <span class="badge reg">정기</span></div>
            <div class="meta">후원자 <b>박**</b></div>
          </div>
        </div>
        <div class="kv">
          <div class="amount plus">+30,000원</div>
          <div>결제방법: <b>계좌이체</b></div>
          <div>입금일시: <b>2024.01.24 16:45</b></div>
        </div>
      </div>
    </div>

    <!-- 입금 4 -->
    <div class="card">
      <div class="row">
        <div class="left">
          <div>
            <div class="title">후원 입금 <span class="badge ok">완료</span> <span class="badge reg">정기</span></div>
            <div class="meta">후원자 <b>장**</b></div>
          </div>
        </div>
        <div class="kv">
          <div class="amount plus">+200,000원</div>
          <div>결제방법: <b>계좌이체</b></div>
          <div>입금일시: <b>2024.01.24 09:20</b></div>
        </div>
      </div>
      <div class="memo">메모: 초코의 수술비 사용해주세요</div>
    </div>

    <!-- 입금 5 -->
    <div class="card">
      <div class="row">
        <div class="left">
          <div>
            <div class="title">후원 입금 <span class="badge ok">완료</span> <span class="badge reg">정기</span></div>
            <div class="meta">후원자 <b>다**</b></div>
          </div>
        </div>
        <div class="kv">
          <div class="amount plus">+20,000원</div>
          <div>결제방법: <b>카드결제</b></div>
          <div>입금일시: <b>2024.01.23 11:30</b></div>
        </div>
      </div>
    </div>
  </section>

  <!-- LIST: 사용 -->
  <section id="list-out" style="display:none">
    <div class="card">
      <div class="row">
        <div class="left">
          <div>
            <div class="title">후원금 사용 <span class="badge ok">영수증 첨부</span></div>
            <div class="meta">항목 <b>사료/간식</b></div>
          </div>
        </div>
        <div class="kv">
          <div class="amount minus">-120,000원</div>
          <div>지출방법: <b>카드결제</b></div>
          <div>지출일시: <b>2024.01.22 13:10</b></div>
        </div>
      </div>
      <div class="memo">메모: 대용량 사료 3포 구입</div>
    </div>

    <div class="card">
      <div class="row">
        <div class="left">
          <div>
            <div class="title">후원금 사용 <span class="badge ok">영수증 첨부</span></div>
            <div class="meta">항목 <b>의료비</b></div>
          </div>
        </div>
        <div class="kv">
          <div class="amount minus">-375,000원</div>
          <div>지출방법: <b>계좌이체</b></div>
          <div>지출일시: <b>2024.01.20 09:40</b></div>
        </div>
      </div>
      <div class="memo">메모: 구조견 ‘초코’ 수술비</div>
    </div>
  </section>

  <!-- 블루 안내 -->
  <div class="notice">
    <h3>🔎 투명성 확보 안내</h3>
    <ul>
      <li>모든 지출 내역은 항목/영수증과 함께 공개됩니다.</li>
      <li>지출·후원 관련 데이터는 상시 검토와 정기 보고서를 발행합니다.</li>
      <li>불일치 항목 발견 시 즉시 수정되며, 처리 결과를 공유드립니다.</li>
      <li>궁금한 사항이 있으면 관리자에게 문의해주세요.</li>
    </ul>
  </div>

  <script src="${pageContext.request.contextPath}/assets/js/shelter/donation/ledger.js"></script>
</main>


</body>
</html>
