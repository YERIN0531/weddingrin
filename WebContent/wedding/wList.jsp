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
<link href="${conPath }/css/wedding/wlist.css" rel="stylesheet">
	<style>
	
	</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
	
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div>&nbsp;</div>
    <div id="lnb">
            <ul>
            <li><a href="${conPath }/WListView.do">전체목록</a></li>
            <li><a href="#">지역별</a></li>
            <li><a href="${conPath }/ReviewList.do">후기게시판</a></li>
            <li><a href="#">문의사항</a></li>
            </ul>
            </div>
   <section>
   <div id="main">
   <div id="border">
   	
   	
   	<table>
   		<caption>WEDDING_RIN</caption>
		<tr><td>&nbsp;</td></tr>   	
   		
   		<tr>
	   		<c:set var="idx" value="1"/>
	   		<c:forEach var="dto" items="${wListView }">
		
			<td>
			<a href="${conPath }/Wcontent.do?wno=${dto.wno}&mid=${member.mid}"><img src="${conPath }/wimg/${dto.wimage}"></a>
			<p class="hallname">${dto.wname}</p>
			<p class="halladdress">${dto.wloc }</p>
			</td>
			
			<c:if test="${idx%3 eq 0 }">
				<tr></tr>				
			</c:if>
			<c:set var="idx" value="${idx+1 }"/>
		</c:forEach>
		</tr>
   		
   	
   	</table>
   	
   	
   	<div class="paging">
		<a href="${conPath }/WListView.do?pageNum=1">&lt;&lt;</a>
		&nbsp; &nbsp; &nbsp;
		<c:if test="${startPage>BLOCKSIZE }">
			<a href="${conPath }/WListView.do?pageNum=${startPage-1}&wno=${weddinghall.wno}">&lt;</a>
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
				[ <a href="${conPath }/WListView.do?pageNum=${i}&wno=${weddinghall.wno}">${i }</a> ]
			</c:if>
		</c:forEach>
		&nbsp; &nbsp; &nbsp;
		<c:if test="${endPage < pageCnt }">
			<a href="${conPath }/WListView.do?pageNum=${endPage+1}&wno=${weddinghall.wno}">&gt;</a>
		</c:if>
		<c:if test="${endPage == pageCnt }">
			&gt;
		</c:if>
		&nbsp; &nbsp; &nbsp;
		<a href="${conPath }/WListView.do?pageNum=${pageCnt}&wno=${weddinghall.wno}">&gt;&gt;</a>
	</div>
   	</div>
   </div>
   </section>
   <jsp:include page="../main/footer.jsp"/>
</body>
</html>