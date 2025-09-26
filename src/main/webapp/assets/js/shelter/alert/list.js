 // 초기 정렬: 안읽음 우선
  function sortUnreadFirst() {
    const list = document.getElementById('alertList');
    const items = Array.from(list.children);
    items.sort((a,b)=> (b.classList.contains('unread')?1:0) - (a.classList.contains('unread')?1:0));
    items.forEach(li => list.appendChild(li));
  }
  // 필터/검색
  function applyFilters(){
    const cat = document.getElementById('categoryFilter').value;
    const read = document.getElementById('readFilter').value;
    const kw  = document.getElementById('searchInput').value.trim().toLowerCase();

    const items = document.querySelectorAll('#alertList .card');
    let unreadCount = 0;

    items.forEach(li=>{
      const matchCat  = (cat==='all') || (li.dataset.cat===cat);
      const matchRead = (read==='all') || (li.dataset.read===read);
      const matchKw   = li.innerText.toLowerCase().includes(kw);

      const show = matchCat && matchRead && matchKw;
      li.style.display = show ? '' : 'none';
      if (show && li.dataset.read === 'unread') unreadCount++;
    });
    document.getElementById('unreadCnt').textContent = unreadCount;
  }

  document.getElementById('categoryFilter').addEventListener('change', applyFilters);
  document.getElementById('readFilter').addEventListener('change', applyFilters);
  document.getElementById('searchInput').addEventListener('input', applyFilters);

  // 초기 실행
  sortUnreadFirst();
  applyFilters();