// 통계 페이지 JavaScript
document.addEventListener('DOMContentLoaded', function () {
    // 차트 플레이스홀더에 클릭 이벤트 추가
    const chartPlaceholders = document.querySelectorAll('.chart-placeholder');
    chartPlaceholders.forEach(placeholder => {
        placeholder.addEventListener('click', function () {
            alert('실제 구현에서는 Chart.js나 D3.js 등을 사용하여 차트를 렌더링합니다.');
        });
    });

    // 요약 카드 애니메이션
    const summaryCards = document.querySelectorAll('.summary-card');
    summaryCards.forEach((card, index) => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';

        setTimeout(() => {
            card.style.transition = 'all 0.5s ease';
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
        }, index * 100);
    });

    // 최근 활동 실시간 업데이트 시뮬레이션
    setInterval(() => {
        const activities = document.querySelectorAll('.activity-item');
        if (activities.length > 0) {
            const randomActivity = activities[Math.floor(Math.random() * activities.length)];
            randomActivity.style.backgroundColor = '#f8f9fa';
            setTimeout(() => {
                randomActivity.style.backgroundColor = 'transparent';
            }, 2000);
        }
    }, 10000);
});