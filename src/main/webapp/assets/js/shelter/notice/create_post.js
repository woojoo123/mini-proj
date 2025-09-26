 // counter
  const title = document.getElementById('title');
  const content = document.getElementById('content');
  const titleCount = document.getElementById('titleCount');
  const contentCount = document.getElementById('contentCount');
  const files = document.getElementById('files');
  const fileInfo = document.getElementById('fileInfo');

  title.addEventListener('input', ()=> titleCount.textContent = `${title.value.length} / 100`);
  content.addEventListener('input', ()=> contentCount.textContent = `${content.value.length}자`);

  files.addEventListener('change', ()=> {
    if(files.files.length === 0) fileInfo.textContent = '첨부 없음';
    else fileInfo.textContent = `${files.files.length}개 파일 선택`;
  });

  // switches
  function toggle(el){
    el.classList.toggle('on');
    el.setAttribute('aria-checked', el.classList.contains('on'));
  }
  document.getElementById('switchPublish').addEventListener('click', function(){ toggle(this); });
  document.getElementById('switchPin').addEventListener('click', function(){ toggle(this); });

  // action buttons (demo)
  function collectData(){
    return {
      title: title.value.trim(),
      content: content.value.trim(),
      category: document.getElementById('category').value,
      publishNow: document.getElementById('switchPublish').classList.contains('on'),
      pinTop: document.getElementById('switchPin').classList.contains('on'),
      files: files.files.length
    };
  }

  document.getElementById('previewBtn').addEventListener('click', ()=>{
    const d = collectData();
    if(!d.title && !d.content){ alert('제목 또는 내용을 입력하세요.'); return; }
    // 미리보기는 별도 모달/페이지로 연결해야 합니다. 여기선 간단히 JSON 출력.
    const w = window.open('', '_blank', 'width=800,height=600');
    w.document.write(`<pre>${JSON.stringify(d,null,2)}</pre>`);
  });

  document.getElementById('saveDraftBtn').addEventListener('click', ()=>{
    const d = collectData();
    alert('임시저장됨(샘플):\\n' + JSON.stringify(d,null,2));
    // 실제로는 AJAX/폼 전송으로 서버에 저장하세요.
  });

  document.getElementById('publishBtn').addEventListener('click', ()=>{
    const d = collectData();
    if(!d.title){ alert('제목을 입력하세요'); return; }
    if(!d.content){ if(!confirm('내용이 비어있습니다. 그래도 게시하시겠습니까?')) return; }
    alert('게시 처리(샘플):\\n' + JSON.stringify(d,null,2));
    // 실제 게시 로직: 서버에 POST 요청 또는 form.submit()
  });

  // keyboard: Ctrl+Enter 게시
  document.addEventListener('keydown', (e)=>{
    if((e.ctrlKey || e.metaKey) && e.key === 'Enter'){
      document.getElementById('publishBtn').click();
    }
  });