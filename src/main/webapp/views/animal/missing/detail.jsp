<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
    분실동물 상세 정보 페이지

    **Controller에서 받는 데이터:**
    - animal: Map<String, Object> (분실동물 상세 정보)
      - rfidCd: String (RFID 코드)
      - callName: String (신고자명)
      - callTel: String (신고자 연락처)
      - happenDt: String (분실일)
      - happenAddr: String (분실주소)
      - happenAddrDtl: String (분실상세주소)
      - happenPlace: String (분실장소)
      - orgNm: String (관할기관)
      - popfile: String (이미지)
      - kindCd: String (축종코드)
      - colorCd: String (색상)
      - sexCd: String (성별)
      - age: String (나이)
      - specialMark: String (특징)
--%>

<%-- 동물 정보가 없을 경우 처리 --%>
<c:if test="${empty animal}">
    <div class="missing-detail-container">
        <div class="error-message" style="text-align: center; padding: 50px;">
            <h2 style="color: #666;">분실동물 정보를 찾을 수 없습니다.</h2>
            <a href="${pageContext.request.contextPath}/animal/missing" class="btn btn-primary">목록으로 돌아가기</a>
        </div>
    </div>
</c:if>

<c:if test="${not empty animal}">

<style>
    .missing-detail-container {
        background-color: #F9F9F9;
        color: #000000;
        padding: 20px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .breadcrumb {
        color: #777777;
        margin-bottom: 20px;
        font-size: 14px;
    }

    .breadcrumb a {
        color: #8D7B68;
        text-decoration: none;
    }

    .breadcrumb a:hover {
        color: #A4907C;
    }

    .detail-header {
        background-color: #FFFFFF;
        border: 2px solid #FF6B6B;
        border-radius: 12px;
        padding: 30px;
        margin-bottom: 30px;
        box-shadow: 0 4px 8px rgba(255, 107, 107, 0.2);
        text-align: center;
    }

    .missing-title {
        color: #3C2A21;
        font-size: 32px;
        margin-bottom: 15px;
        font-weight: bold;
    }

    .missing-status {
        background-color: #FF6B6B;
        color: #FFFFFF;
        padding: 10px 30px;
        border-radius: 25px;
        font-weight: bold;
        font-size: 18px;
        display: inline-block;
        animation: pulse 2s infinite;
    }

    @keyframes pulse {
        0% { opacity: 1; }
        50% { opacity: 0.7; }
        100% { opacity: 1; }
    }

    .missing-date {
        color: #666666;
        margin-top: 15px;
        font-size: 16px;
    }

    .main-content {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
        margin-bottom: 30px;
    }

    .image-section {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        padding: 20px;
    }

    .main-image {
        width: 100%;
        height: 400px;
        object-fit: cover;
        border-radius: 8px;
        border: 2px solid #FF6B6B;
        margin-bottom: 15px;
    }

    .reward-info {
        background-color: #FFE5E5;
        border: 2px solid #FF6B6B;
        border-radius: 8px;
        padding: 15px;
        text-align: center;
    }

    .reward-amount {
        color: #FF6B6B;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .reward-label {
        color: #666666;
        font-size: 14px;
    }

    .info-section {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        padding: 20px;
    }

    .section-title {
        color: #3C2A21;
        font-size: 20px;
        margin-bottom: 20px;
        font-weight: bold;
        border-bottom: 2px solid #F1DEC9;
        padding-bottom: 10px;
    }

    .info-grid {
        display: grid;
        gap: 15px;
    }

    .info-item {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        padding: 12px 0;
        border-bottom: 1px solid #FFF8EA;
    }

    .info-item:last-child {
        border-bottom: none;
    }

    .info-label {
        color: #3C2A21;
        font-weight: bold;
        flex: 1;
        min-width: 120px;
    }

    .info-value {
        color: #666666;
        flex: 2;
        text-align: right;
    }

    .full-width {
        flex-direction: column;
        align-items: flex-start;
        gap: 8px;
    }

    .full-width .info-value {
        text-align: left;
        line-height: 1.5;
    }

    .contact-section {
        background-color: #FFF8EA;
        border: 2px solid #8D7B68;
        border-radius: 12px;
        padding: 30px;
        margin-bottom: 30px;
    }

    .contact-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
        margin-bottom: 20px;
    }

    .contact-card {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
    }

    .contact-type {
        color: #8D7B68;
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 15px;
    }

    .contact-name {
        color: #3C2A21;
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .contact-tel {
        color: #666666;
        font-size: 16px;
        margin-bottom: 15px;
    }

    .contact-actions {
        display: flex;
        gap: 15px;
        justify-content: center;
        flex-wrap: wrap;
    }

    .btn {
        padding: 12px 24px;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        text-decoration: none;
        display: inline-block;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s;
        font-size: 14px;
    }

    .btn-primary {
        background-color: #8D7B68;
        color: #FFFFFF;
    }

    .btn-primary:hover {
        background-color: #A4907C;
    }

    .btn-emergency {
        background-color: #FF6B6B;
        color: #FFFFFF;
    }

    .btn-emergency:hover {
        background-color: #FF5252;
    }

    .btn-secondary {
        background-color: #FFFFFF;
        color: #8D7B68;
        border: 2px solid #8D7B68;
    }

    .btn-secondary:hover {
        background-color: #8D7B68;
        color: #FFFFFF;
    }

    .description-section {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        padding: 30px;
        margin-bottom: 30px;
    }

    .description-text {
        color: #777777;
        line-height: 1.8;
        font-size: 16px;
    }

    .owner-comment {
        background-color: #FFF8EA;
        border-left: 4px solid #8D7B68;
        padding: 20px;
        margin-top: 20px;
        border-radius: 0 8px 8px 0;
    }

    .owner-comment-label {
        color: #8D7B68;
        font-weight: bold;
        margin-bottom: 10px;
    }

    .owner-comment-text {
        color: #3C2A21;
        font-style: italic;
        line-height: 1.6;
    }

    .action-section {
        background-color: #FFFFFF;
        border: 2px solid #FF6B6B;
        border-radius: 12px;
        padding: 30px;
        text-align: center;
    }

    .action-title {
        color: #FF6B6B;
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 15px;
    }

    .action-subtitle {
        color: #666666;
        margin-bottom: 25px;
        line-height: 1.5;
    }

    .action-buttons {
        display: flex;
        gap: 20px;
        justify-content: center;
        flex-wrap: wrap;
    }

    .btn-large {
        padding: 15px 30px;
        font-size: 16px;
    }

    @media (max-width: 768px) {
        .main-content {
            grid-template-columns: 1fr;
        }

        .contact-grid {
            grid-template-columns: 1fr;
        }

        .contact-actions {
            flex-direction: column;
        }

        .action-buttons {
            flex-direction: column;
            align-items: center;
        }

        .btn-large {
            width: 100%;
            max-width: 300px;
        }
    }
</style>

<script>
    function makeCall(phoneNumber) {
        if (confirm(`${phoneNumber}로 전화를 걸겠습니까?`)) {
            window.location.href = `tel:${phoneNumber}`;
        }
    }

    function reportSighting() {
        alert('목격 제보 기능입니다.\n실제 구현에서는 제보 폼으로 이동합니다.');
    }

    function shareInfo() {
        if (navigator.share) {
            navigator.share({
                title: '분실동물 정보',
                text: '분실된 반려동물을 찾습니다.',
                url: window.location.href
            });
        } else {
            // 폴백: URL 복사
            navigator.clipboard.writeText(window.location.href).then(() => {
                alert('링크가 복사되었습니다.');
            });
        }
    }
</script>

<div class="missing-detail-container">
    <%-- 브레드크럼 --%>
    <div class="breadcrumb">
        <a href="${pageContext.request.contextPath}/animal/missing">분실동물 목록</a> > 상세정보
    </div>

    <%-- 헤더 --%>
    <div class="detail-header">
        <h1 class="missing-title">분실동물 신고</h1>
        <div class="missing-status">긴급 수색 중</div>
        <div class="missing-date">분실일:
            <c:choose>
                <c:when test="${not empty animal.happenDt and animal.happenDt.length() == 8}">
                    ${animal.happenDt.substring(0,4)}-${animal.happenDt.substring(4,6)}-${animal.happenDt.substring(6,8)}
                </c:when>
                <c:otherwise>
                    ${animal.happenDt}
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <%-- 메인 콘텐츠 --%>
    <div class="main-content">
        <%-- 이미지 섹션 --%>
        <div class="image-section">
            <img src="${animal.popfile}" alt="분실동물" class="main-image"
                 onerror="this.onerror=null; this.src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAwIiBoZWlnaHQ9IjQwMCIgdmlld0JveD0iMCAwIDQwMCA0MDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxyZWN0IHdpZHRoPSI0MDAiIGhlaWdodD0iNDAwIiBmaWxsPSIjRjVGNUY1Ii8+CjxwYXRoIGQ9Ik0xNjAgMjAwQzE2MCAyMTMuMjU1IDE3My43NDUgMjI3IDIwMCAyMjdIMjAwQzIyNi4yNTUgMjI3IDI0MCAyMTMuMjU1IDI0MCAyMDBWMTgwQzI0MCAyNjYuMjU1IDIyNi4yNTUgMjgwIDIwMCAyODBIMjAwQzE3My43NDUgMjgwIDE2MCAyNjYuMjU1IDE2MCAyNDBWMjAwWiIgZmlsbD0iI0Q5RDlEOSIvPgo8Y2lyY2xlIGN4PSIxODUiIGN5PSIxODUiIHI9IjgiIGZpbGw9IiM5RTlFOUUiLz4KPGNpcmNsZSBjeD0iMjE1IiBjeT0iMTg1IiByPSI4IiBmaWxsPSIjOUU5RTlFIi8+CjxwYXRoIGQ9Ik0xNzAgMjIwQzE3MCAyMjAgMTg1IDIzMCAyMDAgMjMwQzIxNSAyMzAgMjMwIDIyMCAyMzAgMjIwIiBzdHJva2U9IiM5RTlFOUUiIHN0cm9rZS13aWR0aD0iNCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIi8+Cjx0ZXh0IHg9IjIwMCIgeT0iMzIwIiBmb250LWZhbWlseT0iQXJpYWwiIGZvbnQtc2l6ZT0iMTgiIGZpbGw9IiM5OTk5OTkiIHRleHQtYW5jaG9yPSJtaWRkbGUiPu2YhOyZuCDsl4bsnYw8L3RleHQ+Cjwvc3ZnPgo='">
        </div>

        <%-- 기본 정보 섹션 --%>
        <div class="info-section">
            <h3 class="section-title">동물 정보</h3>
            <div class="info-grid">
                <div class="info-item">
                    <span class="info-label">동물등록번호</span>
                    <span class="info-value">${animal.rfidCd}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">종류</span>
                    <span class="info-value">
                        <c:choose>
                            <c:when test="${animal.kindCd == '417000'}">개</c:when>
                            <c:when test="${animal.kindCd == '422400'}">고양이</c:when>
                            <c:otherwise>기타</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="info-item">
                    <span class="info-label">품종</span>
                    <span class="info-value">${animal.breeds}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">성별</span>
                    <span class="info-value">
                        <c:choose>
                            <c:when test="${animal.sexCd == 'M'}">수컷</c:when>
                            <c:when test="${animal.sexCd == 'F'}">암컷</c:when>
                            <c:otherwise>미상</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="info-item">
                    <span class="info-label">나이</span>
                    <span class="info-value">${animal.age}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">체중</span>
                    <span class="info-value">${animal.weight}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">색상</span>
                    <span class="info-value">${animal.colorCd}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">중성화</span>
                    <span class="info-value">
                        <c:choose>
                            <c:when test="${animal.neuterYn == 'Y'}">완료</c:when>
                            <c:when test="${animal.neuterYn == 'N'}">미완료</c:when>
                            <c:otherwise>미상</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="info-item">
                    <span class="info-label">마이크로칩</span>
                    <span class="info-value">${animal.microchip}</span>
                </div>
            </div>
        </div>
    </div>

    <%-- 분실 장소 정보 --%>
    <div class="description-section">
        <h3 class="section-title">분실 장소</h3>
        <div class="info-grid">
            <div class="info-item">
                <span class="info-label">주소</span>
                <span class="info-value">${animal.happenAddr} ${animal.happenAddrDtl}</span>
            </div>
            <div class="info-item">
                <span class="info-label">구체적 장소</span>
                <span class="info-value">${animal.happenPlace}</span>
            </div>
            <div class="info-item">
                <span class="info-label">관할기관</span>
                <span class="info-value">${animal.orgNm}</span>
            </div>
        </div>
    </div>

    <%-- 특징 및 기타 정보 --%>
    <div class="description-section">
        <h3 class="section-title">특징 및 상세 정보</h3>
        <p class="description-text">${animal.specialMark}</p>
    </div>

    <%-- 연락처 정보 --%>
    <div class="contact-section">
        <h3 class="section-title">연락처 정보</h3>
        <div class="contact-grid">
            <div class="contact-card">
                <div class="contact-type">보호자</div>
                <div class="contact-name">${animal.callName}</div>
                <div class="contact-tel">${animal.callTel}</div>
            </div>
            <div class="contact-card">
                <div class="contact-type">관할기관</div>
                <div class="contact-name">${animal.orgNm}</div>
            </div>
        </div>
    </div>

    <%-- 액션 섹션 --%>
    <div class="action-section">
        <div class="action-title">도움이 필요합니다!</div>
        <div class="action-subtitle">
            작은 정보라도 큰 도움이 됩니다.<br>
            목격하셨거나 보호하고 계시다면 즉시 연락해 주세요.
        </div>
    </div>
</div>

</c:if>