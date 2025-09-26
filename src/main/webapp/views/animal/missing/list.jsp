<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
    실종 동물 목록 페이지 (공공데이터 API 스펙 기반)

    **JavaScript에서 처리하는 데이터:**
    - missingAnimals: Array (실종 동물 목록)
    - regions: Array (지역 목록)
    - animalTypes: Array (동물 종류 목록)
    - totalCount: Number (총 실종 동물 수)

    **JavaScript에서 사용하는 필터 파라미터:**
    - upr_cd: String (시도코드)
    - upkind: String (축종코드)
    - bgnde: String (분실일 시작일)
    - ended: String (분실일 종료일)
    - sex_cd: String (성별코드)
--%>

<style>
    .missing-animals-container {
        background-color: #F9F9F9;
        color: #000000;
        padding: 20px;
        max-width: 1200px;
        margin: 0 auto;
    }

    h2 {
        color: #3C2A21;
        font-size: 28px;
        margin-bottom: 10px;
        text-align: center;
    }

    .subtitle {
        color: #777777;
        text-align: center;
        margin-bottom: 30px;
        font-size: 16px;
    }

    .search-filter {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 30px;
    }

    .filter-row {
        display: flex;
        gap: 15px;
        align-items: end;
        flex-wrap: wrap;
        margin-bottom: 15px;
    }

    .filter-group {
        display: flex;
        flex-direction: column;
        gap: 5px;
        min-width: 150px;
    }

    .filter-group label {
        color: #3C2A21;
        font-weight: bold;
        font-size: 14px;
    }

    .filter-group select,
    .filter-group input {
        padding: 8px 12px;
        border: 1px solid #A4907C;
        border-radius: 4px;
        background-color: #FFF8EA;
        color: #3C2A21;
    }

    .filter-buttons {
        display: flex;
        gap: 10px;
        margin-top: 15px;
    }

    .search-button,
    .reset-button {
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
    }

    .search-button {
        background-color: #8D7B68;
        color: #FFFFFF;
    }

    .search-button:hover {
        background-color: #A4907C;
    }

    .reset-button {
        background-color: #FFFFFF;
        color: #8D7B68;
        border: 1px solid #8D7B68;
    }

    .reset-button:hover {
        background-color: #F1DEC9;
    }

    .missing-animals-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(400px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
    }

    .missing-card {
        background-color: #FFFFFF;
        border: 2px solid #FFB6C1;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(255, 182, 193, 0.3);
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .missing-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(255, 182, 193, 0.4);
    }

    .missing-photo {
        position: relative;
        height: 200px;
    }

    .missing-photo img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .missing-badge {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: #FF6B6B;
        color: #FFFFFF;
        padding: 6px 12px;
        border-radius: 20px;
        font-weight: bold;
        font-size: 12px;
        animation: pulse 2s infinite;
    }

    @keyframes pulse {
        0% { opacity: 1; }
        50% { opacity: 0.7; }
        100% { opacity: 1; }
    }

    .missing-info {
        padding: 20px;
    }

    .missing-info h3 {
        color: #3C2A21;
        margin: 0 0 15px 0;
        font-size: 16px;
        font-weight: bold;
    }

    .info-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 8px;
        margin-bottom: 15px;
    }

    .info-item {
        display: flex;
        align-items: center;
        font-size: 14px;
    }

    .info-item.full-width {
        grid-column: 1 / -1;
        flex-direction: column;
        align-items: flex-start;
        gap: 5px;
    }

    .info-item .label {
        font-weight: bold;
        color: #3C2A21;
        min-width: 50px;
        margin-right: 8px;
    }

    .info-item .value {
        color: #666666;
        flex: 1;
    }

    .contact-info {
        background-color: #FFF8EA;
        padding: 10px;
        border-radius: 6px;
        margin-bottom: 15px;
    }

    .contact-info p {
        margin: 3px 0;
        font-size: 13px;
        color: #3C2A21;
    }

    .missing-actions {
        display: flex;
        gap: 10px;
        padding: 0 20px 20px;
    }

    .btn-report,
    .btn-detail {
        flex: 1;
        padding: 10px;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s;
    }

    .btn-report {
        background-color: #FF6B6B;
        color: #FFFFFF;
    }

    .btn-report:hover {
        background-color: #FF5252;
    }

    .btn-detail {
        background-color: #8D7B68;
        color: #FFFFFF;
    }

    .btn-detail:hover {
        background-color: #A4907C;
    }

    .missing-register {
        background-color: #FFFFFF;
        border: 2px solid #FF6B6B;
        border-radius: 12px;
        padding: 30px;
        text-align: center;
        margin-bottom: 30px;
    }

    .missing-register h3 {
        color: #3C2A21;
        margin-bottom: 10px;
    }

    .missing-register p {
        color: #666666;
        margin-bottom: 20px;
    }

    .btn-primary {
        background-color: #FF6B6B;
        color: #FFFFFF;
        padding: 12px 24px;
        border: none;
        border-radius: 6px;
        font-weight: bold;
        text-decoration: none;
        display: inline-block;
        cursor: pointer;
    }

    .btn-primary:hover {
        background-color: #FF5252;
    }

    @media (max-width: 768px) {
        .missing-animals-grid {
            grid-template-columns: 1fr;
        }

        .filter-row {
            flex-direction: column;
            align-items: stretch;
        }

        .filter-group {
            min-width: auto;
        }

        .info-grid {
            grid-template-columns: 1fr;
        }

        .missing-actions {
            flex-direction: column;
        }
    }
</style>

<div class="missing-animals-container">
    <h2>분실동물 정보</h2>
    <p class="subtitle">분실된 반려동물을 찾아주세요</p>

    <%-- 검색 필터 --%>
    <div class="search-filter">
        <form>
            <div class="filter-row">
                <div class="filter-group">
                    <label for="region">지역</label>
                    <select id="region" name="upr_cd">
                        <option value="">전체 지역</option>
                        <!-- JavaScript로 동적 로드 -->
                    </select>
                </div>

                <div class="filter-group">
                    <label for="animalType">동물 종류</label>
                    <select id="animalType" name="upkind">
                        <option value="">전체 동물</option>
                        <!-- JavaScript로 동적 로드 -->
                    </select>
                </div>

                <div class="filter-group">
                    <label for="startDate">분실일 (시작)</label>
                    <input type="date" id="startDate" name="bgnde">
                </div>

                <div class="filter-group">
                    <label for="endDate">분실일 (종료)</label>
                    <input type="date" id="endDate" name="ended">
                </div>

                <div class="filter-group">
                    <label for="gender">성별</label>
                    <select id="gender" name="sex_cd">
                        <option value="">전체</option>
                        <option value="M">수컷</option>
                        <option value="F">암컷</option>
                        <option value="Q">미상</option>
                    </select>
                </div>
            </div>

            <div class="filter-buttons">
                <button type="button" class="search-button">검색</button>
                <button type="button" class="reset-button">초기화</button>
            </div>
        </form>
    </div>

    <%-- 실종 동물 목록 --%>
    <div class="missing-animals-grid">
        <!-- JavaScript로 동적 로드 -->
    </div>

    <%-- 분실 신고 등록 --%>
    <div class="missing-register">
        <h3>분실 신고 등록</h3>
        <p>반려동물이 분실되셨나요? 신고를 등록해주세요.</p>
        <a href="${pageContext.request.contextPath}/animal/missing/register" class="btn-primary">분실 신고 등록</a>
    </div>
</div>

<!-- JavaScript 파일 포함 -->
<script src="${pageContext.request.contextPath}/assets/js/missing-animals-data.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/missing-animals.js"></script>