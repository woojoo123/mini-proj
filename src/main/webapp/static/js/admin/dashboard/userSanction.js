// JavaScript (동작)
document.addEventListener('DOMContentLoaded', function () {
    const sanctionData = [
        { id: 1, name: '박준호', username: 'jun_park', avatar: '박', sanctionType: '게시 제한', reason: '부적절한 게시글 작성', code: 'REP-001', duration: '7일', startDate: '2024.03.20', endDate: '2024.03.27', status: '진행 중', registrant: '관리자' },
        { id: 2, name: '이영희', username: 'young_lee', avatar: '이', sanctionType: '댓글 제한', reason: '욕설 및 비방', code: 'REP-003', duration: '3일', startDate: '2024.03.18', endDate: '2024.03.21', status: '완료', registrant: '관리자' },
        { id: 3, name: '최민수', username: 'min_choi', avatar: '최', sanctionType: '계정 정지', reason: '중복 신고 접수', code: 'REP-005', duration: '14일', startDate: '2024.03.15', endDate: '2024.03.29', status: '진행 중', registrant: '관리자' },
    ];

    const tableBody = document.querySelector('.sanction-table tbody');

    // 제재 데이터로 테이블 행 생성
    sanctionData.forEach(sanction => {
        const row = document.createElement('tr');

        const getBadgeClass = (type) => {
            if (type === '게시 제한') return 'badge-post-restriction';
            if (type === '댓글 제한') return 'badge-comment-restriction';
            if (type === '계정 정지') return 'badge-account-suspension';
            return '';
        };

        const getStatusBadgeClass = (status) => {
            if (status === '진행 중') return 'badge-in-progress';
            if (status === '완료') return 'badge-completed';
            return '';
        };

        row.innerHTML = `
                    <td><input type="checkbox" class="row-check" data-id="${sanction.id}"></td>
                    <td>
                        <div class="member-info">
                            <div class="avatar">${sanction.avatar}</div>
                            <div>
                                <div class="name">${sanction.name}</div>
                                <div class="username">@${sanction.username}</div>
                            </div>
                        </div>
                    </td>
                    <td><span class="badge ${getBadgeClass(sanction.sanctionType)}">${sanction.sanctionType}</span></td>
                    <td>
                        <div>${sanction.reason}</div>
                        <div style="font-size: 12px; color: var(--text-light-color);">${sanction.code}</div>
                    </td>
                    <td>${sanction.duration}</td>
                    <td>${sanction.startDate}</td>
                    <td>${sanction.endDate}</td>
                    <td><span class="badge ${getStatusBadgeClass(sanction.status)}">${sanction.status}</span></td>
                    <td>${sanction.registrant}</td>
                    <td>
                        <button class="btn btn-secondary btn-small">상세</button>
                        ${sanction.status === '진행 중' ?
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
        updateSelectedMembersDisplay();
    });

    // 개별 체크박스 변경 시
    rowChecks.forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            updateSelectAllCheckbox();
            updateSelectedMembersDisplay();
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

    // 선택된 회원 표시 업데이트
    function updateSelectedMembersDisplay() {
        const selectedCheckboxes = document.querySelectorAll('.row-check:checked');
        const selectedCount = selectedCheckboxes.length;
        const selectedCountElement = document.getElementById('selectedCount');
        const selectedMembersList = document.getElementById('selectedMembersList');
        const sanctionRegistration = document.getElementById('sanctionRegistration');

        selectedCountElement.textContent = selectedCount;

        if (selectedCount > 0) {
            sanctionRegistration.style.display = 'block';
            updateSelectedMembersList(selectedCheckboxes);
        } else {
            sanctionRegistration.style.display = 'none';
        }
    }

    // 선택된 회원 목록 업데이트
    function updateSelectedMembersList(selectedCheckboxes) {
        const selectedMembersList = document.getElementById('selectedMembersList');
        selectedMembersList.innerHTML = '';

        selectedCheckboxes.forEach(checkbox => {
            const sanctionId = checkbox.dataset.id;
            const sanction = sanctionData.find(s => s.id == sanctionId);
            if (sanction) {
                const tag = document.createElement('div');
                tag.className = 'selected-tag';
                tag.innerHTML = `
                            ${sanction.name} (@${sanction.username})
                            <button class="remove-tag" onclick="removeSelectedMember('${sanctionId}')">×</button>
                        `;
                selectedMembersList.appendChild(tag);
            }
        });
    }

    // 선택된 회원 제거
    window.removeSelectedMember = function (memberId) {
        const checkbox = document.querySelector(`[data-id="${memberId}"]`);
        if (checkbox) {
            checkbox.checked = false;
            updateSelectAllCheckbox();
            updateSelectedMembersDisplay();
        }
    };

    // 제재 등록 취소
    window.cancelRegistration = function () {
        // 선택된 회원들 모두 해제
        document.querySelectorAll('.row-check').forEach(checkbox => {
            checkbox.checked = false;
        });
        checkAll.checked = false;
        checkAll.indeterminate = false;

        // 폼 초기화
        document.getElementById('sanctionType').selectedIndex = 0;
        document.getElementById('sanctionDuration').selectedIndex = 0;
        document.getElementById('sanctionCode').selectedIndex = 0;
        document.getElementById('sanctionReason').value = '';

        updateSelectedMembersDisplay();
    };

    // 제재 등록
    window.registerSanction = function () {
        const sanctionType = document.getElementById('sanctionType').value;
        const sanctionDuration = document.getElementById('sanctionDuration').value;
        const sanctionCode = document.getElementById('sanctionCode').value;
        const sanctionReason = document.getElementById('sanctionReason').value.trim();

        // 유효성 검사
        if (!sanctionType) {
            alert('제재 유형을 선택해주세요.');
            return;
        }

        if (!sanctionDuration) {
            alert('제재 기간을 선택해주세요.');
            return;
        }

        if (!sanctionCode) {
            alert('제재 코드를 선택해주세요.');
            return;
        }

        if (!sanctionReason) {
            alert('제재 사유를 입력해주세요.');
            return;
        }

        const selectedCheckboxes = document.querySelectorAll('.row-check:checked');
        if (selectedCheckboxes.length === 0) {
            alert('제재할 회원을 선택해주세요.');
            return;
        }

        // 확인 대화상자
        const selectedNames = Array.from(selectedCheckboxes).map(checkbox => {
            const sanctionId = checkbox.dataset.id;
            const sanction = sanctionData.find(s => s.id == sanctionId);
            return sanction ? sanction.name : '';
        }).join(', ');

        const confirmMessage = `
다음 회원들에게 제재를 등록하시겠습니까?

대상 회원: ${selectedNames}
제재 유형: ${sanctionType}
제재 기간: ${sanctionDuration}일
제재 코드: ${sanctionCode}
제재 사유: ${sanctionReason}
                `;

        if (confirm(confirmMessage)) {
            // 실제로는 서버에 제재 등록 요청을 보내야 함
            console.log('제재 등록:', {
                sanctionType,
                sanctionDuration,
                sanctionCode,
                sanctionReason,
                selectedMembers: Array.from(selectedCheckboxes).map(cb => cb.dataset.id)
            });

            alert('제재가 성공적으로 등록되었습니다.');

            // 폼 초기화 및 선택 해제
            cancelRegistration();
        }
    };
});