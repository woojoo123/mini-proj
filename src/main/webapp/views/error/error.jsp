<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <c:set var="pageTitle" value="오류 발생" scope="request" />
    <c:set var="pageDescription" value="시스템 오류가 발생했습니다." scope="request" />
    <%@ include file="../common/meta.jsp" %>
    <title>${pageTitle} - 보호소 관리 시스템</title>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    <%@ include file="../common/nav.jsp" %>

    <main class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="text-center">
                    <!-- Error Icon -->
                    <div class="error-icon mb-4">
                        <i class="fas fa-exclamation-triangle text-warning" style="font-size: 4rem;"></i>
                    </div>

                    <!-- Error Title -->
                    <h1 class="display-4 text-primary mb-3">오류 발생</h1>

                    <!-- Error Message -->
                    <div class="alert alert-danger" role="alert">
                        <h4 class="alert-heading">시스템 오류</h4>
                        <p class="mb-0">
                            <c:choose>
                                <c:when test="${not empty errorMessage}">
                                    ${errorMessage}
                                </c:when>
                                <c:when test="${not empty exception.message}">
                                    ${exception.message}
                                </c:when>
                                <c:otherwise>
                                    예상치 못한 오류가 발생했습니다.
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>

                    <!-- Error Details (Development Mode) -->
                    <c:if test="${not empty exception and pageContext.request.serverName == 'localhost'}">
                        <div class="card mt-4">
                            <div class="card-header">
                                <h5 class="mb-0">오류 상세 정보 (개발 모드)</h5>
                            </div>
                            <div class="card-body text-start">
                                <p><strong>Exception Type:</strong> ${exception.class.name}</p>
                                <c:if test="${not empty exception.stackTrace}">
                                    <details>
                                        <summary>스택 트레이스</summary>
                                        <pre class="mt-2 p-3 bg-light"><c:forEach items="${exception.stackTrace}" var="trace">${trace}
</c:forEach></pre>
                                    </details>
                                </c:if>
                            </div>
                        </div>
                    </c:if>

                    <!-- Action Buttons -->
                    <div class="mt-4">
                        <button onclick="history.back()" class="btn btn-outline-secondary me-2">
                            <i class="fas fa-arrow-left me-1"></i>
                            이전 페이지
                        </button>
                        <a href="${pageContext.request.contextPath}/" class="btn btn-primary">
                            <i class="fas fa-home me-1"></i>
                            홈으로
                        </a>
                    </div>

                    <!-- Support Information -->
                    <div class="mt-5 p-4 bg-light rounded">
                        <h5 class="text-muted">도움이 필요하신가요?</h5>
                        <p class="text-muted mb-2">문제가 지속되면 관리자에게 문의하세요.</p>
                        <a href="${pageContext.request.contextPath}/inquiry/write" class="btn btn-sm btn-outline-info">
                            <i class="fas fa-question-circle me-1"></i>
                            문의하기
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="../common/footer.jsp" %>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Auto-refresh prevention for error pages -->
    <script>
        window.addEventListener('pageshow', function(event) {
            if (event.persisted) {
                window.location.reload();
            }
        });
    </script>
</body>
</html>