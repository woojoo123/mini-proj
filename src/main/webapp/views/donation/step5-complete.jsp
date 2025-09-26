<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후원 완료 | Shelter</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-light: #F1DEC9;
            --primary-dark: #3C2A21;
            --secondary-light: #FFF8EA;
            --accent: #A4907C;
            --text-dark: #000000;
            --text-gray: #777777;
            --bg-light: #F9F9F9;
            --donation-primary: #4CAF50;
            --donation-hover: #45a049;
            --success: #28a745;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: var(--text-dark);
            font-family: 'Noto Sans KR', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }

        .completion-container {
            max-width: 600px;
            width: 100%;
        }

        .success-animation {
            text-align: center;
            margin-bottom: 2rem;
        }

        .success-icon {
            width: 100px;
            height: 100px;
            background: var(--success);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem;
            animation: heartbeat 2s ease-in-out infinite;
        }

        .success-icon i {
            font-size: 3rem;
            color: white;
        }

        @keyframes heartbeat {
            0% { transform: scale(1); }
            14% { transform: scale(1.1); }
            28% { transform: scale(1); }
            42% { transform: scale(1.1); }
            70% { transform: scale(1); }
        }

        .completion-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .card-header {
            background: linear-gradient(135deg, var(--donation-primary) 0%, #45a049 100%);
            color: white;
            padding: 2rem;
            text-align: center;
        }

        .card-header h1 {
            margin: 0 0 0.5rem 0;
            font-size: 2rem;
            font-weight: 700;
        }

        .card-header p {
            margin: 0;
            font-size: 1.1rem;
            opacity: 0.9;
        }

        .card-body {
            padding: 2rem;
        }

        .thank-you-message {
            background: var(--secondary-light);
            border-radius: 16px;
            padding: 2rem;
            text-align: center;
            margin-bottom: 2rem;
            border-left: 5px solid var(--donation-primary);
        }

        .thank-you-message h3 {
            color: var(--primary-dark);
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .thank-you-message p {
            color: var(--text-gray);
            line-height: 1.7;
            margin: 0;
        }

        .shelter-message {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            border-left: 4px solid var(--accent);
        }

        .shelter-profile {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 16px;
            margin-bottom: 1rem;
        }

        .donation-summary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 16px;
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .summary-title {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .summary-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .summary-item {
            text-align: center;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
        }

        .summary-label {
            font-size: 0.9rem;
            opacity: 0.8;
            margin-bottom: 0.5rem;
        }

        .summary-value {
            font-size: 1.2rem;
            font-weight: 600;
        }

        .payment-id {
            text-align: center;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            font-family: monospace;
            font-size: 1.1rem;
        }

        .next-steps {
            background: white;
            border: 2px solid #e3f2fd;
            border-radius: 16px;
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .steps-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--primary-dark);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .step-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1rem;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 12px;
        }

        .step-item:last-child {
            margin-bottom: 0;
        }

        .step-number {
            width: 30px;
            height: 30px;
            background: var(--donation-primary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        .step-content {
            flex: 1;
        }

        .step-title {
            font-weight: 600;
            margin-bottom: 0.3rem;
        }

        .step-desc {
            color: var(--text-gray);
            font-size: 0.9rem;
        }

        .action-buttons {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        .btn-primary {
            background: var(--donation-primary);
            border: none;
            border-radius: 12px;
            padding: 1rem;
            font-weight: 600;
            color: white;
            text-decoration: none;
            text-align: center;
            transition: background 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-primary:hover {
            background: var(--donation-hover);
            color: white;
        }

        .btn-secondary {
            background: white;
            border: 2px solid var(--accent);
            border-radius: 12px;
            padding: 1rem;
            font-weight: 600;
            color: var(--accent);
            text-decoration: none;
            text-align: center;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-secondary:hover {
            background: var(--accent);
            color: white;
        }

        .receipt-download {
            text-align: center;
            margin-top: 1rem;
        }

        .receipt-btn {
            background: rgba(76, 175, 80, 0.1);
            border: 2px solid var(--donation-primary);
            border-radius: 12px;
            padding: 1rem 2rem;
            color: var(--donation-primary);
            text-decoration: none;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            transition: all 0.3s ease;
        }

        .receipt-btn:hover {
            background: var(--donation-primary);
            color: white;
        }

        @media (max-width: 768px) {
            .summary-grid {
                grid-template-columns: 1fr;
            }

            .action-buttons {
                grid-template-columns: 1fr;
            }

            .card-header h1 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="completion-container">
        <!-- 성공 애니메이션 -->
        <div class="success-animation">
            <div class="success-icon">
                <i class="fas fa-heart"></i>
            </div>
        </div>

        <!-- 완료 카드 -->
        <div class="completion-card">
            <div class="card-header">
                <h1>후원이 완료되었습니다!</h1>
                <p>따뜻한 마음에 깊이 감사드립니다</p>
            </div>

            <div class="card-body">
                <!-- 감사 메시지 -->
                <div class="thank-you-message">
                    <h3><i class="fas fa-paw me-2"></i>행복한 강아지 보호소에서 감사인사</h3>
                    <p>
                        후원해주신 따뜻한 마음 덕분에 우리 아이들이 더욱 건강하고 행복하게 지낼 수 있습니다.
                        여러분의 사랑이 새로운 가족을 찾아가는 희망의 다리가 되어주고 있어요.
                        정말 고맙습니다! 🐶💕
                    </p>
                </div>

                <!-- 보호소 메시지 -->
                <div class="shelter-message" id="customMessageSection" style="display: none;">
                    <div class="shelter-profile" style="background-color: #a8d8ea;">
                        행복
                    </div>
                    <div>
                        <strong>후원자님께 전하는 메시지:</strong><br>
                        <span id="customMessage" style="font-style: italic; color: var(--text-gray);"></span>
                    </div>
                </div>

                <!-- 후원 요약 -->
                <div class="donation-summary">
                    <div class="summary-title">
                        <i class="fas fa-receipt me-2"></i>후원 내역
                    </div>

                    <div class="summary-grid">
                        <div class="summary-item">
                            <div class="summary-label">후원 대상</div>
                            <div class="summary-value">행복한 강아지 보호소</div>
                        </div>
                        <div class="summary-item">
                            <div class="summary-label">후원 유형</div>
                            <div class="summary-value" id="donationType">일시 후원</div>
                        </div>
                        <div class="summary-item">
                            <div class="summary-label">후원 금액</div>
                            <div class="summary-value" id="donationAmount">30,000원</div>
                        </div>
                        <div class="summary-item">
                            <div class="summary-label">결제일시</div>
                            <div class="summary-value" id="paymentDate">2023.11.15 15:30</div>
                        </div>
                    </div>

                    <div class="payment-id">
                        결제번호: <span id="paymentId">PAY_20231115153000</span>
                    </div>
                </div>

                <!-- 다음 단계 안내 -->
                <div class="next-steps">
                    <div class="steps-title">
                        <i class="fas fa-list-check me-2"></i>다음 안내사항
                    </div>

                    <div class="step-item">
                        <div class="step-number">1</div>
                        <div class="step-content">
                            <div class="step-title">기부금 영수증 발송</div>
                            <div class="step-desc">영수증은 입력하신 이메일로 24시간 내에 발송됩니다</div>
                        </div>
                    </div>

                    <div class="step-item">
                        <div class="step-number">2</div>
                        <div class="step-content">
                            <div class="step-title">보호소 소식 전달</div>
                            <div class="step-desc">정기적으로 보호소의 근황과 동물들의 이야기를 전해드려요</div>
                        </div>
                    </div>

                    <div class="step-item">
                        <div class="step-number">3</div>
                        <div class="step-content">
                            <div class="step-title">특별 이벤트 안내</div>
                            <div class="step-desc">후원자 전용 보호소 방문 프로그램과 특별 이벤트에 초대합니다</div>
                        </div>
                    </div>
                </div>

                <!-- 영수증 다운로드 -->
                <div class="receipt-download" id="receiptSection" style="display: none;">
                    <a href="#" class="receipt-btn" onclick="downloadReceipt()">
                        <i class="fas fa-download me-2"></i>기부금 영수증 다운로드
                    </a>
                </div>
            </div>
        </div>

        <!-- 액션 버튼들 -->
        <div class="action-buttons">
            <a href="/shelter/list" class="btn-secondary">
                <i class="fas fa-home me-2"></i>보호소 목록으로
            </a>
            <a href="/donation/shelter/1" class="btn-primary">
                <i class="fas fa-heart me-2"></i>추가 후원하기
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // URL 파라미터에서 정보 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const amount = urlParams.get('amount') || '0';
        const type = urlParams.get('type') || 'once';
        const name = urlParams.get('name') || '';
        const message = urlParams.get('message') || '';
        const receiptAgree = urlParams.get('receiptAgree') === 'true';
        const paymentId = urlParams.get('paymentId') || 'PAY_' + Date.now();

        // 화면에 정보 표시
        function displayCompletionInfo() {
            // 후원 금액 표시
            const formattedAmount = parseInt(amount).toLocaleString() + '원';
            document.getElementById('donationAmount').textContent = formattedAmount;

            // 후원 유형 표시
            document.getElementById('donationType').textContent =
                type === 'once' ? '일시 후원' : '정기 후원';

            // 결제 일시 표시
            const now = new Date();
            const dateStr = now.toLocaleDateString('ko-KR', {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit'
            }).replace(/\. /g, '.').replace('.', '');
            const timeStr = now.toLocaleTimeString('ko-KR', {
                hour: '2-digit',
                minute: '2-digit'
            });
            document.getElementById('paymentDate').textContent = `${dateStr} ${timeStr}`;

            // 결제 번호 표시
            document.getElementById('paymentId').textContent = paymentId;

            // 후원자 메시지가 있는 경우 표시
            if (message && message.trim()) {
                document.getElementById('customMessage').textContent = message;
                document.getElementById('customMessageSection').style.display = 'block';
            }

            // 영수증 발급 요청한 경우 다운로드 버튼 표시
            if (receiptAgree) {
                document.getElementById('receiptSection').style.display = 'block';
            }
        }

        function downloadReceipt() {
            // 실제로는 서버에서 PDF 생성하여 다운로드
            alert('기부금 영수증이 다운로드됩니다.\n\n* 실제 구현 시에는 PDF 파일이 다운로드됩니다.');
        }

        // 페이지 로드 시 confetti 효과 (선택사항)
        function showCelebration() {
            // 간단한 축하 효과
            const colors = ['#4CAF50', '#FFC107', '#FF5722', '#2196F3'];
            for (let i = 0; i < 50; i++) {
                setTimeout(() => {
                    createConfetti();
                }, i * 50);
            }
        }

        function createConfetti() {
            const confetti = document.createElement('div');
            confetti.style.position = 'fixed';
            confetti.style.width = '10px';
            confetti.style.height = '10px';
            confetti.style.backgroundColor = '#4CAF50';
            confetti.style.left = Math.random() * window.innerWidth + 'px';
            confetti.style.top = '-10px';
            confetti.style.borderRadius = '50%';
            confetti.style.pointerEvents = 'none';
            confetti.style.zIndex = '9999';
            confetti.style.animation = 'fall 3s linear forwards';

            document.body.appendChild(confetti);

            setTimeout(() => {
                confetti.remove();
            }, 3000);
        }

        // CSS 애니메이션 추가
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fall {
                to {
                    transform: translateY(100vh) rotate(360deg);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);

        // 페이지 로드 시 실행
        displayCompletionInfo();
        setTimeout(showCelebration, 500);
    </script>
</body>
</html>