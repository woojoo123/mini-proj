document.getElementById('shareBtn').addEventListener('click', function(){
  const data = {title: document.title, text:'보호소 프로필', url: location.href};
  if(navigator.share){ navigator.share(data).catch(()=>{}); }
  else{ navigator.clipboard.writeText(location.href); alert('링크가 복사되었습니다.'); }
});