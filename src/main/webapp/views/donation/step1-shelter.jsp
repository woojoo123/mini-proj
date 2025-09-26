<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>보호소 후원 | Shelter</title>
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
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem 1rem;
        }

        .shelter-info-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            padding: 2rem;
            margin-bottom: 2rem;
            border: 1px solid #f0f0f0;
        }

        .shelter-profile {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 24px;
            margin-right: 1.5rem;
        }

        .shelter-name {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-dark);
            margin-bottom: 0.5rem;
        }

        .shelter-description {
            color: var(--text-gray);
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 1.5rem;
        }

        .recent-activity {
            background: var(--secondary-light);
            border-radius: 12px;
            padding: 1.5rem;
            margin-top: 1.5rem;
        }

        .activity-title {
            font-weight: 600;
            color: var(--primary-dark);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
        }

        .activity-item {
            display: flex;
            align-items: center;
            padding: 0.5rem 0;
            color: var(--text-gray);
        }

        .amount-selection {
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

        .amount-buttons {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .amount-btn {
            background: white;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1.2rem;
            font-weight: 600;
        }

        .amount-btn:hover {
            border-color: var(--donation-primary);
            background: #f8fffe;
        }

        .amount-btn.selected {
            border-color: var(--donation-primary);
            background: var(--donation-primary);
            color: white;
        }

        .custom-amount {
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            padding: 1rem;
            font-size: 1.2rem;
            width: 100%;
            margin-bottom: 1rem;
        }

        .custom-amount:focus {
            outline: none;
            border-color: var(--donation-primary);
            box-shadow: 0 0 0 0.25rem rgba(76, 175, 80, 0.25);
        }

        .donation-type {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .type-btn {
            flex: 1;
            background: white;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            padding: 1rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 600;
        }

        .type-btn:hover {
            border-color: var(--donation-primary);
            background: #f8fffe;
        }

        .type-btn.selected {
            border-color: var(--donation-primary);
            background: var(--donation-primary);
            color: white;
        }

        .donation-summary {
            background: var(--secondary-light);
            border-radius: 12px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .summary-total {
            font-size: 1.3rem;
            font-weight: 700;
            color: var(--primary-dark);
            border-top: 1px solid #ddd;
            padding-top: 1rem;
            margin-top: 1rem;
        }

        .donate-btn {
            background: var(--donation-primary);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 1.2rem 2rem;
            font-size: 1.3rem;
            font-weight: 600;
            width: 100%;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .donate-btn:hover {
            background: var(--donation-hover);
        }

        .donate-btn:disabled {
            background: #ccc;
            cursor: not-allowed;
        }

        .back-link {
            color: var(--accent);
            text-decoration: none;
            font-weight: 600;
            margin-bottom: 1rem;
            display: inline-block;
        }

        .back-link:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .amount-buttons {
                grid-template-columns: 1fr;
            }

            .shelter-info-card {
                padding: 1.5rem;
            }

            .shelter-name {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="donation-container">
        <a href="/shelter/list" class="back-link">
            <i class="fas fa-arrow-left me-2"></i>보호소 목록으로 돌아가기
        </a>

        <!-- 보호소 정보 -->
        <div class="shelter-info-card">
            <div class="d-flex align-items-start">
                <div class="shelter-profile" style="background-color: #a8d8ea;">
                    행복
                </div>
                <div class="flex-grow-1">
                    <h1 class="shelter-name">행복한 강아지 보호소</h1>
                    <p class="shelter-description">
                        2015년부터 유기견 보호와 입양을 위해 운영되고 있는 비영리 보호소입니다.
                        현재 50여 마리의 강아지들이 새로운 가족을 기다리고 있으며,
                        정성스런 돌봄과 사랑으로 건강한 아이들로 키우고 있습니다.
                    </p>
                    <div class="d-flex">
                        <span class="badge bg-light text-dark me-2">
                            <i class="fas fa-map-marker-alt me-1"></i>서울 강남구
                        </span>
                        <span class="badge bg-light text-dark me-2">
                            <i class="fas fa-paw me-1"></i>보호 중 52마리
                        </span>
                        <span class="badge bg-light text-dark">
                            <i class="fas fa-heart me-1"></i>입양 완료 200+마리
                        </span>
                    </div>
                </div>
            </div>

            <div class="recent-activity">
                <div class="activity-title">
                    <i class="fas fa-clock me-2"></i>최근 활동
                </div>
                <div class="activity-item">
                    <i class="fas fa-camera me-2"></i>
                    새로 온 골든리트리버 루비를 소개합니다 (2시간 전)
                </div>
                <div class="activity-item">
                    <i class="fas fa-medical-bag me-2"></i>
                    비글 초코의 치료가 완료되었습니다 (1일 전)
                </div>
                <div class="activity-item">
                    <i class="fas fa-home me-2"></i>
                    래브라도 몰리가 새 가족을 만났습니다 (3일 전)
                </div>
            </div>
        </div>

        <!-- 후원 금액 선택 -->
        <div class="amount-selection">
            <h2 class="section-title">후원 금액을 선택해주세요</h2>

            <div class="amount-buttons">
                <div class="amount-btn" onclick="selectAmount(10000)">
                    <div style="font-size: 1.5rem;">10,000원</div>
                    <small style="color: #666;">사료비 지원</small>
                </div>
                <div class="amount-btn" onclick="selectAmount(30000)">
                    <div style="font-size: 1.5rem;">30,000원</div>
                    <small style="color: #666;">의료비 지원</small>
                </div>
                <div class="amount-btn" onclick="selectAmount(50000)">
                    <div style="font-size: 1.5rem;">50,000원</div>
                    <small style="color: #666;">시설 운영비</small>
                </div>
                <div class="amount-btn" onclick="selectAmount(100000)">
                    <div style="font-size: 1.5rem;">100,000원</div>
                    <small style="color: #666;">종합 지원</small>
                </div>
            </div>

            <input type="number" class="custom-amount" placeholder="직접 입력 (최소 1,000원)"
                   min="1000" id="customAmount" oninput="selectCustomAmount()">

            <div class="donation-type">
                <div class="type-btn selected" onclick="selectType('once')">
                    <i class="fas fa-hand-holding-heart me-2"></i>일시 후원
                </div>
                <div class="type-btn" onclick="selectType('monthly')">
                    <i class="fas fa-calendar-alt me-2"></i>정기 후원
                </div>
            </div>

            <div class="donation-summary">
                <div class="summary-row">
                    <span>후원 대상:</span>
                    <span class="fw-bold">행복한 강아지 보호소</span>
                </div>
                <div class="summary-row">
                    <span>후원 유형:</span>
                    <span id="donationType" class="fw-bold">일시 후원</span>
                </div>
                <div class="summary-row summary-total">
                    <span>후원 금액:</span>
                    <span id="totalAmount" class="fw-bold">0원</span>
                </div>
            </div>

            <button class="donate-btn" onclick="proceedToDonation()" disabled>
                <i class="fas fa-heart me-2"></i>이 보호소 후원하기
            </button>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let selectedAmount = 0;
        let selectedType = 'once';

        function selectAmount(amount) {
            selectedAmount = amount;
            document.getElementById('customAmount').value = '';

            // Reset all amount buttons
            document.querySelectorAll('.amount-btn').forEach(btn => {
                btn.classList.remove('selected');
            });

            // Select clicked button
            event.target.closest('.amount-btn').classList.add('selected');

            updateSummary();
        }

        function selectCustomAmount() {
            const customAmount = parseInt(document.getElementById('customAmount').value) || 0;
            if (customAmount >= 1000) {
                selectedAmount = customAmount;

                // Reset preset buttons
                document.querySelectorAll('.amount-btn').forEach(btn => {
                    btn.classList.remove('selected');
                });

                updateSummary();
            } else {
                selectedAmount = 0;
                updateSummary();
            }
        }

        function selectType(type) {
            selectedType = type;

            // Reset all type buttons
            document.querySelectorAll('.type-btn').forEach(btn => {
                btn.classList.remove('selected');
            });

            // Select clicked button
            event.target.classList.add('selected');

            updateSummary();
        }

        function updateSummary() {
            document.getElementById('totalAmount').textContent =
                selectedAmount > 0 ? selectedAmount.toLocaleString() + '원' : '0원';

            document.getElementById('donationType').textContent =
                selectedType === 'once' ? '일시 후원' : '정기 후원';

            // Enable/disable button
            const donateBtn = document.querySelector('.donate-btn');
            if (selectedAmount >= 1000) {
                donateBtn.disabled = false;
            } else {
                donateBtn.disabled = true;
            }
        }

        function proceedToDonation() {
            if (selectedAmount < 1000) {
                alert('최소 후원 금액은 1,000원입니다.');
                return;
            }

            // 후원자 정보 입력 페이지로 이동
            const params = new URLSearchParams({
                shelterId: 1, // 임시 ID
                amount: selectedAmount,
                type: selectedType
            });

            window.location.href = '/donation/info?' + params.toString();
        }
    </script>
</body>
</html>