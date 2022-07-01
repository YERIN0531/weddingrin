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
<link href="${conPath }/css/main/footer.css" rel="stylesheet">
 <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
 <footer>
        <div class="office_address">
            <ul>
                <li>info@weddingrin.com|<a href="${conPath }/adminLoginView.do">관리자모드</a></li>
                <li>(주)웨딩린|대표이사 서예린|사업자번호 010-6666-0012|서울특별시 구로구 오류동</li>
                <li>
                    ⓒHOWTOSEARCHWEDDINGHALL 2022 ALL RIGHTS RESERVED
                </li>
            </ul>
        </div>
        
        </footer>
</body>
</html>