// JavaScript (동작)
document.addEventListener('DOMContentLoaded', function() {
    const memberData = [
        { name: '김철수', id: 'iron_dog', email: 'kimchul@example.com', type: '일반회원', status: '활성', joinDate: '2024.01.15', lastLogin: '2024.03.20 14:30', posts: 12, comments: 45, reports: 1, sanctions: '제재 1회' },
        { name: '행복보호소', id: 'happydog_shelter', email: 'info@happydog.org', type: '보호소', status: '활성', joinDate: '2023.11.08', lastLogin: '2024.03.20 09:15', posts: 89, comments: 156, reports: 0, sanctions: '문제 없음' },
        { name: '박영희', id: 'love_park', email: 'park@example.com', type: '일반회원', status: '탈퇴', joinDate: '2024.02.03', lastLogin: '2024.03.18 22:45', posts: 3, comments: 8, reports: 0, sanctions: '문제 없음' },
        { name: '이민준', id: 'minjoon_lee', email: 'young@example.com', type: '일반회원', status: '제재', joinDate: '2023.08.22', lastLogin: '2021.01.25 16:20', posts: 24, comments: 67, reports: 3, sanctions: '제재 3회' },
        { name: '관리자', id: 'admin_user', email: 'admin@yourdomain.com', type: '관리자', status: '활성', joinDate: '2023.01.01', lastLogin: '2024.03.20 20:45', posts: 155, comments: 189, reports: 0, sanctions: '문제 없음' },
        { name: '최미소', id: 'smile_choi', email: 'choi@example.com', type: '일반회원', status: '휴면', joinDate: '2023.05.12', lastLogin: '2024.02.28 11:30', posts: 7, comments: 19, reports: 0, sanctions: '문제 없음' },
    ];

    const tableBody = document.querySelector('.member-table tbody');

    // 유틸리티 함수들을 전역으로 정의
    const getBadgeClass = (type) => {
        if (type === '관리자') return 'badge-admin';
        if (type === '보호소') return 'badge-shelter';
        return 'badge-user';
    };

    const getStatusBadgeClass = (status) => {
        if (status === '활성') return 'badge-active';
        if (status === '제재') return 'badge-suspended';
        if (status === '탈퇴') return 'badge-withdrawn';
        return 'badge-dormant';
    };

    // 회원 데이터로 테이블 행 생성
    memberData.forEach((member, index) => {
        const row = document.createElement('tr');
        row.dataset.memberIndex = index;

        row.innerHTML = `
            <td><input type="checkbox" class="row-check"></td>
            <td>
                <div class="member-info">
                    <div class="avatar">${member.name.charAt(0)}</div>
                    <div>
                        <div class="name">${member.name} (${member.id})</div>
                        <div class="email">${member.email}</div>
                    </div>
                </div>
            </td>
            <td><span class="badge ${getBadgeClass(member.type)}">${member.type}</span></td>
            <td><span class="badge ${getStatusBadgeClass(member.status)}">${member.status}</span></td>
            <td>${member.joinDate}</td>
            <td>${member.lastLogin}</td>
            <td>
                <div class="activity-info">
                    게시글 ${member.posts}<br>
                    댓글 ${member.comments}
                </div>
            </td>
            <td>
                 <div class="report-info">
                    신고 ${member.reports}<br>
                    ${member.sanctions}
                </div>
            </td>
            <td>
                <button class="btn btn-secondary btn-small detail-btn" data-member-index="${index}">상세</button>
                <button class="btn btn-secondary btn-small">제재</button>
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

    // 상세 정보 표시/숨기기 기능
    function toggleMemberDetail(memberIndex) {
        const member = memberData[memberIndex];
        const currentRow = document.querySelector(`tr[data-member-index="${memberIndex}"]`);
        const detailRow = document.querySelector(`tr.member-detail[data-member-index="${memberIndex}"]`);
        
        // 이미 상세 정보가 표시되어 있다면 제거
        if (detailRow) {
            detailRow.remove();
            return;
        }
        
        // 상세 정보 행 생성
        const detailRowElement = document.createElement('tr');
        detailRowElement.className = 'member-detail';
        detailRowElement.dataset.memberIndex = memberIndex;
        
        detailRowElement.innerHTML = `
            <td colspan="9">
                <div class="member-detail-content">
                    <div class="detail-header">
                        <h4>${member.name} 회원 상세 정보</h4>
                        <button class="btn btn-sm btn-close" onclick="closeDetail(${memberIndex})">&times;</button>
                    </div>
                    <div class="detail-body">
                        <div class="detail-grid">
                            <div class="detail-section">
                                <h5>기본 정보</h5>
                                <div class="detail-item">
                                    <span class="label">실명:</span>
                                    <span class="value">${member.name}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">아이디:</span>
                                    <span class="value">${member.id}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">이메일:</span>
                                    <span class="value">${member.email}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">회원 유형:</span>
                                    <span class="value badge ${getBadgeClass(member.type)}">${member.type}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>계정 정보</h5>
                                <div class="detail-item">
                                    <span class="label">계정 상태:</span>
                                    <span class="value badge ${getStatusBadgeClass(member.status)}">${member.status}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">가입일:</span>
                                    <span class="value">${member.joinDate}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">최근 로그인:</span>
                                    <span class="value">${member.lastLogin}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">제재 내역:</span>
                                    <span class="value">${member.sanctions}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>활동 통계</h5>
                                <div class="detail-item">
                                    <span class="label">작성 게시글:</span>
                                    <span class="value">${member.posts}개</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">작성 댓글:</span>
                                    <span class="value">${member.comments}개</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">신고 횟수:</span>
                                    <span class="value">${member.reports}회</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>관리 작업</h5>
                                <div class="detail-actions">
                                    <button class="btn btn-primary btn-sm">계정 상태 변경</button>
                                    <button class="btn btn-warning btn-sm">제재 부여</button>
                                    <button class="btn btn-danger btn-sm">계정 삭제</button>
                                    <button class="btn btn-secondary btn-sm">비밀번호 초기화</button>
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
    window.closeDetail = function(memberIndex) {
        const detailRow = document.querySelector(`tr.member-detail[data-member-index="${memberIndex}"]`);
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
            const memberIndex = parseInt(e.target.dataset.memberIndex);
            toggleMemberDetail(memberIndex);
        }
        
        // 계정 상태 변경 버튼 클릭
        if (e.target.textContent === '계정 상태 변경') {
            const detailRow = e.target.closest('.member-detail');
            const memberIndex = parseInt(detailRow.dataset.memberIndex);
            const member = memberData[memberIndex];
            showStatusChangeModal(member, memberIndex);
        }
        
        // 계정 삭제 버튼 클릭
        if (e.target.textContent === '계정 삭제') {
            const detailRow = e.target.closest('.member-detail');
            const memberIndex = parseInt(detailRow.dataset.memberIndex);
            const member = memberData[memberIndex];
            showDeleteConfirmModal(member, memberIndex);
        }
        
        // 비밀번호 초기화 버튼 클릭
        if (e.target.textContent === '비밀번호 초기화') {
            const detailRow = e.target.closest('.member-detail');
            const memberIndex = parseInt(detailRow.dataset.memberIndex);
            const member = memberData[memberIndex];
            showPasswordResetModal(member, memberIndex);
        }
        
        // 모달 닫기 버튼들
        if (e.target.classList.contains('modal-close') || e.target.classList.contains('modal-cancel')) {
            closeModal();
        }
        
        // 모달 배경 클릭시 닫기
        if (e.target.classList.contains('modal-backdrop')) {
            closeModal();
        }
    });

    // 계정 상태 변경 모달 표시
    function showStatusChangeModal(member, memberIndex) {
        const modal = createModal('계정 상태 변경', `
            <div class="modal-content">
                <p><strong>${member.name} (${member.id})</strong> 회원의 계정 상태를 변경하시겠습니까?</p>
                <div class="status-options">
                    <label class="status-option">
                        <input type="radio" name="newStatus" value="활성" ${member.status === '활성' ? 'checked' : ''}>
                        <span class="status-badge badge-active">활성</span>
                    </label>
                    <label class="status-option">
                        <input type="radio" name="newStatus" value="제재" ${member.status === '제재' ? 'checked' : ''}>
                        <span class="status-badge badge-suspended">제재</span>
                    </label>
                    <label class="status-option">
                        <input type="radio" name="newStatus" value="휴면" ${member.status === '휴면' ? 'checked' : ''}>
                        <span class="status-badge badge-dormant">휴면</span>
                    </label>
                    <label class="status-option">
                        <input type="radio" name="newStatus" value="탈퇴" ${member.status === '탈퇴' ? 'checked' : ''}>
                        <span class="status-badge badge-withdrawn">탈퇴</span>
                    </label>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary modal-cancel">취소</button>
                <button class="btn btn-primary" onclick="confirmStatusChange(${memberIndex})">변경</button>
            </div>
        `);
        document.body.appendChild(modal);
        setTimeout(() => modal.classList.add('show'), 10);
    }

    // 계정 삭제 확인 모달 표시
    function showDeleteConfirmModal(member, memberIndex) {
        const modal = createModal('계정 삭제', `
            <div class="modal-content">
                <div class="warning-icon">⚠️</div>
                <p><strong>${member.name} (${member.id})</strong> 회원의 계정을 삭제하시겠습니까?</p>
                <p class="warning-text">이 작업은 되돌릴 수 없습니다.</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary modal-cancel">취소</button>
                <button class="btn btn-danger" onclick="confirmDelete(${memberIndex})">삭제</button>
            </div>
        `);
        document.body.appendChild(modal);
        setTimeout(() => modal.classList.add('show'), 10);
    }

    // 비밀번호 초기화 확인 모달 표시
    function showPasswordResetModal(member, memberIndex) {
        const modal = createModal('비밀번호 초기화', `
            <div class="modal-content">
                <div class="info-icon">🔑</div>
                <p><strong>${member.name} (${member.id})</strong> 회원의 비밀번호를 초기화하시겠습니까?</p>
                <p class="info-text">초기화 후 임시 비밀번호가 회원의 이메일로 전송됩니다.</p>
            </div>
            <div class="modal-footer">
                <button class="btn btn-secondary modal-cancel">취소</button>
                <button class="btn btn-primary" onclick="confirmPasswordReset(${memberIndex})">초기화</button>
            </div>
        `);
        document.body.appendChild(modal);
        setTimeout(() => modal.classList.add('show'), 10);
    }

    // 모달 생성 함수
    function createModal(title, content) {
        const modal = document.createElement('div');
        modal.className = 'modal-backdrop';
        modal.innerHTML = `
            <div class="modal">
                <div class="modal-header">
                    <h3>${title}</h3>
                    <button class="modal-close">&times;</button>
                </div>
                ${content}
            </div>
        `;
        return modal;
    }

    // 모달 닫기
    function closeModal() {
        const modal = document.querySelector('.modal-backdrop');
        if (modal) {
            modal.classList.remove('show');
            setTimeout(() => modal.remove(), 300);
        }
    }

    // 계정 상태 변경 확인
    window.confirmStatusChange = function(memberIndex) {
        const selectedStatus = document.querySelector('input[name="newStatus"]:checked');
        if (selectedStatus) {
            const newStatus = selectedStatus.value;
            const member = memberData[memberIndex];
            
            // 데이터 업데이트
            member.status = newStatus;
            
            // UI 업데이트
            updateMemberRow(memberIndex);
            updateDetailInfo(memberIndex);
            
            // 성공 메시지 표시
            showSuccessMessage(`${member.name} 회원의 계정 상태가 "${newStatus}"로 변경되었습니다.`);
            
            closeModal();
        }
    };

    // 계정 삭제 확인
    window.confirmDelete = function(memberIndex) {
        const member = memberData[memberIndex];
        
        // 데이터에서 제거
        memberData.splice(memberIndex, 1);
        
        // UI에서 제거
        const row = document.querySelector(`tr[data-member-index="${memberIndex}"]`);
        const detailRow = document.querySelector(`tr.member-detail[data-member-index="${memberIndex}"]`);
        
        if (row) row.remove();
        if (detailRow) detailRow.remove();
        
        // 인덱스 재정렬
        reindexRows();
        
        // 성공 메시지 표시
        showSuccessMessage(`${member.name} 회원의 계정이 삭제되었습니다.`);
        
        closeModal();
    };

    // 비밀번호 초기화 확인
    window.confirmPasswordReset = function(memberIndex) {
        const member = memberData[memberIndex];
        
        // 성공 메시지 표시
        showSuccessMessage(`${member.name} 회원의 비밀번호가 초기화되었습니다. 임시 비밀번호가 이메일로 전송되었습니다.`);
        
        closeModal();
    };

    // 회원 행 업데이트
    function updateMemberRow(memberIndex) {
        const row = document.querySelector(`tr[data-member-index="${memberIndex}"]`);
        const member = memberData[memberIndex];
        
        if (row) {
            const statusCell = row.cells[3]; // 상태 컬럼
            statusCell.innerHTML = `<span class="badge ${getStatusBadgeClass(member.status)}">${member.status}</span>`;
        }
    }

    // 상세 정보 업데이트
    function updateDetailInfo(memberIndex) {
        const detailRow = document.querySelector(`tr.member-detail[data-member-index="${memberIndex}"]`);
        if (detailRow) {
            // 상세 정보 다시 렌더링
            const member = memberData[memberIndex];
            const detailContent = detailRow.querySelector('.member-detail-content');
            detailContent.innerHTML = `
                <div class="detail-header">
                    <h4>${member.name} 회원 상세 정보</h4>
                    <button class="btn btn-sm btn-close" onclick="closeDetail(${memberIndex})">&times;</button>
                </div>
                <div class="detail-body">
                    <div class="detail-grid">
                        <div class="detail-section">
                            <h5>기본 정보</h5>
                            <div class="detail-item">
                                <span class="label">실명:</span>
                                <span class="value">${member.name}</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">아이디:</span>
                                <span class="value">${member.id}</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">이메일:</span>
                                <span class="value">${member.email}</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">회원 유형:</span>
                                <span class="value badge ${getBadgeClass(member.type)}">${member.type}</span>
                            </div>
                        </div>
                        <div class="detail-section">
                            <h5>계정 정보</h5>
                            <div class="detail-item">
                                <span class="label">계정 상태:</span>
                                <span class="value badge ${getStatusBadgeClass(member.status)}">${member.status}</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">가입일:</span>
                                <span class="value">${member.joinDate}</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">최근 로그인:</span>
                                <span class="value">${member.lastLogin}</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">제재 내역:</span>
                                <span class="value">${member.sanctions}</span>
                            </div>
                        </div>
                        <div class="detail-section">
                            <h5>활동 통계</h5>
                            <div class="detail-item">
                                <span class="label">작성 게시글:</span>
                                <span class="value">${member.posts}개</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">작성 댓글:</span>
                                <span class="value">${member.comments}개</span>
                            </div>
                            <div class="detail-item">
                                <span class="label">신고 횟수:</span>
                                <span class="value">${member.reports}회</span>
                            </div>
                        </div>
                        <div class="detail-section">
                            <h5>관리 작업</h5>
                            <div class="detail-actions">
                                <button class="btn btn-primary btn-sm">계정 상태 변경</button>
                                <button class="btn btn-warning btn-sm">제재 부여</button>
                                <button class="btn btn-danger btn-sm">계정 삭제</button>
                                <button class="btn btn-secondary btn-sm">비밀번호 초기화</button>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }
    }

    // 행 인덱스 재정렬
    function reindexRows() {
        const rows = document.querySelectorAll('tr[data-member-index]');
        rows.forEach((row, index) => {
            row.dataset.memberIndex = index;
            const detailBtn = row.querySelector('.detail-btn');
            if (detailBtn) {
                detailBtn.dataset.memberIndex = index;
            }
        });
    }

    // 성공 메시지 표시
    function showSuccessMessage(message) {
        const toast = document.createElement('div');
        toast.className = 'toast-message';
        toast.textContent = message;
        document.body.appendChild(toast);
        
        setTimeout(() => toast.classList.add('show'), 10);
        setTimeout(() => {
            toast.classList.remove('show');
            setTimeout(() => toast.remove(), 300);
        }, 3000);
    }
});