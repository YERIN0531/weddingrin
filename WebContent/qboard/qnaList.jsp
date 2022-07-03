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
		<tr><td>
			<c:if test="${not empty member }">
				<a href="${conPath }/QnaWriteView.do">글쓰기</a>
			</c:if>
			<c:if test="${empty member }">
				<a href="${conPath }/memberLoginView.do">글쓰기는 사용자 로그인 후에 이용 가능합니다</a>
			</c:if>
		</td></tr>
	</table>
	
	<table>
		<tr><th>글번호</th><th>작성자</th><th>글제목</th><th>조회수</th><th>날짜</th></tr>
		<c:if test="${totCnt==0 }">
			<tr><td colspan="6">등록된 글이 없습니다</td></tr>
		</c:if>
		<c:if test="${totCnt!=0 }">
			<c:forEach items="${qnaList }" var="qna">
			<tr>
			<td>${qna.qno }</td>
			<td>${qna.qid }</td>
			<td>${qna.rtitle }</td>
			<td>${qna.rhit }</td>
			<td><fmt:formatDate value="${qna.rdate }" type="date" dateStyle="short"/></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>