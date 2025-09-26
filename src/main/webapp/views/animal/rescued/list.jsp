<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
    구조 동물 목록 페이지 (공공데이터 API 스펙 기반)

    **JavaScript에서 처리하는 데이터:**
    - rescuedAnimals: Array (구조된 동물 목록)
    - regions: Array (지역 목록)
    - animalTypes: Array (동물 종류 목록)
    - totalCount: Number (총 구조 동물 수)

    **JavaScript에서 사용하는 필터 파라미터:**
    - bgnde: String (구조날짜 시작일, YYYYMMDD)
    - endde: String (구조날짜 종료일, YYYYMMDD)
    - upkind: String (축종코드)
    - kind: String (품종코드)
    - upr_cd: String (시도코드)
    - org_cd: String (시군구코드)
    - care_reg_no: String (보호소번호)
    - state: String (상태 - notice, protect)
    - neuter_yn: String (중성화 여부)
    - sex_cd: String (성별코드)
--%>

<style>
    .rescued-animals-container {
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
    
    .filter-container {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 30px;
    }
    
    .filter-row {
        display: flex;
        gap: 15px;
        align-items: center;
        flex-wrap: wrap;
        margin-bottom: 15px;
    }
    
    .filter-group {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }
    
    .filter-group label {
        color: #3C2A21;
        font-weight: bold;
        font-size: 14px;
    }
    
    .filter-group select {
        padding: 8px 12px;
        border: 1px solid #A4907C;
        border-radius: 4px;
        background-color: #FFF8EA;
        color: #3C2A21;
        min-width: 150px;
    }
    
    .filter-buttons {
        display: flex;
        gap: 10px;
        margin-top: 15px;
    }

    .filter-button {
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

    .filter-group input {
        padding: 8px 12px;
        border: 1px solid #A4907C;
        border-radius: 4px;
        background-color: #FFF8EA;
        color: #3C2A21;
    }
    
    .stats-container {
        display: flex;
        justify-content: center;
        gap: 40px;
        margin-bottom: 40px;
        flex-wrap: wrap;
    }
    
    .stat-item {
        background-color: #FFFFFF;
        border: 2px solid #F1DEC9;
        border-radius: 8px;
        padding: 20px;
        text-align: center;
        min-width: 150px;
    }
    
    .stat-number {
        display: block;
        font-size: 24px;
        font-weight: bold;
        color: #8D7B68;
        margin-bottom: 8px;
    }
    
    .stat-label {
        color: #666666;
        font-size: 14px;
    }
    
    .rescued-animals-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
    }

    .rescued-card {
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 2px 4px rgba(60, 42, 33, 0.1);
        transition: transform 0.3s, box-shadow 0.3s;
        cursor: pointer;
    }

    .rescued-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(141, 123, 104, 0.3);
    }

    .rescued-photo {
        position: relative;
        height: 200px;
    }

    .rescued-photo img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .status-badge {
        position: absolute;
        top: 10px;
        right: 10px;
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: bold;
        color: #FFFFFF;
    }

    .status-badge.notice {
        background-color: #8D7B68;
    }

    .status-badge.protect {
        background-color: #A4907C;
    }

    .rescued-info {
        padding: 20px;
    }

    .rescued-info h3 {
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

    .shelter-info {
        background-color: #FFF8EA;
        padding: 10px;
        border-radius: 6px;
        margin-bottom: 15px;
    }

    .shelter-info p {
        margin: 3px 0;
        font-size: 13px;
        color: #3C2A21;
    }

    .rescued-actions {
        display: flex;
        gap: 10px;
        padding: 0 20px 20px;
    }

    .btn-adopt,
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

    .btn-adopt {
        background-color: #8D7B68;
        color: #FFFFFF;
    }

    .btn-adopt:hover {
        background-color: #A4907C;
    }

    .btn-detail {
        background-color: #FFFFFF;
        color: #8D7B68;
        border: 1px solid #8D7B68;
    }

    .btn-detail:hover {
        background-color: #F1DEC9;
    }
    
    @media (max-width: 768px) {
        .rescued-animals-grid {
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

        .rescued-actions {
            flex-direction: column;
        }

        .stats-container {
            flex-direction: column;
            align-items: center;
        }
    }
</style>

<div class="rescued-animals-container">
    <h2>구조동물 정보</h2>
    <p class="subtitle">보호소에서 보호 중인 구조동물들을 확인하세요</p>

    <%-- 검색 필터 --%>
    <div class="filter-container">
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
                    <label for="startDate">구조일 (시작)</label>
                    <input type="date" id="startDate" name="bgnde">
                </div>

                <div class="filter-group">
                    <label for="endDate">구조일 (종료)</label>
                    <input type="date" id="endDate" name="endde">
                </div>

                <div class="filter-group">
                    <label for="state">상태</label>
                    <select id="state" name="state">
                        <option value="">전체</option>
                        <option value="notice">공고중</option>
                        <option value="protect">보호중</option>
                    </select>
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
                <button type="button" class="filter-button search-button">검색</button>
                <button type="button" class="filter-button reset-button">초기화</button>
            </div>
        </form>
    </div>

    <%-- 통계 정보 --%>
    <div class="stats-container">
        <div class="stat-item">
            <span class="stat-number">0</span>
            <span class="stat-label">공고중</span>
        </div>
        <div class="stat-item">
            <span class="stat-number">0</span>
            <span class="stat-label">보호중</span>
        </div>
        <div class="stat-item">
            <span class="stat-number">0</span>
            <span class="stat-label">총 구조 마리</span>
        </div>
    </div>

    <%-- 구조 동물 목록 --%>
    <div class="rescued-animals-grid">
        <!-- JavaScript로 동적 로드 -->
    </div>
</div>

<!-- JavaScript 파일 포함 -->
<script src="${pageContext.request.contextPath}/assets/js/rescued-animals-data.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/rescued-animals.js"></script>