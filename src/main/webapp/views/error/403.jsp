<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>접근 권한 없음 - 동반자</title>
</head>
<body>
    <div class="error-page">
        <h1>403 - 접근 권한이 없습니다</h1>
        <p>요청하신 페이지에 접근할 권한이 없습니다.</p>
        <a href="${pageContext.request.contextPath}/">홈으로 돌아가기</a>
    </div>
</body>
</html>