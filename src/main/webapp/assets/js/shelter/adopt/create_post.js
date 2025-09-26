 // 필수값 검사
  const required = [document.getElementById('animal'), document.getElementById('fee'), document.getElementById('process')];
  const submitBtn = document.getElementById('submitBtn');
  const topSubmit = document.getElementById('topSubmit');

  function validate(){
    const ok = required.every(el => (el.value||"").trim().length>0);
    submitBtn.disabled = !ok;
    topSubmit.disabled = !ok;
  }
  required.forEach(el => el.addEventListener('input', validate));
  validate();

  // 버튼 동작(데모)
  document.getElementById('saveBtn').addEventListener('click', ()=>alert('임시 저장되었습니다 (데모)'));
  submitBtn.addEventListener('click', ()=>alert('등록이 완료되었습니다 (데모)'));
  topSubmit.addEventListener('click', ()=>submitBtn.click());
  document.getElementById('cancelBtn').addEventListener('click', ()=>history.back());