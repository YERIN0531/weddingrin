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
<link href="${conPath }/css/content.css" rel="stylesheet">
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
		<caption>INFORMATION</caption>
			<tr><td colspan="2" class="name">${mDto.mname }회원</td></tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><th>회원아이디</th>
					<td><input type="text" name="mid" value="${mDto.mid }"
									readonly="readonly">
					</td>
			</tr>
			<tr><th>회원이름</th>
					<td><input type="text" name="mname" value="${mDto.mname }"
									readonly="readonly">
					</td>
			</tr>
			<tr><th>메일</th><td><input type="email" name="memail" value="${mDto.memail }" readonly="readonly"></td></tr>
			<tr><th>생년월일</th>
					<td colspan="2">
						<input type="text" name="mbirth" id="mbirth" value="${mDto.mbirth }" id="birth" readonly="readonly">
					</td>
			</tr>
			<tr><th>주소</th>
					<td colspan="2">
						<input type="text" name="maddress" value="${mDto.maddress }" readonly="readonly">
					</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><td colspan="3">
						<input type="button" value="이전" onclick="history.go(-1)" class="btn">
						<input type="button" value="회원삭제" 
								onclick="location.href='${conPath}/withdrawal.do'" class="btn">	
					</td>
			</tr>
		</table>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>