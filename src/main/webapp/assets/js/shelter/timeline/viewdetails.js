document.addEventListener('DOMContentLoaded', () => {
    // 좋아요 토글(임시)
    const likeBox = document.getElementById('likeBox');
    if (likeBox) {
      likeBox.addEventListener('click', () => {
        const el = document.getElementById('likeCnt');
        if (!el) return;
        el.textContent = Number(el.textContent) + 1;
      });
    }
  
    // 공유
    const shareBtn = document.getElementById('shareBtn');
    if (shareBtn) {
      shareBtn.addEventListener('click', async () => {
        const data = { title: document.title, text: '타임라인 보기', url: location.href };
        if (navigator.share) {
          try { await navigator.share(data); } catch(e){}
        } else {
          try {
            await navigator.clipboard.writeText(location.href);
            alert('링크가 복사되었습니다.');
          } catch (e) {
            prompt('아래 링크를 복사하세요', location.href);
          }
        }
      });
    }
  
    // 댓글 추가(프론트만)
    const cSubmit = document.getElementById('cSubmit');
    if (cSubmit) {
      cSubmit.addEventListener('click', () => {
        const input = document.getElementById('cInput');
        if (!input) return;
        const text = input.value.trim();
        if(!text) return input.focus();
  
        const safe = text.replace(/</g,'&lt;').replace(/>/g,'&gt;');
        const wrap = document.createElement('div');
        wrap.className = 'comment-card';
        wrap.innerHTML =
          '<div class="comment-head">' +
            '<strong>나</strong><span class="comment-role">방문자</span>' +
            '<span style="margin-left:auto;color:#9a8f86">' + new Date().toLocaleString() + '</span>' +
          '</div>' +
          '<div>' + safe + '</div>';
  
        const list = document.querySelector('.comments');
        list.appendChild(wrap);
        input.value='';
  
        const cnt = document.getElementById('cCnt');
        if (cnt) cnt.textContent = Number(cnt.textContent) + 1;
      });
    }
  });
  