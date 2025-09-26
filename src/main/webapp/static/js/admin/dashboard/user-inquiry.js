// 고객 문의 관리 JavaScript
document.addEventListener('DOMContentLoaded', function() {
	const contextPath = "shelter-server"
	
    const memoData = [
        { 
            member: { name: '김사랑', id: 'love_dog', email: 'love@example.com', avatar: '김' },
            title: '입양 상담 진행 중',
            preview: '고양이 2마리 입양 상담 중. 방문...',
            category: '입양 상담',
            priority: '중간',
            date: '2024.03.20',
            author: '관리자',
            public: '공개',
            selected: true
        },
        { 
            member: { name: '해피득보호소', id: 'happydog_shelter', email: 'info@happydog.com', avatar: '해' },
            title: '보호소 인증 검토 필요',
            preview: '제출된 서류 검토 중. 현장 방문...',
            category: '인증 관리',
            priority: '높음',
            date: '2024.03.19',
            author: '관리자',
            public: '비공개',
            selected: true
        },
        { 
            member: { name: '박준호', id: 'jun_park', email: 'jun@example.com', avatar: '박' },
            title: '신고 처리 관련',
            preview: '부적절한 게시글로 신고 접수. 제...',
            category: '신고 처리',
            priority: '높음',
            date: '2024.03.18',
            modifiedDate: '2024.03.20',
            author: '관리자',
            public: '공개',
            selected: false
        },
        { 
            member: { name: '이영희', id: 'young_lee', email: 'young@example.com', avatar: '이' },
            title: '휴면 계정 안내',
            preview: '3개월 미접속으로 휴면 전환. 활성...',
            category: '계정 관리',
            priority: '낮음',
            date: '2024.03.15',
            author: '시스템',
            public: '공개',
            selected: false
        },
        { 
            member: { name: '최민수', id: 'min_choi', email: 'min@example.com', avatar: '최' },
            title: '탈퇴 처리 완료',
            preview: '회원 탈퇴 처리 완료. 개인정보 삭...',
            category: '계정 관리',
            priority: '낮음',
            date: '2024.03.10',
            author: '관리자',
            public: '공개',
            selected: false
        }
    ];

    const tableBody = document.querySelector('.memo-table tbody');

    // 배지 클래스 반환 함수
    const getBadgeClasses = (item) => {
        const categoryClasses = { 
            '입양 상담': 'badge-category-adoption', 
            '인증 관리': 'badge-category-certification', 
            '신고 처리': 'badge-category-report', 
            '계정 관리': 'badge-category-account' 
        };
        const priorityClasses = { 
            '높음': 'badge-priority-high', 
            '중간': 'badge-priority-medium', 
            '낮음': 'badge-priority-low' 
        };
        const publicClasses = { 
            '공개': 'badge-public', 
            '비공개': 'badge-private' 
        };
        return {
            category: categoryClasses[item.category] || '',
            priority: priorityClasses[item.priority] || '',
            public: publicClasses[item.public] || '',
        }
    };

    // 아바타 색상 생성
    const getAvatarColor = (name) => {
        const colors = ['#e74c3c', '#3498db', '#2ecc71', '#f39c12', '#9b59b6', '#1abc9c', '#34495e'];
        const index = name.charCodeAt(0) % colors.length;
        return colors[index];
    };

    // 메모 데이터로 테이블 행 생성
    function renderTable() {
        tableBody.innerHTML = '';
        memoData.forEach((memo, index) => {
            const row = document.createElement('tr');
            const badges = getBadgeClasses(memo);
            const avatarColor = getAvatarColor(memo.member.name);
            
            const dateDisplay = memo.modifiedDate ? 
                `${memo.date}<br><small style="color: #999;">수정: ${memo.modifiedDate}</small>` : 
                memo.date;
            
            row.innerHTML = `
                <td><input type="checkbox" class="checkbox-row" ${memo.selected ? 'checked' : ''} data-index="${index}"></td>
                <td>
                    <div class="member-info">
                        <div class="avatar" style="background-color: ${avatarColor};">${memo.member.avatar}</div>
                        <div>
                            <div class="name">${memo.member.name}</div>
                            <div class="id">@${memo.member.id}</div>
                            <div class="email">${memo.member.email}</div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="memo-title">${memo.title}</div>
                    <div class="memo-preview">${memo.preview}</div>
                </td>
                <td><span class="badge ${badges.category}">${memo.category}</span></td>
                <td><span class="badge ${badges.priority}">${memo.priority}</span></td>
                <td>${dateDisplay}</td>
                <td>${memo.author}</td>
                <td><span class="badge ${badges.public}">${memo.public}</span></td>
                <td>
                    <button class="btn btn-view btn-small" onclick="viewMemo(${index})">◎ 보기</button>
                    <button class="btn btn-edit btn-small" onclick="editMemo(${index})">수정</button>
                    <button class="btn btn-delete btn-small" onclick="deleteMemo(${index})">삭제</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
        
        // 체크박스 이벤트 리스너 재설정
        setupCheckboxEvents();
    }

    // 체크박스 이벤트 설정
    function setupCheckboxEvents() {
        const checkAll = document.getElementById('check-all');
        const rowChecks = document.querySelectorAll('.checkbox-row');

        // 전체 선택/해제 체크박스 기능
        checkAll.addEventListener('change', (e) => {
            rowChecks.forEach(checkbox => {
                checkbox.checked = e.target.checked;
                const index = parseInt(checkbox.dataset.index);
                memoData[index].selected = e.target.checked;
            });
        });

        // 개별 체크박스 변경 시 전체 선택 상태 업데이트
        rowChecks.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                const index = parseInt(this.dataset.index);
                memoData[index].selected = this.checked;
                
                const allChecked = Array.from(rowChecks).every(cb => cb.checked);
                const someChecked = Array.from(rowChecks).some(cb => cb.checked);
                
                checkAll.checked = allChecked;
                checkAll.indeterminate = someChecked && !allChecked;
            });
        });
    }

    // 검색 기능
    function setupSearch() {
        const searchInput = document.querySelector('.search-input');
        const searchSelect = document.querySelector('.basic-search select');
        const searchBtn = document.querySelector('.filter-buttons .btn-primary');
        const resetBtn = document.querySelector('.filter-buttons .btn-secondary');

        searchBtn.addEventListener('click', function() {
            const searchTerm = searchInput.value.toLowerCase();
            const searchType = searchSelect.value;
            
            // 필터링된 데이터로 테이블 다시 렌더링
            filterAndRender(searchTerm, searchType);
        });

        resetBtn.addEventListener('click', function() {
            searchInput.value = '';
            document.querySelectorAll('.custom-select').forEach(select => {
                select.value = 'all';
            });
            renderTable();
        });
    }

    // 필터링 및 렌더링
    function filterAndRender(searchTerm, searchType) {
        let filteredData = memoData;
        
        if (searchTerm) {
            filteredData = memoData.filter(memo => {
                switch(searchType) {
                    case 'title':
                        return memo.title.toLowerCase().includes(searchTerm);
                    case 'content':
                        return memo.preview.toLowerCase().includes(searchTerm);
                    case 'member':
                        return memo.member.name.toLowerCase().includes(searchTerm) || 
                               memo.member.id.toLowerCase().includes(searchTerm);
                    default:
                        return memo.title.toLowerCase().includes(searchTerm) ||
                               memo.preview.toLowerCase().includes(searchTerm) ||
                               memo.member.name.toLowerCase().includes(searchTerm);
                }
            });
        }
        
        // 필터링된 데이터로 테이블 렌더링
        renderFilteredTable(filteredData);
    }

    // 필터링된 테이블 렌더링
    function renderFilteredTable(data) {
        tableBody.innerHTML = '';
        data.forEach((memo, index) => {
            const row = document.createElement('tr');
            const badges = getBadgeClasses(memo);
            const avatarColor = getAvatarColor(memo.member.name);
            
            const dateDisplay = memo.modifiedDate ? 
                `${memo.date}<br><small style="color: #999;">수정: ${memo.modifiedDate}</small>` : 
                memo.date;
            
            row.innerHTML = `
                <td><input type="checkbox" class="checkbox-row" ${memo.selected ? 'checked' : ''} data-index="${index}"></td>
                <td>
                    <div class="member-info">
                        <div class="avatar" style="background-color: ${avatarColor};">${memo.member.avatar}</div>
                        <div>
                            <div class="name">${memo.member.name}</div>
                            <div class="id">@${memo.member.id}</div>
                            <div class="email">${memo.member.email}</div>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="memo-title">${memo.title}</div>
                    <div class="memo-preview">${memo.preview}</div>
                </td>
                <td><span class="badge ${badges.category}">${memo.category}</span></td>
                <td><span class="badge ${badges.priority}">${memo.priority}</span></td>
                <td>${dateDisplay}</td>
                <td>${memo.author}</td>
                <td><span class="badge ${badges.public}">${memo.public}</span></td>
                <td>
                    <button class="btn btn-view btn-small" onclick="viewMemo(${index})">◎ 보기</button>
                    <button class="btn btn-edit btn-small" onclick="editMemo(${index})">수정</button>
                    <button class="btn btn-delete btn-small" onclick="deleteMemo(${index})">삭제</button>
                </td>
            `;
            tableBody.appendChild(row);
        });
        
        setupCheckboxEvents();
    }

    // 일괄 작업 기능
    function setupBulkActions() {
        const bulkButtons = document.querySelectorAll('.bulk-actions .btn');
        bulkButtons.forEach(btn => {
            btn.addEventListener('click', function() {
                const selectedRows = document.querySelectorAll('.checkbox-row:checked');
                if (selectedRows.length === 0) {
                    alert('선택된 항목이 없습니다.');
                    return;
                }
                
                const action = this.textContent;
                const selectedIndices = Array.from(selectedRows).map(cb => parseInt(cb.dataset.index));
                
                switch(action) {
                    case '카테고리 변경':
                        changeCategory(selectedIndices);
                        break;
                    case '우선순위 변경':
                        changePriority(selectedIndices);
                        break;
                    case '일괄 삭제':
                        bulkDelete(selectedIndices);
                        break;
                    case '일괄 내보내기':
                        bulkExport(selectedIndices);
                        break;
                }
            });
        });
    }

    // 카테고리 변경
    function changeCategory(indices) {
        const newCategory = prompt('새 카테고리를 입력하세요:', '입양 상담');
        if (newCategory) {
            indices.forEach(index => {
                memoData[index].category = newCategory;
            });
            renderTable();
            alert(`${indices.length}개 항목의 카테고리가 변경되었습니다.`);
        }
    }

    // 우선순위 변경
    function changePriority(indices) {
        const newPriority = prompt('새 우선순위를 입력하세요 (높음/중간/낮음):', '중간');
        if (newPriority && ['높음', '중간', '낮음'].includes(newPriority)) {
            indices.forEach(index => {
                memoData[index].priority = newPriority;
            });
            renderTable();
            alert(`${indices.length}개 항목의 우선순위가 변경되었습니다.`);
        }
    }

    // 일괄 삭제
    function bulkDelete(indices) {
        if (confirm(`${indices.length}개 항목을 삭제하시겠습니까?`)) {
            indices.sort((a, b) => b - a); // 역순으로 정렬하여 인덱스 문제 방지
            indices.forEach(index => {
                memoData.splice(index, 1);
            });
            renderTable();
            alert(`${indices.length}개 항목이 삭제되었습니다.`);
        }
    }

    // 일괄 내보내기
    function bulkExport(indices) {
        const selectedData = indices.map(index => memoData[index]);
        const csvContent = generateCSV(selectedData);
        downloadCSV(csvContent, 'customer_inquiries.csv');
        alert(`${indices.length}개 항목이 내보내기되었습니다.`);
    }

    // CSV 생성
    function generateCSV(data) {
        const headers = ['회원명', 'ID', '이메일', '제목', '카테고리', '우선순위', '작성일', '작성자', '공개여부'];
        const rows = data.map(item => [
            item.member.name,
            item.member.id,
            item.member.email,
            item.title,
            item.category,
            item.priority,
            item.date,
            item.author,
            item.public
        ]);
        
        return [headers, ...rows].map(row => row.join(',')).join('\n');
    }

    // CSV 다운로드
    function downloadCSV(content, filename) {
        const blob = new Blob([content], { type: 'text/csv;charset=utf-8;' });
        const link = document.createElement('a');
        const url = URL.createObjectURL(blob);
        link.setAttribute('href', url);
        link.setAttribute('download', filename);
        link.style.visibility = 'hidden';
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }
    
    const myButton = document.getElementById('myButton');
    
	myButton.addEventListener('click', async () => {
        /*const data = memoData[0];*/
        const data = { username: "example" };
        try {
            const response = await fetch(`/${contextPath}/userInquiry/userView`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(data),
            });

            const result = await response.json();
            console.log("성공:", result);
        } catch (error) {
            console.error("실패:", error);
        }
    });
    // 메모 보기
    window.viewMemo = function(index) {
        const memo = memoData[index];
        alert(`메모 상세 정보:\n\n제목: ${memo.title}\n내용: ${memo.preview}\n회원: ${memo.member.name} (@${memo.member.id})\n카테고리: ${memo.category}\n우선순위: ${memo.priority}\n작성일: ${memo.date}\n작성자: ${memo.author}\n공개여부: ${memo.public}`);
    };

    // 메모 수정
    window.editMemo = function(index) {
        const memo = memoData[index];
        const newTitle = prompt('제목을 수정하세요:', memo.title);
        if (newTitle) {
            memo.title = newTitle;
            renderTable();
        }
    };

    // 메모 삭제
    window.deleteMemo = function(index) {
        if (confirm('이 메모를 삭제하시겠습니까?')) {
            memoData.splice(index, 1);
            renderTable();
            alert('메모가 삭제되었습니다.');
        }
    };

    // 초기화
    renderTable();
    setupSearch();
    setupBulkActions();
});
