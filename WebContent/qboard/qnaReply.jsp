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
<link href="${conPath }/css/board/reviewwrite.css" rel="stylesheet">
	<style></style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="logos">
		<p>QNA_REPLY</p>
	</div>
	<div id="border">
	<form action="${conPath }/QboardReply.do" method="post">
			<input type="hidden" name="qgroup" value="${originBoard.qgroup }">
			<input type="hidden" name="qstep" value="${originBoard.qstep }">
			<input type="hidden" name="qindent" value="${originBoard.qindent }">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="qid" value="${admin.aid }">
		<table id="replyboard">
			<tr>
			<th>제목</th>
			<td>
			<input type="text" name="qtitle" required="required" value="└─[답]${originBoard.qtitle }" class="replytitle">
			</td>
			</tr>
			<tr>
			<th>본문</th>
			<td><textarea name="qcontent" rows="15" cols="37" class="replycontent"></textarea></td>
			</tr>
			<tr>
			<td colspan="2">
				<input type="submit" value="답변쓰기" class="btn">
				<input type="reset" value="취소" class="btn">
				<input type="button" value="목록" onclick="location.href='${conPath}/QnaList.do'" class="btn">
			</td>
			</tr>
		</table>
	</form>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>






