<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>보호소 대시보드</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/shelter/dashboard/main.css">

</head>
<body>
	<main class="container">
		<!-- 헤더 & 액션 -->
		<div class="header">
			<div>
				<h1>보호소 대시보드</h1>
				<div class="subtitle">보호소 관리를 한 눈에 확인하세요</div>
			</div>
			<div class="actions">
				<a class="btn" href="./notice-new.html"> 공지사항 등록</a> <a class="btn"
					href="./timeline-new.html"> 타임라인 작성</a> <a class="btn"
					href="./carelog-new.html"> 보호일지 작성</a> <a class="btn primary"
					href="./volunteer-new.html"> 봉사일정 등록</a>
			</div>
		</div>

		<!-- 알림 -->
		<div class="alert" style="margin-top: 14px">
			<b>알림</b> <span class="hint" id="alertText">새 후원 2건, 입양 문의 1건이
				있습니다.</span>
		</div>

		<!-- KPI 4개 -->
		<section class="grid g4" style="margin-top: 14px">
			<div class="kpi">
				<small>보호 중인 강아지</small>
				<div class="num" id="kpiDogs">0</div>
			</div>
			<div class="kpi">
				<small>입양 가능한 강아지</small>
				<div class="num" id="kpiAdoptable">0</div>
			</div>
			<div class="kpi">
				<small>총 후원액</small>
				<div class="num" id="kpiTotalDon">0원</div>
			</div>
			<div class="kpi">
				<small>이번달 후원액</small>
				<div class="num" id="kpiMonthDon">0원</div>
			</div>
		</section>

		<!-- 중단 2열: 강아지 게시글형 리스트 / 봉사 일정 -->
		<section class="grid g2" style="margin-top: 16px">
			<!-- 좌: 보호 중 강아지 (게시글형) -->
			<article class="card">
				<h3 class="section-title">우리 보호소 보호 중 강아지</h3>
				<div id="dogFeed" class="feed" aria-label="보호중인 강아지 목록"></div>
			</article>

<div style="position:fixed;top:8px;left:8px;background:#ffc;padding:4px;z-index:99999">
  ${pageContext.request.contextPath}
</div>





			<!-- 우: 등록한 봉사 일정 -->
			<article class="card">
				<h3 class="section-title">등록한 봉사 일정</h3>
				<div id="volList" class="scrollbox"></div>
			</article>
		</section>

		<!-- 하단 2열: 문의사항 / 최근 게시글 -->
		<section class="grid g2" style="margin-top: 16px">
			<article class="card">
				<h3 class="section-title">최근 문의사항</h3>
				<div id="inqList" class="scrollbox sm"></div>
			</article>

			<article class="card">
				<h3 class="section-title">최근 게시글</h3>
				<div id="postList" class="scrollbox sm"></div>
			</article>
		</section>
	</main>

	<script defer
		src="${pageContext.request.contextPath}/assets/js/shelter/dashboard/main.js"></script>

</body>
</html>
