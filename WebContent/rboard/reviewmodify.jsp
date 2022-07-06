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
		<p>REVIEW_MODIFY</p>
    </div>
	<div id="border2">
	<form action="${conPath }/ReviewModify.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="rno" value="${board.rno }">
			<input type="hidden" name="dbFileName" value="${board.rfilename }">
	<table>
			<caption>${board.rno }no MODIFY</caption>
			<tr>
			<th>작성자</th>
			<td><input type="text" required="required" value="${member.mname }(${board.mid})" readonly="readonly"></td>
			</tr>
			<tr>
			<th>제목</th>
			<td class="two"><input type="text" name="rtitle" required="required" value="${board.rtitle }"></td>
			</tr>
			<tr>
			<th>본문</th>
			<td class="three"><textarea name="rcontent" rows="10" cols="35">${board.rcontent }</textarea>
			</td>
			</tr>
			<tr>
			<th colspan="2">후기사진</th>
			</tr>
			
			<tr>
			<td colspan="2">
				<c:if test="${not empty board.rfilename }">
				<img src='${conPath }/reviewBoardUp/${board.rfilename}' class="modifyimg">
				</c:if>
				<input type="file" name="rfilename"> 
				<c:if test="${empty board.rfilename }">
					<div class="nofile"><p>원본첨부파일 없음</p></div>
				</c:if>
			</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" class="btn">
					<input type="button" value="목록" onclick="location='${conPath }/ReviewList.do?pageNum=${param.pageNum }'" class="btn">
					<input type="reset" value="이전" onclick="history.back()" class="btn">			
				</td>
			</tr>
		</table>
	</form>	
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>