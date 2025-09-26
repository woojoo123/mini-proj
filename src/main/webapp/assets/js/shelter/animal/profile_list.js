/* 총 개수 반영 */
document.getElementById('totalCnt').textContent =
  document.querySelectorAll('#container .card').length;

/* 검색 */
var q = document.getElementById('q');
q.addEventListener('input', function(){
  var v = this.value.toLowerCase().trim();
  document.querySelectorAll('#container .card').forEach(function(card){
    var name = card.dataset.name.toLowerCase();
    var breed = card.dataset.breed.toLowerCase();
    card.style.display = (name.indexOf(v)>-1 || breed.indexOf(v)>-1) ? '' : 'none';
  });
});

/* 보기 전환 */
var container = document.querySelector('main');
document.getElementById('viewGrid').addEventListener('click', function(){
  container.classList.remove('list');
});
document.getElementById('viewList').addEventListener('click', function(){
  container.classList.add('list');
});

/* 버튼 예시 */
document.getElementById('addBtn').addEventListener('click', function(){
  alert('동물 등록 화면으로 이동(예시)');
});
document.getElementById('filterBtn').addEventListener('click', function(){
  alert('필터 패널은 추후 연결(예시)');
});
document.getElementById('sortBtn').addEventListener('click', function(){
  alert('정렬 옵션은 추후 연결(예시)');
});