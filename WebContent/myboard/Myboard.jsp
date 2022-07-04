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
	<style>
		#show1{
		display:none;
		}
		#show2{
		display:none;
		}
	</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('.1').click(function(){
				$('#show1').toggle();
			});
			
			$('.2').click(function(){
				$('#show2').toggle();
			});
			
			$('#show2 tr').click(function(){
				var wno = Number($(this).children().eq(0).text());
				if(!isNaN(wno)){
					location.href='${conPath}/Wcontent.do?wno='+wno+'&mid=${member.mid}&pageNum=${pageNum}';
				}
			});
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
					<td><input type="text" name="mid" value="${member.mid }"
									readonly="readonly">
					</td>
			</tr>
			<tr><th>회원이름</th>
					<td><input type="text" name="mname" value="${member.mname }"
									readonly="readonly">
					</td>
			</tr>
			<tr><th>메일</th><td><input type="email" name="memail" value="${member.memail }" readonly="readonly"></td></tr>
			<tr><th>생년월일</th>
					<td colspan="2">
						<input type="text" name="mbirth" id="mbirth" value="${member.mbirth }" id="birth" readonly="readonly">
					</td>
			</tr>
			<tr><th>주소</th>
					<td colspan="2">
						<input type="text" name="maddress" value="${member.maddress }" readonly="readonly">
					</td>
			</tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			<tr><td colspan="3">
						<input type="button" value="이전" onclick="history.go(-1)" class="btn">
						<input type="button" value="회원삭제" 
								onclick="location.href='${conPath}/withdrawal.do'" class="btn">
						<input type="button" value="내정보수정"
								onclick="#">
					</td>
			</tr>
		</table>
		
		
		<button class="1">예약현황가져오기</button>
		<div id="show1">
			<table>
				<caption>예약현황가져오기</caption>
				<tr><th>예약번호</th><th>예약자</th><th>홀번호</th><th>예약날짜</th></tr>
				<c:forEach items="${reserve }" var="rs">
				<tr>
				<td>${rs.rsno }</td>
				<td>${rs.mid }</td>
				<td>${rs.wno }</td>
				<td><fmt:formatDate value="${rs.wdate }" type="date" dateStyle="short"/></td>
				</tr>
				</c:forEach>
					
			</table>
		</div>
		<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
		<button class="2">찜한목록가져오기</button>
		<div id="show2">
		<table>
			<caption>내가 찜한 목록 가져오기</caption>
			<tr><th>홀번호</th><th>아이디</th><th>홀번호</th><th>찜한날짜</th></tr>
				<c:forEach items="${zimlist }" var="zim">
				<tr>
				<td>${zim.wno }</td>
				<td>${zim.wname }</td>
				<td>${zim.waddress }</td>
				<td>${zim.wloc }</td>
				</tr>
				</c:forEach>
			
		</table>
		</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>