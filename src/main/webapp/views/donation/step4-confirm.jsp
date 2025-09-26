<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후원 결제 확인 | Shelter</title>
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
        }

        body {
            background-color: var(--bg-light);
            color: var(--text-dark);
            font-family: 'Noto Sans KR', sans-serif;
        }

        .donation-container {
            max-width: 700px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        .progress-bar-container {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        .progress-steps {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .step {
            flex: 1;
            text-align: center;
            position: relative;
        }

        .step-number {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #e0e0e0;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 0.5rem;
            font-weight: 600;
        }

        .step.active .step-number {
            background: var(--donation-primary);
        }

        .step.completed .step-number {
            background: var(--donation-primary);
        }

        .step-label {
            font-size: 0.9rem;
            color: var(--text-gray);
        }

        .step.active .step-label {
            color: var(--donation-primary);
            font-weight: 600;
        }

        .step-line {
            position: absolute;
            top: 20px;
            left: 60%;
            right: -40%;
            height: 2px;
            background: #e0e0e0;
            z-index: -1;
        }

        .step.completed .step-line {
            background: var(--donation-primary);
        }

        .step:last-child .step-line {
            display: none;
        }

        .confirm-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 2rem;
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, var(--donation-primary) 0%, #45a049 100%);
            color: white;
            padding: 1.5rem 2rem;
            text-align: center;
        }

        .card-header h2 {
            margin: 0;
            font-size: 1.5rem;
            font-weight: 700;
        }

        .card-body {
            padding: 2rem;
        }

        .section {
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #f0f0f0;
        }

        .section:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }

        .section-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--primary-dark);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .section-icon {
            margin-right: 0.8rem;
            color: var(--donation-primary);
        }

        .shelter-info {
            background: var(--secondary-light);
            border-radius: 12px;
            padding: 1.5rem;
            display: flex;
            align-items: center;
        }

        .shelter-profile {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 18px;
            margin-right: 1rem;
        }

        .shelter-details h4 {
            margin: 0 0 0.5rem 0;
            font-size: 1.3rem;
            font-weight: 600;
            color: var(--primary-dark);
        }

        .shelter-details p {
            margin: 0;
            color: var(--text-gray);
        }

        .info-grid {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 1rem;
            align-items: center;
        }

        .info-label {
            font-weight: 600;
            color: var(--text-gray);
        }

        .info-value {
            color: var(--text-dark);
            font-weight: 500;
        }

        .message-box {
            background: #f8f9fa;
            border-left: 4px solid var(--donation-primary);
            border-radius: 0 8px 8px 0;
            padding: 1rem 1.5rem;
            margin-top: 1rem;
            font-style: italic;
            color: var(--text-gray);
        }

        .payment-summary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 12px;
            padding: 1.5rem;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.8rem;
        }

        .summary-row:last-child {
            margin-bottom: 0;
            padding-top: 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.3);
            font-size: 1.2rem;
            font-weight: 700;
        }

        .payment-method-display {
            display: flex;
            align-items: center;
            background: #f8f9fa;
            border-radius: 8px;
            padding: 1rem;
            margin-top: 1rem;
        }

        .payment-icon {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            color: white;
        }

        .important-notice {
            background: #fff3cd;
            border: 1px solid #ffeaa7;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .notice-title {
            font-weight: 600;
            color: #856404;
            margin-bottom: 0.8rem;
            display: flex;
            align-items: center;
        }

        .notice-list {
            margin: 0;
            padding-left: 1.5rem;
            color: #856404;
        }

        .notice-list li {
            margin-bottom: 0.5rem;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }

        .btn-back {
            background: white;
            color: var(--accent);
            border: 2px solid var(--accent);
            border-radius: 12px;
            padding: 1rem 1.5rem;
            font-weight: 600;
            flex: 1;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background: var(--accent);
            color: white;
        }

        .btn-pay {
            background: var(--donation-primary);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 1rem 1.5rem;
            font-weight: 600;
            font-size: 1.1rem;
            flex: 2;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-pay:hover {
            background: var(--donation-hover);
        }

        .btn-pay:disabled {
            background: #ccc;
            cursor: not-allowed;
        }

        @media (max-width: 768px) {
            .info-grid {
                grid-template-columns: 1fr;
                gap: 0.5rem;
            }

            .shelter-info {
                flex-direction: column;
                text-align: center;
            }

            .shelter-profile {
                margin-right: 0;
                margin-bottom: 1rem;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="donation-container">
        <!-- 진행 상황 -->
        <div class="progress-bar-container">
            <div class="progress-steps">
                <div class="step completed">
                    <div class="step-number">1</div>
                    <div class="step-label">금액 선택</div>
                    <div class="step-line"></div>
                </div>
                <div class="step completed">
                    <div class="step-number">2</div>
                    <div class="step-label">정보 입력</div>
                    <div class="step-line"></div>
                </div>
                <div class="step completed">
                    <div class="step-number">3</div>
                    <div class="step-label">결제 수단</div>
                    <div class="step-line"></div>
                </div>
                <div class="step active">
                    <div class="step-number">4</div>
                    <div class="step-label">완료</div>
                </div>
            </div>
        </div>

        <!-- 후원 확인 정보 -->
        <div class="confirm-card">
            <div class="card-header">
                <h2><i class="fas fa-heart me-2"></i>후원 내용을 확인해주세요</h2>
            </div>
            <div class="card-body">
                <!-- 보호소 정보 -->
                <div class="section">
                    <div class="section-title">
                        <i class="fas fa-home section-icon"></i>후원 대상 보호소
                    </div>
                    <div class="shelter-info">
                        <div class="shelter-profile" style="background-color: #a8d8ea;">
                            행복
                        </div>
                        <div class="shelter-details">
                            <h4>행복한 강아지 보호소</h4>
                            <p>유기견 보호와 입양을 위한 비영리 보호소</p>
                        </div>
                    </div>
                </div>

                <!-- 후원자 정보 -->
                <div class="section">
                    <div class="section-title">
                        <i class="fas fa-user section-icon"></i>후원자 정보
                    </div>
                    <div class="info-grid">
                        <span class="info-label">성명</span>
                        <span class="info-value" id="donorName">홍길동</span>

                        <span class="info-label">연락처</span>
                        <span class="info-value" id="donorPhone">010-0000-0000</span>

                        <span class="info-label">이메일</span>
                        <span class="info-value" id="donorEmail">example@email.com</span>

                        <span class="info-label">기부금 영수증</span>
                        <span class="info-value" id="receiptStatus">발급 요청</span>
                    </div>

                    <div id="messageSection" style="display: none;">
                        <div class="message-box">
                            <strong>보호소에 전하는 메시지:</strong><br>
                            <span id="donorMessage"></span>
                        </div>
                    </div>
                </div>

                <!-- 결제 정보 -->
                <div class="section">
                    <div class="section-title">
                        <i class="fas fa-credit-card section-icon"></i>결제 정보
                    </div>

                    <div class="payment-method-display">
                        <div class="payment-icon" id="paymentIcon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div>
                            <div class="fw-bold" id="paymentMethodName">신용카드 / 체크카드</div>
                            <small class="text-muted" id="paymentMethodDesc">안전한 카드 결제</small>
                        </div>
                    </div>

                    <div class="payment-summary">
                        <div class="summary-row">
                            <span>후원 유형</span>
                            <span id="donationType">일시 후원</span>
                        </div>
                        <div class="summary-row">
                            <span>후원 금액</span>
                            <span id="donationAmount">30,000원</span>
                        </div>
                        <div class="summary-row">
                            <span>총 결제 금액</span>
                            <span id="totalAmount">30,000원</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 주의사항 -->
        <div class="important-notice">
            <div class="notice-title">
                <i class="fas fa-exclamation-triangle me-2"></i>결제 전 확인사항
            </div>
            <ul class="notice-list">
                <li>후원금은 보호소 운영 및 동물 돌봄에 사용됩니다</li>
                <li>기부금 영수증은 결제 완료 후 이메일로 발송됩니다</li>
                <li>정기 후원의 경우 매월 동일한 날짜에 자동 결제됩니다</li>
                <li>후원 취소나 변경은 고객센터로 문의해주세요</li>
            </ul>
        </div>

        <div class="action-buttons">
            <button type="button" class="btn-back" onclick="goBack()">
                <i class="fas fa-arrow-left me-2"></i>이전 단계
            </button>
            <button type="button" class="btn-pay" onclick="processPayment()">
                <i class="fas fa-heart me-2"></i><span id="payButtonText">30,000원 결제하기</span>
            </button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // URL 파라미터에서 정보 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const shelterId = urlParams.get('shelterId') || '1';
        const amount = urlParams.get('amount') || '0';
        const type = urlParams.get('type') || 'once';
        const name = urlParams.get('name') || '';
        const phone = urlParams.get('phone') || '';
        const email = urlParams.get('email') || '';
        const message = urlParams.get('message') || '';
        const receiptAgree = urlParams.get('receiptAgree') === 'true';
        const marketingAgree = urlParams.get('marketingAgree') === 'true';
        const paymentMethod = urlParams.get('paymentMethod') || 'card';

        // 결제 수단 정보 매핑
        const paymentMethods = {
            'card': {
                name: '신용카드 / 체크카드',
                desc: '안전한 카드 결제',
                icon: 'fas fa-credit-card',
                iconBg: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)'
            },
            'transfer': {
                name: '계좌이체',
                desc: '실시간 계좌이체',
                icon: 'fas fa-university',
                iconBg: 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)'
            },
            'kakaopay': {
                name: '카카오페이',
                desc: '카카오톡 간편결제',
                icon: 'fas fa-comment',
                iconBg: '#FFCD00'
            },
            'naverpay': {
                name: '네이버페이',
                desc: '네이버 간편결제',
                icon: 'fas fa-n',
                iconBg: '#03C75A'
            }
        };

        // 화면에 정보 표시
        function displayInfo() {
            document.getElementById('donorName').textContent = name;
            document.getElementById('donorPhone').textContent = phone;
            document.getElementById('donorEmail').textContent = email;
            document.getElementById('receiptStatus').textContent = receiptAgree ? '발급 요청' : '발급 안함';

            if (message && message.trim()) {
                document.getElementById('donorMessage').textContent = message;
                document.getElementById('messageSection').style.display = 'block';
            }

            document.getElementById('donationType').textContent =
                type === 'once' ? '일시 후원' : '정기 후원';

            const formattedAmount = parseInt(amount).toLocaleString() + '원';
            document.getElementById('donationAmount').textContent = formattedAmount;
            document.getElementById('totalAmount').textContent = formattedAmount;
            document.getElementById('payButtonText').textContent = formattedAmount + ' 결제하기';

            // 결제 수단 정보 표시
            const methodInfo = paymentMethods[paymentMethod];
            if (methodInfo) {
                document.getElementById('paymentMethodName').textContent = methodInfo.name;
                document.getElementById('paymentMethodDesc').textContent = methodInfo.desc;

                const paymentIcon = document.getElementById('paymentIcon');
                paymentIcon.innerHTML = `<i class="${methodInfo.icon}"></i>`;
                paymentIcon.style.background = methodInfo.iconBg;

                if (paymentMethod === 'kakaopay') {
                    paymentIcon.querySelector('i').style.color = '#3C1E1E';
                }
            }
        }

        function goBack() {
            const params = new URLSearchParams({
                shelterId: shelterId,
                amount: amount,
                type: type,
                name: name,
                phone: phone,
                email: email,
                message: message,
                receiptAgree: receiptAgree,
                marketingAgree: marketingAgree
            });
            window.location.href = '/donation/payment?' + params.toString();
        }

        function processPayment() {
            // 실제 결제 처리는 여기서 구현
            // 결제 완료 페이지로 이동
            const params = new URLSearchParams({
                shelterId: shelterId,
                amount: amount,
                type: type,
                name: name,
                phone: phone,
                email: email,
                message: message,
                receiptAgree: receiptAgree,
                marketingAgree: marketingAgree,
                paymentMethod: paymentMethod,
                paymentId: 'PAY_' + Date.now() // 임시 결제 ID
            });

            // 결제 처리 시뮬레이션 (실제로는 결제 API 호출)
            document.querySelector('.btn-pay').disabled = true;
            document.querySelector('.btn-pay').innerHTML =
                '<i class="fas fa-spinner fa-spin me-2"></i>결제 처리 중...';

            setTimeout(() => {
                window.location.href = '/donation/complete?' + params.toString();
            }, 2000);
        }

        // 페이지 로드 시 정보 표시
        displayInfo();
    </script>
</body>
</html>