<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
    구조된 동물 상세 정보 페이지 (공공데이터 API 스펙 기반)

    **Controller에서 받는 데이터:**
    - animal: Map<String, Object> (구조된 동물 상세 정보 - API 응답 필드 기준)
    - animalImages: List<String> (popfile1~popfile8 이미지 목록)

    **API 필드 정보:**
    - desertionNo: 유기번호
    - kindCd, kindNm: 품종코드/이름
    - colorCd: 색상
    - age: 나이
    - weight: 체중
    - noticeNo: 공고번호
    - noticeSdt, noticeEdt: 공고시작일/종료일
    - happenDt: 발견일
    - happenPlace: 발견장소
    - careNm: 보호소명
    - careTel: 보호소연락처
    - careAddr: 보호소주소
    - processState: 상태
    - sexCd: 성별
    - neuterYn: 중성화여부
    - specialMark: 특징
--%>

<%-- 동물 정보가 없을 경우 처리 --%>
<c:if test="${empty animal}">
    <div class="rescued-detail-container">
        <div class="error-message" style="text-align: center; padding: 50px;">
            <h2 style="color: #666;">동물 정보를 찾을 수 없습니다.</h2>
            <a href="${pageContext.request.contextPath}/animal/rescued" class="btn btn-primary">목록으로 돌아가기</a>
        </div>
    </div>
</c:if>

<c:if test="${not empty animal}">

<style>
    .rescued-detail-container {
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
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        padding: 30px;
        margin-bottom: 30px;
        box-shadow: 0 2px 4px rgba(60, 42, 33, 0.1);
    }
    
    .animal-title {
        color: #3C2A21;
        font-size: 32px;
        margin-bottom: 15px;
        text-align: center;
    }
    
    .rescue-date-badge {
        text-align: center;
        margin-bottom: 20px;
    }
    
    .date-badge {
        background-color: #8D7B68;
        color: #FFFFFF;
        padding: 8px 20px;
        border-radius: 20px;
        font-weight: bold;
        display: inline-block;
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
        border: 2px solid #F1DEC9;
        margin-bottom: 15px;
    }
    
    .image-gallery {
        display: flex;
        gap: 10px;
        overflow-x: auto;
        padding: 10px 0;
    }
    
    .thumbnail {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 4px;
        border: 1px solid #F1DEC9;
        cursor: pointer;
        flex-shrink: 0;
    }
    
    .thumbnail:hover,
    .thumbnail.active {
        border: 2px solid #8D7B68;
    }
    
    .info-section {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        padding: 20px;
    }
    
    .info-grid {
        display: grid;
        gap: 15px;
    }
    
    .info-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 0;
        border-bottom: 1px solid #FFF8EA;
    }
    
    .info-label {
        color: #3C2A21;
        font-weight: bold;
        flex: 1;
    }
    
    .info-value {
        color: #666666;
        flex: 2;
        text-align: right;
    }
    
    .status-badge {
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: bold;
        color: #FFFFFF;
    }
    
    .status-badge.건강 {
        background-color: #8D7B68;
    }
    
    .status-badge.치료중 {
        background-color: #A4907C;
    }
    
    .status-badge.위험 {
        background-color: #666666;
    }
    
    .description-section {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        padding: 30px;
        margin-bottom: 30px;
    }
    
    .section-title {
        color: #3C2A21;
        font-size: 20px;
        margin-bottom: 15px;
        font-weight: bold;
    }
    
    .description-text {
        color: #777777;
        line-height: 1.6;
        font-size: 16px;
    }
    
    .shelter-section {
        background-color: #FFF8EA;
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        padding: 30px;
        margin-bottom: 30px;
    }
    
    .shelter-info {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 20px;
    }
    
    .contact-buttons {
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
        transition: background-color 0.3s;
    }
    
    .btn-primary {
        background-color: #8D7B68;
        color: #FFFFFF;
    }
    
    .btn-primary:hover {
        background-color: #A4907C;
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
    
    .btn-danger {
        background-color: #666666;
        color: #FFFFFF;
    }
    
    .btn-danger:hover {
        background-color: #555555;
    }
    
    .related-section {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        padding: 30px;
    }
    
    .related-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
    }
    
    .related-item {
        border: 1px solid #F1DEC9;
        border-radius: 8px;
        padding: 15px;
        text-align: center;
        background-color: #FFF8EA;
    }
    
    .related-item img {
        width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 6px;
        margin-bottom: 10px;
    }
    
    .related-item h4 {
        color: #3C2A21;
        margin: 10px 0 5px 0;
    }
    
    .related-item p {
        color: #777777;
        font-size: 14px;
        margin: 5px 0;
    }
    
    .related-item a {
        color: #8D7B68;
        text-decoration: none;
        font-weight: bold;
        font-size: 14px;
    }
    
    .related-item a:hover {
        color: #A4907C;
    }
    
    @media (max-width: 768px) {
        .main-content {
            grid-template-columns: 1fr;
        }
        
        .shelter-info {
            grid-template-columns: 1fr;
        }
        
        .contact-buttons {
            flex-direction: column;
        }
        
        .related-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<script>
    function changeMainImage(src) {
        document.getElementById('mainImage').src = src;
        
        // 모든 썸네일에서 active 클래스 제거
        document.querySelectorAll('.thumbnail').forEach(thumb => {
            thumb.classList.remove('active');
        });
        
        // 클릭된 썸네일에 active 클래스 추가
        event.target.classList.add('active');
    }
</script>

<div class="rescued-detail-container">
    <%-- 브레드크럼 --%>
    <div class="breadcrumb">
        <a href="${pageContext.request.contextPath}/animal/rescued">구조된 동물 목록</a> > ${animal.desertionNo} 상세정보
    </div>

    <%-- 헤더 --%>
    <div class="detail-header">
        <h1 class="animal-title">공고번호: ${animal.noticeNo}</h1>
        <div class="rescue-date-badge">
            <span class="date-badge">발견일: ${animal.happenDt}</span>
            <c:if test="${not empty animal.noticeSdt and not empty animal.noticeEdt}">
                <span class="date-badge">공고기간: ${animal.noticeSdt} ~ ${animal.noticeEdt}</span>
            </c:if>
        </div>
    </div>

    <%-- 메인 콘텐츠 --%>
    <div class="main-content">
        <%-- 이미지 섹션 --%>
        <div class="image-section">
            <img id="mainImage" src="${animal.popfile1}" alt="구조동물" class="main-image">

            <c:if test="${not empty animalImages}">
                <div class="image-gallery">
                    <c:forEach items="${animalImages}" var="image" varStatus="status">
                        <c:if test="${not empty image}">
                            <img src="${image}" alt="구조동물 사진 ${status.index + 1}"
                                 class="thumbnail ${status.index == 0 ? 'active' : ''}"
                                 onclick="changeMainImage('${image}')">
                        </c:if>
                    </c:forEach>
                </div>
            </c:if>
        </div>

        <%-- 기본 정보 섹션 --%>
        <div class="info-section">
            <h3 class="section-title">기본 정보</h3>
            <div class="info-grid">
                <div class="info-item">
                    <span class="info-label">유기번호</span>
                    <span class="info-value">${animal.desertionNo}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">품종</span>
                    <span class="info-value">${animal.kindNm}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">성별</span>
                    <span class="info-value">
                        <c:choose>
                            <c:when test="${animal.sexCd eq 'M'}">수컷</c:when>
                            <c:when test="${animal.sexCd eq 'F'}">암컷</c:when>
                            <c:otherwise>미상</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="info-item">
                    <span class="info-label">나이</span>
                    <span class="info-value">${animal.age}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">색상</span>
                    <span class="info-value">${animal.colorCd}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">체중</span>
                    <span class="info-value">${animal.weight}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">중성화</span>
                    <span class="info-value">
                        <c:choose>
                            <c:when test="${animal.neuterYn eq 'Y'}">완료</c:when>
                            <c:when test="${animal.neuterYn eq 'N'}">미완료</c:when>
                            <c:otherwise>미상</c:otherwise>
                        </c:choose>
                    </span>
                </div>
                <div class="info-item">
                    <span class="info-label">상태</span>
                    <span class="info-value">
                        <span class="status-badge ${animal.processState}">${animal.processState}</span>
                    </span>
                </div>
                <div class="info-item">
                    <span class="info-label">발견일</span>
                    <span class="info-value">${animal.happenDt}</span>
                </div>
                <div class="info-item">
                    <span class="info-label">발견장소</span>
                    <span class="info-value">${animal.happenPlace}</span>
                </div>
            </div>
        </div>
    </div>

    <%-- 특징 설명 --%>
    <c:if test="${not empty animal.specialMark}">
        <div class="description-section">
            <h3 class="section-title">특징</h3>
            <p class="description-text">${animal.specialMark}</p>
        </div>
    </c:if>

    <%-- 보호소 정보 --%>
    <div class="shelter-section">
        <h3 class="section-title">보호소 정보</h3>
        <div class="shelter-info">
            <div class="info-item">
                <span class="info-label">보호소명</span>
                <span class="info-value">${animal.careNm}</span>
            </div>
            <div class="info-item">
                <span class="info-label">연락처</span>
                <span class="info-value">${animal.careTel}</span>
            </div>
            <div class="info-item">
                <span class="info-label">주소</span>
                <span class="info-value">${animal.careAddr}</span>
            </div>
            <c:if test="${not empty animal.careRegNo}">
                <div class="info-item">
                    <span class="info-label">등록번호</span>
                    <span class="info-value">${animal.careRegNo}</span>
                </div>
            </c:if>
        </div>

        <div class="contact-buttons">
            <a href="${pageContext.request.contextPath}/animal/rescued" class="btn btn-secondary">
                목록으로 돌아가기
            </a>
        </div>
    </div>

</div>

</c:if>