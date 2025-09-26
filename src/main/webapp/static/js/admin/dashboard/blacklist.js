// JavaScript (동작)
document.addEventListener('DOMContentLoaded', function () {
    const blacklistData = [
        { id: 1, name: '김철수', username: 'iron_dog', avatar: '김', banType: '영구 차단', reason: '스팸', detailReason: '반복적인 광고 게시', banDate: '2024.03.15', expireDate: '영구', status: '활성', registrant: '관리자' },
        { id: 2, name: '박영희', username: 'love_park', avatar: '박', banType: '임시 차단', reason: '욕설/비방', detailReason: '다른 회원에 대한 지속적인 비방', banDate: '2024.03.18', expireDate: '2024.04.18', status: '활성', registrant: '관리자' },
        { id: 3, name: '이민준', username: 'minjoon_lee', avatar: '이', banType: 'IP 차단', reason: '사기', detailReason: '가짜 분양 정보 게시', banDate: '2024.03.10', expireDate: '2024.06.10', status: '활성', registrant: '관리자' },
        { id: 4, name: '최미소', username: 'smile_choi', avatar: '최', banType: '기기 차단', reason: '부적절한 내용', detailReason: '음란물 게시', banDate: '2024.02.28', expireDate: '2024.05.28', status: '활성', registrant: '관리자' },
        { id: 5, name: '정현우', username: 'hyun_woo', avatar: '정', banType: '임시 차단', reason: '스팸', detailReason: '대량의 광고 메시지 발송', banDate: '2024.02.15', expireDate: '2024.03.15', status: '만료', registrant: '관리자' },
    ];

    const tableBody = document.querySelector('.blacklist-table tbody');

    // 블랙리스트 데이터로 테이블 행 생성
    blacklistData.forEach(blacklist => {
        const row = document.createElement('tr');

        const getBadgeClass = (type) => {
            if (type === '영구 차단') return 'badge-permanent';
            if (type === '임시 차단') return 'badge-temporary';
            if (type === 'IP 차단') return 'badge-ip-ban';
            if (type === '기기 차단') return 'badge-device-ban';
            return '';
        };

        const getStatusBadgeClass = (status) => {
            if (status === '활성') return 'badge-active';
            if (status === '만료') return 'badge-expired';
            return '';
        };

        row.innerHTML = `
                    <td><input type="checkbox" class="row-check" data-id="${blacklist.id}"></td>
                    <td>
                        <div class="member-info">
                            <div class="avatar">${blacklist.avatar}</div>
                            <div>
                                <div class="name">${blacklist.name}</div>
                                <div class="username">@${blacklist.username}</div>
                            </div>
                        </div>
                    </td>
                    <td><span class="badge ${getBadgeClass(blacklist.banType)}">${blacklist.banType}</span></td>
                    <td>
                        <div>${blacklist.reason}</div>
                        <div style="font-size: 12px; color: var(--text-light-color);">${blacklist.detailReason}</div>
                    </td>
                    <td>${blacklist.banDate}</td>
                    <td>${blacklist.expireDate}</td>
                    <td><span class="badge ${getStatusBadgeClass(blacklist.status)}">${blacklist.status}</span></td>
                    <td>${blacklist.registrant}</td>
                    <td>
                        <button class="btn btn-secondary btn-small">상세</button>
                        ${blacklist.status === '활성' ?
                `<button class="btn btn-secondary btn-small">해제</button>
                            <button class="btn btn-secondary btn-small">연장</button>` :
                ''
            }
                    </td>
                `;
        tableBody.appendChild(row);
    });

    // 전체 선택/해제 체크박스 기능
    const checkAll = document.getElementById('check-all');
    const rowChecks = document.querySelectorAll('.row-check');

    checkAll.addEventListener('change', (e) => {
        rowChecks.forEach(checkbox => {
            checkbox.checked = e.target.checked;
        });
    });

    // 개별 체크박스 변경 시
    rowChecks.forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            updateSelectAllCheckbox();
        });
    });

    // 전체 선택 체크박스 상태 업데이트
    function updateSelectAllCheckbox() {
        const checkedCount = document.querySelectorAll('.row-check:checked').length;
        const totalCount = rowChecks.length;

        if (checkedCount === 0) {
            checkAll.checked = false;
            checkAll.indeterminate = false;
        } else if (checkedCount === totalCount) {
            checkAll.checked = true;
            checkAll.indeterminate = false;
        } else {
            checkAll.checked = false;
            checkAll.indeterminate = true;
        }
    }

    // 블랙리스트 등록 취소
    window.cancelRegistration = function () {
        // 폼 초기화
        document.querySelectorAll('.form-input, .form-select, .form-textarea').forEach(input => {
            if (input.type === 'text' || input.tagName === 'TEXTAREA') {
                input.value = '';
            } else if (input.tagName === 'SELECT') {
                input.selectedIndex = 0;
            }
        });
    };

    // 블랙리스트 등록
    window.registerBlacklist = function () {
        const targetMember = document.querySelector('.form-input').value.trim();
        const banType = document.querySelectorAll('.form-select')[0].value;
        const banPeriod = document.querySelectorAll('.form-select')[1].value;
        const banReason = document.querySelectorAll('.form-select')[2].value;
        const detailReason = document.querySelector('.form-textarea').value.trim();

        // 유효성 검사
        if (!targetMember) {
            alert('대상 회원을 입력해주세요.');
            return;
        }

        if (!banType) {
            alert('차단 유형을 선택해주세요.');
            return;
        }

        if (!banPeriod) {
            alert('차단 기간을 선택해주세요.');
            return;
        }

        if (!banReason) {
            alert('차단 사유를 선택해주세요.');
            return;
        }

        if (!detailReason) {
            alert('상세 사유를 입력해주세요.');
            return;
        }

        // 확인 대화상자
        const confirmMessage = `
다음 정보로 블랙리스트를 등록하시겠습니까?

대상 회원: ${targetMember}
차단 유형: ${banType}
차단 기간: ${banPeriod}
차단 사유: ${banReason}
상세 사유: ${detailReason}
                `;

        if (confirm(confirmMessage)) {
            // 실제로는 서버에 블랙리스트 등록 요청을 보내야 함
            console.log('블랙리스트 등록:', {
                targetMember,
                banType,
                banPeriod,
                banReason,
                detailReason
            });

            alert('블랙리스트가 성공적으로 등록되었습니다.');

            // 폼 초기화
            cancelRegistration();
        }
    };
});