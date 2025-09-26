<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 비밀번호 재설정 페이지 --%>
<div class="auth-container">
    <h2>비밀번호 재설정</h2>
    <form action="${pageContext.request.contextPath}/auth/reset-password" method="post">
        <%-- TODO: 비밀번호 재설정 폼 구현 --%>
        <input type="hidden" name="token" value="${token}">
        <input type="password" name="password" placeholder="새 비밀번호" required>
        <input type="password" name="passwordConfirm" placeholder="새 비밀번호 확인" required>
        <button type="submit">비밀번호 변경</button>
    </form>
</div>