<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>보호 동물 관리</title>
<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/shelter/animal/profile_list.css"></link>
</head>
<body>
<main class="wrap">

  <!-- 헤더 -->
  <div class="head">
    <div>
      <div class="h-left">
        <div class="back">←</div>
        <h1 class="h1">보호 동물 관리</h1>
      </div>
      <div class="h-sub">총 <b id="totalCnt">8</b>마리의 동물이 보호되고 있습니다</div>
    </div>
    <div class="h-actions">
      <button class="btn primary" id="addBtn">＋ 동물 등록</button>
    </div>
  </div>

  <!-- 툴바 -->
  <div class="toolbar">
    <div class="search">
      🔎 <input id="q" placeholder="동물 이름이나 품종으로 검색…">
    </div>
    <button class="btn" id="filterBtn">필터</button>
    <div class="select">
      <button class="btn" id="sortBtn">최신 입소순</button>
      <button class="btn" id="viewGrid">▦</button>
      <button class="btn" id="viewList">≡</button>
    </div>
  </div>

  <!-- 카드 그리드 -->
  <section id="container" class="grid">

    <!-- 카드 1 -->
    <article class="card" data-name="별이" data-breed="웰시코기">
      <div class="thumb">
        <img src="https://images.unsplash.com/photo-1517849845537-4d257902454a?q=80&w=1200&auto=format&fit=crop" alt="별이">
        <div class="labs"><span class="lab purple">임시보호</span></div>
      </div>
      <div class="body">
        <div class="title">별이 <span class="chip">웰시코기</span></div>
        <div class="meta">만 4살 · 암컷 · 12개월째 보호중<br>안정적 보호중</div>
        <div class="row-chips">
          <span class="chip">입원/치료</span><span class="chip">장난기</span><span class="chip">+1</span>
        </div>
        <div class="actions">
          <button class="btn-sm">수정</button>
          <button class="btn-sm">블로그</button>
        </div>
      </div>
    </article>

    <!-- 카드 2 -->
    <article class="card" data-name="무지" data-breed="말티즈">
      <div class="thumb cam">📷</div>
      <div class="body">
        <div class="title">무지 <span class="chip">말티즈</span></div>
        <div class="meta">만 2살 · 암컷 · 6kg<br>경기도 수원시 · 18일째 보호중</div>
        <div class="row-chips"><span class="chip">자발적</span><span class="chip">온순</span><span class="chip">+1</span></div>
        <div class="actions"><button class="btn-sm">수정</button><button class="btn-sm">블로그</button></div>
      </div>
    </article>

    <!-- 카드 3 -->
    <article class="card" data-name="나비" data-breed="믹스견">
      <div class="thumb cam">📷</div>
      <div class="body">
        <div class="title">나비 <span class="chip">믹스견</span></div>
        <div class="meta">만 2살 · 암컷 · 15kg<br>서울시 성동구 · 23일째 보호중</div>
        <div class="row-chips"><span class="chip">자발적</span><span class="chip">조용함</span></div>
        <div class="actions"><button class="btn-sm">수정</button><button class="btn-sm">블로그</button></div>
      </div>
    </article>

    <!-- 카드 4 -->
    <article class="card" data-name="해피" data-breed="랩라브라도">
      <div class="thumb cam">📷
        <div class="labs"><span class="lab">입양대기</span></div>
      </div>
      <div class="body">
        <div class="title">해피 <span class="chip">랩라브라도</span></div>
        <div class="meta">만 2살 · 암컷 · 25kg<br>서울시 은평구 · 32일째 보호중</div>
        <div class="row-chips"><span class="chip">활동성</span><span class="chip">친화력</span><span class="chip">+1</span></div>
        <div class="actions"><button class="btn-sm">수정</button><button class="btn-sm">블로그</button></div>
      </div>
    </article>

    <!-- 카드 5 -->
    <article class="card" data-name="초코" data-breed="골든 리트리버">
      <div class="thumb">
        <img src="https://images.unsplash.com/photo-1583337130417-3346a1b0d1d2?q=80&w=1200&auto=format&fit=crop" alt="초코">
        <div class="labs"><span class="lab">입양대기</span></div>
      </div>
      <div class="body">
        <div class="title">초코 <span class="chip">골든 리트리버</span></div>
        <div class="meta">만 3살 · 수컷 · 28kg<br>서울시 강남구 · 45일째 보호중</div>
        <div class="row-chips"><span class="chip">온순</span><span class="chip">활발</span><span class="chip">친화적</span></div>
        <div class="actions"><button class="btn-sm">수정</button><button class="btn-sm">블로그</button></div>
      </div>
    </article>

    <!-- 카드 6 -->
    <article class="card" data-name="봄이" data-breed="시박견">
      <div class="thumb cam">📷</div>
      <div class="body">
        <div class="title">봄이 <span class="chip">시박견</span></div>
        <div class="meta">만 5살 · 수컷 · 18kg<br>서울시 마포구 · 52일째 보호중</div>
        <div class="row-chips"><span class="chip">차분</span><span class="chip">훈련중</span><span class="chip">+1</span></div>
        <div class="actions"><button class="btn-sm">수정</button><button class="btn-sm">블로그</button></div>
      </div>
    </article>

    <!-- 카드 7 -->
    <article class="card" data-name="구름" data-breed="진돗개">
      <div class="thumb">
        <img src="https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?q=80&w=1200&auto=format&fit=crop" alt="구름">
        <div class="labs"><span class="lab">입양대기</span></div>
      </div>
      <div class="body">
        <div class="title">구름 <span class="chip">진돗개</span></div>
        <div class="meta">만 1살 · 수컷 · 20kg<br>경기도 · 67일째 보호중</div>
        <div class="row-chips"><span class="chip">활발</span><span class="chip">용감</span><span class="chip">+1</span></div>
        <div class="actions"><button class="btn-sm">수정</button><button class="btn-sm">블로그</button></div>
      </div>
    </article>

    <!-- 카드 8 -->
    <article class="card" data-name="코코" data-breed="믹스브리안">
      <div class="thumb cam">📷
        <div class="labs"><span class="lab green">입양완료</span></div>
      </div>
      <div class="body">
        <div class="title">코코 <span class="chip">믹스브리안</span></div>
        <div class="meta">만 6개월 · 암컷 · 4kg<br>서울시 · 89일째 보호중</div>
        <div class="row-chips"><span class="chip">덩달음</span><span class="chip">애교</span></div>
        <div class="actions"><button class="btn-sm">수정</button><button class="btn-sm">블로그</button></div>
      </div>
    </article>

  </section>

  <script defer
		src="${pageContext.request.contextPath}/assets/js/shelter/animal/profile_list.js"></script>
</main>


</body>
</html>
