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
	<form action="${conPath }/QboardReply.do" method="post">
		<table>
			<caption>${originBoard.qno }번글의 답변쓰기 폼</caption>
			<tr>
			<td>제목</td>
			<td>
			<input type="text" name="qgroup" value="${originBoard.qgroup }">
			<input type="text" name="qstep" value="${originBoard.qstep }">
			<input type="text" name="qindent" value="${originBoard.qindent }">
			<input type="text" name="pageNum" value="${param.pageNum }">
			<input type="text" name="qid" value="${admin.aid }">
			<input type="text" name="qtitle" required="required" value="└─[답]${originBoard.qtitle }">
			</td>
			</tr>
			<tr>
			<td>본문</td>
			<td><textarea name="qcontent" rows="3" cols="3"></textarea></td>
			</tr>
			<tr>
			<td colspan="2">
				<input type="submit" value="답변쓰기">
				<input type="reset" value="취소">
				<input type="button" value="목록" onclick="location.href='${conPath}/QnaList.do'">
			</td>
			</tr>
		</table>
	</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>






