<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>초코의 프로필</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/animal/profile.css">
</head>
<body>
  <main class="wrap">
    <!-- 상단 -->
    <div class="topbar">
      <div class="back">← 초코의 프로필 · <span>사랑보호소 · 서울시 강남구</span></div>
      <button class="share" id="shareBtn">공유하기</button>
    </div>

    <div class="grid">
      <!-- 왼쪽: 메인 -->
      <div>
        <!-- 프로필 카드 -->
        <section class="card pad">
          <div class="profile">
            <img class="photo" src="https://images.unsplash.com/photo-1548199973-03cce0bbc87b?q=80&w=1200&auto=format&fit=crop" alt="초코">
            <div>
              <div class="name-row">
                <h1 class="name">초코</h1>
                <span class="badge">입양대기</span>
              </div>
              <div class="sub">골든 리트리버</div>

              <div class="meta-grid">
                <div class="meta">
                  <!-- 성별 -->
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"><circle cx="12" cy="12" r="10" stroke-width="2"/><path d="M12 8v8M8 12h8" stroke-width="2"/></svg>
                  성별: 수컷
                </div>
                <div class="meta">
                  <!-- 나이 -->
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"><circle cx="12" cy="12" r="10" stroke-width="2"/><path d="M12 6v6l4 2" stroke-width="2"/></svg>
                  추정 나이: 3세
                </div>
                <div class="meta">
                  <!-- 몸무게 -->
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"><path d="M21 16V8a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v8" stroke-width="2"/><path d="M7 16h10" stroke-width="2"/></svg>
                  25kg
                </div>
                <div class="meta">
                  <!-- 보호일수 -->
                  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor"><rect x="3" y="4" width="18" height="16" rx="2" ry="2" stroke-width="2"/><path d="M16 2v4M8 2v4M3 10h18" stroke-width="2"/></svg>
                  <span class="wait">613일째 보호중</span>
                </div>
              </div>

              <div>
                <div class="section-title">성격</div>
                <div class="pills">
                  <span class="pill">차분함</span>
                  <span class="pill">사람을좋아함</span>
                  <span class="pill">활발함</span>
                  <span class="pill">독특함</span>
                </div>
              </div>

              <div style="margin-top:10px">
                <div class="section-title">건강 상태</div>
                <div class="pills">
                  <span class="pill green">접종 완료</span>
                  <span class="pill green">중성화 완료</span>
                  <span class="pill blue">건강상태 양호</span>
                </div>
              </div>
            </div>
          </div>

          <div style="margin-top:14px">
            <div class="section-title">소개</div>
            <div class="desc">
              사람을 좋아하고 온순한 성격의 초코입니다. 다른 동물들과도 잘 어울리며, 산책과 놀이를 즐깁니다.
              아이들과도 잘 노는 편이라 가족 반려견으로도 훌륭합니다.
            </div>
          </div>
        </section>

        <!-- 활동 타임라인 -->
        <section class="card timeline">
          <div class="section-title" style="margin-bottom:8px">활동 타임라인</div>

          <div class="titem">
            <div class="dot"></div>
            <div>
              <div class="theadline">건강검진 완료! <span class="tlabel">건강</span></div>
              <div class="tdesc">오늘 정기 건강검진을 받았으며, 모든 수치가 정상이고 건강한 상태입니다.</div>
            </div>
            <div style="text-align:right;color:#8c8279">2024.01.25</div>
          </div>

          <div class="titem">
            <div class="dot"></div>
            <div>
              <div class="theadline">산책 시간 <span class="tlabel">봉사</span></div>
              <div class="tdesc">봉사자분과 함께 공원에서 즐거운 산책 시간을 보냈어요. 날씨가 좋아 기분이 최고였습니다!</div>
            </div>
            <div style="text-align:right;color:#8c8279">2024.01.24</div>
          </div>

          <div class="titem">
            <div class="dot"></div>
            <div style="display:grid;grid-template-columns:92px 1fr;gap:10px">
              <img class="tthumb" src="https://images.unsplash.com/photo-1507146426996-ef05306b995a?q=80&w=1200&auto=format&fit=crop" alt="thumb">
              <div>
                <div class="theadline">새로운 친구들과 놀기 <span class="tlabel">일상</span></div>
                <div class="tdesc">다른 아이들과 함께 시간을 가졌어요. 첫 만남엔 낯설었지만 금세 친해졌습니다.</div>
              </div>
            </div>
            <div style="text-align:right;color:#8c8279">2024.01.23</div>
          </div>
        </section>
      </div>

      <!-- 오른쪽: 사이드 -->
      <aside class="side">
        <section class="card pad">
          <div class="cta">
            <button class="btn strong">♡  입양 신청하기</button>
            <button class="btn">$  후원하기</button>
            <button class="btn">👣  팔로우하기</button>
            <div class="small">127명이 팔로우 중</div>
          </div>
        </section>

        <section class="card pad">
          <div class="section-title">개인 블로그</div>
          <div class="small" style="margin-bottom:8px">초코의 일상과 성장기를 만나보세요</div>
          <a class="btn" href="#">블로그 보러가기</a>
        </section>

        <section class="card pad">
          <div class="section-title">입양 정보</div>
          <div class="kv"><span>입양비:</span> <b>200,000원</b></div>
          <div class="kv"><span>보호 기간:</span> <b>613일</b></div>
          <div class="small">입양비는 검진, 접종, 중성화 등의 의료비에 사용됩니다</div>
        </section>

        <section class="card pad">
          <div class="section-title">보호소 정보</div>
          <div class="list">
            <div class="row">🏠 <b>사랑보호소</b></div>
            <div class="row">📍 서울시 강남구</div>
          </div>
          <div class="sep"></div>
          <div class="small">입소일: 2024.01.15</div>
        </section>
      </aside>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/shelter/animal/profile.js"></script>
  </main>


</body>
</html>
