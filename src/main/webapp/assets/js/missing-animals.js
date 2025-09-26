// 실종 동물 페이지 AJAX 기능

class MissingAnimalsPage {
    constructor() {
        this.currentFilters = {
            upr_cd: '',
            upkind: '',
            bgnde: '',
            ended: '',
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

            // 실종 동물 목록 로드
            await this.loadMissingAnimals();

            this.hideLoading();
        } catch (error) {
            console.error('초기 데이터 로드 실패:', error);
            this.showError('데이터를 불러오는데 실패했습니다.');
        }
    }

    // 필터 옵션들 로드
    async loadFilterOptions() {
        const [regions, animalTypes] = await Promise.all([
            window.missingAnimalsData.getRegions(),
            window.missingAnimalsData.getAnimalTypes()
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

    // 실종 동물 목록 로드
    async loadMissingAnimals(filters = this.currentFilters) {
        try {
            const data = await window.missingAnimalsData.getMissingAnimals(filters);

            this.renderMissingAnimals(data.items);
            this.updateFilterValues(filters);

            this.currentFilters = { ...filters };
        } catch (error) {
            console.error('실종 동물 목록 로드 실패:', error);
            this.showError('실종 동물 목록을 불러오는데 실패했습니다.');
        }
    }

    // 분실동물 목록 렌더링
    renderMissingAnimals(animals) {
        const container = document.querySelector('.missing-animals-grid');

        if (!animals || animals.length === 0) {
            container.innerHTML = '<div class="no-results">검색 결과가 없습니다.</div>';
            return;
        }

        container.innerHTML = animals.map(animal => `
            <div class="missing-card" onclick="missingAnimalsPage.viewDetail('${animal.animal_seq}')">
                <div class="missing-photo">
                    <img src="${animal.thumbnail}" alt="분실 동물"
                         onerror="this.onerror=null; this.src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAwIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDMwMCAyMDAiIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxyZWN0IHdpZHRoPSIzMDAiIGhlaWdodD0iMjAwIiBmaWxsPSIjRjVGNUY1Ii8+CjxwYXRoIGQ9Ik0xMjAgMTAwQzEyMCA4Ni43NDUgMTMwLjc0NSA3NiAxNDQgNzZIMTU2QzE2OS4yNTUgNzYgMTgwIDg2Ljc0NSAxODAgMTAwVjEyNEMxODAgMTM3LjI1NSAxNjkuMjU1IDE0OCAxNTYgMTQ4SDE0NEMxMzAuNzQ1IDE0OCAxMjAgMTM3LjI1NSAxMjAgMTI0VjEwMFoiIGZpbGw9IiNEOUQ5RDkiLz4KPGNpcmNsZSBjeD0iMTQwIiBjeT0iOTUiIHI9IjQiIGZpbGw9IiM5RTlFOUUiLz4KPGNpcmNsZSBjeD0iMTYwIiBjeT0iOTUiIHI9IjQiIGZpbGw9IiM5RTlFOUUiLz4KPHBhdGggZD0iTTEzNSAxMTBDMTM1IDExMCAxNDUgMTE1IDE1MCAxMTVDMTU1IDExNSAxNjUgMTEwIDE2NSAxMTAiIHN0cm9rZT0iIzlFOUU5RSIgc3Ryb2tlLXdpZHRoPSIyIiBzdHJva2UtbGluZWNhcD0icm91bmQiLz4KPHRleHQgeD0iMTUwIiB5PSIxNzAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIxNCIgZmlsbD0iIzk5OTk5OSIgdGV4dC1hbmNob3I9Im1pZGRsZSI+67aE7Iuk64+Z66y8PC90ZXh0Pgo8L3N2Zz4K'">
                    <div class="missing-badge">${window.missingAnimalsData.getTmpProtectStatus(animal.tmpr_protect_yn)}</div>
                </div>
                <div class="missing-info">
                    <h3>동물번호: ${animal.animal_seq}</h3>
                    <div class="info-grid">
                        <div class="info-item">
                            <span class="label">종류:</span>
                            <span class="value">${animal.species_nm}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">품종:</span>
                            <span class="value">${animal.breeds_nm}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">성별:</span>
                            <span class="value">${animal.sex_nm}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">나이:</span>
                            <span class="value">${animal.age_info}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">체중:</span>
                            <span class="value">${animal.bdwgh_info}</span>
                        </div>
                        <div class="info-item">
                            <span class="label">분실일:</span>
                            <span class="value">${window.missingAnimalsData.formatDate(animal.lost_ymd)}</span>
                        </div>
                        <div class="info-item full-width">
                            <span class="label">분실장소:</span>
                            <span class="value">${animal.lost_place}</span>
                        </div>
                        <div class="info-item full-width">
                            <span class="label">색상:</span>
                            <span class="value">${animal.main_color} / ${animal.spot_color}</span>
                        </div>
                        <div class="info-item full-width">
                            <span class="label">특징:</span>
                            <span class="value">${animal.etc_info}</span>
                        </div>
                    </div>
                    <div class="contact-info">
                        <p><strong>소유자:</strong> ${animal.owner_nm}</p>
                        <p><strong>연락처:</strong> ${animal.owner_tel}</p>
                        ${animal.tmpr_protect_yn === 'Y' ? `
                            <p><strong>임시보호소:</strong> ${animal.tmpr_protect_place}</p>
                            <p><strong>담당자:</strong> ${animal.tmpr_protect_charge_nm} (${animal.tmpr_protect_charge_tel})</p>
                        ` : ''}
                    </div>
                </div>
            </div>
        `).join('');
    }


    // 필터 값 업데이트
    updateFilterValues(filters) {
        const regionSelect = document.getElementById('region');
        const animalTypeSelect = document.getElementById('animalType');
        const startDateInput = document.getElementById('startDate');
        const endDateInput = document.getElementById('endDate');
        const genderSelect = document.getElementById('gender');

        if (regionSelect) regionSelect.value = filters.upr_cd || '';
        if (animalTypeSelect) animalTypeSelect.value = filters.upkind || '';
        if (startDateInput) startDateInput.value = filters.bgnde ? this.convertDateFormat(filters.bgnde) : '';
        if (endDateInput) endDateInput.value = filters.ended ? this.convertDateFormat(filters.ended) : '';
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
        const searchForm = document.querySelector('.search-filter form');
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
            ended: document.getElementById('endDate')?.value.replace(/-/g, '') || '',
            sex_cd: document.getElementById('gender')?.value || ''
        };

        this.showLoading();
        await this.loadMissingAnimals(filters);
        this.hideLoading();
    }

    // 필터 초기화
    async resetFilters() {
        document.getElementById('region').value = '';
        document.getElementById('animalType').value = '';
        document.getElementById('startDate').value = '';
        document.getElementById('endDate').value = '';
        document.getElementById('gender').value = '';

        this.showLoading();
        await this.loadMissingAnimals({});
        this.hideLoading();
    }

    // 목격 제보
    reportSighting(animal_seq) {
        alert(`목격 제보 기능입니다. 동물번호: ${animal_seq}\n실제 구현에서는 제보 폼으로 이동합니다.`);
    }

    // 상세보기
    viewDetail(animal_seq) {
        // 컨텍스트 패스를 포함한 올바른 URL로 이동
        const contextPath = document.querySelector('script[src*="missing-animals.js"]')
            ?.src.split('/assets')[0] || '';
        window.location.href = `${contextPath}/animal/missing-detail/${animal_seq}`;
    }

    // 로딩 표시
    showLoading() {
        const container = document.querySelector('.missing-animals-grid');
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
        const container = document.querySelector('.missing-animals-grid');
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
    window.missingAnimalsPage = new MissingAnimalsPage();
});