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
<jsp:include page="../main/header.jsp"/>
	<form action="${conPath }/ReviewWrite.do" method="post" enctype="multipart/form-data">
		<table>
			<caption>글쓰기</caption>
			<tr>
			<td>제목</td>
			<td><input type="text" name="rtitle" required="required"></td>
			</tr>
			<tr>
			<td>본문</td>
			<td><textarea name="rcontent" rows="3" cols="3"></textarea></td>
			</tr>
			<tr>
			<td>첨부파일</td>
			<td><input type="file" name="rfilename"></td>
			</tr>
			<tr>
			<td colspan="2">
				<input type="submit" value="글쓰기">
				<input type="reset" value="취소">
				<input type="button" value="목록" onclick="location.href='${conPath}/ReviewList.do'">
			</td>
			</tr>
		</table>
	</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>