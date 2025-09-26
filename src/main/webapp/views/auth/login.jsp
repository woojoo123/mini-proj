<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <c:set var="pageTitle" value="로그인" scope="request" />
    <c:set var="pageDescription" value="보호소 관리 시스템에 로그인하세요." scope="request" />
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
            background: linear-gradient(135deg, var(--color-bg-primary) 0%, var(--color-accent) 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-card {
            background: var(--color-white);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(60, 42, 33, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 400px;
            position: relative;
            overflow: hidden;
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--color-brown-medium), var(--color-accent), var(--color-brown-light));
        }

        .logo-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--color-brown-medium), var(--color-brown-light));
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            box-shadow: 0 8px 16px rgba(164, 144, 124, 0.3);
        }

        .logo-icon i {
            color: var(--color-white);
            font-size: 24px;
        }

        .login-title {
            color: var(--color-brown-dark);
            font-size: 24px;
            font-weight: 600;
            margin: 0;
        }

        .login-subtitle {
            color: var(--color-text-secondary);
            font-size: 14px;
            margin: 5px 0 0 0;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            color: var(--color-brown-dark);
            font-weight: 500;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .form-input {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid var(--color-accent);
            border-radius: 10px;
            font-size: 16px;
            color: var(--color-text-primary);
            background: var(--color-bg-light);
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--color-brown-medium);
            background: var(--color-white);
            box-shadow: 0 0 0 3px rgba(164, 144, 124, 0.1);
        }

        .form-input::placeholder {
            color: var(--color-text-muted);
        }

        .password-group {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--color-text-secondary);
            cursor: pointer;
            padding: 4px;
            border-radius: 4px;
            transition: color 0.3s ease;
        }

        .password-toggle:hover {
            color: var(--color-brown-medium);
        }

        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .remember-me input[type="checkbox"] {
            width: 16px;
            height: 16px;
            accent-color: var(--color-brown-medium);
        }

        .remember-me label {
            color: var(--color-text-secondary);
            font-size: 14px;
            cursor: pointer;
        }

        .forgot-link {
            color: var(--color-brown-medium);
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .forgot-link:hover {
            color: var(--color-brown-dark);
            text-decoration: underline;
        }

        .login-button {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, var(--color-brown-medium), var(--color-brown-light));
            color: var(--color-white);
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .login-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(164, 144, 124, 0.4);
        }

        .login-button:active {
            transform: translateY(0);
        }

        .divider {
            text-align: center;
            margin: 25px 0;
            position: relative;
            color: var(--color-text-muted);
            font-size: 14px;
        }

        .divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background: var(--color-accent);
        }

        .divider span {
            background: var(--color-white);
            padding: 0 15px;
        }

        .signup-link {
            text-align: center;
            margin-top: 20px;
        }

        .signup-link p {
            color: var(--color-text-secondary);
            margin: 0 0 10px 0;
            font-size: 14px;
        }

        .signup-button {
            display: inline-block;
            color: var(--color-brown-medium);
            text-decoration: none;
            font-weight: 600;
            padding: 10px 20px;
            border: 2px solid var(--color-brown-medium);
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .signup-button:hover {
            background: var(--color-brown-medium);
            color: var(--color-white);
            text-decoration: none;
        }

        .social-login {
            margin: 20px 0;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .social-button {
            width: 100%;
            padding: 14px 16px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            position: relative;
        }

        .social-button:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .social-icon {
            width: 24px;
            height: 24px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 14px;
        }

        .naver-button {
            background: #03C75A;
            color: white;
        }

        .naver-button:hover {
            background: #02b351;
        }

        .naver-icon {
            background: white;
            color: #03C75A;
        }

        .kakao-button {
            background: #FEE500;
            color: #000000;
        }

        .kakao-button:hover {
            background: #fdd835;
        }

        .kakao-icon {
            background: #000000;
            color: #FEE500;
            font-size: 12px;
        }

        .alert {
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .alert-error {
            background: #fee;
            color: #c33;
            border: 1px solid #fcc;
        }

        .alert-success {
            background: #efe;
            color: #363;
            border: 1px solid #cfc;
        }

        @media (max-width: 480px) {
            .login-card {
                padding: 30px 20px;
                margin: 10px;
            }

            .login-title {
                font-size: 20px;
            }

            .remember-forgot {
                flex-direction: column;
                gap: 10px;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="logo-section">
                <div class="logo-icon">
                    <i class="fas fa-paw"></i>
                </div>
                <h1 class="login-title">로그인</h1>
                <p class="login-subtitle">보호소 관리 시스템에 오신 것을 환영합니다</p>
            </div>

            <!-- 오류 메시지 -->
            <c:if test="${not empty error}">
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-circle"></i>
                    ${error}
                </div>
            </c:if>

            <!-- 성공 메시지 -->
            <c:if test="${not empty message}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    ${message}
                </div>
            </c:if>

            <!-- 회원가입 성공 메시지 -->
            <c:if test="${not empty registerSuccess}">
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    ${registerSuccess}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/auth/login" method="post" id="loginForm">
                <div class="form-group">
                    <label for="loginId" class="form-label">아이디 (이메일 또는 사용자명)</label>
                    <input type="text"
                           id="loginId"
                           name="loginId"
                           class="form-input"
                           placeholder="이메일 또는 사용자명을 입력하세요"
                           value="${param.loginId}"
                           required>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">비밀번호</label>
                    <div class="password-group">
                        <input type="password"
                               id="password"
                               name="password"
                               class="form-input"
                               placeholder="비밀번호를 입력하세요"
                               required>
                        <button type="button" class="password-toggle" onclick="togglePassword()">
                            <i class="fas fa-eye" id="password-icon"></i>
                        </button>
                    </div>
                </div>

                <div class="remember-forgot">
                    <div class="remember-me">
                        <input type="checkbox" id="remember" name="remember" value="true">
                        <label for="remember">로그인 상태 유지</label>
                    </div>
                    <a href="${pageContext.request.contextPath}/auth/forgot-password" class="forgot-link">
                        비밀번호를 잊으셨나요?
                    </a>
                </div>

                <button type="submit" class="login-button">
                    <i class="fas fa-sign-in-alt"></i>
                    로그인
                </button>
            </form>

            <div class="divider">
                <span>또는</span>
            </div>

            <div class="social-login">
                <button type="button" class="social-button naver-button" onclick="naverLogin()">
                    <div class="social-icon naver-icon">N</div>
                    네이버로 로그인
                </button>

                <button type="button" class="social-button kakao-button" onclick="kakaoLogin()">
                    <div class="social-icon kakao-icon">
                        <i class="fas fa-comment"></i>
                    </div>
                    카카오로 로그인
                </button>
            </div>

            <div class="signup-link">
                <p>아직 계정이 없으신가요?</p>
                <a href="${pageContext.request.contextPath}/auth/register" class="signup-button">
                    <i class="fas fa-user-plus"></i>
                    회원가입
                </a>
            </div>
        </div>
    </div>

    <!-- Font Awesome -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>

    <!-- Custom JavaScript -->
    <script>
        // 비밀번호 표시/숨김 토글
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const passwordIcon = document.getElementById('password-icon');

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                passwordIcon.className = 'fas fa-eye-slash';
            } else {
                passwordInput.type = 'password';
                passwordIcon.className = 'fas fa-eye';
            }
        }

        // 폼 유효성 검사
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const loginId = document.getElementById('loginId').value.trim();
            const password = document.getElementById('password').value.trim();

            if (!loginId || !password) {
                e.preventDefault();
                alert('아이디와 비밀번호를 모두 입력해주세요.');
                return;
            }

            // 로그인 ID가 너무 짧은 경우
            if (loginId.length < 3) {
                e.preventDefault();
                alert('아이디는 3자 이상이어야 합니다.');
                return;
            }
        });

        // 페이지 로드 시 첫 번째 입력 필드에 포커스
        window.addEventListener('load', function() {
            document.getElementById('loginId').focus();
        });

        // Enter 키로 로그인 버튼 활성화
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.getElementById('loginForm').submit();
            }
        });

        // 네이버 로그인
        function naverLogin() {
            // TODO: 네이버 로그인 API 연동
            console.log('네이버 로그인 시도');
            alert('네이버 로그인 기능은 준비 중입니다.');
            // window.location.href = '${pageContext.request.contextPath}/auth/naver';
        }

        // 카카오 로그인
        function kakaoLogin() {
            // TODO: 카카오 로그인 API 연동
            console.log('카카오 로그인 시도');
            alert('카카오 로그인 기능은 준비 중입니다.');
            // window.location.href = '${pageContext.request.contextPath}/auth/kakao';
        }
    </script>
</body>
</html>