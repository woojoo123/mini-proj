document.getElementById('shareBtn').addEventListener('click', function(){
  var data = {title: document.title, text:'동물 프로필 보기', url: location.href};
  if(navigator.share){ navigator.share(data).catch(function(){}); }
  else{ navigator.clipboard.writeText(location.href); alert('링크가 복사되었습니다.'); }
});