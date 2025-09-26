// 공개 스위치
var pub = document.getElementById('pubSwitch');
pub.addEventListener('click', function(){ this.classList.toggle('on'); this.setAttribute('aria-checked', this.classList.contains('on')); });

// 운영시간 행 생성
var days = ['월요일','화요일','수요일','목요일','금요일','토요일','일요일'];
var hoursList = document.getElementById('hoursList');

function makeHourRow(day, isHoliday){
  var row = document.createElement('div'); row.className='hour-row';

  var label = document.createElement('div'); label.className='day-label'; label.textContent = day;
  row.appendChild(label);

  var onWrap = document.createElement('div'); onWrap.className='hour-on';
  var sw = document.createElement('div'); sw.className='small-switch'+(isHoliday?'':' on'); sw.setAttribute('role','switch');
  var txt = document.createElement('span'); txt.textContent = isHoliday ? '휴무' : '운영';
  onWrap.appendChild(sw); onWrap.appendChild(txt);
  row.appendChild(onWrap);

  var tr = document.createElement('div'); tr.className='time-range';
  if(isHoliday){ tr.style.opacity='.45'; }
  var t1 = document.createElement('div'); t1.className='time';
  var i1 = document.createElement('input'); i1.type='time'; i1.value='09:00';
  t1.appendChild(document.createTextNode('오전')); t1.appendChild(i1);
  var mid = document.createElement('span'); mid.textContent='~';
  var t2 = document.createElement('div'); t2.className='time';
  var i2 = document.createElement('input'); i2.type='time'; i2.value = (day==='토요일' ? '17:00' : '18:00');
  t2.appendChild(document.createTextNode('오후')); t2.appendChild(i2);
  tr.appendChild(t1); tr.appendChild(mid); tr.appendChild(t2);
  if(isHoliday){ i1.disabled = true; i2.disabled = true; }

  sw.addEventListener('click', function(){
    var on = this.classList.toggle('on');
    txt.textContent = on ? '운영' : '휴무';
    i1.disabled = !on; i2.disabled = !on;
    tr.style.opacity = on ? '1' : '.45';
  });

  row.appendChild(tr);
  return row;
}
for(var d=0; d<days.length; d++){
  hoursList.appendChild(makeHourRow(days[d], days[d]==='일요일'));
}

// 이미지 개수 카운트
var g = document.getElementById('gallery'), gCount = document.getElementById('imgCount');
g.addEventListener('change', function(){ gCount.textContent = Math.min(10, this.files.length); });

// 파일 버튼 클릭 뷰
document.querySelectorAll('.btn-file').forEach(function(btn){
  var input = btn.querySelector('input[type="file"]');
  btn.addEventListener('click', function(){ if(input) input.click(); });
});