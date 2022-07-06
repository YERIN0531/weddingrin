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
<link href="${conPath }/css/board/myboard.css" rel="stylesheet">
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
	<div id="logoss">
			<img src="${conPath }/icon/logo.png"> 
		</div>
	<div id="middle">
	<div id="logos">
		<p>INFOMATION</p>
    </div>
	<div id="wrap">
		<div id="memberinfo">
			<table>
					<tr><td colspan="2" class="name">${member.mname }회원</td></tr>
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
								<input type="button" value="정보수정" 
										onclick="location.href='${conPath}/memberModifyView.do'" class="btn">
								<input type="button" value="메인가기"
										onclick="location.href='${conPath}/main.do'" class="btn">
							</td>
					</tr>
				</table>
			</div><!-- memberInfo -->
		<div id="reserveinfo">
			<button class="1">RESERVATION</button>
			<div><p>예약을 확인하시고 싶으시면 클릭하세요</p></div>
			<div id="show1">
				<table>
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
		</div>
		
		<div id="ziminfo">
		<button class="2">SELECT</button>
		<div><p>내가 찜한 목록을 확인하시고 싶으시면 클릭하세요</p></div>
		<div id="show2">
		<table>
			<tr><th>번호</th><th>홀</th><th>주소</th><th>위치</th></tr>
				<c:forEach items="${zimlist }" var="zim">
				<tr>
				<td>${zim.wno }</td>
				<td>${zim.wname }</td>
				<td>${zim.waddress }</td>
				<td>${zim.wloc }</td>
				</tr>
				</c:forEach>
			
		</table>
		</div><!-- show2 -->
		</div><!--ziminfo-->
	
	</div><!-- wrap -->
	</div><!-- middle -->
<jsp:include page="../main/footer.jsp"/>
</body>
</html>