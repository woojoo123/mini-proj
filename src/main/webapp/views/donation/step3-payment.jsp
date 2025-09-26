<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 수단 선택 | Shelter</title>
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

        .form-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-dark);
            margin-bottom: 2rem;
            text-align: center;
        }

        .payment-methods {
            display: grid;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .payment-method {
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            padding: 1.5rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .payment-method:hover {
            border-color: var(--donation-primary);
            background: #f8fffe;
        }

        .payment-method.selected {
            border-color: var(--donation-primary);
            background: var(--donation-primary);
            color: white;
        }

        .payment-method-info {
            display: flex;
            align-items: center;
        }

        .payment-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            font-size: 1.5rem;
            color: white;
        }

        .payment-details h4 {
            margin: 0 0 0.5rem 0;
            font-size: 1.2rem;
            font-weight: 600;
        }

        .payment-details p {
            margin: 0;
            font-size: 0.9rem;
            opacity: 0.8;
        }

        .payment-method.selected .payment-details p {
            opacity: 0.9;
        }

        .payment-benefits {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .benefit-item {
            display: flex;
            align-items: center;
            margin-bottom: 0.8rem;
        }

        .benefit-item:last-child {
            margin-bottom: 0;
        }

        .benefit-icon {
            color: var(--donation-primary);
            margin-right: 0.8rem;
            font-size: 1.1rem;
        }

        .security-info {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
            text-align: center;
        }

        .security-info h5 {
            margin-bottom: 1rem;
            font-weight: 600;
        }

        .security-badges {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 1rem;
        }

        .security-badge {
            background: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
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

        .btn-next {
            background: var(--donation-primary);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 1rem 1.5rem;
            font-weight: 600;
            flex: 2;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-next:hover {
            background: var(--donation-hover);
        }

        .btn-next:disabled {
            background: #ccc;
            cursor: not-allowed;
        }

        @media (max-width: 768px) {
            .payment-method {
                flex-direction: column;
                text-align: center;
            }

            .payment-method-info {
                flex-direction: column;
                margin-bottom: 1rem;
            }

            .payment-icon {
                margin-right: 0;
                margin-bottom: 1rem;
            }

            .security-badges {
                flex-direction: column;
                align-items: center;
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
                <div class="step active">
                    <div class="step-number">3</div>
                    <div class="step-label">결제 수단</div>
                    <div class="step-line"></div>
                </div>
                <div class="step">
                    <div class="step-number">4</div>
                    <div class="step-label">완료</div>
                </div>
            </div>
        </div>

        <!-- 결제 수단 선택 -->
        <div class="form-card">
            <h2 class="section-title">결제 수단을 선택해주세요</h2>

            <div class="payment-methods">
                <div class="payment-method" onclick="selectPayment('card')">
                    <div class="payment-method-info">
                        <div class="payment-icon" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <div class="payment-details">
                            <h4>신용카드 / 체크카드</h4>
                            <p>국내 모든 카드사 지원, 간편하고 빠른 결제</p>
                        </div>
                    </div>
                    <div class="payment-check">
                        <i class="fas fa-check-circle" style="font-size: 1.5rem;"></i>
                    </div>
                </div>

                <div class="payment-method" onclick="selectPayment('transfer')">
                    <div class="payment-method-info">
                        <div class="payment-icon" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                            <i class="fas fa-university"></i>
                        </div>
                        <div class="payment-details">
                            <h4>계좌이체</h4>
                            <p>실시간 계좌이체, 수수료 무료</p>
                        </div>
                    </div>
                    <div class="payment-check">
                        <i class="fas fa-check-circle" style="font-size: 1.5rem;"></i>
                    </div>
                </div>

                <div class="payment-method" onclick="selectPayment('kakaopay')">
                    <div class="payment-method-info">
                        <div class="payment-icon" style="background: #FFCD00;">
                            <i class="fas fa-comment" style="color: #3C1E1E;"></i>
                        </div>
                        <div class="payment-details">
                            <h4>카카오페이</h4>
                            <p>카카오톡으로 간편하게 결제</p>
                        </div>
                    </div>
                    <div class="payment-check">
                        <i class="fas fa-check-circle" style="font-size: 1.5rem;"></i>
                    </div>
                </div>

                <div class="payment-method" onclick="selectPayment('naverpay')">
                    <div class="payment-method-info">
                        <div class="payment-icon" style="background: #03C75A;">
                            <i class="fas fa-n" style="font-weight: bold;"></i>
                        </div>
                        <div class="payment-details">
                            <h4>네이버페이</h4>
                            <p>네이버 아이디로 간편 결제</p>
                        </div>
                    </div>
                    <div class="payment-check">
                        <i class="fas fa-check-circle" style="font-size: 1.5rem;"></i>
                    </div>
                </div>
            </div>

            <!-- 결제 혜택 -->
            <div class="payment-benefits">
                <h5 style="margin-bottom: 1rem; font-weight: 600; color: var(--primary-dark);">
                    <i class="fas fa-gift me-2"></i>후원 혜택
                </h5>
                <div class="benefit-item">
                    <i class="fas fa-receipt benefit-icon"></i>
                    <span>기부금 영수증 자동 발급 (연말정산 소득공제)</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-envelope benefit-icon"></i>
                    <span>보호소 근황 및 동물들의 소식 정기 전달</span>
                </div>
                <div class="benefit-item">
                    <i class="fas fa-heart benefit-icon"></i>
                    <span>후원자 전용 보호소 방문 이벤트 우선 참여</span>
                </div>
            </div>

            <!-- 보안 정보 -->
            <div class="security-info">
                <h5><i class="fas fa-shield-alt me-2"></i>안전한 결제 보장</h5>
                <p>모든 결제 정보는 암호화되어 안전하게 처리됩니다</p>
                <div class="security-badges">
                    <div class="security-badge">SSL 암호화</div>
                    <div class="security-badge">PCI DSS 인증</div>
                    <div class="security-badge">개인정보보호</div>
                </div>
            </div>

            <div class="action-buttons">
                <button type="button" class="btn-back" onclick="goBack()">
                    <i class="fas fa-arrow-left me-2"></i>이전 단계
                </button>
                <button type="button" class="btn-next" onclick="proceedToConfirm()" disabled>
                    결제 확인 <i class="fas fa-arrow-right ms-2"></i>
                </button>
            </div>
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

        let selectedPaymentMethod = '';

        function selectPayment(method) {
            selectedPaymentMethod = method;

            // 모든 결제 수단 선택 해제
            document.querySelectorAll('.payment-method').forEach(element => {
                element.classList.remove('selected');
            });

            // 선택된 결제 수단 활성화
            event.target.closest('.payment-method').classList.add('selected');

            // 다음 버튼 활성화
            document.querySelector('.btn-next').disabled = false;
        }

        function goBack() {
            const params = new URLSearchParams({
                shelterId: shelterId,
                amount: amount,
                type: type
            });
            window.location.href = '/donation/info?' + params.toString();
        }

        function proceedToConfirm() {
            if (!selectedPaymentMethod) {
                alert('결제 수단을 선택해주세요.');
                return;
            }

            // 결제 확인 페이지로 이동
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
                paymentMethod: selectedPaymentMethod
            });

            window.location.href = '/donation/confirm?' + params.toString();
        }

        // 결제 수단별 추가 정보 표시 (향후 확장용)
        function showPaymentInfo(method) {
            const infoMap = {
                'card': '국내외 모든 신용카드와 체크카드를 사용할 수 있습니다.',
                'transfer': '실시간 계좌이체로 즉시 결제가 완료됩니다.',
                'kakaopay': '카카오톡 앱에서 간편하게 결제하세요.',
                'naverpay': '네이버 계정으로 안전하게 결제하세요.'
            };

            console.log(infoMap[method]);
        }
    </script>
</body>
</html>