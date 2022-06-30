<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/header.css" rel="stylesheet">
 <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<header>
<c:if test="${empty member and empty admin}">
            <div id="gnb">
                <div id="left">
                <a href="${conPath }/main.do">WEDDING_RIN</a>
                </div>
                <div id="right">
                <ul>
                <li><a href="#">INFO</a></li>
                <li><a href="${conPath }/memberJoinView.do">JOIN</a></li>
                <li><a href="${conPath }/memberLoginView.do">LOGIN</a></li>
                </ul>
                </div>
            </div>
            <div id="logo">
                <h1>faith, hope and love</h1>
            </div>
            <div id="lnb">
            <ul>
            <li><a href="#">전체목록</a></li>
            <li><a href="#">지역별</a></li>
            <li><a href="#">후기게시판</a></li>
            <li><a href="#">문의사항</a></li>
            </ul>
            </div>
        
</c:if> 
<c:if test="${not empty member and empty admin}"> <%--로그인 후 화면 --%>
            <div id="gnb">
                <div id="left">
                <a href="${conPath }/main.do">WEDDING_RIN</a>
                </div>
                <div id="right">
                <ul>
                <li><a href="#">INFO</a></li>
                <li><a href="#">MY</a></li>
                <li><a href="${conPath }/memberLogout.do">LOGOUT</a></li>
                </ul>
                </div>
            </div>
            <div id="logo">
                <h1>faith, hope and love</h1>
            </div>
            <div id="lnb">
            <ul>
            <li><a href="#">전체목록</a></li>
            <li><a href="#">지역별</a></li>
            <li><a href="#">후기게시판</a></li>
            <li><a href="#">문의사항</a></li>
            </ul>
            </div>
</c:if> 
</header>
</body>
</html>