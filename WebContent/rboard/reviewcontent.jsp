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
		<p>REVIEW_CONTENT</p>
    </div>
	<div id="border">
		<table>
			<caption>${reviewboard.rno }no CONTENT</caption>
			<tr><td></td></tr>
			<tr>
			<th>작성자</th>
			<td class="one"><b>${reviewboard.mid }님</b></td>
			</tr>
			<tr>
			<th>제목</th>
			<th class="two">${reviewboard.rtitle }</th>
			</tr>
			<tr>
			<th>본문</th>
			<th class="three">${reviewboard.rcontent }</th>
			</tr>
			<tr>
			<th colspan="2">후기사진</th>
			</tr>
			
			<tr>
			<td colspan="2">
				<c:if test="${not empty reviewboard.rfilename }">
				<img src='${conPath }/reviewBoardUp/${reviewboard.rfilename}'>
				</c:if>
				<c:if test="${empty reviewboard.rfilename }">
					첨부파일 없음
				</c:if>
			</td>
			</tr>
			<tr>
				<td colspan="2">
				<c:if test="${member.mid eq reviewboard.mid }">
					 				<button class="btn" onclick="location='${conPath}/ReviewModifyView.do?rno=${reviewboard.rno }&pageNum=${param.pageNum }'">수정</button>
					 			</c:if>
					 			<c:if test="${member.mid eq reviewboard.mid or not empty admin}">
					 				<button class="btn" onclick="location='${conPath}/ReviewDelete.do?rno=${reviewboard.rno }&pageNum=${param.pageNum }'">삭제</button>
					 			</c:if>
					 			<input type="button" value="목록" class="btn"
					 	onclick="location='${conPath}/ReviewList.do?pageNum=${param.pageNum }'">	
				
				</td>
			</tr>
		</table>
	</div>
		<jsp:include page="../main/footer.jsp"/>
</body>
</html>









