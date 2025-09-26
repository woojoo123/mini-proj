 const $=(s,el=document)=>el.querySelector(s), $$=(s,el=document)=>Array.from(el.querySelectorAll(s));
  const list=$('#list'); const cards=()=>$$('.card',list);

  // Toolbar refs
  const q=$('#q'), statusSel=$('#statusSel'), sortSel=$('#sortSel');
  const rangeBtn=$('#rangeBtn'), rangePop=$('#rangePop'), rangeLabel=$('#rangeLabel');
  const startInput=$('#startDate'), endInput=$('#endDate');
  const bulkApprove=$('#bulkApprove'), bulkReject=$('#bulkReject');
  const selectAll=$('#selectAll'), selCount=$('#selCount'), visibleCount=$('#visibleCount');

  let range={start:null,end:null};
  function toDate(s){ return new Date(s.replace(/-/g,'/')); }

  function syncBadges(card){
    const name=card.querySelector('.name');
    name.querySelectorAll('.b-attend,.b-absent').forEach(n=>n.remove());
    if(card.dataset.status==='approved' && card.dataset.attend){
      const span=document.createElement('span');
      if(card.dataset.attend==='came'){ span.className='badge b-attend'; span.textContent='출석'; }
      else { span.className='badge b-absent'; span.textContent='결석'; }
      name.appendChild(span);
    }
  }

  function refresh(){
    const text=q.value.trim().toLowerCase();
    const st=statusSel.value;
    const s=range.start?new Date(range.start+'T00:00:00'):null;
    const e=range.end?new Date(range.end+'T23:59:59'):null;

    let vis=[];
    cards().forEach(c=>{
      const okText=!text||c.dataset.name.toLowerCase().includes(text)||c.dataset.email.toLowerCase().includes(text)||c.dataset.title.toLowerCase().includes(text);
      const okSt=st==='all'||c.dataset.status===st;
      const applied=toDate(c.dataset.applied);
      const okRange=(!s||applied>=s)&&(!e||applied<=e);

      c.style.display=(okText&&okSt&&okRange)?'':'none';
      if(c.style.display!=='none') vis.push(c);

      // right actions: pending -> 승인/반려, approved -> 출석/결석
      const actions=c.querySelector('.actions');
      if(c.dataset.status==='pending'){
        actions.innerHTML=`
          <button class="btn green ok">승인</button>
          <button class="btn red no">반려</button>`;
      }else if(c.dataset.status==='approved'){
        actions.innerHTML=`
          <button class="pill">⟳ 출석</button>
          <button class="pill white">✖ 결석</button>`;
      }else{
        actions.innerHTML='';
      }
      syncBadges(c);
    });

    // sort
    const cmp={
      date_desc:(a,b)=>toDate(b.dataset.applied)-toDate(a.dataset.applied),
      status:(a,b)=>({approved:1,pending:2,rejected:3}[a.dataset.status]-({approved:1,pending:2,rejected:3}[b.dataset.status])),
      name:(a,b)=>a.dataset.name.localeCompare(b.dataset.name,'ko')
    }[sortSel.value]||((a,b)=>0);
    vis.sort(cmp).forEach(v=>list.appendChild(v));

    // counts
    $('#totalCount').textContent=cards().length+'명';
    $('#pendingCount').textContent=cards().filter(c=>c.dataset.status==='pending').length+'명';
    $('#listCount').textContent=cards().length;
    $('#visibleCount').textContent=vis.length;

    updateSelectionUI();
  }

  // search/filter/sort
  q.addEventListener('input',refresh);
  statusSel.addEventListener('change',refresh);
  sortSel.addEventListener('change',refresh);

  // date popover
  function openPop(){ const r=rangeBtn.getBoundingClientRect(); rangePop.style.left=r.left+'px'; rangePop.style.top=(r.bottom + window.scrollY + 6)+'px'; rangePop.style.display='block'; }
  function closePop(){ rangePop.style.display='none'; }
  rangeBtn.addEventListener('click',()=> rangePop.style.display==='block'?closePop():openPop());
  $('#rangeCancel').addEventListener('click',closePop);
  document.addEventListener('click',e=>{ if(rangePop.style.display==='block'&&!rangePop.contains(e.target)&&e.target!==rangeBtn) closePop(); });
  $$('.quick button',rangePop).forEach(b=> b.addEventListener('click',()=>{
    const now=new Date();
    if(b.dataset.preset==='thisMonth'){ const s=new Date(now.getFullYear(),now.getMonth(),1), ee=new Date(now.getFullYear(),now.getMonth()+1,0); startInput.value=s.toISOString().slice(0,10); endInput.value=ee.toISOString().slice(0,10);}
    else if(b.dataset.preset==='lastMonth'){ const s=new Date(now.getFullYear(),now.getMonth()-1,1), ee=new Date(now.getFullYear(),now.getMonth(),0); startInput.value=s.toISOString().slice(0,10); endInput.value=ee.toISOString().slice(0,10);}
    else { startInput.value=''; endInput.value=''; }
  }));
  $('#rangeApply').addEventListener('click',()=>{
    range.start=startInput.value||null; range.end=endInput.value||null;
    rangeLabel.textContent=range.start? (range.end? `${range.start} ~ ${range.end}`:`${range.start} ~ 현재`) : '기간 선택';
    closePop(); refresh();
  });

  // selection
  function visibleChecks(){ return cards().filter(c=>c.style.display!=='none').map(c=>c.querySelector('.rowcheck')); }
  function updateSelectionUI(){
    const checks=visibleChecks();
    const selected=checks.filter(ch=>ch.checked).length;
    selCount.textContent=selected;
    selectAll.checked=checks.length>0&&selected===checks.length;
    const any=selected>0;
    bulkApprove.disabled=!any; bulkReject.disabled=!any;
  }
  selectAll.addEventListener('change',()=>{ visibleChecks().forEach(ch=>ch.checked=selectAll.checked); updateSelectionUI(); });
  list.addEventListener('change',e=>{ if(e.target.classList.contains('rowcheck')) updateSelectionUI(); });

  // per-row actions
  list.addEventListener('click',e=>{
    const btn=e.target.closest('button'); if(!btn) return;
    const card=e.target.closest('.card');

    if(btn.classList.contains('ok')){ // 승인
      card.dataset.status='approved';
      const b=card.querySelector('.name .badge'); b.className='badge b-approve'; b.textContent='승인';
      if(!card.dataset.attend) card.dataset.attend='came';
      refresh();
    }else if(btn.classList.contains('no')){ // 반려
      card.dataset.status='rejected';
      const b=card.querySelector('.name .badge'); b.className='badge b-reject'; b.textContent='반려';
      delete card.dataset.attend; refresh();
    }else if(btn.classList.contains('pill')){ // 출석/결석 토글
      if(btn.textContent.includes('출석')) card.dataset.attend='came';
      if(btn.textContent.includes('결석')) card.dataset.attend='absent';
      syncBadges(card);
    }
  });

  // bulk actions
  function selectedCards(){ return cards().filter(c=>c.style.display!=='none' && c.querySelector('.rowcheck').checked); }
  bulkApprove.addEventListener('click',()=>{ selectedCards().forEach(c=>{ c.dataset.status='approved'; const b=c.querySelector('.name .badge'); b.className='badge b-approve'; b.textContent='승인'; if(!c.dataset.attend) c.dataset.attend='came'; }); refresh(); });
  bulkReject.addEventListener('click',()=>{ selectedCards().forEach(c=>{ c.dataset.status='rejected'; const b=c.querySelector('.name .badge'); b.className='badge b-reject'; b.textContent='반려'; delete c.dataset.attend; }); refresh(); });

  // init
  refresh();