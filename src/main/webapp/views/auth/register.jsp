<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <c:set var="pageTitle" value="회원가입" scope="request" />
    <c:set var="pageDescription" value="보호소 관리 시스템에 가입하세요." scope="request" />
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

        .register-container {
            background: var(--color-white);
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(60, 42, 33, 0.1);
            width: 100%;
            max-width: 480px;
            padding: 48px;
            margin: 20px;
        }

        .register-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .register-title {
            font-size: 32px;
            font-weight: 700;
            color: var(--color-brown-dark);
            margin: 0 0 8px 0;
        }

        .register-subtitle {
            font-size: 16px;
            color: var(--color-text-secondary);
            margin: 0;
        }

        .register-form {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: var(--color-brown-dark);
        }

        .form-input {
            padding: 16px 20px;
            border: 2px solid var(--color-accent);
            border-radius: 12px;
            font-size: 16px;
            background: var(--color-white);
            color: var(--color-text-primary);
            transition: all 0.3s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--color-brown-medium);
            box-shadow: 0 0 0 4px rgba(164, 144, 124, 0.1);
        }

        .form-input::placeholder {
            color: var(--color-text-muted);
        }

        .user-type-group {
            display: flex;
            gap: 16px;
            margin-top: 8px;
        }

        .radio-option {
            flex: 1;
            position: relative;
        }

        .radio-input {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        .radio-label {
            display: block;
            padding: 16px;
            border: 2px solid var(--color-accent);
            border-radius: 12px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            background: var(--color-white);
            font-weight: 500;
            color: var(--color-text-secondary);
        }

        .radio-input:checked + .radio-label {
            border-color: var(--color-brown-medium);
            background: var(--color-bg-light);
            color: var(--color-brown-dark);
        }

        .register-button {
            background: linear-gradient(135deg, var(--color-brown-medium) 0%, var(--color-brown-light) 100%);
            color: var(--color-white);
            border: none;
            padding: 18px 24px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 16px;
        }

        .register-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(141, 123, 104, 0.3);
        }

        .register-button:active {
            transform: translateY(0);
        }

        .login-link {
            text-align: center;
            margin-top: 32px;
            padding-top: 24px;
            border-top: 1px solid var(--color-accent);
        }

        .login-link-text {
            color: var(--color-text-secondary);
            font-size: 14px;
        }

        .login-link-button {
            color: var(--color-brown-medium);
            text-decoration: none;
            font-weight: 600;
            margin-left: 8px;
            transition: color 0.3s ease;
        }

        .login-link-button:hover {
            color: var(--color-brown-dark);
            text-decoration: underline;
        }

        .error-message {
            background: #fee2e2;
            color: #dc2626;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 14px;
            margin-bottom: 24px;
        }

        @media (max-width: 768px) {
            .register-container {
                margin: 10px;
                padding: 32px 24px;
            }

            .register-title {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <h1 class="register-title">회원가입</h1>
            <p class="register-subtitle">보호소 관리 시스템에 가입하세요</p>
        </div>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form class="register-form" action="${pageContext.request.contextPath}/auth/register" method="post">
            <!-- 사용자명 -->
            <div class="form-group">
                <label class="form-label" for="username">사용자명</label>
                <input type="text"
                       id="username"
                       name="username"
                       class="form-input"
                       placeholder="영문, 숫자, 언더스코어 3-20자"
                       value="${param.username}"
                       required>
            </div>

            <!-- 이메일 -->
            <div class="form-group">
                <label class="form-label" for="email">이메일</label>
                <input type="email"
                       id="email"
                       name="email"
                       class="form-input"
                       placeholder="email@example.com"
                       value="${param.email}"
                       required>
            </div>

            <!-- 비밀번호 -->
            <div class="form-group">
                <label class="form-label" for="password">비밀번호</label>
                <input type="password"
                       id="password"
                       name="password"
                       class="form-input"
                       placeholder="8자 이상, 영문+숫자+특수문자"
                       required>
            </div>

            <!-- 비밀번호 확인 -->
            <div class="form-group">
                <label class="form-label" for="passwordConfirm">비밀번호 확인</label>
                <input type="password"
                       id="passwordConfirm"
                       name="passwordConfirm"
                       class="form-input"
                       placeholder="비밀번호를 다시 입력해주세요"
                       required>
            </div>

            <!-- 실명 -->
            <div class="form-group">
                <label class="form-label" for="fullName">실명</label>
                <input type="text"
                       id="fullName"
                       name="fullName"
                       class="form-input"
                       placeholder="실명을 입력해주세요"
                       value="${param.fullName}"
                       required>
            </div>

            <!-- 연락처 -->
            <div class="form-group">
                <label class="form-label" for="phoneNumber">연락처</label>
                <input type="tel"
                       id="phoneNumber"
                       name="phoneNumber"
                       class="form-input"
                       placeholder="010-0000-0000"
                       value="${param.phoneNumber}"
                       pattern="010-\d{4}-\d{4}"
                       required>
            </div>

            <!-- 생년월일 -->
            <div class="form-group">
                <label class="form-label" for="birthDate">생년월일</label>
                <input type="date"
                       id="birthDate"
                       name="birthDate"
                       class="form-input"
                       value="${param.birthDate}"
                       required>
            </div>

            <!-- 주소 -->
            <div class="form-group">
                <label class="form-label" for="address">주소</label>
                <input type="text"
                       id="address"
                       name="address"
                       class="form-input"
                       placeholder="주소를 입력해주세요"
                       value="${param.address}"
                       required>
            </div>

            <!-- 우편번호 -->
            <div class="form-group">
                <label class="form-label" for="postalCode">우편번호</label>
                <input type="text"
                       id="postalCode"
                       name="postalCode"
                       class="form-input"
                       placeholder="12345"
                       value="${param.postalCode}"
                       pattern="\d{5}"
                       required>
            </div>

            <!-- 사용자 유형 -->
            <div class="form-group">
                <label class="form-label">사용자 유형</label>
                <div class="user-type-group">
                    <div class="radio-option">
                        <input type="radio" 
                               id="userTypeUser" 
                               name="userType" 
                               value="USER" 
                               class="radio-input" 
                               ${param.userType == 'USER' || empty param.userType ? 'checked' : ''}>
                        <label for="userTypeUser" class="radio-label">일반 사용자</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" 
                               id="userTypeShelter" 
                               name="userType" 
                               value="SHELTER_ADMIN" 
                               class="radio-input"
                               ${param.userType == 'SHELTER_ADMIN' ? 'checked' : ''}>
                        <label for="userTypeShelter" class="radio-label">보호소 관리자</label>
                    </div>
                </div>
            </div>

            <!-- 경험 여부 -->
            <div class="form-group">
                <label class="form-label">
                    <input type="checkbox" 
                           id="hasExperience" 
                           name="hasExperience" 
                           value="true"
                           ${param.hasExperience ? 'checked' : ''}>
                    동물 보호 관련 경험이 있습니다
                </label>
            </div>

            <button type="submit" class="register-button">회원가입</button>
        </form>

        <div class="login-link">
            <span class="login-link-text">이미 계정이 있으신가요?</span>
            <a href="${pageContext.request.contextPath}/auth/login" class="login-link-button">로그인</a>
        </div>
    </div>

    <script>
        // 비밀번호 확인 검증
        document.getElementById('passwordConfirm').addEventListener('blur', function() {
            const password = document.getElementById('password').value;
            const passwordConfirm = this.value;

            if (password && passwordConfirm && password !== passwordConfirm) {
                this.setCustomValidity('비밀번호가 일치하지 않습니다.');
            } else {
                this.setCustomValidity('');
            }
        });

        // 폼 제출 시 추가 유효성 검사
        document.querySelector('.register-form').addEventListener('submit', function(e) {
            const username = document.getElementById('username').value.trim();
            const email = document.getElementById('email').value.trim();
            const fullName = document.getElementById('fullName').value.trim();
            const phoneNumber = document.getElementById('phoneNumber').value.trim();
            const birthDate = document.getElementById('birthDate').value;
            const address = document.getElementById('address').value.trim();
            const postalCode = document.getElementById('postalCode').value.trim();

            // 기본 필드 검사
            if (!username || !email || !fullName || !phoneNumber || !birthDate || !address || !postalCode) {
                e.preventDefault();
                alert('모든 필수 항목을 입력해주세요.');
                return;
            }

            // 사용자명 형식 검사
            const usernameRegex = /^[a-zA-Z0-9_]{3,20}$/;
            if (!usernameRegex.test(username)) {
                e.preventDefault();
                alert('사용자명은 3-20자의 영문, 숫자, 언더스코어만 사용 가능합니다.');
                return;
            }

            // 연락처 형식 검사
            const phoneRegex = /^010-\d{4}-\d{4}$/;
            if (!phoneRegex.test(phoneNumber)) {
                e.preventDefault();
                alert('연락처는 010-0000-0000 형식으로 입력해주세요.');
                return;
            }

            // 우편번호 형식 검사
            const postalRegex = /^\d{5}$/;
            if (!postalRegex.test(postalCode)) {
                e.preventDefault();
                alert('우편번호는 5자리 숫자로 입력해주세요.');
                return;
            }
        });

        // 이메일 형식 검증 함수
        function isValidEmail(email) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }
    </script>
</body>
</html>