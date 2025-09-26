  // ---------- 지역 선택 ----------
  const regionMap = {
    "서울특별시":["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"],
    "부산광역시":["강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구"],
    "인천광역시":["계양구","남동구","동구","미추홀구","부평구","서구","연수구","중구","강화군","옹진군"],
    "대구광역시":["남구","달서구","달성군","동구","북구","서구","수성구","중구"],
    "대전광역시":["대덕구","동구","서구","유성구","중구"],
    "광주광역시":["광산구","남구","동구","북구","서구"],
    "울산광역시":["남구","동구","북구","중구","울주군"],
    "경기도":["수원시","용인시","성남시","고양시","화성시","부천시","남양주시","안산시","안양시","평택시","시흥시","김포시","의정부시","파주시","광주시"]
  };
  const qSido = document.getElementById('qSido');
  const qGugun = document.getElementById('qGugun');
  qSido.addEventListener('change', ()=>{
    const val = qSido.value;
    qGugun.innerHTML = '<option value="">전체</option>';
    if(!val || !regionMap[val]){ qGugun.disabled = true; return; }
    regionMap[val].forEach(d=>{ const o=document.createElement('option'); o.textContent=d; qGugun.appendChild(o); });
    qGugun.disabled = false;
  });

  // ---------- 샘플 데이터 ----------
  const DATA = [
    {
      id:1, title:'유기견 산책 및 사회화 봉사활동', state:'모집중', tags:['돌봄','활동'],
      recruitFrom:'2024-12-01', recruitTo:'2024-12-20',
      actFrom:'2024-12-15', actTo:'2024-12-22',
      time:'10:00 ~ 15:00 (5시간)', timeType:['오전','오후'],
      region:{sido:'서울특별시', gugun:'강남구'},
      shelter:'사랑보호소', types:['성인'], category:'돌봄',
      createdAt:'2024-12-01'
    },
    {
      id:2, title:'새끼강아지 특별 케어 봉사활동', state:'모집중', tags:['돌봄','의료지원'],
      recruitFrom:'2024-12-20', recruitTo:'2024-12-25',
      actFrom:'2024-12-16', actTo:'2024-12-30',
      time:'14:00 ~ 18:00 (4시간)', timeType:['오후'],
      region:{sido:'부산광역시', gugun:'해운대구'},
      shelter:'동물사랑센터', types:['성인','청소년'], category:'돌봄',
      createdAt:'2024-12-05'
    },
    {
      id:3, title:'유기견 입양 상담 및 안내 봉사', state:'상시', tags:['상담','안내'],
      recruitFrom:'2024-11-01', recruitTo:'2025-02-28',
      actFrom:'2024-12-01', actTo:'2025-02-28',
      time:'13:00 ~ 17:00 (4시간)', timeType:['오후'],
      region:{sido:'대구광역시', gugun:'달서구'},
      shelter:'행복보호소', types:['성인','청소년'], category:'상담',
      createdAt:'2024-11-20'
    },
    {
      id:4, title:'보호견 목욕 및 그루밍 봉사활동', state:'모집중', tags:['돌봄','미용'],
      recruitFrom:'2024-12-10', recruitTo:'2024-12-20',
      actFrom:'2024-12-21', actTo:'2024-12-21',
      time:'10:00 ~ 16:00 (6시간)', timeType:['오전','오후','종일'],
      region:{sido:'인천광역시', gugun:'연수구'},
      shelter:'천사보호소', types:['성인'], category:'미용',
      createdAt:'2024-12-08'
    },
    {
      id:5, title:'노령견 특별 돌봄 프로그램', state:'마감임박', tags:['돌봄','의료지원'],
      recruitFrom:'2024-12-08', recruitTo:'2024-12-14',
      actFrom:'2024-12-15', actTo:'2024-12-29',
      time:'11:00 ~ 15:00 (4시간)', timeType:['오전','오후'],
      region:{sido:'광주광역시', gugun:'북구'},
      shelter:'광화보호소', types:['성인'], category:'돌봄',
      createdAt:'2024-12-06'
    },
    {
      id:6, title:'보호소 환경정비 및 물품정리', state:'모집중', tags:['청소/환경정비'],
      recruitFrom:'2024-12-03', recruitTo:'2024-12-18',
      actFrom:'2024-12-19', actTo:'2024-12-23',
      time:'18:30 ~ 21:00 (2.5시간)', timeType:['야간'],
      region:{sido:'경기도', gugun:'수원시'},
      shelter:'푸름보호소', types:['성인','청소년'], category:'청소/환경정비',
      createdAt:'2024-12-03'
    }
  ];

  // ---------- 상태 배지 스타일 ----------
  function stateClass(st){
    if(st==='모집중') return 'open';
    if(st==='상시') return 'info';
    if(st==='마감임박') return 'warn';
    return 'ghost';
  }

  // ---------- 필터/정렬 ----------
  const els = {
    qTitle: document.getElementById('qTitle'),
    qShelter: document.getElementById('qShelter'),
    qSido, qGugun,
    qCategory: document.getElementById('qCategory'),
    qStatus: document.getElementById('qStatus'),
    qStart: document.getElementById('qStart'),
    qEnd: document.getElementById('qEnd'),
    qAdult: document.getElementById('qAdult'),
    qTeen: document.getElementById('qTeen'),
    qTimeType: document.getElementById('qTimeType'),
    list: document.getElementById('list'),
    count: document.getElementById('resultCount'),
    sortBy: document.getElementById('sortBy'),
    pager: document.getElementById('pager'),
    btnSearch: document.getElementById('btnSearch'),
    btnReset: document.getElementById('btnReset')
  };

  const PAGE_SIZE = 4;
  let currentPage = 1;

  function matches(item){
    const t = els.qTitle.value.trim();
    const s = els.qShelter.value.trim();
    if(t && !item.title.includes(t)) return false;
    if(s && !item.shelter.includes(s)) return false;

    const sido = els.qSido.value, gugun = els.qGugun.value;
    if(sido && item.region.sido !== sido) return false;
    if(gugun && item.region.gugun !== gugun) return false;

    const cat = els.qCategory.value;
    if(cat && item.category !== cat) return false;

    const st = els.qStatus.value;
    if(st && item.state !== st) return false;

    // 봉사기간 겹침 여부
    const qs = els.qStart.value, qe = els.qEnd.value;
    if(qs || qe){
      const a1 = new Date(item.actFrom), a2 = new Date(item.actTo);
      const b1 = qs ? new Date(qs) : new Date('1900-01-01');
      const b2 = qe ? new Date(qe) : new Date('2999-12-31');
      const overlap = a1 <= b2 && b1 <= a2;
      if(!overlap) return false;
    }

    // 유형
    const need = [];
    if(els.qAdult.checked) need.push('성인');
    if(els.qTeen.checked)  need.push('청소년');
    if(need.length && !need.some(x => item.types.includes(x))) return false;

    // 시간대
    const tt = els.qTimeType.value;
    if(tt && !item.timeType.includes(tt)) return false;

    return true;
  }

  function sortItems(arr){
    const v = els.sortBy.value;
    const cp = [...arr];
    if(v==='latest') cp.sort((a,b)=> new Date(b.createdAt)-new Date(a.createdAt));
    else if(v==='oldest') cp.sort((a,b)=> new Date(a.createdAt)-new Date(b.createdAt));
    else if(v==='endSoon') cp.sort((a,b)=> new Date(a.actTo)-new Date(b.actTo));
    return cp;
  }

  function render(){
    const filtered = sortItems(DATA.filter(matches));
    els.count.textContent = `전체 ${filtered.length}건`;
    const start = (currentPage-1)*PAGE_SIZE;
    const pageItems = filtered.slice(start, start+PAGE_SIZE);
    els.list.innerHTML = pageItems.map(item => renderItem(item)).join('');
    renderPager(filtered.length);
    // 버튼 이벤트
    document.querySelectorAll('[data-action="detail"]').forEach(b=>{
      b.addEventListener('click', ()=>{ location.href = `volunteer-detail.html?id=${b.dataset.id}`; });
    });
    document.querySelectorAll('[data-action="apply"]').forEach(b=>{
      b.addEventListener('click', ()=>{ location.href = `volunteer-apply.html?id=${b.dataset.id}`; });
    });
  }

  function renderItem(it){
    return `
      <article class="item">
        <div class="head">
          <div class="tags">
            <span class="state ${stateClass(it.state)}">${it.state}</span>
            ${it.tags.map(t=>`<span class="tag">${t}</span>`).join('')}
          </div>
          <div class="right-actions">
            <button class="btn ghost" data-action="detail" data-id="${it.id}">자세히보기</button>
            <button class="btn primary" data-action="apply" data-id="${it.id}">신청하기</button>
          </div>
        </div>
        <h3 class="title">${it.title}</h3>
        <div class="rows">
          <div>
            <div class="row">${ico('calendar')} <b style="min-width:70px">모집기간:</b> ${it.recruitFrom} ~ ${it.recruitTo}</div>
            <div class="row">${ico('clock')} <b style="min-width:70px">봉사시간:</b> ${it.time}</div>
            <div class="row">${ico('map')} <b style="min-width:70px">활동지역:</b> ${it.region.sido} ${it.region.gugun}</div>
          </div>
          <div>
            <div class="row">${ico('calendar')} <b style="min-width:70px">봉사기간:</b> ${it.actFrom} ~ ${it.actTo}</div>
            <div class="row">${ico('users')} <b style="min-width:70px">모집기관:</b> ${it.shelter}</div>
          </div>
        </div>
      </article>
    `;
  }

  function renderPager(total){
    const pages = Math.max(1, Math.ceil(total / PAGE_SIZE));
    currentPage = Math.min(currentPage, pages);
    const btns = [];
    btns.push(`<button class="pagebtn" ${currentPage===1?'disabled':''} data-p="prev">이전</button>`);
    for(let i=1;i<=pages;i++){
      btns.push(`<button class="pagebtn ${i===currentPage?'active':''}" data-p="${i}">${i}</button>`);
    }
    btns.push(`<button class="pagebtn" ${currentPage===pages?'disabled':''} data-p="next">다음</button>`);
    els.pager.innerHTML = btns.join('');
    els.pager.querySelectorAll('button').forEach(b=>{
      b.addEventListener('click', ()=>{
        const p = b.dataset.p;
        if(p==='prev' && currentPage>1) currentPage--;
        else if(p==='next' && currentPage<pages) currentPage++;
        else if(!isNaN(+p)) currentPage = +p;
        render();
      });
    });
  }

  // icons
  function ico(name){
    if(name==='calendar') return `<svg viewBox="0 0 24 24"><path d="M7 2v2H5a2 2 0 0 0-2 2v2h18V6a2 2 0 0 0-2-2h-2V2h-2v2H9V2H7zm14 8H3v10a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V10z"/></svg>`;
    if(name==='clock') return `<svg viewBox="0 0 24 24"><path d="M12 1a11 11 0 1 0 0 22 11 11 0 0 0 0-22zm1 11V6h-2v7h6v-2h-4z"/></svg>`;
    if(name==='map') return `<svg viewBox="0 0 24 24"><path d="M15 3l-6 2-6-2v18l6 2 6-2 6 2V5l-6-2zm0 2l4 1v14l-4-1-6 2-4-1V5l4 1 6-2z"/></svg>`;
    if(name==='users') return `<svg viewBox="0 0 24 24"><path d="M16 11a4 4 0 1 0-4-4 4 4 0 0 0 4 4zM8 13a4 4 0 1 0-4-4 4 4 0 0 0 4 4zm8 2a6 6 0 0 0-6 6h2a4 4 0 0 1 8 0h2a6 6 0 0 0-6-6zM8 15a6 6 0 0 0-6 6h2a4 4 0 0 1 8 0h2a6 6 0 0 0-6-6z"/></svg>`;
    return '';
  }

  // 이벤트
  els.btnSearch.addEventListener('click', e=>{ e.preventDefault(); currentPage=1; render(); });
  els.btnReset.addEventListener('click', e=>{
    e.preventDefault();
    document.querySelectorAll('input[type="search"]').forEach(i=>i.value='');
    [els.qSido, els.qGugun, els.qCategory, els.qStatus, els.qTimeType, els.sortBy].forEach(s=>s.value='');
    els.qStart.value = ''; els.qEnd.value=''; els.qAdult.checked=false; els.qTeen.checked=false;
    qGugun.disabled = true; currentPage=1; render();
  });
  ['change','keyup'].forEach(ev=>{
    document.querySelectorAll('#qTitle,#qShelter,#qSido,#qGugun,#qCategory,#qStatus,#qStart,#qEnd,#qAdult,#qTeen,#qTimeType,#sortBy').forEach(el=>{
      el.addEventListener(ev, ()=>{ currentPage=1; render(); });
    });
  });

  // 초기 렌더
  render();