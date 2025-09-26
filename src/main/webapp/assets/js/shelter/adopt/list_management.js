 // 검색 + 필터 + 정렬
  const grid = document.getElementById('grid');
  const cards = [...grid.querySelectorAll('.card')];
  const q = document.querySelector('.search input');
  const filterSel = document.getElementById('filter');
  const sortSel = document.getElementById('sort');

  function apply(){
    const text = q.value.trim();
    const f = filterSel.value;

    cards.forEach(c=>{
      const okFilter = (f==='all' || c.dataset.status===f);
      const okText = !text || c.dataset.name.includes(text);
      c.style.display = (okFilter && okText)?'':'none';
    });

    const visible = cards.filter(c=>c.style.display!=='none');
    const cmp = {
      reg_desc:(a,b)=> new Date(b.dataset.registered) - new Date(a.dataset.registered),
      status  :(a,b)=> ({public:1,private:2,done:3}[a.dataset.status] - ({public:1,private:2,done:3}[b.dataset.status])),
      name    :(a,b)=> a.dataset.name.localeCompare(b.dataset.name,'ko'),
      apply   :(a,b)=> (+b.dataset.apply) - (+a.dataset.apply)
    }[sortSel.value] || ((a,b)=>0);
    visible.sort(cmp).forEach(v=>grid.appendChild(v));
  }
  q.addEventListener('input', apply);
  filterSel.addEventListener('change', apply);
  sortSel.addEventListener('change', apply);
  apply();