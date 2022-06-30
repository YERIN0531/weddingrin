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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Domine:wght@500&family=IBM+Plex+Sans+KR&family=Satisfy&family=The+Nautigal:wght@400;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<c:if test="${not empty MloginErrorMsg }">
		<script>
			alert('${MloginErrorMsg}');
			history.back();
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<section>
            <div id="main">
            <table id="mt">
            <tr>
            <td id="one"></td>
            <td id="two">
                <a href="#">WEDDINGHALL<br>LIST</a>
                <div>&nbsp;</div>
                <p>
                    This is a page where you can see the wedding hall.<br />
                    If you want to see the list of wedding halls,<br /> press this letter
                </p>
            </td>
            </tr>
            <tr>
                <td id="three">
                    <a href="#">HOMEPAGE<br>INTRODUCE</a>
                    <div>&nbsp;</div>
                    <p>
                        This is an introduction related to Weddingrin.<br />
                        If you want to read the comments,<br /> please click on the letters
                    </p>
                </td>
            <td id="four"></td>
            </tr>
            </table>

            </div>
        </section>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>