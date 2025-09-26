// 구조 동물 페이지 AJAX 기능 (공공데이터 API 스펙 기반)

class RescuedAnimalsPage {
    constructor() {
        this.currentFilters = {
            upr_cd: '',
            upkind: '',
            bgnde: '',
            endde: '',
            state: '',
            sex_cd: ''
        };
        this.init();
    }

    init() {
        this.loadInitialData();
        this.setupEventListeners();
    }

    // 초기 데이터 로드
    async loadInitialData() {
        try {
            this.showLoading();

            // 필터 옵션들 로드
            await this.loadFilterOptions();

            // 구조된 동물 목록 로드
            await this.loadRescuedAnimals();

            this.hideLoading();
        } catch (error) {
            console.error('초기 데이터 로드 실패:', error);
            this.showError('데이터를 불러오는데 실패했습니다.');
        }
    }

    // 필터 옵션들 로드
    async loadFilterOptions() {
        const [regions, animalTypes] = await Promise.all([
            window.rescuedAnimalsData.getRegions(),
            window.rescuedAnimalsData.getAnimalTypes()
        ]);

        this.populateRegionOptions(regions);
        this.populateAnimalTypeOptions(animalTypes);
    }

    // 지역 옵션 생성
    populateRegionOptions(regions) {
        const regionSelect = document.getElementById('region');
        regionSelect.innerHTML = '<option value="">전체 지역</option>';

        regions.forEach(region => {
            const option = document.createElement('option');
            option.value = region.code;
            option.textContent = region.name;
            regionSelect.appendChild(option);
        });
    }

    // 동물 종류 옵션 생성
    populateAnimalTypeOptions(animalTypes) {
        const animalTypeSelect = document.getElementById('animalType');
        animalTypeSelect.innerHTML = '<option value="">전체 동물</option>';

        animalTypes.forEach(type => {
            const option = document.createElement('option');
            option.value = type.code;
            option.textContent = type.name;
            animalTypeSelect.appendChild(option);
        });
    }

    // 구조 동물 목록 로드
    async loadRescuedAnimals(filters = this.currentFilters) {
        try {
            const data = await window.rescuedAnimalsData.getRescuedAnimals(filters);

            this.renderStats(data.noticeCount, data.protectCount, data.totalCount);
            this.renderRescuedAnimals(data.items);
            this.updateFilterValues(filters);

            this.currentFilters = { ...filters };
        } catch (error) {
            console.error('구조 동물 목록 로드 실패:', error);
            this.showError('동물 목록을 불러오는데 실패했습니다.');
        }
    }

    // 통계 정보 렌더링
    renderStats(noticeCount, protectCount, totalCount) {
        const statNumbers = document.querySelectorAll('.stat-number');

        if (statNumbers[0]) statNumbers[0].textContent = noticeCount;
        if (statNumbers[1]) statNumbers[1].textContent = protectCount;
        if (statNumbers[2]) statNumbers[2].textContent = totalCount;
    }

    // 구조 동물 목록 렌더링
    renderRescuedAnimals(animals) {
        const container = document.querySelector('.rescued-animals-grid');

        if (!animals || animals.length === 0) {
            container.innerHTML = '<div class="no-results">검색 결과가 없습니다.</div>';
            return;
        }

        container.innerHTML = animals.map(animal => `
            <div class="rescued-card" onclick="rescuedAnimalsPage.viewAnimalDetail('${animal.desertionNo}')">
                <div class="rescued-photo">
                    <img src="${animal.popfile1}" alt="구조동물"
                         onerror="this.onerror=null; this.src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDMwMCAyMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxyZWN0IHdpZHRoPSIzMDAiIGhlaWdodD0iMjAwIiBmaWxsPSIjRjVGNUY1Ii8+CjxwYXRoIGQ9Ik0xMjAgMTAwQzEyMCA4Ni43NDUgMTMwLjc0NSA3NiAxNDQgNzZIMTU2QzE2OS4yNTUgNzYgMTgwIDg2Ljc0NSAxODAgMTAwVjEyNEMxODAgMTM3LjI1NSAxNjkuMjU1IDE0OCAxNTYgMTQ4SDE0NEMxMzAuNzQ1IDE0OCAxMjAgMTM3LjI1NSAxMjAgMTI0VjEwMFoiIGZpbGw9IiNEOUQ5RDkiLz4KPGNpcmNsZSBjeD0iMTQwIiBjeT0iOTUiIHI9IjQiIGZpbGw9IiM5RTlFOUUiLz4KPGNpcmNsZSBjeD0iMTYwIiBjeT0iOTUiIHI9IjQiIGZpbGw9IiM5RTlFOUUiLz4KPHBhdGggZD0iTTEzNSAxMTBDMTM1IDExMCAxNDUgMTE1IDE1MCAxMTVDMTU1IDExNSAxNjUgMTEwIDE2NSAxMTAiIHN0cm9rZT0iIzlFOUU5RSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiLz4KPHRleHQgeD0iMTUwIiB5PSIxNzAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0iIzk5OTk5OSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+6rWs7KGw64+Z66y8PC90ZXh0Pgo8L3N2Zz4K'">
                    <div class="status-badge ${this.getProcessStateClass(animal.processState)}">
                        ${this.getProcessStateName(animal.processState)}
                    </div>
                </div>
                <div class="rescued-info">
                    <h3>유기번호: ${animal.desertionNo}</h3>
                    <div class="info-grid">
                        <div class="info-item">
                            <span class="label">품종:</span>
                            <span class="value">${animal.kindNm}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">성별:</span>
                            <span class="value">${this.getGenderName(animal.sexCd)}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">나이:</span>
                            <span class="value">${animal.age}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">체중:</span>
                            <span class="value">${animal.weight}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">색상:</span>
                            <span class="value">${animal.colorCd}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">발견일:</span>
                            <span class="value">${this.formatDate(animal.happenDt)}</span>
                        </div>
                        <div class="info-item full-width">
                            <span class="label">발견장소:</span>
                            <span class="value">${animal.happenPlace}</span>
                        </div>
                    </div>
                    <div class="shelter-info">
                        <p><strong>보호소:</strong> ${animal.careNm}</p>
                        <p><strong>연락처:</strong> ${animal.careTel}</p>
                    </div>
                </div>
            </div>
        `).join('');
    }

    // 날짜 포맷팅 (YYYYMMDD -> YYYY.MM.DD)
    formatDate(dateString) {
        if (!dateString || dateString.length !== 8) return dateString;
        return `${dateString.substring(0, 4)}.${dateString.substring(4, 6)}.${dateString.substring(6, 8)}`;
    }

    // 성별 코드를 이름으로 변환
    getGenderName(sexCd) {
        switch (sexCd) {
            case 'M': return '수컷';
            case 'F': return '암컷';
            case 'Q': return '미상';
            default: return '미상';
        }
    }

    // 상태 코드를 이름으로 변환
    getProcessStateName(processState) {
        switch (processState) {
            case 'notice': return '공고중';
            case 'protect': return '보호중';
            default: return processState;
        }
    }

    // 상태별 CSS 클래스
    getProcessStateClass(processState) {
        switch (processState) {
            case 'notice': return 'notice';
            case 'protect': return 'protect';
            default: return 'notice';
        }
    }

    // 필터 값 업데이트
    updateFilterValues(filters) {
        const regionSelect = document.getElementById('region');
        const animalTypeSelect = document.getElementById('animalType');
        const startDateInput = document.getElementById('startDate');
        const endDateInput = document.getElementById('endDate');
        const stateSelect = document.getElementById('state');
        const genderSelect = document.getElementById('gender');

        if (regionSelect) regionSelect.value = filters.upr_cd || '';
        if (animalTypeSelect) animalTypeSelect.value = filters.upkind || '';
        if (startDateInput) startDateInput.value = filters.bgnde ? this.convertDateFormat(filters.bgnde) : '';
        if (endDateInput) endDateInput.value = filters.endde ? this.convertDateFormat(filters.endde) : '';
        if (stateSelect) stateSelect.value = filters.state || '';
        if (genderSelect) genderSelect.value = filters.sex_cd || '';
    }

    // 날짜 포맷 변환 (YYYYMMDD -> YYYY-MM-DD)
    convertDateFormat(dateString) {
        if (!dateString || dateString.length !== 8) return '';
        return `${dateString.substring(0, 4)}-${dateString.substring(4, 6)}-${dateString.substring(6, 8)}`;
    }

    // 이벤트 리스너 설정
    setupEventListeners() {
        // 검색 버튼 클릭
        const searchButton = document.querySelector('.search-button');
        if (searchButton) {
            searchButton.addEventListener('click', () => {
                this.handleSearch();
            });
        }

        // 검색 폼 제출
        const searchForm = document.querySelector('.filter-container form');
        if (searchForm) {
            searchForm.addEventListener('submit', (e) => {
                e.preventDefault();
                this.handleSearch();
            });
        }

        // 초기화 버튼
        const resetButton = document.querySelector('.reset-button');
        if (resetButton) {
            resetButton.addEventListener('click', () => {
                this.resetFilters();
            });
        }
    }

    // 검색 처리
    async handleSearch() {
        const filters = {
            upr_cd: document.getElementById('region')?.value || '',
            upkind: document.getElementById('animalType')?.value || '',
            bgnde: document.getElementById('startDate')?.value.replace(/-/g, '') || '',
            endde: document.getElementById('endDate')?.value.replace(/-/g, '') || '',
            state: document.getElementById('state')?.value || '',
            sex_cd: document.getElementById('gender')?.value || ''
        };

        this.showLoading();
        await this.loadRescuedAnimals(filters);
        this.hideLoading();
    }

    // 필터 초기화
    async resetFilters() {
        document.getElementById('region').value = '';
        document.getElementById('animalType').value = '';
        document.getElementById('startDate').value = '';
        document.getElementById('endDate').value = '';
        document.getElementById('state').value = '';
        document.getElementById('gender').value = '';

        this.showLoading();
        await this.loadRescuedAnimals({});
        this.hideLoading();
    }

    // 보호소 연락하기
    contactShelter(phoneNumber) {
        if (phoneNumber) {
            window.location.href = `tel:${phoneNumber}`;
        } else {
            alert('연락처 정보가 없습니다.');
        }
    }

    // 동물 상세 페이지로 이동
    viewAnimalDetail(desertionNo) {
        // 컨텍스트 패스를 포함한 올바른 URL로 이동
        const contextPath = document.querySelector('script[src*="rescued-animals.js"]')
            ?.src.split('/assets')[0] || '';
        window.location.href = `${contextPath}/animal/rescued-detail/${desertionNo}`;
    }

    // 로딩 표시
    showLoading() {
        const container = document.querySelector('.rescued-animals-grid');
        if (container) {
            container.innerHTML = '<div class="loading">데이터를 불러오는 중...</div>';
        }
    }

    // 로딩 숨김
    hideLoading() {
        // 로딩 상태는 데이터 렌더링으로 자동으로 해제됨
    }

    // 에러 표시
    showError(message) {
        const container = document.querySelector('.rescued-animals-grid');
        if (container) {
            container.innerHTML = `<div class="error">오류: ${message}</div>`;
        }
    }
}

// CSS 스타일 추가
const additionalStyles = `
    .loading, .error, .no-results {
        text-align: center;
        padding: 40px;
        font-size: 16px;
        color: #666666;
        background-color: #FFFFFF;
        border: 1px solid #F1DEC9;
        border-radius: 12px;
        grid-column: 1 / -1;
    }

    .error {
        color: #d32f2f;
        background-color: #fef5f5;
        border-color: #ffcdd2;
    }

    .loading {
        color: #8D7B68;
    }
`;

// 스타일 추가
const styleElement = document.createElement('style');
styleElement.textContent = additionalStyles;
document.head.appendChild(styleElement);

// 페이지 로드 완료 후 초기화
document.addEventListener('DOMContentLoaded', () => {
    window.rescuedAnimalsPage = new RescuedAnimalsPage();
});