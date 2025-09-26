/* 스위치 */
var pub = document.getElementById('pubSwitch');
pub.addEventListener('click', function(){ this.classList.toggle('on'); this.setAttribute('aria-checked', this.classList.contains('on')); });
var cmt = document.getElementById('cmtSwitch');
cmt.classList.add('on'); cmt.setAttribute('aria-checked','true');
cmt.addEventListener('click', function(){ this.classList.toggle('on'); this.setAttribute('aria-checked', this.classList.contains('on')); });

/* 태그 입력 */
var tagBox = document.getElementById('tagBox');
var tagInput = document.getElementById('tagInput');
function addTag(t){
  if(!t) return;
  var span = document.createElement('span');
  span.className='tag';
  span.innerHTML = t.replace(/</g,'&lt;').replace(/>/g,'&gt;') +
                   ' <button type="button" aria-label="삭제">×</button>';
  span.querySelector('button').addEventListener('click', function(){ tagBox.removeChild(span); });
  tagBox.insertBefore(span, tagInput);
}
tagInput.addEventListener('keydown', function(e){
  var key = e.key || e.keyCode;
  if(key==='Enter' || key===13){
    e.preventDefault();
    var v = tagInput.value.trim();
    if(v){ addTag(v); tagInput.value=''; }
  }
});

/* 미디어 카운트 */
var media = document.getElementById('media');
var mediaCnt = document.getElementById('mediaCnt');
media.addEventListener('change', function(){ mediaCnt.textContent = Math.min(10, this.files.length); });

/* 발행 버튼 활성화(필수: 동물/제목/내용) */
var animal = document.getElementById('animal');
var titleEl = document.getElementById('title');
var bodyEl = document.getElementById('body');
var publishBtn = document.getElementById('publishBtn');

function checkRequired(){
  var ok = animal.selectedIndex > 0 && titleEl.value.trim().length > 0 && bodyEl.value.trim().length > 0;
  publishBtn.disabled = !ok;
  publishBtn.classList.toggle('primary', !ok);
}
animal.addEventListener('change', checkRequired);
titleEl.addEventListener('input', checkRequired);
bodyEl.addEventListener('input', checkRequired);

/* 버튼 동작(데모) */
document.getElementById('draftBtn').addEventListener('click', function(){ alert('임시 저장되었습니다(예시).'); });
publishBtn.addEventListener('click', function(){
  if(publishBtn.disabled) return;
  alert('발행되었습니다(예시). 실제 저장 로직 연결 필요!');
});