document.addEventListener('DOMContentLoaded', function () {
    const reportData = [
        { 
            date: '2024.03.20 14:30', 
            reporter: '김사랑', 
            reporterId: 'love_dog', 
            target: '박준용', 
            targetId: 'fun_park', 
            type: '부적절한 내용', 
            title: '분양글 내용 관련 게시물', 
            preview: '게시물', 
            status: '처리 대기', 
            priority: '상', 
            action: '-',
            content: '분양글에 부적절한 내용이 포함되어 있습니다. 동물의 건강 상태를 과장하여 표현하고, 실제와 다른 정보를 제공하고 있습니다.',
            evidence: ['screenshot1.jpg', 'screenshot2.jpg'],
            reporterContact: '010-1234-5678',
            targetContact: '010-2345-6789',
            reportReason: '동물의 건강 상태를 과장하여 표현하고, 실제와 다른 정보를 제공',
            adminNote: '',
            createdAt: '2024-03-20 14:30:00',
            updatedAt: '2024-03-20 14:30:00'
        },
        { 
            date: '2024.03.19 18:42', 
            reporter: '이영희', 
            reporterId: 'young_lee', 
            target: '행복보호소', 
            targetId: 'happydog_shelter', 
            type: '스팸/광고', 
            title: '허위 입양 정보 게시', 
            preview: '게시물', 
            status: '처리 완료', 
            priority: '중', 
            action: '게시글 삭제',
            content: '보호소에서 허위 입양 정보를 게시하여 사용자들을 속이고 있습니다.',
            evidence: ['spam_post.jpg'],
            reporterContact: '010-3456-7890',
            targetContact: '02-1234-5678',
            reportReason: '허위 입양 정보 게시로 인한 사용자 피해',
            adminNote: '게시글 삭제 완료. 보호소에 경고 조치.',
            createdAt: '2024-03-19 18:42:00',
            updatedAt: '2024-03-19 20:15:00'
        },
        { 
            date: '2024.03.19 11:20', 
            reporter: '박현수', 
            reporterId: 'min_choi', 
            target: '김사랑', 
            targetId: 'love_dog', 
            type: '욕설/비방', 
            title: '댓글에서 욕설 사용', 
            preview: '댓글', 
            status: '처리 완료', 
            priority: '상', 
            action: '-',
            content: '댓글에서 심한 욕설과 비방을 사용하여 다른 사용자에게 불쾌감을 주고 있습니다.',
            evidence: ['comment_screenshot.jpg'],
            reporterContact: '010-4567-8901',
            targetContact: '010-1234-5678',
            reportReason: '댓글에서 욕설 및 비방 사용',
            adminNote: '경고 조치 완료. 재발 시 제재 예정.',
            createdAt: '2024-03-19 11:20:00',
            updatedAt: '2024-03-19 12:30:00'
        },
        { 
            date: '2024.03.18 09:15', 
            reporter: '관리자', 
            reporterId: 'system_user', 
            target: '박준용', 
            targetId: 'fun_park', 
            type: '음란물', 
            title: '음란물 내용 번역 게시', 
            preview: '게시물', 
            status: '처리 완료', 
            priority: '중', 
            action: '일시 정지',
            content: '부적절한 음란물 내용을 번역하여 게시하고 있습니다.',
            evidence: ['inappropriate_content.jpg'],
            reporterContact: 'system',
            targetContact: '010-2345-6789',
            reportReason: '음란물 내용 게시',
            adminNote: '7일 일시 정지 조치 완료.',
            createdAt: '2024-03-18 09:15:00',
            updatedAt: '2024-03-18 10:00:00'
        },
        { 
            date: '2024.03.17 23:30', 
            reporter: '행복보호소', 
            reporterId: 'happydog_shelter', 
            target: '박현수', 
            targetId: 'min_choi', 
            type: '개인정보 노출', 
            title: '타인의 연락처 무단 공개', 
            preview: '게시물', 
            status: '처리 대기', 
            priority: '상', 
            action: '-',
            content: '다른 사용자의 개인 연락처를 무단으로 공개하여 개인정보 보호법 위반에 해당합니다.',
            evidence: ['privacy_violation.jpg'],
            reporterContact: '02-1234-5678',
            targetContact: '010-4567-8901',
            reportReason: '타인의 개인정보 무단 공개',
            adminNote: '',
            createdAt: '2024-03-17 23:30:00',
            updatedAt: '2024-03-17 23:30:00'
        },
    ];

    const tableBody = document.querySelector('.report-table tbody');

    // 배지 클래스 반환 함수
    const getBadgeClasses = (item) => {
        const typeClasses = { '부적절한 내용': 'badge-type-inappropriate', '스팸/광고': 'badge-type-spam', '욕설/비방': 'badge-type-slur', '음란물': 'badge-type-slur', '개인정보 노출': 'badge-type-inappropriate' };
        const statusClasses = { '처리 대기': 'badge-status-pending', '처리 완료': 'badge-status-completed' };
        const priorityClasses = { '상': 'badge-priority-high', '중': 'badge-priority-medium', '하': 'badge-priority-low' };
        return {
            type: typeClasses[item.type] || '',
            status: statusClasses[item.status] || '',
            priority: priorityClasses[item.priority] || '',
        }
    };

    // 데이터로 테이블 행 생성
    reportData.forEach((item, index) => {
        const row = document.createElement('tr');
        row.dataset.reportIndex = index;
        const badges = getBadgeClasses(item);

        row.innerHTML = `
            <td><input type="checkbox" class="checkbox-row" data-index="${index}"></td>
            <td>${item.date.replace(' ', '<br>')}</td>
            <td><div class="user-info">${item.reporter}<div class="id">@${item.reporterId}</div></div></td>
            <td><div class="user-info">${item.target}<div class="id">@${item.targetId}</div></div></td>
            <td><span class="badge ${badges.type}">${item.type}</span></td>
            <td class="content">
                <div class="content-title">${item.title}</div>
                <div class="content-preview">${item.preview}</div>
            </td>
            <td><span class="badge ${badges.status}">${item.status}</span></td>
            <td><span class="badge ${badges.priority}">${item.priority}</span></td>
            <td>${item.action}</td>
            <td>
                <button class="btn btn-secondary btn-small detail-btn" data-report-index="${index}">상세</button>
                <button class="btn btn-danger btn-small sanction-btn" data-report-index="${index}">제재</button>
            </td>
        `;
        tableBody.appendChild(row);
    });

    // 체크박스 및 일괄 제재 기능
    const selectAllCheckbox = document.getElementById('selectAll');
    const rowCheckboxes = document.querySelectorAll('.checkbox-row');
    const selectedCountSpan = document.getElementById('selectedCount');
    const bulkSanctionBtn = document.getElementById('bulkSanctionBtn');
    const sanctionModal = document.getElementById('sanctionModal');
    const closeModal = document.getElementById('closeModal');
    const cancelSanction = document.getElementById('cancelSanction');
    const confirmSanction = document.getElementById('confirmSanction');
    const selectedTargetsList = document.getElementById('selectedTargetsList');

    // 전체 선택/해제 기능
    selectAllCheckbox.addEventListener('change', function () {
        rowCheckboxes.forEach(checkbox => {
            checkbox.checked = this.checked;
        });
        updateSelectedCount();
    });

    // 개별 체크박스 변경 시
    rowCheckboxes.forEach(checkbox => {
        checkbox.addEventListener('change', function () {
            updateSelectedCount();
            updateSelectAllState();
        });
    });

    // 선택된 항목 수 업데이트
    function updateSelectedCount() {
        const selectedCount = document.querySelectorAll('.checkbox-row:checked').length;
        selectedCountSpan.textContent = selectedCount;
        bulkSanctionBtn.disabled = selectedCount === 0;
    }

    // 전체 선택 체크박스 상태 업데이트
    function updateSelectAllState() {
        const totalCheckboxes = rowCheckboxes.length;
        const checkedCheckboxes = document.querySelectorAll('.checkbox-row:checked').length;

        if (checkedCheckboxes === 0) {
            selectAllCheckbox.indeterminate = false;
            selectAllCheckbox.checked = false;
        } else if (checkedCheckboxes === totalCheckboxes) {
            selectAllCheckbox.indeterminate = false;
            selectAllCheckbox.checked = true;
        } else {
            selectAllCheckbox.indeterminate = true;
        }
    }

    // 일괄 제재 버튼 클릭
    bulkSanctionBtn.addEventListener('click', function () {
        const selectedCheckboxes = document.querySelectorAll('.checkbox-row:checked');
        if (selectedCheckboxes.length === 0) return;

        // 선택된 대상 목록 생성
        selectedTargetsList.innerHTML = '';
        selectedCheckboxes.forEach(checkbox => {
            const index = parseInt(checkbox.dataset.index);
            const item = reportData[index];
            const targetItem = document.createElement('div');
            targetItem.className = 'target-item';
            targetItem.innerHTML = `
                <div class="target-info">
                    <div class="target-name">${item.target}</div>
                    <div class="target-id">@${item.targetId}</div>
                </div>
            `;
            selectedTargetsList.appendChild(targetItem);
        });

        sanctionModal.style.display = 'block';
    });

    // 모달 닫기
    function closeModalFunc() {
        sanctionModal.style.display = 'none';
        // 폼 초기화
        document.getElementById('sanctionType').value = '';
        document.getElementById('sanctionPeriod').value = '';
        document.getElementById('sanctionReason').value = '';
    }

    closeModal.addEventListener('click', closeModalFunc);
    cancelSanction.addEventListener('click', closeModalFunc);

    // 모달 외부 클릭 시 닫기
    window.addEventListener('click', function (event) {
        if (event.target === sanctionModal) {
            closeModalFunc();
        }
    });

    // 제재 실행
    confirmSanction.addEventListener('click', function () {
        const sanctionType = document.getElementById('sanctionType').value;
        const sanctionPeriod = document.getElementById('sanctionPeriod').value;
        const sanctionReason = document.getElementById('sanctionReason').value;

        if (!sanctionType || !sanctionPeriod || !sanctionReason.trim()) {
            alert('모든 필드를 입력해주세요.');
            return;
        }

        const selectedCheckboxes = document.querySelectorAll('.checkbox-row:checked');
        const selectedTargets = Array.from(selectedCheckboxes).map(checkbox => {
            const index = parseInt(checkbox.dataset.index);
            return reportData[index];
        });

        // 제재 실행 로직 (실제로는 서버에 전송)
        console.log('제재 실행:', {
            type: sanctionType,
            period: sanctionPeriod,
            reason: sanctionReason,
            targets: selectedTargets
        });

        alert(`${selectedTargets.length}명의 사용자에게 제재가 적용되었습니다.`);

        // 체크박스 해제
        selectedCheckboxes.forEach(checkbox => {
            checkbox.checked = false;
        });
        selectAllCheckbox.checked = false;
        selectAllCheckbox.indeterminate = false;
        updateSelectedCount();

        closeModalFunc();
    });

    // 신고 상세 정보 토글 기능
    function toggleReportDetail(reportIndex) {
        const report = reportData[reportIndex];
        const currentRow = document.querySelector(`tr[data-report-index="${reportIndex}"]`);
        const detailRow = document.querySelector(`tr.report-detail[data-report-index="${reportIndex}"]`);
        
        // 이미 상세 정보가 표시되어 있다면 제거
        if (detailRow) {
            detailRow.remove();
            return;
        }
        
        // 상세 정보 행 생성
        const detailRowElement = document.createElement('tr');
        detailRowElement.className = 'report-detail';
        detailRowElement.dataset.reportIndex = reportIndex;
        
        detailRowElement.innerHTML = `
            <td colspan="10">
                <div class="report-detail-content">
                    <div class="detail-header">
                        <h4>신고 상세 정보</h4>
                        <button class="btn btn-sm btn-close" onclick="closeReportDetail(${reportIndex})">&times;</button>
                    </div>
                    <div class="detail-body">
                        <div class="detail-grid">
                            <div class="detail-section">
                                <h5>신고 정보</h5>
                                <div class="detail-item">
                                    <span class="label">신고일시:</span>
                                    <span class="value">${report.date}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">신고 유형:</span>
                                    <span class="value badge ${getBadgeClasses(report).type}">${report.type}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">우선순위:</span>
                                    <span class="value badge ${getBadgeClasses(report).priority}">${report.priority}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">처리 상태:</span>
                                    <span class="value badge ${getBadgeClasses(report).status}">${report.status}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>신고자 정보</h5>
                                <div class="detail-item">
                                    <span class="label">신고자명:</span>
                                    <span class="value">${report.reporter}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">신고자 ID:</span>
                                    <span class="value">@${report.reporterId}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">연락처:</span>
                                    <span class="value">${report.reporterContact}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>피신고자 정보</h5>
                                <div class="detail-item">
                                    <span class="label">피신고자명:</span>
                                    <span class="value">${report.target}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">피신고자 ID:</span>
                                    <span class="value">@${report.targetId}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">연락처:</span>
                                    <span class="value">${report.targetContact}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>신고 내용</h5>
                                <div class="detail-item">
                                    <span class="label">신고 제목:</span>
                                    <span class="value">${report.title}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">신고 사유:</span>
                                    <span class="value">${report.reportReason}</span>
                                </div>
                                <div class="detail-item">
                                    <span class="label">상세 내용:</span>
                                    <span class="value">${report.content}</span>
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>첨부 파일</h5>
                                <div class="evidence-list">
                                    ${report.evidence.map(file => `<div class="evidence-item">📎 ${file}</div>`).join('')}
                                </div>
                            </div>
                            <div class="detail-section">
                                <h5>관리자 메모</h5>
                                <div class="admin-note">
                                    ${report.adminNote || '관리자 메모가 없습니다.'}
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

    // 신고 상세 정보 닫기 함수 (전역 함수로 등록)
    window.closeReportDetail = function(reportIndex) {
        const detailRow = document.querySelector(`tr.report-detail[data-report-index="${reportIndex}"]`);
        if (detailRow) {
            detailRow.classList.remove('show');
            setTimeout(() => {
                detailRow.remove();
            }, 300);
        }
    };

    // 개별 제재 모달 표시
    function showIndividualSanctionModal(reportIndex) {
        const report = reportData[reportIndex];
        
        // 기존 모달 내용을 개별 제재용으로 변경
        const modal = document.getElementById('sanctionModal');
        const modalTitle = modal.querySelector('.modal-header h3');
        const selectedTargetsList = document.getElementById('selectedTargetsList');
        
        modalTitle.textContent = '개별 제재';
        
        // 제재 대상 설정
        selectedTargetsList.innerHTML = `
            <div class="target-item">
                <div class="target-info">
                    <div class="target-name">${report.target}</div>
                    <div class="target-id">@${report.targetId}</div>
                </div>
            </div>
        `;
        
        // 모달 표시
        modal.style.display = 'block';
        
        // 제재 실행 시 개별 제재 처리
        const confirmBtn = document.getElementById('confirmSanction');
        const originalHandler = confirmBtn.onclick;
        confirmBtn.onclick = function() {
            const sanctionType = document.getElementById('sanctionType').value;
            const sanctionPeriod = document.getElementById('sanctionPeriod').value;
            const sanctionReason = document.getElementById('sanctionReason').value;

            if (!sanctionType || !sanctionPeriod || !sanctionReason.trim()) {
                alert('모든 필드를 입력해주세요.');
                return;
            }

            // 개별 제재 실행 로직
            console.log('개별 제재 실행:', {
                type: sanctionType,
                period: sanctionPeriod,
                reason: sanctionReason,
                target: report
            });

            alert(`${report.target}(${report.targetId})에게 제재가 적용되었습니다.`);
            
            // 모달 닫기
            closeModalFunc();
            
            // 원래 핸들러 복원
            confirmBtn.onclick = originalHandler;
        };
    }

    // 이벤트 리스너 추가
    document.addEventListener('click', (e) => {
        if (e.target.classList.contains('detail-btn')) {
            const reportIndex = parseInt(e.target.dataset.reportIndex);
            toggleReportDetail(reportIndex);
        }
        
        if (e.target.classList.contains('sanction-btn')) {
            const reportIndex = parseInt(e.target.dataset.reportIndex);
            showIndividualSanctionModal(reportIndex);
        }
    });
});