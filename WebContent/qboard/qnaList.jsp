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
			$('tr').click(function(){
				var qno = Number($(this).children().eq(0).text());
				if(!isNaN(qno)){
					location.href='${conPath}/QnaContent.do?qno='+qno+'&pageNum=${pageNum}';
				}
				
			});
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
			<td>${qna.qtitle }</td>
			<td>${qna.qhit }</td>
			<td><fmt:formatDate value="${qna.qdate }" type="date" dateStyle="short"/></td>
			</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
	<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/QnaList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				<b> [ ${i } ] </b>
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/QnaList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/QnaList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>