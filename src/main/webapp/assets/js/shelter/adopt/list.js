 const list    = document.getElementById('list');
  const search  = document.getElementById('search');
  const statusF = document.getElementById('statusFilter');
  const sorter  = document.getElementById('sorter');

  // 상태순 정렬 우선순위(대기→보류→승인→거절)
  const statusOrder = { '대기': 3, '보류': 2, '승인': 1, '거절': 0 };

  function updateCounters() {
    const items = [...list.children];
    document.getElementById('cntTotal').textContent = items.length;
    document.getElementById('cntWait').textContent  = items.filter(li => li.dataset.status === '대기').length;
    document.getElementById('cntOk').textContent    = items.filter(li => li.dataset.status === '승인').length;
  }

  function applyFilters() {
    const kw = search.value.trim().toLowerCase();
    const st = statusF.value;

    [...list.children].forEach(li => {
      const matchKw = (li.dataset.name + li.dataset.pet + li.textContent).toLowerCase().includes(kw);
      const matchSt = (st === '전체') || (li.dataset.status === st);
      li.style.display = (matchKw && matchSt) ? '' : 'none';
    });
    sortNow();
  }

  function sortNow() {
    const mode = sorter.value;
    const shown = [...list.children].filter(li => li.style.display !== 'none');

    shown.sort((a,b)=>{
      if (mode === 'status') {
        const sa = statusOrder[a.dataset.status] ?? -1;
        const sb = statusOrder[b.dataset.status] ?? -1;
        if (sb !== sa) return sb - sa; // 상태 우선
        return new Date(b.dataset.date) - new Date(a.dataset.date); // 최신 우선
      } else {
        return new Date(b.dataset.date) - new Date(a.dataset.date); // 신청일순(최신)
      }
    });
    shown.forEach(li => list.appendChild(li));
  }

  [search, statusF].forEach(el => el.addEventListener('input', applyFilters));
  sorter.addEventListener('change', sortNow);

  updateCounters();
  applyFilters();