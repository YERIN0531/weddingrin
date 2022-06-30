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
	 main
     </div>
	</section>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>