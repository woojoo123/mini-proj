<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>후원자 관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/donation/list.css">
</head>
<body>
<main class="wrap">
  <!-- 헤더 -->
  <div class="head">
    <div>
      <h1>후원자 관리</h1>
      <div class="sub">보호소 후원자 현황을 확인하고 관리하세요</div>
    </div>
    <button class="btn">후원 내역 조회</button>
  </div>

  <!-- KPI (상단 3개 표시) -->
  <section class="kpis">
    <div class="kpi">
      <div class="label">전체 후원자</div>
      <div class="val" id="kpiTotal">6</div>
    </div>
    <div class="kpi">
      <div class="label">정기 후원자</div>
      <div class="val" id="kpiRegular">4</div>
    </div>
    <div class="kpi">
      <div class="label">총 후원금</div>
      <div class="val" id="kpiAmount">532만원</div>
    </div>
  </section>

  <!-- 검색 & 필터 (총금액 정렬 제거) -->
  <div class="toolbar">
    <div class="search">🔎
      <input id="q" placeholder="후원자명으로 검색…" />
    </div>
    <div class="sel">
      <select id="fType">
        <option value="all">전체</option>
        <option value="정기">정기</option>
        <option value="일시">일시</option>
      </select>
      <select id="fState">
        <option value="all">상태(전체)</option>
        <option value="활성">활성</option>
        <option value="일시중지">일시중지</option>
      </select>
    </div>
  </div>

  <!-- 리스트 -->
  <section id="list">
    <!-- 강** -->
    <article class="card" data-name="강" data-type="정기" data-state="활성">
      <div class="row">
        <div class="ava">강</div>
        <div class="mid">
          <div class="top">
            <div>
              <div class="name">강** <span class="tag">정기후원</span></div>
              <div class="meta">총 후원금 <b>2,000,000원</b> · 총 횟수 <b>36회</b> · 최근 후원 <b>2024.01.22</b></div>
            </div>
            <div class="actions">
              <button class="btn-sm">내역 보기</button>
              <button class="btn-sm more">⋯</button>
            </div>
          </div>
        </div>
      </div>
      <div class="sub"><div class="chips">
        <span class="chip">2024.01.22 · 100,000원 · 정기</span>
        <span class="chip">2023.12.22 · 100,000원 · 정기</span>
        <span class="chip">2023.11.22 · 100,000원 · 정기</span>
      </div></div>
    </article>

    <!-- 김** -->
    <article class="card" data-name="김" data-type="정기" data-state="활성">
      <div class="row">
        <div class="ava">김</div>
        <div class="mid">
          <div class="top">
            <div>
              <div class="name">김** <span class="tag">정기후원</span></div>
              <div class="meta">총 후원금 <b>1,200,000원</b> · 총 횟수 <b>24회</b> · 최근 후원 <b>2024.01.25</b></div>
            </div>
            <div class="actions">
              <button class="btn-sm">내역 보기</button>
              <button class="btn-sm more">⋯</button>
            </div>
          </div>
        </div>
      </div>
      <div class="sub"><div class="chips">
        <span class="chip">2024.01.25 · 50,000원 · 정기</span>
        <span class="chip">2023.12.25 · 50,000원 · 정기</span>
        <span class="chip">2023.11.25 · 50,000원 · 정기</span>
      </div></div>
    </article>

    <!-- 임** (일시) -->
    <article class="card" data-name="임" data-type="일시" data-state="활성">
      <div class="row">
        <div class="ava">임</div>
        <div class="mid">
          <div class="top">
            <div>
              <div class="name">임** <span class="tag one">일시후원</span></div>
              <div class="meta">총 후원금 <b>100,000원</b> · 총 횟수 <b>8회</b> · 최근 후원 <b>2024.01.23</b></div>
            </div>
            <div class="actions">
              <button class="btn-sm">내역 보기</button>
              <button class="btn-sm more">⋯</button>
            </div>
          </div>
        </div>
      </div>
      <div class="sub"><div class="chips">
        <span class="chip">2024.01.23 · 10,000원 · 일시</span>
        <span class="chip">2023.12.15 · 15,000원 · 일시</span>
        <span class="chip">2023.11.20 · 10,000원 · 일시</span>
      </div></div>
    </article>

    <!-- 박** (정기, 일시중지) -->
    <article class="card" data-name="박" data-type="정기" data-state="일시중지">
      <div class="row">
        <div class="ava">박</div>
        <div class="mid">
          <div class="top">
            <div>
              <div class="name">박** <span class="tag">정기후원</span></div>
              <div class="meta">총 후원금 <b>450,000원</b> · 총 횟수 <b>15회</b> · 최근 후원 <b>2024.01.20</b></div>
            </div>
            <div class="actions">
              <button class="btn-sm">내역 보기</button>
              <button class="btn-sm more">⋯</button>
            </div>
          </div>
        </div>
      </div>
      <div class="sub"><div class="chips">
        <span class="chip">2024.01.20 · 30,000원 · 정기</span>
        <span class="chip">2023.12.09 · 30,000원 · 정기</span>
        <span class="chip">상태: 일시중지</span>
      </div></div>
    </article>

    <!-- 다** (일시) -->
    <article class="card" data-name="다" data-type="일시" data-state="활성">
      <div class="row">
        <div class="ava">다</div>
        <div class="mid">
          <div class="top">
            <div>
              <div class="name">다** <span class="tag one">일시후원</span></div>
              <div class="meta">총 후원금 <b>320,000원</b> · 총 횟수 <b>16회</b> · 최근 후원 <b>2024.01.18</b></div>
            </div>
            <div class="actions">
              <button class="btn-sm">내역 보기</button>
              <button class="btn-sm more">⋯</button>
            </div>
          </div>
        </div>
      </div>
      <div class="sub"><div class="chips">
        <span class="chip">2024.01.18 · 20,000원 · 일시</span>
        <span class="chip">2023.12.18 · 20,000원 · 일시</span>
        <span class="chip">2023.11.18 · 20,000원 · 일시</span>
      </div></div>
    </article>

    <!-- 의** (정기) -->
    <article class="card" data-name="의" data-type="정기" data-state="활성">
      <div class="row">
        <div class="ava">의</div>
        <div class="mid">
          <div class="top">
            <div>
              <div class="name">의** <span class="tag">정기후원</span></div>
              <div class="meta">총 후원금 <b>510,000원</b> · 총 횟수 <b>15회</b> · 최근 후원 <b>2024.01.15</b></div>
            </div>
            <div class="actions">
              <button class="btn-sm">내역 보기</button>
              <button class="btn-sm more">⋯</button>
            </div>
          </div>
        </div>
      </div>
      <div class="sub"><div class="chips">
        <span class="chip">2024.01.15 · 50,000원 · 정기</span>
        <span class="chip">2023.12.03 · 50,000원 · 정기</span>
        <span class="chip">2023.10.05 · 50,000원 · 정기</span>
      </div></div>
    </article>
  </section>

  <!-- 개인정보 보호 안내 -->
  <div class="notice">
    <h3>🛡 개인정보 보호 안내</h3>
    <ul>
      <li>후원자의 개인정보는 보호되며, 익명/가명 후원의 경우 마스킹 처리됩니다.</li>
      <li>연락처, 주소 등 민감한 개인정보는 표시되지 않습니다.</li>
      <li>후원 관련 데이터는 투명성 확보를 위해 통계적 정보만 제공됩니다.</li>
    </ul>
  </div>

  <script src="${pageContext.request.contextPath}/assets/js/shelter/donation/list.js"></script>
</main>

</body>
</html>
