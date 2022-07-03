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
		<caption>${reviewboard.rno }글 상세보기</caption>
		<tr>
		<td>작성자</td>
		<td>${member.mname }(${reviewboard.mid })님</td>
		</tr>
		<tr>
		<td>제목</td>
		<td>${reviewboard.rtitle }</td>
		</tr>
		<tr>
		<td>본문</td>
		<td><pre>${reviewboard.rcontent }</pre></td>
		</tr>
		<tr>
		<th>후기사진</th>
		<td>
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
				 				<button onclick="location='${conPath}/ReviewModifyView.do?rno=${reviewboard.rno }&pageNum=${param.pageNum }'">수정</button>
				 			</c:if>
				 			<c:if test="${member.mid eq reviewboard.mid or not empty admin}">
				 				<button onclick="location='${conPath}/ReviewDelete.do?rno=${reviewboard.rno }&pageNum=${param.pageNum }'">삭제</button>
				 			</c:if>
				 			<input type="button" value="목록" class="btn"
				 	onclick="location='${conPath}/ReviewList.do?pageNum=${param.pageNum }'">	
			
			</td>
		</tr>
	</table>
		<jsp:include page="../main/footer.jsp"/>
</body>
</html>









