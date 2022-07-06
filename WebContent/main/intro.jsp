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
<link href="${conPath }/css/main/intro.css" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	</script>
</head>
<body>
  <div id="back">
        <img src="${conPath }/image/intro5.jpg" alt="" />
    </div>
    <div id="front">
        <h2>Preimium Wedding Service</h2>
        <h1>Wedding rin_</h1>
        <ul>
            <li><a href="${conPath }/memberJoinView.do">JOIN</a></li>
            <li><a href="${conPath }/memberLoginView.do">LOGIN</a></li>
            <li><a href="${conPath }/main.do">MAIN</a></li>
        </ul>
    </div>
</body>
</html>