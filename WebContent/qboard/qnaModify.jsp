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

	<form action="${conPath }/QnaModify.do">
	<input type="hidden" name="qno" value="${qnaboard.qno }">
	<input type="hidden" name="pageNum" value="${param.pageNum }">
	
		<table>
			<caption>${qnaboard.qno }번 글 수정</caption>
			<tr>
				<th>작성자</th>
				<td><input type="text" required="required" value="${qnaboard.qid }" readonly="readonly"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name ="qtitle" value="${qnaboard.qtitle }"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><textarea rows="5" cols="32" name="qcontent">${qnaboard.qcontent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="location='${conPath}/QnaList.do?pageNum=${param.pageNum }'">
					<input type="reset" value="이전" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>