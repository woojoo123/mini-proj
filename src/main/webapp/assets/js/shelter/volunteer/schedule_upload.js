// --- Region/District cascading select (대표 샘플: 서울/부산 + 일부 광역)
const regionMap = {
  "서울특별시": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"],
  "부산광역시": ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"],
  "인천광역시": ["계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"],
  "대구광역시": ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"],
  "대전광역시": ["대덕구", "동구", "서구", "유성구", "중구"],
  "광주광역시": ["광산구", "남구", "동구", "북구", "서구"],
  "울산광역시": ["남구", "동구", "북구", "중구", "울주군"],
  "경기도": ["수원시", "용인시", "성남시", "고양시", "화성시", "부천시", "남양주시", "안산시", "안양시", "평택시", "시흥시", "김포시", "의정부시", "파주시", "광주시"]
};

const sido = document.getElementById('sido');
const gugun = document.getElementById('gugun');

sido.addEventListener('change', () => {
  const val = sido.value;
  gugun.innerHTML = '';
  if (!val || !regionMap[val]) {
    gugun.innerHTML = '<option>구/군 선택</option>';
    gugun.disabled = true;
    return;
  }
  regionMap[val].forEach(d => {
    const opt = document.createElement('option');
    opt.textContent = d;
    gugun.appendChild(opt);
  });
  gugun.disabled = false;
});

// --- 모집기간: 배타 모드 토글 ---
const rangeChk = document.getElementById('rangeChk');
const multiChk = document.getElementById('multiChk');
const rangeWrap = document.getElementById('rangeWrap');
const multiWrap = document.getElementById('multiWrap');
const startDate = document.getElementById('startDate');
const endDate = document.getElementById('endDate');

function setMode(mode) {
  if (mode === 'range') {
    // ... (그대로)
  } else if (mode === 'multi') {
    rangeChk.checked = false; multiChk.checked = true;
    rangeWrap.hidden = true; multiWrap.hidden = false;
    // 작은 달력 즉시 오픈
    setTimeout(() => { if (multiDate.showPicker) multiDate.showPicker(); else multiDate.focus(); }, 0);
  } else {
    rangeChk.checked = false; multiChk.checked = false;
    rangeWrap.hidden = true; multiWrap.hidden = true;
  }
}
rangeChk.addEventListener('change', () => setMode(rangeChk.checked ? 'range' : 'none'));
multiChk.addEventListener('change', () => setMode(multiChk.checked ? 'multi' : 'none'));

// --- 특정 날짜: 작은 date 입력으로 여러 날짜 선택 ---
const multiDate = document.getElementById('multiDate');
const openMultiDate = document.getElementById('openMultiDate');
const multiChips = document.getElementById('multiChips');
const multiDatesValue = document.getElementById('multiDatesValue');
let multiDates = []; // 'yyyy-mm-dd' 배열

function renderChips() {
  multiChips.innerHTML = '';
  multiDates.forEach(d => {
    const chip = document.createElement('div');
    chip.className = 'chip removable';
    chip.innerHTML = `${d} <button title="삭제" aria-label="${d} 삭제">✕</button>`;
    chip.querySelector('button').addEventListener('click', () => {
      multiDates = multiDates.filter(x => x !== d);
      renderChips();
    });
    multiChips.appendChild(chip);
  });
  multiDatesValue.value = multiDates.join(',');
}

// 날짜 선택 시: 배열에 누적하고, 입력값 비운 뒤 달력 다시 열기
multiDate.addEventListener('change', () => {
  const d = multiDate.value;
  if (d && !multiDates.includes(d)) {
    multiDates.push(d);
    multiDates.sort();
    renderChips();
  }
  // multiDate.value = '';
  // 크롬/엣지 등 지원 브라우저에서 달력을 다시 띄워 연속 선택
  setTimeout(() => { if (multiDate.showPicker) multiDate.showPicker(); }, 0);
});





// 취소 버튼
document.getElementById('cancelBtn').addEventListener('click', () => {
  if (confirm('작성 중인 내용을 모두 지울까요?')) {
    document.getElementById('volunteerForm').reset();
    gugun.innerHTML = '<option>구/군 선택</option>';
    gugun.disabled = true;
    rangeWrap.hidden = true;
    patternWrap.hidden = true;
    multiDates = []; renderChips(); setMode('none');
  }
});

// 미리보기
const modal = document.getElementById('previewModal');
const previewBody = document.getElementById('previewBody');

document.getElementById('previewBtn').addEventListener('click', () => {
  const data = collectForm();
  previewBody.innerHTML = `
    <div class="kv"><b>활동명</b><div>\${esc(data.title)}</div></div>
    <div class="kv"><b>모집기관</b><div>\${esc(data.org)}</div></div>
    <div class="kv"><b>모집상태</b><div>\${esc(data.status)}</div></div>
    <div class="kv"><b>주소</b><div>\${esc(data.addr)} ${esc(data.addrDetail)}</div></div>
    <div class="kv"><b>담당자</b><div>\${esc(data.manager)} / ${esc(data.phone)} / ${esc(data.email)}</div></div>
    <div class="kv"><b>봉사지역</b><div>\${esc(data.sido)} ${esc(data.gugun)}</div></div>
    <div class="kv"><b>봉사분야</b><div>\${esc(data.category)}</div></div>
    <div class="kv"><b>모집기간</b><div>\${esc(data.period)}</div></div>
    <div class="kv"><b>봉사자유형</b><div>\${data.types.join(', ') || '-'}</div></div>
    <div class="kv"><b>모집인원</b><div>\${data.capacity ? data.capacity + '명' : '-'}</div></div>
    <div class="kv"><b>활동시간</b><div>\${esc(data.startTime)} ~ ${esc(data.endTime)}</div></div>
    <div class="kv"><b>활동내용</b><div>\${nl2br(esc(data.desc))}</div></div>
    <div class="kv"><b>준비물</b><div>\${nl2br(esc(data.items))}</div></div>
    <div class="kv"><b>유의사항</b><div>\${nl2br(esc(data.notes))}</div></div>
  `;
  modal.classList.add('open');
  modal.setAttribute('aria-hidden', 'false');
});
document.getElementById('closePreview').addEventListener('click', closeModal);
modal.addEventListener('click', (e) => { if (e.target === modal) closeModal(); });
function closeModal() { modal.classList.remove('open'); modal.setAttribute('aria-hidden', 'true'); }

// 등록 (데모용)
document.getElementById('volunteerForm').addEventListener('submit', (e) => {
  e.preventDefault();
  const requiredOk = document.getElementById('title').value.trim().length > 0;
  if (!requiredOk) { alert('활동명을 입력해주세요.'); return; }
  alert('임시 저장 되었습니다. (연동 시 API 호출로 교체)');
});

// Utils
function collectForm() {
  const types = [];
  if (document.getElementById('adult').checked) types.push('성인');
  if (document.getElementById('teen').checked) types.push('청소년');
  let period = '기간 미지정';
  if (rangeChk.checked) {
    const s = startDate.value, e = endDate.value;
    period = (s && e) ? `${s} ~ ${e}` : '연속 기간';
  } else if (multiChk.checked) {
    period = multiDates.length ? multiDates.join(', ') : '특정 날짜 미선택';
  }



  if (patternChk.checked) {
    const t = document.getElementById('patternText').value;
    period += (period ? ' / ' : '') + (t || '특정 요일/패턴');
  }
  if (!rangeChk.checked && !patternChk.checked) { period = '기간 미지정'; }

  return {
    title: val('title'),
    org: val('org'),
    status: val('status'),
    addr: val('addr'),
    addrDetail: val('addrDetail'),
    manager: val('manager'),
    phone: val('phone'),
    email: val('email'),
    sido: document.getElementById('sido').value || '',
    gugun: document.getElementById('gugun').disabled ? '' : document.getElementById('gugun').value,
    category: val('category'),
    period,
    types,
    capacity: val('capacity'),
    startTime: val('startTime'),
    endTime: val('endTime'),
    desc: val('desc'),
    items: val('items'),
    notes: val('notes')
  };
}
function val(id) { return document.getElementById(id)?.value?.trim() || '' }
function esc(s) { return (s || '').replace(/[&<>"']/g, m => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[m])) }
function nl2br(s) { return s.replace(/\n/g, '<br>') }