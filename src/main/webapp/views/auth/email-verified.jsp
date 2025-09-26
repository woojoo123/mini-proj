<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <c:set var="pageTitle" value="이메일 인증 완료" scope="request" />
    <c:set var="pageDescription" value="이메일 인증이 완료되었습니다." scope="request" />
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

        .success-container {
            background: var(--color-white);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(60, 42, 33, 0.1);
            width: 100%;
            max-width: 480px;
            padding: 48px;
            margin: 20px;
            text-align: center;
        }

        .success-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 24px;
            background: linear-gradient(135deg, #059669 0%, #10b981 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--color-white);
            font-size: 32px;
            animation: successPulse 2s ease-in-out infinite;
        }

        @keyframes successPulse {
            0%, 100% {
                transform: scale(1);
                box-shadow: 0 0 0 0 rgba(16, 185, 129, 0.7);
            }
            50% {
                transform: scale(1.05);
                box-shadow: 0 0 0 10px rgba(16, 185, 129, 0);
            }
        }

        .success-title {
            font-size: 28px;
            font-weight: 700;
            color: var(--color-brown-dark);
            margin: 0 0 16px 0;
        }

        .success-subtitle {
            font-size: 16px;
            color: var(--color-text-secondary);
            margin: 0 0 32px 0;
            line-height: 1.6;
        }

        .success-message {
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            border-radius: 12px;
            padding: 24px;
            margin: 24px 0;
            color: #065f46;
            line-height: 1.6;
        }

        .success-message h3 {
            margin: 0 0 12px 0;
            font-size: 18px;
            font-weight: 600;
            color: #065f46;
        }

        .success-message p {
            margin: 0;
            font-size: 15px;
        }

        .welcome-box {
            background: var(--color-bg-light);
            border: 2px solid var(--color-accent);
            border-radius: 12px;
            padding: 24px;
            margin: 32px 0;
        }

        .welcome-box h4 {
            font-size: 18px;
            font-weight: 600;
            color: var(--color-brown-dark);
            margin: 0 0 12px 0;
        }

        .welcome-box p {
            font-size: 15px;
            color: var(--color-text-secondary);
            margin: 0;
            line-height: 1.6;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 32px;
        }

        .login-button {
            background: linear-gradient(135deg, var(--color-brown-medium) 0%, var(--color-brown-light) 100%);
            color: var(--color-white);
            border: none;
            padding: 18px 24px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .login-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(141, 123, 104, 0.3);
            color: var(--color-white);
            text-decoration: none;
        }

        .home-button {
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

        .home-button:hover {
            background: var(--color-brown-medium);
            color: var(--color-white);
            text-decoration: none;
        }

        .verification-details {
            background: var(--color-bg-primary);
            border-radius: 8px;
            padding: 16px;
            margin: 24px 0;
            font-size: 14px;
            color: var(--color-text-muted);
        }

        .verification-details strong {
            color: var(--color-brown-dark);
        }

        @media (max-width: 768px) {
            .success-container {
                margin: 10px;
                padding: 32px 24px;
            }

            .success-title {
                font-size: 24px;
            }

            .success-icon {
                width: 64px;
                height: 64px;
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="success-container">
        <div class="success-icon">
            ✓
        </div>

        <h1 class="success-title">인증 완료!</h1>
        <p class="success-subtitle">
            이메일 인증이 성공적으로 완료되었습니다.
        </p>

        <div class="success-message">
            <h3>🎉 회원가입이 완료되었습니다</h3>
            <p>
                보호소 관리 시스템의 모든 서비스를 이용하실 수 있습니다.
            </p>
        </div>

        <div class="welcome-box">
            <h4>환영합니다!</h4>
            <p>
                이제 로그인하여 보호소 정보 조회, 입양 신청, 커뮤니티 참여 등
                다양한 서비스를 이용해보세요.
            </p>
        </div>

        <div class="verification-details">
            <strong>인증 완료 정보</strong><br>
            인증 일시: <span id="verificationTime"></span><br>
            이메일: ${param.email != null ? param.email : 'user@example.com'}
        </div>

        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/auth/login" class="login-button">
                로그인하기
            </a>

            <a href="${pageContext.request.contextPath}/" class="home-button">
                홈페이지로 이동
            </a>
        </div>
    </div>

    <script>
        // 현재 시간을 표시
        document.addEventListener('DOMContentLoaded', function() {
            const now = new Date();
            const options = {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit',
                hour: '2-digit',
                minute: '2-digit',
                hour12: false
            };

            document.getElementById('verificationTime').textContent =
                now.toLocaleDateString('ko-KR', options).replace(/\./g, '-').replace(' ', ' ');
        });

        // 3초 후 자동으로 로그인 페이지로 이동 (선택사항)
        // setTimeout(() => {
        //     window.location.href = '${pageContext.request.contextPath}/auth/login';
        // }, 3000);
    </script>
</body>
</html>