/* 탭 전환 (표시만) */
const tabs = document.querySelectorAll('.tab');
const listIn = document.getElementById('list-in');
const listOut = document.getElementById('list-out');
tabs.forEach(t=>{
  t.addEventListener('click',()=>{
    tabs.forEach(x=>x.classList.remove('active'));
    t.classList.add('active');
    const key = t.dataset.tab;
    listIn.style.display = key==='in' ? '' : 'none';
    listOut.style.display = key==='out' ? '' : 'none';
  });
});