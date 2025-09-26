<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
/* 전체 컨테이너 */
.animal-list-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 40px 20px;
    background-color: #F9F9F9;
    min-height: 100vh;
}

/* 페이지 제목 */
.page-header {
    text-align: center;
    margin-bottom: 40px;
    background: linear-gradient(135deg, #F1DEC9, #FFF8EA);
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(140, 123, 104, 0.1);
}

.page-title {
    color: #3C2A21;
    font-size: 2.5rem;
    font-weight: bold;
    margin: 0 0 10px 0;
    text-shadow: 0 2px 4px rgba(60, 42, 33, 0.1);
}

.page-subtitle {
    color: #8D7B68;
    font-size: 1.1rem;
    margin: 0;
}

/* 검색 및 필터 영역 */
.search-filter {
    background: #FFFFFF;
    padding: 25px;
    border-radius: 12px;
    margin-bottom: 30px;
    box-shadow: 0 2px 8px rgba(140, 123, 104, 0.1);
    border: 1px solid #F1DEC9;
}

.filter-row {
    display: flex;
    gap: 15px;
    flex-wrap: wrap;
    align-items: center;
    margin-bottom: 15px;
}

.filter-group {
    flex: 1;
    min-width: 200px;
}

.filter-label {
    display: block;
    color: #3C2A21;
    font-weight: 600;
    margin-bottom: 5px;
    font-size: 0.9rem;
}

.search-input, .filter-select {
    width: 100%;
    padding: 12px 15px;
    border: 2px solid #F1DEC9;
    border-radius: 8px;
    font-size: 1rem;
    background-color: #FFF8EA;
    color: #3C2A21;
    transition: all 0.3s ease;
}

.search-input:focus, .filter-select:focus {
    outline: none;
    border-color: #8D7B68;
    background-color: #FFFFFF;
    box-shadow: 0 0 8px rgba(140, 123, 104, 0.2);
}

.search-btn, .reset-btn {
    padding: 12px 25px;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}

.search-btn {
    background-color: #8D7B68;
    color: #FFFFFF;
}

.search-btn:hover {
    background-color: #777777;
    transform: translateY(-2px);
}

.reset-btn {
    background-color: #A4907C;
    color: #FFFFFF;
    margin-left: 10px;
}

.reset-btn:hover {
    background-color: #8D7B68;
    transform: translateY(-2px);
}

/* 결과 정보 */
.results-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
    padding: 15px 0;
    border-bottom: 2px solid #F1DEC9;
}

.results-count {
    color: #3C2A21;
    font-weight: 600;
    font-size: 1.1rem;
}

.sort-options {
    display: flex;
    gap: 10px;
    align-items: center;
}

.sort-label {
    color: #666666;
    font-weight: 500;
}

/* 동물 카드 그리드 */
.animal-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 25px;
    margin-bottom: 40px;
}

.animal-card {
    background: #FFFFFF;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(140, 123, 104, 0.1);
    transition: all 0.3s ease;
    border: 1px solid #F1DEC9;
    position: relative;
}

.animal-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(140, 123, 104, 0.2);
}

.card-image-container {
    position: relative;
    width: 100%;
    height: 220px;
    overflow: hidden;
}

.animal-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.animal-card:hover .animal-image {
    transform: scale(1.05);
}

.status-badge {
    position: absolute;
    top: 12px;
    right: 12px;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
    text-transform: uppercase;
}

.status-available {
    background-color: #8D7B68;
    color: #FFFFFF;
}

.status-adopted {
    background-color: #A4907C;
    color: #FFFFFF;
}

.card-content {
    padding: 20px;
}

.animal-name {
    color: #3C2A21;
    font-size: 1.4rem;
    font-weight: bold;
    margin: 0 0 10px 0;
}

.animal-info {
    margin-bottom: 15px;
}

.info-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 8px;
    color: #666666;
    font-size: 0.95rem;
}

.info-label {
    font-weight: 600;
    color: #777777;
}

.info-value {
    color: #8D7B68;
    font-weight: 500;
}

.shelter-info {
    color: #A4907C;
    font-size: 0.9rem;
    margin-bottom: 15px;
    font-style: italic;
}

.card-actions {
    display: flex;
    gap: 10px;
}

.detail-btn {
    flex: 1;
    padding: 12px;
    background-color: #8D7B68;
    color: #FFFFFF;
    text-decoration: none;
    text-align: center;
    border-radius: 8px;
    font-weight: 600;
    transition: all 0.3s ease;
    border: none;
    cursor: pointer;
}

.detail-btn:hover {
    background-color: #777777;
    transform: translateY(-1px);
    text-decoration: none;
    color: #FFFFFF;
}

.favorite-btn {
    padding: 12px;
    background-color: #F1DEC9;
    color: #8D7B68;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    min-width: 45px;
}

.favorite-btn:hover {
    background-color: #8D7B68;
    color: #FFFFFF;
}

/* 빈 상태 */
.empty-state {
    text-align: center;
    padding: 60px 20px;
    background: #FFFFFF;
    border-radius: 15px;
    border: 2px dashed #F1DEC9;
    margin: 40px 0;
}

.empty-icon {
    font-size: 4rem;
    color: #A4907C;
    margin-bottom: 20px;
}

.empty-title {
    color: #3C2A21;
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 10px;
}

.empty-message {
    color: #777777;
    font-size: 1rem;
    margin-bottom: 20px;
}

/* 로딩 상태 */
.loading-spinner {
    display: inline-block;
    width: 20px;
    height: 20px;
    border: 3px solid #F1DEC9;
    border-radius: 50%;
    border-top-color: #8D7B68;
    animation: spin 1s ease-in-out infinite;
}

@keyframes spin {
    to { transform: rotate(360deg); }
}

/* 반응형 디자인 */
@media (max-width: 768px) {
    .animal-list-container {
        padding: 20px 15px;
    }

    .page-title {
        font-size: 2rem;
    }

    .filter-row {
        flex-direction: column;
        gap: 15px;
    }

    .filter-group {
        min-width: 100%;
    }

    .animal-grid {
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
    }

    .results-info {
        flex-direction: column;
        gap: 15px;
        text-align: center;
    }
}

@media (max-width: 480px) {
    .animal-grid {
        grid-template-columns: 1fr;
    }

    .card-actions {
        flex-direction: column;
    }
}
</style>

<%-- 전체 동물 목록 페이지 --%>
<div class="animal-list-container">
    <%-- 페이지 헤더 --%>
    <div class="page-header">
        <h1 class="page-title">전체 보호 동물</h1>
        <p class="page-subtitle">사랑이 필요한 동물들을 만나보세요</p>
    </div>

    <%-- 검색 및 필터 영역 --%>
    <div class="search-filter">
        <form id="searchForm" method="GET" action="${pageContext.request.contextPath}/animal/list">
            <div class="filter-row">
                <div class="filter-group">
                    <label class="filter-label">동물 이름</label>
                    <input type="text" name="name" class="search-input" placeholder="동물 이름을 입력하세요" value="${param.name}">
                </div>
                <div class="filter-group">
                    <label class="filter-label">동물 종류</label>
                    <select name="species" class="filter-select">
                        <option value="">전체</option>
                        <option value="dog" ${param.species == 'dog' ? 'selected' : ''}>개</option>
                        <option value="cat" ${param.species == 'cat' ? 'selected' : ''}>고양이</option>
                        <option value="etc" ${param.species == 'etc' ? 'selected' : ''}>기타</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label class="filter-label">입양 상태</label>
                    <select name="status" class="filter-select">
                        <option value="">전체</option>
                        <option value="available" ${param.status == 'available' ? 'selected' : ''}>입양 가능</option>
                        <option value="adopted" ${param.status == 'adopted' ? 'selected' : ''}>입양 완료</option>
                        <option value="reserved" ${param.status == 'reserved' ? 'selected' : ''}>입양 예약</option>
                    </select>
                </div>
            </div>
            <div class="filter-row">
                <div class="filter-group">
                    <label class="filter-label">품종</label>
                    <input type="text" name="breed" class="search-input" placeholder="품종을 입력하세요" value="${param.breed}">
                </div>
                <div class="filter-group">
                    <label class="filter-label">나이</label>
                    <select name="age" class="filter-select">
                        <option value="">전체</option>
                        <option value="young" ${param.age == 'young' ? 'selected' : ''}>어린 동물 (1세 이하)</option>
                        <option value="adult" ${param.age == 'adult' ? 'selected' : ''}>성인 동물 (2-7세)</option>
                        <option value="senior" ${param.age == 'senior' ? 'selected' : ''}>노령 동물 (8세 이상)</option>
                    </select>
                </div>
                <div class="filter-group">
                    <label class="filter-label">보호소</label>
                    <input type="text" name="shelter" class="search-input" placeholder="보호소명을 입력하세요" value="${param.shelter}">
                </div>
            </div>
            <div class="filter-row" style="justify-content: center; margin-bottom: 0;">
                <button type="submit" class="search-btn">
                    <span class="loading-spinner" style="display: none;"></span>
                    검색하기
                </button>
                <button type="button" class="reset-btn" onclick="resetFilters()">초기화</button>
            </div>
        </form>
    </div>

    <%-- 검색 결과 정보 --%>
    <div class="results-info">
        <div class="results-count">
            총 <strong>${totalCount != null ? totalCount : 0}</strong>마리의 동물이 있습니다
        </div>
        <div class="sort-options">
            <span class="sort-label">정렬:</span>
            <select name="sort" class="filter-select" style="width: auto; min-width: 120px;" onchange="changeSort(this.value)">
                <option value="latest" ${param.sort == 'latest' ? 'selected' : ''}>최신순</option>
                <option value="name" ${param.sort == 'name' ? 'selected' : ''}>이름순</option>
                <option value="age" ${param.sort == 'age' ? 'selected' : ''}>나이순</option>
            </select>
        </div>
    </div>

    <%-- 동물 카드 그리드 --%>
    <div class="animal-grid" id="animalGrid">
        <c:choose>
            <c:when test="${empty animals}">
                <div class="empty-state" style="grid-column: 1 / -1;">
                    <div class="empty-icon">🐕🐱</div>
                    <h3 class="empty-title">검색 결과가 없습니다</h3>
                    <p class="empty-message">다른 검색 조건으로 시도해보세요</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach items="${animals}" var="animal">
                    <div class="animal-card" data-id="${animal.id}">
                        <div class="card-image-container">
                            <img src="${animal.profileImage != null ? animal.profileImage : '/assets/images/default-animal.jpg'}"
                                 alt="${animal.name}" class="animal-image">
                            <div class="status-badge status-${animal.adoptionStatus == 'available' ? 'available' : 'adopted'}">
                                ${animal.adoptionStatus == 'available' ? '입양가능' :
                                  animal.adoptionStatus == 'adopted' ? '입양완료' : '입양예약'}
                            </div>
                        </div>
                        <div class="card-content">
                            <h3 class="animal-name">${animal.name}</h3>
                            <div class="animal-info">
                                <div class="info-row">
                                    <span class="info-label">품종:</span>
                                    <span class="info-value">${animal.breed}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">나이:</span>
                                    <span class="info-value">${animal.age}세</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">성별:</span>
                                    <span class="info-value">${animal.gender == 'M' ? '수컷' : '암컷'}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">크기:</span>
                                    <span class="info-value">${animal.size}</span>
                                </div>
                            </div>
                            <c:if test="${not empty animal.shelterName}">
                                <div class="shelter-info">🏠 ${animal.shelterName}</div>
                            </c:if>
                            <div class="card-actions">
                                <a href="${pageContext.request.contextPath}/animal/detail/${animal.id}" class="detail-btn">
                                    자세히 보기
                                </a>
                                <button type="button" class="favorite-btn" onclick="toggleFavorite(${animal.id})"
                                        title="관심동물 등록">
                                    ❤️
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <%-- 페이징 --%>
    <jsp:include page="../common/pagination.jsp" />
</div>

<script>
// 필터 초기화
function resetFilters() {
    document.getElementById('searchForm').reset();
    window.location.href = '${pageContext.request.contextPath}/animal/list';
}

// 정렬 변경
function changeSort(sortValue) {
    const form = document.getElementById('searchForm');
    const sortInput = document.createElement('input');
    sortInput.type = 'hidden';
    sortInput.name = 'sort';
    sortInput.value = sortValue;
    form.appendChild(sortInput);
    form.submit();
}

// 관심동물 토글
function toggleFavorite(animalId) {
    // TODO: 관심동물 등록/해제 AJAX 구현
    console.log('Toggle favorite for animal:', animalId);
}

// 검색 폼 제출 시 로딩 표시
document.getElementById('searchForm').addEventListener('submit', function() {
    const spinner = this.querySelector('.loading-spinner');
    const btn = this.querySelector('.search-btn');
    spinner.style.display = 'inline-block';
    btn.disabled = true;
});

// 카드 호버 효과 개선
document.addEventListener('DOMContentLoaded', function() {
    const cards = document.querySelectorAll('.animal-card');
    cards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-5px)';
        });

        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });
});
</script>