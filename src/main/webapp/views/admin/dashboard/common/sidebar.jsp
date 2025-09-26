<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    String contextPath = request.getContextPath();
	String urlLocation = "admin/dashboard/";
%>
<c:set var="currentPage" value="${pageContext.request.requestURI}" />
<head>
<title>Sidebar</title>
</head>

<aside class="sidebar">
        <h1>관리자</h1>
        <h1>${ currentPage }</h1>
        <p class="system-name">Member System</p>
        <nav>
            <ul>
                <li><a href="<%= contextPath %>/<%= urlLocation %>/management/list" class="${currentPage.contains('/userManagementList') ? 'active' : ''}">회원 관리</a></li>
            	<li><a href="<%= contextPath %>/shelterList" class="${currentPage.contains('/shelterList') ? 'active' : ''}">보호소 관리</a></li>
            	<li><a href="<%= contextPath %>/reportList" class="${currentPage.contains('/reportList') ? 'active' : ''}">신고 관리</a></li>
            	<li><a href="<%= contextPath %>/userSanctionList" class="${currentPage.contains('/userSanctionList') ? 'active' : ''}">이용자 제재</a></li>
            	<li><a href="<%= contextPath %>/blacklistList" class="${currentPage.contains('/blacklistList') ? 'active' : ''}">블랙리스트 관리</a></li>
            	<li><a href="<%= contextPath %>/userInquiryList" class="${currentPage.contains('/userInquiryList') ? 'active' : ''}">고객 문의 관리</a></li>
            	<li><a href="<%= contextPath %>/dataAnalysis" class="${currentPage.contains('/dataAnalysis') ? 'active' : ''}">통계</a></li>
            </ul>
        </nav>
</aside>
