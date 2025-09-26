<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>후원자 정보 입력 | Shelter</title>
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
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .donation-summary-mini {
            background: var(--secondary-light);
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: 600;
            color: var(--primary-dark);
            margin-bottom: 0.5rem;
        }

        .required {
            color: #e74c3c;
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            padding: 1rem;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--donation-primary);
            box-shadow: 0 0 0 0.25rem rgba(76, 175, 80, 0.25);
        }

        .form-control.error {
            border-color: #e74c3c;
        }

        .error-message {
            color: #e74c3c;
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }

        .checkbox-group {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .checkbox-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1rem;
        }

        .checkbox-item:last-child {
            margin-bottom: 0;
        }

        .checkbox-item input[type="checkbox"] {
            margin-right: 0.8rem;
            margin-top: 0.2rem;
            transform: scale(1.2);
        }

        .checkbox-label {
            flex: 1;
            font-size: 0.95rem;
            line-height: 1.5;
        }

        .checkbox-label.required {
            font-weight: 600;
        }

        .message-textarea {
            min-height: 100px;
            resize: vertical;
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
            .progress-steps {
                font-size: 0.8rem;
            }

            .step-number {
                width: 35px;
                height: 35px;
            }

            .action-buttons {
                flex-direction: column;
            }

            .form-card {
                padding: 1.5rem;
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
                <div class="step active">
                    <div class="step-number">2</div>
                    <div class="step-label">정보 입력</div>
                    <div class="step-line"></div>
                </div>
                <div class="step">
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

        <!-- 후원 요약 -->
        <div class="donation-summary-mini">
            <div class="summary-item">
                <span><i class="fas fa-home me-2"></i>후원 대상:</span>
                <span class="fw-bold">행복한 강아지 보호소</span>
            </div>
            <div class="summary-item">
                <span><i class="fas fa-calendar me-2"></i>후원 유형:</span>
                <span id="donationType" class="fw-bold">일시 후원</span>
            </div>
            <div class="summary-item">
                <span><i class="fas fa-won me-2"></i>후원 금액:</span>
                <span id="donationAmount" class="fw-bold text-success">30,000원</span>
            </div>
        </div>

        <!-- 후원자 정보 입력 -->
        <div class="form-card">
            <h2 class="section-title">후원자 정보를 입력해주세요</h2>

            <form id="donorInfoForm">
                <div class="form-group">
                    <label class="form-label">
                        이름 <span class="required">*</span>
                    </label>
                    <input type="text" class="form-control" id="donorName"
                           placeholder="실명을 입력해주세요" required>
                    <div class="error-message" id="nameError"></div>
                </div>

                <div class="form-group">
                    <label class="form-label">
                        연락처 <span class="required">*</span>
                    </label>
                    <input type="tel" class="form-control" id="donorPhone"
                           placeholder="010-0000-0000" required>
                    <div class="error-message" id="phoneError"></div>
                </div>

                <div class="form-group">
                    <label class="form-label">
                        이메일 <span class="required">*</span>
                    </label>
                    <input type="email" class="form-control" id="donorEmail"
                           placeholder="example@email.com" required>
                    <div class="error-message" id="emailError"></div>
                </div>

                <div class="form-group">
                    <label class="form-label">
                        보호소에 전할 메시지 (선택사항)
                    </label>
                    <textarea class="form-control message-textarea" id="donorMessage"
                              placeholder="보호소와 동물들에게 전하고 싶은 따뜻한 메시지를 남겨주세요."></textarea>
                </div>

                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" id="receiptAgree" required>
                        <label class="checkbox-label required">
                            <strong>기부금 영수증 발급을 원합니다</strong><br>
                            <small class="text-muted">연말정산 시 소득공제 혜택을 받을 수 있습니다.</small>
                        </label>
                    </div>

                    <div class="checkbox-item">
                        <input type="checkbox" id="privacyAgree" required>
                        <label class="checkbox-label required">
                            <strong>개인정보 수집 및 이용에 동의합니다</strong><br>
                            <small class="text-muted">후원 처리 및 영수증 발급을 위해 개인정보를 수집합니다.</small>
                        </label>
                    </div>

                    <div class="checkbox-item">
                        <input type="checkbox" id="marketingAgree">
                        <label class="checkbox-label">
                            보호소 소식 및 이벤트 알림 수신에 동의합니다 (선택)<br>
                            <small class="text-muted">이메일 및 SMS로 보호소 근황을 전해드립니다.</small>
                        </label>
                    </div>
                </div>

                <div class="action-buttons">
                    <button type="button" class="btn-back" onclick="goBack()">
                        <i class="fas fa-arrow-left me-2"></i>이전 단계
                    </button>
                    <button type="submit" class="btn-next" disabled>
                        다음 단계 <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // URL 파라미터에서 후원 정보 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        const donationAmount = urlParams.get('amount') || '0';
        const donationType = urlParams.get('type') || 'once';
        const shelterId = urlParams.get('shelterId') || '1';

        // 화면에 표시
        document.getElementById('donationAmount').textContent =
            parseInt(donationAmount).toLocaleString() + '원';
        document.getElementById('donationType').textContent =
            donationType === 'once' ? '일시 후원' : '정기 후원';

        // 폼 유효성 검사
        function validateForm() {
            const name = document.getElementById('donorName').value.trim();
            const phone = document.getElementById('donorPhone').value.trim();
            const email = document.getElementById('donorEmail').value.trim();
            const receiptAgree = document.getElementById('receiptAgree').checked;
            const privacyAgree = document.getElementById('privacyAgree').checked;

            let isValid = true;

            // 이름 검사
            if (name.length < 2) {
                showError('nameError', '이름을 정확히 입력해주세요.');
                isValid = false;
            } else {
                hideError('nameError');
            }

            // 전화번호 검사
            const phoneRegex = /^010-\d{4}-\d{4}$/;
            if (!phoneRegex.test(phone)) {
                showError('phoneError', '올바른 전화번호 형식으로 입력해주세요. (010-0000-0000)');
                isValid = false;
            } else {
                hideError('phoneError');
            }

            // 이메일 검사
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                showError('emailError', '올바른 이메일 주소를 입력해주세요.');
                isValid = false;
            } else {
                hideError('emailError');
            }

            // 필수 동의 검사
            const submitBtn = document.querySelector('.btn-next');
            if (isValid && receiptAgree && privacyAgree) {
                submitBtn.disabled = false;
            } else {
                submitBtn.disabled = true;
            }

            return isValid && receiptAgree && privacyAgree;
        }

        function showError(elementId, message) {
            const errorElement = document.getElementById(elementId);
            errorElement.textContent = message;

            const inputElement = errorElement.previousElementSibling;
            inputElement.classList.add('error');
        }

        function hideError(elementId) {
            const errorElement = document.getElementById(elementId);
            errorElement.textContent = '';

            const inputElement = errorElement.previousElementSibling;
            inputElement.classList.remove('error');
        }

        // 전화번호 자동 포맷팅
        document.getElementById('donorPhone').addEventListener('input', function(e) {
            let value = e.target.value.replace(/[^\d]/g, '');
            if (value.length >= 3 && value.length <= 7) {
                value = value.replace(/(\d{3})(\d+)/, '$1-$2');
            } else if (value.length > 7) {
                value = value.replace(/(\d{3})(\d{4})(\d+)/, '$1-$2-$3');
            }
            e.target.value = value;
            validateForm();
        });

        // 실시간 유효성 검사
        document.getElementById('donorName').addEventListener('input', validateForm);
        document.getElementById('donorEmail').addEventListener('input', validateForm);
        document.getElementById('receiptAgree').addEventListener('change', validateForm);
        document.getElementById('privacyAgree').addEventListener('change', validateForm);

        // 폼 제출
        document.getElementById('donorInfoForm').addEventListener('submit', function(e) {
            e.preventDefault();

            if (!validateForm()) {
                alert('입력 정보를 확인해주세요.');
                return;
            }

            // 결제 수단 선택 페이지로 이동
            const formData = {
                shelterId: shelterId,
                amount: donationAmount,
                type: donationType,
                name: document.getElementById('donorName').value,
                phone: document.getElementById('donorPhone').value,
                email: document.getElementById('donorEmail').value,
                message: document.getElementById('donorMessage').value,
                receiptAgree: document.getElementById('receiptAgree').checked,
                marketingAgree: document.getElementById('marketingAgree').checked
            };

            const params = new URLSearchParams(formData);
            window.location.href = '/donation/payment?' + params.toString();
        });

        function goBack() {
            const params = new URLSearchParams({
                shelterId: shelterId,
                amount: donationAmount,
                type: donationType
            });
            window.location.href = '/donation/shelter/1?' + params.toString();
        }
    </script>
</body>
</html>