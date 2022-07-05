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
	<style></style>
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
            <li><a href="${conPath }/WLocalListView.do">지역별</a></li>
            <li><a href="${conPath }/ReviewList.do">후기게시판</a></li>
            <li><a href="${conPath }/QnaList.do">문의사항</a></li>
            </ul>
            </div>
	<form action="${conPath }/WLocalListView.do">
	<table id="selectlocal">
	<caption class="localcaption">WEDDING_RIN</caption>
		<tr><td>&nbsp;&nbsp;</td></tr> 
		<tr>
			<td>지역별</td>
			<td>
			<select name="wloc" id="option">
				<option>선택하기</option>
				<option>강서</option>
				<option>양천</option>
				<option>구로</option>
				<option>영등포</option>
				<option>금천</option>
				<option>동작</option>
				<option>관악</option>
				<option>서초</option>
				<option>강남</option>
				<option>송파</option>
				<option>강동</option>
				<option>마포</option>
				<option>은평</option>
				<option>서대문</option>
				<option>용산</option>
				<option>중구</option>
				<option>종로</option>
				<option>성북</option>
				<option>성동</option>
				<option>동대문</option>
				<option>광진</option>
				<option>중랑</option>
				<option>노원</option>
				<option>강북</option>
				<option>도봉</option>
				<option>광진</option>
			</select>
			</td>
			<td><input type="submit" value="찾기"></td>
		</tr>
	</table>
	</form>		
	
   
   <c:if test="${not empty wlocalListView }">
   <section>
   <div id="main">
   <div id="border">
   	<table>
   		<tr>
	   		<c:set var="idx" value="1"/>
	   		<c:forEach var="dto" items="${wlocalListView }">
		
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
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				[ <b>${i }</b> ]
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/WLocalListView.do?pageNum=${i}&wno=${weddinghall.wno}">${i }</a> ]
			</c:if>
		</c:forEach>
		&nbsp; &nbsp; &nbsp;
		<c:if test="${endPage < pageCnt }">
			<a href="${conPath }/WLocalListView.do?pageNum=${endPage+1}&wno=${weddinghall.wno}">&gt;</a>
		</c:if>
	</div>
   	</div>
   </div>
   </section>
</c:if>
   <c:if test="${empty wlocalListView }">
   <section>
   		<div id="beforelocal">
    	<p>지역을 선택해 주세요</p>
    	</div>
    </section> 
   </c:if>


<jsp:include page="../main/footer.jsp"/>
</body>
</html>