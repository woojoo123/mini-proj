<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>500 - Internal Server Error</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            text-align: center; 
            padding: 50px; 
        }
        h1 { color: #d32f2f; }
        .error-details {
            margin: 20px 0;
            padding: 15px;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
            text-align: left;
            max-width: 800px;
            margin: 20px auto;
        }
    </style>
</head>
<body>
    <h1>500 - Internal Server Error</h1>
    <p>Sorry, something went wrong on our end.</p>
    
    <c:if test="${not empty pageContext.errorData.throwable}">
        <div class="error-details">
            <p><strong>Error:</strong> ${pageContext.errorData.throwable}</p>
        </div>
    </c:if>
    
    <p><a href="${pageContext.request.contextPath}/">Go to Home Page</a></p>
</body>
</html>
