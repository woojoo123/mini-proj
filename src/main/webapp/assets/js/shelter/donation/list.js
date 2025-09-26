const q = document.getElementById('q');
const list = document.getElementById('list');
const fType = document.getElementById('fType');
const fState = document.getElementById('fState');

// 검색 + 필터 (정렬 제거)
function applyFilters(){
  const term = q.value.trim().toLowerCase();
  const t = fType.value;
  const s = fState.value;

  [...list.querySelectorAll('.card')].forEach(el=>{
    const name = el.dataset.name.toLowerCase();
    const matchText = !term || name.includes(term);
    const matchType = (t==='all' || el.dataset.type===t);
    const matchState = (s==='all' || el.dataset.state===s);
    el.style.display = (matchText && matchType && matchState) ? '' : 'none';
  });
}
[q,fType,fState].forEach(el=>el.addEventListener('input', applyFilters));
applyFilters(); // 초기 실행