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
	<table>
		<caption>${qnacontent.qno }글 상세보기</caption>
		<tr>
			<td>작성자</td>
			<td>${qnacontent.qid }님</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${qnacontent.qtitle }</td>
		</tr>
		<tr>
			<td>본문</td>
			<td><pre>${qnacontent.qcontent }</pre></td>
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
<jsp:include page="../main/footer.jsp"/>
</body>
</html>