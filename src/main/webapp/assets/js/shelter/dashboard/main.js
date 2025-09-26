/* ===== 더미 데이터 (연동 시 API로 교체) ===== */
const dogs = [
  {name:'로제', age:'2살', sex:'암', breed:'믹스', status:'입양대기', img:null},
  {name:'콩이', age:'3살', sex:'수', breed:'푸들', status:'입양대기', img:null},
  {name:'해피', age:'1살', sex:'수', breed:'치와와', status:'특별케어', img:null},
  {name:'루비', age:'4살', sex:'암', breed:'진도믹스', status:'입양상담중', img:null},
  {name:'보리', age:'5살', sex:'수', breed:'리트리버', status:'입양대기', img:null}
];
const volunteers = [
  {title:'강아지 산책 동행', desc:'사회화 산책 및 기본 예절 지도', from:'2024-12-12', to:'2024-12-12', time:'09:00~12:00', state:'모집중'},
  {title:'세척/정리 봉사', desc:'급식기·케이지 세척 및 물품 정리', from:'2024-12-14', to:'2024-12-14', time:'14:00~16:00', state:'모집중'},
  {title:'포토봉사', desc:'입양 사진 촬영 보조', from:'2024-12-18', to:'2024-12-18', time:'13:00~15:00', state:'상시'}
];
const donations = [
  {label:'정기후원', amount:420000},
  {label:'일시후원', amount:180000},
  {label:'현물환산', amount:30000}
];
const inquiries = [
  {title:'입양 절차 문의', user:'김가영', date:'2024-12-08', status:'대기'},
  {title:'후원 영수증 발급', user:'서준호', date:'2024-12-07', status:'처리중'},
  {title:'봉사 스케줄 문의', user:'홍지민', date:'2024-12-06', status:'완료'}
];
const posts = [
  {title:'12월 봉사자 모집 공지', date:'2024-12-07', comments:5},
  {title:'겨울철 케어 팁', date:'2024-12-05', comments:8},
  {title:'입양 후기 모음', date:'2024-12-02', comments:3}
];

/* ===== 유틸 ===== */
const fmtMoney = n => (n||0).toLocaleString('ko-KR') + '원';
function stateClass(s){ return s==='모집중' ? 'ok' : (s==='상시' ? 'info' : 'warn'); }
function svgPaw(name, hue){
  const bg = `hsl(${hue}, 40%, 86%)`;
  const paw = encodeURIComponent('🐾');
  const text = encodeURIComponent(name.slice(0,2));
  return `data:image/svg+xml;utf8,
    <svg xmlns='http://www.w3.org/2000/svg' width='140' height='140'>
      <rect width='100%' height='100%' fill='${bg}'/>
      <text x='50%' y='52%' dominant-baseline='middle' text-anchor='middle' font-size='48'>${paw}</text>
      <text x='6%' y='90%' font-size='16' fill='%235a4b40' font-weight='700'>${text}</text>
    </svg>`;
}

/* ===== KPI ===== */
(function fillKPIs(){
  const total = dogs.length;
  const adoptable = dogs.filter(d => /입양대기|입양가능/i.test(d.status)).length;
  const totalDon = donations.reduce((s,x)=>s+x.amount,0);
  document.getElementById('kpiDogs').textContent = total;
  document.getElementById('kpiAdoptable').textContent = adoptable;
  document.getElementById('kpiTotalDon').textContent = fmtMoney(totalDon);
  document.getElementById('kpiMonthDon').textContent  = fmtMoney(totalDon); // 데모용
})();

/* ===== 강아지 게시글형 리스트 ===== */
(function renderDogs(){
  const el = document.getElementById('dogFeed');
  el.innerHTML = dogs.map((d,i)=>`
    <article class="item">
      <img class="thumb" alt="${d.name}" src="${d.img || svgPaw(d.name,(i*47)%360)}">
      <div>
        <h4 class="title">${d.name}</h4>
        <div class="meta">${d.breed} · ${d.age} · ${d.sex}</div>
      </div>
      <span class="tag">${d.status}</span>
    </article>
  `).join('');
})();

/* ===== 봉사 일정 ===== */
(function renderVolunteers(){
  const el = document.getElementById('volList');
  el.innerHTML = volunteers.map(v=>`
    <div class="row">
      <div>
        <div style="font-weight:900">${v.title}</div>
        <div class="hint">${v.from} ~ ${v.to} · ${v.time}</div>
        <div class="hint" style="margin-top:4px">${v.desc}</div>
      </div>
      <span class="state ${stateClass(v.state)}">${v.state}</span>
    </div>
  `).join('');
})();

/* ===== 문의 & 게시글 ===== */
(function renderInquiries(){
  const el = document.getElementById('inqList');
  el.innerHTML = inquiries.map(q=>`
    <div class="row">
      <div>
        <div style="font-weight:900">${q.title}</div>
        <div class="hint">${q.user} · ${q.date}</div>
      </div>
      <span class="tag">${q.status}</span>
    </div>
  `).join('');
})();
(function renderPosts(){
  const el = document.getElementById('postList');
  el.innerHTML = posts.map(p=>`
    <div class="row">
      <div>
        <div style="font-weight:900">${p.title}</div>
        <div class="hint">${p.date}</div>
      </div>
      <span class="tag">댓글 ${p.comments}</span>
    </div>
  `).join('');
})();