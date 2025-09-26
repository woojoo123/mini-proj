<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <c:set var="pageTitle" value="이메일 인증" scope="request" />
    <c:set var="pageDescription" value="이메일 인증을 완료해주세요." scope="request" />
    <%@ include file="../common/meta.jsp" %>
    <title>${pageTitle} - 보호소 관리 시스템</title>

    <style>
        :root {
            --color-bg-primary: #F9F9F9;
            --color-text-primary: #000000;
            --color-accent: #F1DEC9;
            --color-text-secondary: #777777;
            --color-brown-light: #8D7B68;
            --color-brown-medium: #A4907C;
            --color-text-muted: #666666;
            --color-bg-light: #FFF8EA;
            --color-brown-dark: #3C2A21;
            --color-white: #FFFFFF;
        }

        body {
            font-family: 'Noto Sans KR', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, var(--color-bg-primary) 0%, var(--color-bg-light) 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--color-text-primary);
        }

        .verification-container {
            background: var(--color-white);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(60, 42, 33, 0.1);
            width: 100%;
            max-width: 480px;
            padding: 48px;
            margin: 20px;
            text-align: center;
        }

        .verification-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 24px;
            background: linear-gradient(135deg, var(--color-brown-medium) 0%, var(--color-brown-light) 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--color-white);
            font-size: 32px;
        }

        .verification-title {
            font-size: 28px;
            font-weight: 700;
            color: var(--color-brown-dark);
            margin: 0 0 16px 0;
        }

        .verification-subtitle {
            font-size: 16px;
            color: var(--color-text-secondary);
            margin: 0 0 32px 0;
            line-height: 1.6;
        }

        .email-display {
            background: var(--color-bg-light);
            border: 2px solid var(--color-accent);
            border-radius: 12px;
            padding: 16px;
            margin: 24px 0;
            font-weight: 600;
            color: var(--color-brown-dark);
            word-break: break-all;
        }

        .verification-message {
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            border-radius: 12px;
            padding: 20px;
            margin: 24px 0;
            color: #065f46;
            font-size: 15px;
            line-height: 1.6;
        }

        .verification-steps {
            text-align: left;
            margin: 32px 0;
        }

        .verification-steps h4 {
            font-size: 16px;
            font-weight: 600;
            color: var(--color-brown-dark);
            margin: 0 0 16px 0;
        }

        .verification-steps ol {
            margin: 0;
            padding-left: 20px;
            color: var(--color-text-secondary);
            line-height: 1.8;
        }

        .verification-steps li {
            margin-bottom: 8px;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 32px;
        }

        .resend-button {
            background: linear-gradient(135deg, var(--color-brown-medium) 0%, var(--color-brown-light) 100%);
            color: var(--color-white);
            border: none;
            padding: 16px 24px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .resend-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(141, 123, 104, 0.3);
        }

        .resend-button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }

        .back-button {
            background: transparent;
            color: var(--color-brown-medium);
            border: 2px solid var(--color-brown-medium);
            padding: 16px 24px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .back-button:hover {
            background: var(--color-brown-medium);
            color: var(--color-white);
            text-decoration: none;
        }

        .countdown-timer {
            color: var(--color-text-muted);
            font-size: 14px;
            margin-top: 8px;
        }

        @media (max-width: 768px) {
            .verification-container {
                margin: 10px;
                padding: 32px 24px;
            }

            .verification-title {
                font-size: 24px;
            }

            .verification-icon {
                width: 64px;
                height: 64px;
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="verification-container">
        <div class="verification-icon">
            📧
        </div>

        <h1 class="verification-title">이메일 인증</h1>
        <p class="verification-subtitle">
            회원가입을 완료하기 위해 이메일 인증이 필요합니다.
        </p>

        <div class="email-display">
            ${param.email != null ? param.email : 'user@example.com'}
        </div>

        <div class="verification-message">
            <strong>인증 메일을 발송했습니다!</strong><br>
            위 이메일 주소로 인증 링크를 보내드렸습니다. 메일함을 확인하여 인증을 완료해주세요.
        </div>

        <div class="verification-steps">
            <h4>인증 완료 방법:</h4>
            <ol>
                <li>이메일함(스팸함 포함)을 확인해주세요</li>
                <li>보호소 관리 시스템에서 발송한 메일을 찾아주세요</li>
                <li>메일 내의 인증 링크를 클릭해주세요</li>
                <li>인증 완료 후 로그인이 가능합니다</li>
            </ol>
        </div>

        <div class="action-buttons">
            <button type="button" class="resend-button" id="resendBtn">
                인증 메일 재발송
            </button>
            <div class="countdown-timer" id="countdownTimer"></div>

            <a href="${pageContext.request.contextPath}/auth/login" class="back-button">
                로그인 페이지로 돌아가기
            </a>
        </div>
    </div>

    <script>
        let countdownSeconds = 60;
        let isCountingDown = false;

        function startCountdown() {
            if (isCountingDown) return;

            isCountingDown = true;
            const resendBtn = document.getElementById('resendBtn');
            const countdownTimer = document.getElementById('countdownTimer');

            resendBtn.disabled = true;
            resendBtn.textContent = '재발송 대기중...';

            const interval = setInterval(() => {
                countdownTimer.textContent = `${countdownSeconds}초 후 재발송 가능`;
                countdownSeconds--;

                if (countdownSeconds < 0) {
                    clearInterval(interval);
                    resendBtn.disabled = false;
                    resendBtn.textContent = '인증 메일 재발송';
                    countdownTimer.textContent = '';
                    countdownSeconds = 60;
                    isCountingDown = false;
                }
            }, 1000);
        }

        document.getElementById('resendBtn').addEventListener('click', function() {
            // TODO: 실제 재발송 API 호출
            alert('인증 메일을 재발송했습니다.');
            startCountdown();
        });

        // 페이지 로드 시 카운트다운 시작
        window.addEventListener('load', function() {
            startCountdown();
        });
    </script>
</body>
</html>