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
<link href="${conPath }/css/style.css" rel="stylesheet">
	<style></style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
	<form action="${conPath }/replyModify.do">
		<input type="hidden" name="wno" value="${dto.wno }">
		<input type="hidden" name="wreno" value="${dto.wreno }">
		<table>
		<tr><td>
		<textarea rows="2" cols="20" name="wmemo">${dto.wmemo }</textarea>
		</td></tr>
		<tr><td>
		<input type="submit" value="수정">
		</td></tr>
		</table>
	</form>
</body>
</html>