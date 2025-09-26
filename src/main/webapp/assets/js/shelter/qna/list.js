 const list = document.getElementById('list');
  const catFilter = document.getElementById('catFilter');
  const ansFilter = document.getElementById('ansFilter');
  const sortFilter = document.getElementById('sortFilter');
  const search = document.getElementById('search');

  function updatePendingTotal(){
    const total = [...list.children].filter(li => li.dataset.status==='pending').length;
    document.getElementById('pendingTotal').textContent = total;
  }

  function applyFilters(){
    const cat = catFilter.value;
    const ans = ansFilter.value;
    const kw  = search.value.trim().toLowerCase();

    [...list.children].forEach(li=>{
      const matchCat = (cat==='all') || (li.dataset.cat===cat);
      const matchAns = (ans==='all') || (li.dataset.status===ans);
      const matchKw = li.innerText.toLowerCase().includes(kw);
      li.style.display = (matchCat && matchAns && matchKw) ? '' : 'none';
    });

    // 정렬
    const items = [...list.children].filter(li => li.style.display!=='none');
    items.sort((a,b)=>{
      if (sortFilter.value==='status'){
        const sa = a.dataset.status==='pending' ? 1 : 0;
        const sb = b.dataset.status==='pending' ? 1 : 0;
        if (sb!==sa) return sb-sa; // 미답변 우선
        return new Date(b.dataset.time) - new Date(a.dataset.time); // 최신 우선
      }else{ // date
        return new Date(b.dataset.time) - new Date(a.dataset.time);
      }
    });
    items.forEach(li=>list.appendChild(li));
  }

  [catFilter, ansFilter, sortFilter].forEach(el=>el.addEventListener('change', applyFilters));
  search.addEventListener('input', applyFilters);

  updatePendingTotal();
  applyFilters();