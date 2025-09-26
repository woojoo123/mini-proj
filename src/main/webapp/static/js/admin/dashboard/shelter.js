// JavaScript (동작)
document.addEventListener('DOMContentLoaded', function() {
    const shelterData = [
        { 
            name: '해피독 보호소', 
            type: '대형견 전문 보호소', 
            location: '서울 강남구 대치동', 
            contact: '02-1234-5678', 
            email: 'info@happydog.com', 
            animals: 32, 
            registerDate: '2024.01.15', 
            status: '승인 완료',
            owner: '김보호',
            ownerContact: '010-1234-5678',
            capacity: 50,
            facilities: ['운동장', '의료실', '목욕실'],
            description: '대형견 전문 보호소로 안전하고 쾌적한 환경을 제공합니다.',
            operatingHours: '09:00 - 18:00',
            licenseNumber: 'SEOUL-2024-001'
        },
        { 
            name: '사랑의집 보호소', 
            type: '다견종 종합 보호소', 
            location: '경기 성남시 분당구', 
            contact: '031-2345-6789', 
            email: 'care@lovelyhouse.org', 
            animals: 28, 
            registerDate: '2024.02.28', 
            status: '승인 대기',
            owner: '박사랑',
            ownerContact: '010-2345-6789',
            capacity: 40,
            facilities: ['놀이터', '훈련실', '카페'],
            description: '모든 견종을 환영하는 종합 보호소입니다.',
            operatingHours: '08:00 - 19:00',
            licenseNumber: 'GYEONGGI-2024-002'
        },
        { 
            name: '골든프렌즈 센터', 
            type: '골든리트리버 전문', 
            location: '인천 남동구 구월동', 
            contact: '032-3456-7890', 
            email: 'golden@friends.co.kr', 
            animals: 15, 
            registerDate: '2024.03.10', 
            status: '승인 완료',
            owner: '이골든',
            ownerContact: '010-3456-7890',
            capacity: 30,
            facilities: ['수영장', '그루밍실', '놀이터'],
            description: '골든리트리버 전문 보호소로 특화된 케어를 제공합니다.',
            operatingHours: '10:00 - 17:00',
            licenseNumber: 'INCHEON-2024-003'
        },
        { 
            name: '퍼피파라다이스', 
            type: '소형견 전문', 
            location: '부산 해운대구', 
            contact: '051-4567-8901', 
            email: 'puppy@paradise.com', 
            animals: 22, 
            registerDate: '2024.03.15', 
            status: '승인 거부',
            owner: '최퍼피',
            ownerContact: '010-4567-8901',
            capacity: 35,
            facilities: ['실내놀이터', '의료실', '목욕실'],
            description: '소형견들을 위한 특별한 공간을 제공합니다.',
            operatingHours: '09:30 - 18:30',
            licenseNumber: 'BUSAN-2024-004'
        }
    ];

    const tableBody = document.querySelector('.shelter-table tbody');

    // 유틸리티 함수들 정의
    const getBadgeClass = (status) => {
        if (status === '승인 완료') return 'badge-approve';
        if (status === '승인 대기') return 'badge-pending';
        if (status === '승인 거부') return 'badge-reject';
        return 'badge-default';
    };

    // 보호소 데이터로 테이블 행 생성
    shelterData.forEach((shelter, index) => {
        const row = document.createElement('tr');
        row.dataset.shelterIndex = index;
        
        row.innerHTML = `
            <td>
                <div class="shelter-info">
                    <div class="avatar">🏠</div>
                    <div>
                        <div class="name">${shelter.name}</div>
                        <div class="desc">${shelter.type}</div>
                    </div>
                </div>
            </td>
            <td>${shelter.location}</td>
            <td>${shelter.contact}<br>${shelter.email}</td>
            <td>${shelter.animals}마리</td>
            <td>${shelter.registerDate}</td>
            <td><span class="badge ${getBadgeClass(shelter.status)}">${shelter.status}</span></td>
            <td>
                <button class="btn btn-secondary btn-small detail-btn" data-shelter-index="${index}">상세</button>
                <button class="btn btn-secondary btn-small">편집</button>
            </td>
        `;
        tableBody.appendChild(row);
    });

    // 상세 정보 표시/숨기기 기능
    function toggleShelterDetail(shelterIndex) {
        const shelter = shelterData[shelterIndex];
        const currentRow = document.querySelector(`tr[data-shelter-index="${shelterIndex}"]`);
        const detailRow = document.querySelector(`tr.shelter-detail[data-shelter-index="${shelterIndex}"]`);
        
        // 이미 상세 정보가 표시되어 있다면 제거
        if (detailRow) {
            detailRow.remove();
            return;
        }
        
        // 상세 정보 행 생성
        const detailRowElement = document.createElement('tr');
        detailRowElement.className = 'shelter-detail';
        detailRowElement.dataset.shelterIndex = shelterIndex;
        
        detailRowElement.innerHTML = `
            <td colspan="7">
                <div class="shelter-detail-content">
                    <div class="detail-header">
                        <h4>${shelter.name} 보호소 상세 정보</h4>
                        <button class="btn btn-sm btn-close" onclick="closeDetail(${shelterIndex})">&times;</button>
                    </div>
                    <div class="detail-body">
                        <div class="detail-grid">
                            <div class="detail-section">
                                <h5>기본 정보</h5>
                                <div class="detail-item">
                                    <span class="label">보호소명:</span>
                                    <span class="value">${shelter.name}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">보호소 유형:</span>
                                    <span class="value">${shelter.type}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">위치:</span>
                                    <span class="value">${shelter.location}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">연락처:</span>
                                    <span class="value">${shelter.contact}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">이메일:</span>
                                    <span class="value">${shelter.email}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>운영 정보</h5>
                                <div class="detail-item">
                                    <span class="label">보호 동물 수:</span>
                                    <span class="value">${shelter.animals}마리</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">수용 가능 수:</span>
                                    <span class="value">${shelter.capacity}마리</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">운영 시간:</span>
                                    <span class="value">${shelter.operatingHours}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">등록일:</span>
                                    <span class="value">${shelter.registerDate}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">승인 상태:</span>
                                    <span class="value badge ${getBadgeClass(shelter.status)}">${shelter.status}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>대표자 정보</h5>
                                <div class="detail-item">
                                    <span class="label">대표자명:</span>
                                    <span class="value">${shelter.owner}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">대표자 연락처:</span>
                                    <span class="value">${shelter.ownerContact}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">사업자 등록번호:</span>
                                    <span class="value">${shelter.licenseNumber}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>시설 정보</h5>
                                <div class="detail-item">
                                    <span class="label">주요 시설:</span>
                                    <span class="value">${shelter.facilities.join(', ')}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">보호소 소개:</span>
                                    <span class="value">${shelter.description}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>관리 작업</h5>
                                <div class="detail-actions">
                                    <button class="btn btn-primary btn-sm">승인 상태 변경</button>
                                    <button class="btn btn-warning btn-sm">정보 수정</button>
                                    <button class="btn btn-danger btn-sm">보호소 삭제</button>
                                    <button class="btn btn-secondary btn-sm">문서 다운로드</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </td>
        `;
        
        // 현재 행 다음에 상세 정보 행 삽입
        currentRow.insertAdjacentElement('afterend', detailRowElement);
        
        // 애니메이션 효과를 위한 클래스 추가
        setTimeout(() => {
            detailRowElement.classList.add('show');
        }, 10);
    }

    // 상세 정보 닫기 함수 (전역 함수로 등록)
    window.closeDetail = function(shelterIndex) {
        const detailRow = document.querySelector(`tr.shelter-detail[data-shelter-index="${shelterIndex}"]`);
        if (detailRow) {
            detailRow.classList.remove('show');
            setTimeout(() => {
                detailRow.remove();
            }, 300);
        }
    };

    // 상세 버튼 클릭 이벤트 리스너
    document.addEventListener('click', (e) => {
        if (e.target.classList.contains('detail-btn')) {
            const shelterIndex = parseInt(e.target.dataset.shelterIndex);
            toggleShelterDetail(shelterIndex);
        }
    });
});
