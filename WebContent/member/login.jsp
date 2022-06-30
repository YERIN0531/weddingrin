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
<link href="${conPath }/css/login.css" rel="stylesheet">
	<style></style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:if test="${not empty memberJoinResult }">
		<script>
			alert('${memberJoinResult}');
		</script>
	</c:if>
 	<jsp:include page="../main/header.jsp"/>
 <section>
        <div id="main">
            <form action="${conPath }/memberLogin.do" method="post">
                <div id="border">
                    <table>
                        <caption>WEDDING_RIN</caption>
                        <tr><td colspan="2"></td></tr>
                        <tr><td colspan="2" class="login">LOGIN</td></tr>
                        <tr>
                            <td colspan="2"></td>
                        </tr>

                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="mid" required="required">
                            </td>
                        </tr>

                        <tr>
                            <td>비밀번호</td>
                            <td>
                                <input type="text" name="mpw" required="required" />
                            </td>
                        </tr>
                        <td colspan="2"></td>
                        <tr>
                            <td colspan="2">
                                <input type="submit" value="로그인">
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </section>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>