<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>새 공지사항 작성 · Create Shelter Announcement</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/notice/create_post.css">
</head>
<body>
  <main>
  <div class="wrap">
    <div class="head">
      <div>
        <div class="title">새 공지사항 작성</div>
        <div class="subtitle">보호소 공지사항을 작성하고 관리합니다</div>
      </div>
      <div style="display:flex;gap:8px;align-items:center">
        <button class="btn ghost" id="previewBtn">미리보기</button>
        <button class="btn ghost" id="saveDraftBtn">임시저장</button>
        <button class="btn primary" id="publishBtn">게시하기</button>
      </div>
    </div>

    <div class="layout">
      <!-- main column -->
      <form id="noticeForm" class="card" onsubmit="return false;">
        <div class="section">
          <label for="title">제목</label>
          <input id="title" type="text" maxlength="100" placeholder="공지사항 제목을 입력하세요" />
          <div class="meta-row">
            <div class="hint">간결한 제목이 가독성 좋습니다 (최대 100자)</div>
            <div class="counter" id="titleCount">0 / 100</div>
          </div>
        </div>

        <div class="section">
          <label for="content">내용</label>
          <textarea id="content" placeholder="공지사항 내용을 입력하세요"></textarea>
          <div class="meta-row">
            <div class="hint">중요한 정보(날짜, 장소, 연락처)는 문단 앞에 배치하세요</div>
            <div class="counter" id="contentCount">0자</div>
          </div>
        </div>

        <div class="section">
          <label class="label-strong">첨부(선택)</label>
          <div style="display:flex;gap:8px;flex-wrap:wrap">
            <label class="btn" title="이미지/파일 첨부">
              첨부파일 선택
              <input id="files" type="file" style="display:none" multiple>
            </label>
            <div class="hint" id="fileInfo">첨부 없음</div>
          </div>
        </div>

        <!-- mobile: actions duplicated for easier reach -->
        <div class="btn-row" style="display:none" id="mobileActions">
          <button class="btn ghost" id="mPreview">미리보기</button>
          <button class="btn ghost" id="mDraft">임시저장</button>
          <button class="btn primary" id="mPublish">게시하기</button>
        </div>
      </form>

      <!-- right column (settings) -->
      <aside>
        <div class="side-card" style="margin-bottom:12px">
          <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:8px">
            <div style="font-weight:800">게시 설정</div>
          </div>

          <div class="switch-row">
            <div>
              <div style="font-weight:700;color:#4a4038">즉시 게시</div>
              <div class="hint">체크하면 저장과 동시에 게시</div>
            </div>
            <div id="switchPublish" class="switch" role="switch" aria-checked="false"><span class="knob"></span></div>
          </div>

          <div class="switch-row">
            <div>
              <div style="font-weight:700;color:#4a4038">상단 고정</div>
              <div class="hint">중요 공지를 상단에 고정합니다</div>
            </div>
            <div id="switchPin" class="switch" role="switch" aria-checked="false"><span class="knob"></span></div>
          </div>
        </div>

        <div class="side-card" style="margin-bottom:12px">
          <div style="font-weight:800;margin-bottom:8px">카테고리</div>
          <select id="category">
            <option value="general">일반공지</option>
            <option value="adoption">입양관련</option>
            <option value="medical">의료공지</option>
            <option value="event">이벤트</option>
            <option value="support">후원공지</option>
          </select>
          <div class="hint" style="margin-top:10px">카테고리를 선택하면 목록/필터에 반영됩니다</div>
        </div>

        <div class="side-card">
          <div style="font-weight:800;margin-bottom:6px">상세 옵션</div>
          <div style="font-size:13px;color:var(--muted);line-height:1.6">
            • 알림 발송: 공지 게시 시 팔로워에게 푸시/메일 알림 전송 설정<br>
            • 일정 예약: 즉시 게시를 끄면 예약 날짜/시간 입력 필드가 나타납니다(필요 시 요청 주세요)
          </div>
        </div>
      </aside>
    </div>
  </div>

  <script src="${pageContext.request.contextPath}/assets/js/shelter/notice/create_post.js"></script>
</main>
</body>
</html>
