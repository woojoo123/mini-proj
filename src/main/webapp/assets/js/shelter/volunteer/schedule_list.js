  const $=(s,el=document)=>el.querySelector(s), $$=(s,el=document)=>Array.from(el.querySelectorAll(s));
  const list=$('#list'), q=$('#q'), statusSel=$('#statusSel'), sortSel=$('#sortSel'), totalCnt=$('#totalCnt');

  function applyFilters(){
    const text=q.value.trim().toLowerCase();
    const status=statusSel.value;

    // filter
    const cards=$$('.card',list).filter(card=>{
      const okText=!text || card.dataset.title.toLowerCase().includes(text) || card.querySelector('.desc').textContent.toLowerCase().includes(text);
      const okStatus=(status==='all') || (card.dataset.status===status);
      card.style.display = (okText && okStatus) ? '' : 'none';
      return card.style.display!=='none';
    });

    // sort
    const cmp = ({
      date_desc:(a,b)=> new Date(b.dataset.date) - new Date(a.dataset.date),
      created_desc:(a,b)=> new Date(b.dataset.created) - new Date(a.dataset.created),
    })[sortSel.value];
    cards.sort(cmp).forEach(c=>list.appendChild(c));

    totalCnt.textContent = $$('.card',list).length;
  }

  q.addEventListener('input',applyFilters);
  statusSel.addEventListener('change',applyFilters);
  sortSel.addEventListener('change',applyFilters);

  // init
  applyFilters();