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
<form action="${conPath }/ReviewModify.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<input type="hidden" name="rno" value="${board.rno }">
		<input type="hidden" name="dbFileName" value="${board.rfilename }">
<table>
		<caption>${board.rno }번 글 수정</caption>
		<tr>
		<td>작성자</td>
		<td><input type="text" required="required" value="${member.mname }(${board.mid})" readonly="readonly"></td>
		</tr>
		<tr>
		<td>제목</td>
		<td><input type="text" name="rtitle" required="required" value="${board.rtitle }"></td>
		</tr>
		<tr>
		<td>본문</td>
		<td><textarea name="rcontent" rows="3" cols="3">${board.rcontent }</textarea>
		</td>
		</tr>
		<tr>
		<th>후기사진</th>
		<td>
			<input type="file" name="rfilename">원첨부파일 : 
			<c:if test="${not empty board.rfilename }">
			<img src='${conPath }/reviewBoardUp/${board.rfilename}'>
			</c:if>
			<c:if test="${empty board.rfilename }">
				첨부파일 없음
			</c:if>
		</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="목록" onclick="location='${conPath }/ReviewList.do?pageNum=${param.pageNum }'">
				<input type="reset" value="이전" onclick="history.back()">			
			</td>
		</tr>
	</table>
</form>	
<jsp:include page="../main/footer.jsp"/>
</body>
</html>