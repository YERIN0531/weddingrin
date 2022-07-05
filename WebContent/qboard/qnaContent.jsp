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
<link href="${conPath }/css/board/boardcontent.css" rel="stylesheet">
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
		<p>QNA_CONTENT</p>
    </div>
	<div id="border">
	<table>
		<caption>${qnacontent.qno }no CONTENT</caption>
		<tr>
			<td><b>작성자</b></td>
			<td><b>${qnacontent.qid }님</b></td>
		</tr>
		<tr>
			<td><b>제목</b></td>
			<td><b>${qnacontent.qtitle }</b></td>
		</tr>
		<tr>
			<td><b>본문</b></td>
			<td><b><pre>${qnacontent.qcontent }</pre></b></td>
		</tr>
		<tr>
			<td colspan="2">
				<c:if test="${member.mid eq qnacontent.qid }">
				 				<button onclick="location='${conPath}/QnaModifyView.do?qno=${qnacontent.qno }&pageNum=${param.pageNum }'">수정</button>
				 			</c:if>
				 			<c:if test="${member.mid eq qnacontent.qid or not empty admin}">
				 				<button onclick="location='${conPath}/QnaDelete.do?qno=${qnacontent.qno }&pageNum=${param.pageNum }'">삭제</button>
				 			</c:if>
				 			<c:if test="${not empty admin and empty member.mid }">
				 				<button onclick="location='${conPath}/QboardReplyView.do?qno=${qnacontent.qno }&pageNum=${param.pageNum }&aid=${admin.aid }'">답변</button>
				 			</c:if>
				 			<input type="button" value="목록" class="btn"
				 	onclick="location='${conPath}/QnaList.do?pageNum=${param.pageNum }'">	
			</td>
		</tr>
	</table>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>