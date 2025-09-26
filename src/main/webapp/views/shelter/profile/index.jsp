<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>사랑보호소 - 프로필</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/profile/main.css">
</head>
<body>
  <main class="wrap">
    <div class="toprow">
      <div>← 사랑보호소 · <span style="color:#948a81">유기견 전문 보호소 · 14년간 1,200+ 입양 성공</span></div>
      <button class="btn" id="shareBtn">공유하기</button>
    </div>

    <img class="cover" src="https://images.unsplash.com/photo-1583336663277-620dc1996580?q=80&w=1600&auto=format&fit=crop" alt="cover">

    <div class="grid">
      <!-- 좌측 -->
      <div>
        <section class="card pad">
          <div class="profile">
            <img class="logo" src="https://images.unsplash.com/photo-1517423440428-a5a00ad493e8?q=80&w=400&auto=format&fit=crop" alt="logo">
            <div>
              <div class="name">
                <h1>사랑보호소</h1>
                <div class="rate">★ 4.8 <span style="color:#9b9087">(156)</span></div>
              </div>
              <div class="meta-line">2010년 설립 · 서울시 강남구 푸릇로 123길 45 · 02-123-4567 · contact@loveshelter.org</div>
              <div class="kpis">
                <div class="kpi"><b>45</b><div style="color:#7b726b">보호 중인 동물</div></div>
                <div class="kpi"><b>1247</b><div style="color:#7b726b">입양 성공</div></div>
              </div>
              <div class="badges">
                <span class="badge">응급보호대응</span>
                <span class="badge">무료분양 검진 포함</span>
                <span class="badge">우수 봉사체계</span>
              </div>
            </div>
          </div>
        </section>

        <section class="card section">
          <h3>보호소 소개</h3>
          <div class="desc">
            사랑보호소는 2010년부터 유기견 구조와 보호 활동을 시작하여 지금까지 1,200마리 이상의
            강아지에게 새로운 가족을 찾아주었습니다. 우리는 단순히 동물을 보호하는 것을 넘어, 동물과
            사람이 함께 행복할 수 있는 사회를 만들기 위해 노력하고 있습니다. 모든 아이들은 철저한
            건강검진과 치료 과정을 통해 최적의 상태로 입양됩니다.
          </div>

          <div style="margin-top:12px;display:grid;grid-template-columns:1fr 1fr;gap:12px">
            <div>
              <h3 style="margin-bottom:6px">보호소 특징</h3>
              <ul class="features">
                <li>24시간 의료 팀 상주</li>
                <li>입양 후 케어</li>
                <li>청결한 시설</li>
                <li>기질 훈련중</li>
                <li>무료 건강검진</li>
                <li>CCTV 운영</li>
              </ul>
            </div>
          </div>
        </section>

        <section class="card section">
          <div style="display:flex;justify-content:space-between;align-items:center">
            <h3>보호중인 동물들 (4마리)</h3>
            <div class="tabs">
              <div class="tab active">보호중</div>
              <div class="tab">최근 활동</div>
            </div>
          </div>

          <div class="petgrid">
            <div class="pet">
              <img src="https://images.unsplash.com/photo-1552053831-71594a27632d?q=80&w=600&auto=format&fit=crop" alt="초코">
              <div>
                <div class="title"><b>초코</b><span class="chip">입양대기</span></div>
                <div class="meta">믹스 · 수컷 · 3살</div>
              </div>
            </div>

            <div class="pet">
              <img src="https://images.unsplash.com/photo-1547971085-3b4c61a7b2c2?q=80&w=600&auto=format&fit=crop" alt="나비">
              <div>
                <div class="title"><b>나비</b><span class="chip">입양대기</span></div>
                <div class="meta">말티즈 · 암컷 · 2살</div>
              </div>
            </div>

            <div class="pet">
              <img src="https://images.unsplash.com/photo-1517849845537-4d257902454a?q=80&w=600&auto=format&fit=crop" alt="구름">
              <div>
                <div class="title"><b>구름</b><span class="chip">치료중</span></div>
                <div class="meta">코기 · 수컷 · 1살</div>
              </div>
            </div>

            <div class="pet">
              <img src="https://images.unsplash.com/photo-1507149833265-60c372daea22?q=80&w=600&auto=format&fit=crop" alt="달이">
              <div>
                <div class="title"><b>달이</b><span class="chip">입양대기</span></div>
                <div class="meta">셰틀랜드 쉽독 · 암컷 · 4살</div>
              </div>
            </div>
          </div>
        </section>
      </div>

      <!-- 우측 사이드 -->
      <aside class="side">
        <section class="card pad">
          <button class="btn primary">♡ 후원하기</button>
          <button class="btn">👣 봉사 참여하기</button>
          <button class="btn">✉ 문의하기</button>
          <button class="btn">★ 팔로우하기</button>
          <div class="small">3420명이 팔로우 중</div>
        </section>

        <section class="card pad">
          <h3>운영 정보</h3>
          <div class="line"></div>
          <div class="kv"><span>평일</span><b>09:00 - 18:00</b></div>
          <div class="kv"><span>주말</span><b>09:00 - 17:00</b></div>
          <div class="kv"><span>휴무</span><b>연중무휴</b></div>
          <div class="line"></div>
          <div class="small">방문은 사전 예약을 권장합니다</div>
        </section>

        <section class="card pad">
          <h3>연락처</h3>
          <div class="info-row">📞 02-123-4567</div>
          <div class="info-row">✉ contact@loveshelter.org</div>
          <div class="info-row">🔗 www.loveshelter.org</div>
          <div class="line"></div>
          <div class="sns">
            <a href="#">@loveshelter_seoul</a>
            <a href="#">/LoveShelterSeoul</a>
          </div>
        </section>
      </aside>
    </div>
    <script src="${pageContext.request.contextPath}/assets/js/shelter/profile/main.js"></script>
  </main>


</body>
</html>
