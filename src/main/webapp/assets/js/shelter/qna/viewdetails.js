 const ta = document.getElementById('answer');
  const send = document.getElementById('sendBtn');
  const resetBtn = document.getElementById('resetBtn');
  const fileInput = document.getElementById('file');
  const fileList = document.getElementById('fileList');

  function toggleSend(){
    const hasText = ta.value.trim().length > 0;
    send.classList.toggle('enabled', hasText);
    send.disabled = !hasText;
  }
  ta.addEventListener('input', toggleSend);
  toggleSend();

  resetBtn.addEventListener('click', (e)=>{
    e.preventDefault();
    ta.value = '';
    fileInput.value = '';
    fileList.textContent = '이미지, PDF, DOC 파일 (최대 10MB)';
    toggleSend();
  });

  fileInput.addEventListener('change', ()=>{
    if(!fileInput.files.length){ fileList.textContent = '이미지, PDF, DOC 파일 (최대 10MB)'; return; }
    const names = [...fileInput.files].map(f=>`${f.name} (${(f.size/1024/1024).toFixed(2)}MB)`);
    fileList.textContent = names.join(', ');
  });

  // 데모 전송
  send.addEventListener('click', ()=>{
    if(send.disabled) return;
    alert('답변이 전송되었습니다. (데모)');
  });