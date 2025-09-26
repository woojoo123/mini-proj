<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 비밀번호 찾기 페이지 --%>
<div class="auth-container">
    <h2>비밀번호 찾기</h2>
    <form action="${pageContext.request.contextPath}/auth/forgot-password" method="post">
        <%-- TODO: 비밀번호 찾기 폼 구현 --%>
        <input type="email" name="email" placeholder="가입된 이메일을 입력하세요" required>
        <button type="submit">비밀번호 재설정 링크 보내기</button>
    </form>
</div>