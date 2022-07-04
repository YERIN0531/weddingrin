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
<link href="${conPath }/css/admin/list.css" rel="stylesheet">
	<style>
	
	</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('tr').click(function(){
				var mid = $(this).children().eq(1).html();
				if(mid!='아이디'){
					location.href='${conPath}/MListContent.do?mid='+mid;
				}
			});
		});
	</script>
</head>
<body>
	<c:if test="${not empty aloginErrorMsg }">
		<script>
			alert('${aloginErrorMsg}');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty adminCodeError }">
		<script>
			alert('${adminCodeError}');
			history.back();
		</script>
	</c:if>
	
	
   <jsp:include page="../main/header.jsp"/>
   <section>
   <div id="main">
   <div id="border">
   	<table>
   		<caption>MEMBERSHIP</caption>
   		<tr><td>&nbsp;</td></tr>
   		<tr><th>회원이름</th><th>아이디</th><th>전화번호</th></tr>
   		<c:forEach var="dto" items="${mListView }">
   			<tr>
   			<td>${dto.mname }</td><td>${dto.mid }</td><td>${dto.mtel }</td>
   			</tr>
   		</c:forEach>
   	</table>
   	<div class="paging">
		<a href="${conPath }/MListView.do?pageNum=1">&lt;&lt;</a>
		&nbsp; &nbsp; &nbsp;
		<c:if test="${startPage>BLOCKSIZE }">
			<a href="${conPath }/MListView.do?pageNum=${startPage-1}">&lt;</a>
		</c:if>
		<c:if test="${startPage<=BLOCKSIZE }">
			&lt;
		</c:if>
		&nbsp; &nbsp; &nbsp;
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				[ <b>${i }</b> ]
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/MListView.do?pageNum=${i}">${i }</a> ]
			</c:if>
		</c:forEach>
		&nbsp; &nbsp; &nbsp;
		<c:if test="${endPage < pageCnt }">
			<a href="${conPath }/MListView.do?pageNum=${endPage+1}">&gt;</a>
		</c:if>
		<c:if test="${endPage == pageCnt }">
			&gt;
		</c:if>
		&nbsp; &nbsp; &nbsp;
		<a href="${conPath }/MListView.do?pageNum=${pageCnt}">&gt;&gt;</a>
	</div>
   	</div>
   </div>
   </section>
   <jsp:include page="../main/footer.jsp"/>
</body>
</html>