/* 스위치 공통 토글 */
function bindSwitch(id, initOn){
  var el = document.getElementById(id);
  if(initOn){ el.classList.add('on'); el.setAttribute('aria-checked','true'); }
  el.addEventListener('click', function(){
    var on = this.classList.toggle('on');
    this.setAttribute('aria-checked', on ? 'true' : 'false');
  });
}
bindSwitch('swComments', true);
bindSwitch('swNotify', true);
bindSwitch('swTimeline', false);

/* 갤러리 카운트 */
var g = document.getElementById('gallery');
var gCnt = document.getElementById('gCnt');
g.addEventListener('change', function(){ gCnt.textContent = Math.min(5, this.files.length); });

/* “보호일지 만들기” 버튼 활성화(필수: 품종, 일지 제목) */
var breed = document.getElementById('breed');
var jTitle = document.getElementById('jTitle');
var createBtn = document.getElementById('createBtn');

function checkRequired(){
  var ok = breed.value.trim().length > 0 && jTitle.value.trim().length > 0;
  createBtn.disabled = !ok;
  createBtn.classList.toggle('disabled', !ok);
}
breed.addEventListener('input', checkRequired);
jTitle.addEventListener('input', checkRequired);

/* 버튼 동작(데모) */
createBtn.addEventListener('click', function(){
  if(this.disabled) return;
  alert('보호일지가 생성되었습니다! (예시)\n프로필 상단 문구가 “@@의 보호일지”로 표시되도록 서버에서 업데이트 해주세요.');
});