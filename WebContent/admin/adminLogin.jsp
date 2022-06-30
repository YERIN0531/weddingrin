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
<link href="${conPath }/css/alogin.css" rel="stylesheet">
	<style></style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
	<c:if test="${not empty adminCodeError }">
		<script>
		alert('${adminCodeError}');
		history.back();
		</script>
	</c:if>
	<c:if test="${not empty adminJoinResult }">
		<script>
		alert('${adminJoinResult}');
		</script>
	</c:if>
	
   <jsp:include page="../main/header.jsp"/>
<section>
        <div id="main">
            <form action="${conPath }/adminLogin.do" method="post">
                <div id="border">
                    <table>
                        <caption>WEDDING_RIN</caption>
                        <tr><td colspan="2"></td></tr>
                        <tr><td colspan="2" class="login">ADMINLOGIN</td></tr>
                        <tr>
                            <td colspan="2"></td>
                        </tr>

                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="aid" required="required">
                            </td>
                        </tr>

                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="password" name="apw" required="required" />
                            </td>
                        </tr>
                        <tr>
                            <td>관리자코드</td>
                            <td>
                                <input type="password" name="acode" required="required" />
                            </td>
                        </tr>
                        <td colspan="2"></td>
                        <tr>
                            <td colspan="2" class="but">
                                <input type="submit" value="로그인" class="btn">
                            </td>
                        </tr>
                        <tr>
                        <td colspan="2"><a href="${conPath }/adminJoinView.do" class="ad">관리자등록하기</a></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </section>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>