<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1" />
<title>1:1 문의 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/shelter/qna/viewdetails.css">
</head>
<body>
  <div class="wrap">
    <!-- Page head -->
    <div class="page-head">
      <div class="title-row">
        <h1>문의 상세</h1>
        <span class="pill blue">입양문의</span>
        <span class="pill red">미답변</span>
      </div>
      <p class="sub">문의 내용을 확인하고 답변을 작성해주세요</p>
    </div>

    <!-- 문의자 정보 -->
    <section class="section">
      <div class="sec-head">
        <div class="sec-title">문의자 정보</div>
      </div>
      <div class="sec-body">
        <div class="info-grid">
          <div class="field">
            <div class="label">이름</div>
            <div class="value">김민수</div>
          </div>
          <div class="field">
            <div class="label">이메일</div>
            <div class="value"><span class="ico">✉️</span> kimms@example.com</div>
          </div>
          <div class="field">
            <div class="label">연락처</div>
            <div class="value"><span class="ico">📞</span> 010-1234-5678</div>
          </div>
          <div class="field">
            <div class="label">문의 ID</div>
            <div class="value">INQ-2024-0125-001</div>
          </div>
        </div>

        <div class="info-actions">
          <button class="btn"><span class="ico">📲</span>전화 연락</button>
          <button class="btn"><span class="ico">📧</span>이메일 발송</button>
        </div>
      </div>
    </section>

    <!-- 문의 내용 -->
    <section class="section">
      <div class="sec-head">
        <div class="sec-title">문의 내용</div>
        <div class="meta-line">
          <span>🕒 2024.01.25 14:30</span>
          <span class="badge b-blue">입양문의</span>
        </div>
      </div>
      <div class="sec-body">
        <div class="message-box">
          <div class="msg-title">초코 입양 절차 문의</div>
안녕하세요. 사랑보호소님.

홈페이지에서 초코를 보고 입양을 희망하게 되었습니다.
가족 모두가 동의한 상태이고, 아이들도 매우 기대하고 있습니다.

다음 사항들에 대해 문의드립니다:

1. 입양 신청 시 필요한 서류는 무엇인가요?
2. 가정 방문은 꼭 이루어지나요?
3. 초코의 최근 건강 상태는 어떤가요?
4. 입양 후 적응에 있어 주의할 점이 있나요?
5. 동일한 품종만 입양 가능한가요?

빠른 답변 부탁드립니다.
감사합니다.
        </div>

        <!-- 첨부파일 -->
        <div class="attach-row">
          <div class="attach">
            <div class="attach-ico">JPG</div>
            <div>
              <div class="name">가족사진.jpg</div>
              <div class="size">1.2MB</div>
            </div>
            <button class="dl" title="다운로드">⬇️</button>
          </div>

          <div class="attach">
            <div class="attach-ico" style="background:#fff1e6;color:#b35c08">PDF</div>
            <div>
              <div class="name">거주증명서.pdf</div>
              <div class="size">890KB</div>
            </div>
            <button class="dl" title="다운로드">⬇️</button>
          </div>
        </div>
      </div>
    </section>

    <!-- 답변 작성 -->
    <section class="section reply">
      <div class="sec-head">
        <div class="sec-title">답변 작성</div>
      </div>
      <div class="sec-body">
        <div class="form-row">
          <label for="answer">답변 내용 <span style="color:#d33">*</span></label>
          <textarea id="answer" placeholder="문의자에게 전달될 답변을 작성해주세요...&#10;친절하고 상세한 답변을 작성해주세요."></textarea>
          <div class="hint">※ 입력 후 전송 버튼이 활성화됩니다.</div>
        </div>

        <div class="form-row">
          <label>첨부파일</label>
          <div class="upload">
            <label class="file-btn" for="file"><span>📎</span> 파일 선택</label>
            <input id="file" type="file" multiple />
            <div id="fileList" class="hint">이미지, PDF, DOC 파일 (최대 10MB)</div>
          </div>
        </div>

        <div class="reply-foot">
          <button class="btn-reset" id="resetBtn">초기화</button>
          <button class="btn-send" id="sendBtn"><span class="ico">📤</span>답변 전송</button>
        </div>
      </div>
    </section>
  </div>

  <script src="${pageContext.request.contextPath}/assets/js/shelter/qna/viewdetails.js"></script>
</body>
</html>
