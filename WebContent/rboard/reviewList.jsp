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
<link href="${conPath }/css/board/review.css" rel="stylesheet">
	<style></style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('tr').click(function(){
				var rno = Number($(this).children().eq(0).text());
				if(!isNaN(rno)){
					location.href='${conPath}/ReviewContent.do?rno='+rno+'&pageNum=${pageNum}';
				}
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
		<div>&nbsp;</div>
    	<div id="lnb">
            <ul>
	            <li><a href="${conPath }/WListView.do">전체목록</a></li>
	            <li><a href="${conPath }/WLocalListView.do">지역별</a></li>
	            <li><a href="${conPath }/ReviewList.do">후기게시판</a></li>
	            <li><a href="${conPath }/QnaList.do">문의사항</a></li>
            </ul>
          </div>
         <div id="logos">
			<p>REVIEW_BOARD</p>
         </div>
	<div id="wrap">
		<div id="writeform">
			<table>
				<tr><td>
					<c:if test="${not empty member }">
						<a href="${conPath }/ReviewWriteView.do">&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;글쓰기</a>
					</c:if>
					<c:if test="${empty member }">
						<a href="${conPath }/memberLoginView.do">글쓰기는 사용자 로그인 후에 이용 가능합니다</a>
					</c:if>
				</td></tr>
			</table>
		</div> <!-- writeform -->
		<div id="listform">
			<table>
				<tr><th>글번호</th><th>작성자</th><th>글제목</th><th>조회수</th><th>날짜</th></tr>
				<c:if test="${totCnt==0 }">
					<tr><td colspan="6">등록된 글이 없습니다</td></tr>
				</c:if>
				<c:if test="${totCnt!=0 }">
					<c:forEach items="${allreviewList }" var="reviews">
						<tr>
							<td>${reviews.rno }</td>
							<td>${reviews.mid }</td>
							<td>${reviews.rtitle }</td>
							<td>${reviews.rhit }</td>
							<td><fmt:formatDate value="${reviews.rdate }" type="date" dateStyle="short"/></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div> <!-- listform -->
	</div> <!-- wrap -->
		<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/ReviewList.do?pageNum=${startPage-1}"> 이전 </a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				<b> [ ${i } ] </b>
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/ReviewList.do?pageNum=${i}"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/ReviewList.do?pageNum=${endPage+1}"> 다음 </a> ]
		</c:if>
	</div>
	
	
	<jsp:include page="../main/footer.jsp"/>
	
</body>
	
</html>