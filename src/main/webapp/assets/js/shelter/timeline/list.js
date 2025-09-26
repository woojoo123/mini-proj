/* --------- 더미 데이터(후에 서버 데이터로 대체) ---------- */
var POSTS = [
  {
    author:"사랑보호소", role:"보호소", date:"2024.01.25 14:30",
    tag:"봉사활동", title:"새로운 봉사자분들과 함께한 즐거운 시간",
    excerpt:"오늘 새로 오신 봉사자분들과 함께 아이들 산책을 다녀왔습니다. 초코는 처음 보는 사람에게도 금세 친해져서 꼬리를 흔들며 다가왔어요.",
    images:[
      "https://images.unsplash.com/photo-1543466835-00a7907e9de1?q=80&w=1200&auto=format&fit=crop",
      "https://images.unsplash.com/photo-1534361960057-19889db9621e?q=80&w=1200&auto=format&fit=crop"
    ],
    animals:["초코"], stats:{like:24,comment:8,view:156}
  },
  {
    author:"김수의사", role:"관리자", date:"2024.01.24 16:45",
    tag:"의료기록", title:"구조견 ‘나비’의 건강검진 결과",
    excerpt:"어제 구조된 나비의 건강검진을 받았습니다. 다행히 큰 이상은 없고 치료 중이에요.",
    images:[
      "https://images.unsplash.com/photo-1508672019048-805c876b67e2?q=80&w=1200&auto=format&fit=crop"
    ],
    animals:["나비"], stats:{like:26,comment:9,view:210}
  },
  {
    author:"사랑보호소", role:"보호소", date:"2024.01.22 09:15",
    tag:"후원감사", title:"겨울철 사료 후원에 감사드립니다",
    excerpt:"추운 겨울을 맞아 많은 분들이 사료와 간식을 후원해주셨습니다. 진심으로 감사드립니다.",
    images:[],
    animals:[], stats:{like:42,comment:15,view:321}
  },
  {
    author:"이민정", role:"봉사자", date:"2024.01.21 15:30",
    tag:"일상기록", title:"아침 산책 시간 - 아이들의 즐거운 하루",
    excerpt:"햇살이와 구름이는 서로 장난치며 뛰어다니고, 달이는 옆에서 걸어주네요.",
    images:[
      "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?q=80&w=1200&auto=format&fit=crop"
    ],
    animals:["햇살이","구름이","달이"], stats:{like:19,comment:6,view:98}
  }
];
// 샘플을 늘려 초기 25개로 구성
for(var i=POSTS.length;i<25;i++){
  var base = POSTS[i%POSTS.length];
  POSTS.push({
    author: base.author, role: base.role, date: "2024.01."+(10+i%15)+" 10:"+((i*3)%60).toString().padStart(2,'0'),
    tag: base.tag, title: base.title+" ("+(i+1)+")",
    excerpt: base.excerpt,
    images: (i%3===0)? base.images.slice(0,1) : base.images.slice(0,2),
    animals: base.animals, stats:{like: base.stats.like+i%7, comment: base.stats.comment+i%3, view: base.stats.view+i*5}
  });
}

/* --------- 렌더링 --------- */
var pageSize = 10;   // 처음에 10개
var cursor = 0;

function el(tag, cls, html){
  var e = document.createElement(tag);
  if(cls) e.className = cls;
  if(html!=null) e.innerHTML = html;
  return e;
}

function makeCard(p){
  var card = el('article','card');

  // head
  var head = el('div','head');
  var avatar = el('div','avatar'); avatar.textContent = p.author.charAt(0);
  head.appendChild(avatar);

  var info = el('div');
  info.appendChild(el('div','name-row',
    '<span>'+p.author+'</span> <span class="badge">'+p.role+'</span>'));
  info.appendChild(el('div','meta', p.date));
  info.appendChild(el('h2','title',
    '<span class="tag">'+p.tag+'</span> '+p.title));
  card.appendChild(head);
  head.appendChild(info);

  // tag area to the right
  var tagRight = el('div','tag', p.tag); // 시각 정렬용
  tagRight.style.visibility='hidden'; // 오른쪽 컬럼 채움(레이아웃 안정)
  head.appendChild(tagRight);

  // excerpt
  if(p.excerpt){ card.appendChild(el('p','excerpt', p.excerpt)); }

  // gallery
  if(p.images && p.images.length){
    var gal = el('div','gallery'+(p.images.length===1?' one':''));
    for(var i=0;i<p.images.length;i++){
      var img = document.createElement('img'); img.src = p.images[i]; img.alt='image';
      gal.appendChild(img);
    }
    card.appendChild(gal);
  }

  // related animals
  if(p.animals && p.animals.length){
    card.appendChild(el('div','subtle','관련 동물'));
    var chips = el('div','chips');
    for(var j=0;j<p.animals.length;j++){
      chips.appendChild(el('span','chip', p.animals[j]));
    }
    card.appendChild(chips);
  }

  // footer
  var footer = el('div','footer');
  var nums = el('div','nums',
    '♡ '+p.stats.like+' &nbsp; 💬 '+p.stats.comment+' &nbsp; 👁️ '+p.stats.view);
  var share = el('button','share','공유');
  share.onclick = function(){
    var data = {title: p.title, text:'타임라인 보기', url: location.href};
    if(navigator.share){ navigator.share(data).catch(function(){}); }
    else { navigator.clipboard.writeText(location.href); alert('링크가 복사되었습니다.'); }
  };
  footer.appendChild(nums);
  footer.appendChild(share);
  card.appendChild(footer);
  return card;
}

function renderNext(){
  var list = document.getElementById('list');
  var end = Math.min(cursor+pageSize, POSTS.length);
  for(var i=cursor;i<end;i++){ list.appendChild(makeCard(POSTS[i])); }
  cursor = end;
  if(cursor>=POSTS.length){ document.getElementById('moreBtn').classList.add('hidden'); }
}

document.getElementById('moreBtn').addEventListener('click', renderNext);

// 검색(간단 필터)
document.getElementById('search').addEventListener('input', function(e){
  var q = e.target.value.trim();
  var list = document.getElementById('list');
  list.innerHTML='';
  cursor = 0;

  // 검색어 있으면 전체에서 필터 후 10개부터 다시 렌더
  var src = POSTS;
  if(q){
    var lower = q.toLowerCase();
    src = POSTS.filter(function(p){
      return (p.title.toLowerCase().indexOf(lower)>-1) ||
             (p.excerpt.toLowerCase().indexOf(lower)>-1) ||
             (p.tag && p.tag.toLowerCase().indexOf(lower)>-1);
    });
  }
  window.__filtered = src;
  // 재정의된 렌더
  function renderNextFiltered(){
    var end = Math.min(cursor+pageSize, window.__filtered.length);
    for(var i=cursor;i<end;i++){ list.appendChild(makeCard(window.__filtered[i])); }
    cursor = end;
    document.getElementById('moreBtn').classList.toggle('hidden', cursor>=window.__filtered.length);
  }
  window.renderNext = renderNextFiltered; // 버튼이 이 함수를 쓰도록 바꿈
  renderNextFiltered();
});

// 초기 목록 10개
window.__filtered = POSTS;
window.renderNext = renderNext;
renderNext();