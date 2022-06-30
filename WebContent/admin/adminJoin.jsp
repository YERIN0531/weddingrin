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
<link href="${conPath }/css/join.css" rel="stylesheet">
	<style></style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			$('input[name="apw"], input[name="apwChk"]').keyup(function(){
				var apw = $('input[name="apw"]').val();
				var apwChk = $('input[name="apwChk"]').val();
				if(apw == apwChk){
					$('#apwChkResult').text('비밀번호 일치');
				}else{
					$('#apwChkResult').text('비밀번호 불일치');
				}
			});// mpw key up 이벤트
		});
	</script>
</head>
<body>
<form action="${conPath }/adminJoin.do" method=post>
            <div id="border">
                <table>
                    <caption>WEDDING_RIN</caption>
					
					<tr><td class="join"><div>&nbsp;</div>SIGN UP</td></tr>                   
					<tr><td></td></tr>
                    <tr>
                        <td>아이디<b>*</b></td>
                    </tr>
                    
                    <tr>
                        <td>
                            <input type="text" name="aid" required="required">
                        </td>
                    </tr>

                    <tr>
                        <td>비밀번호<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="apw" required="required">
                        </td>
                    </tr>

                    <tr>
                        <td>비밀번호확인<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="apwChk" required="required">
                            <div id="apwChkResult"> &nbsp; </div>
                        </td>
                    </tr>

                    <tr>
                        <td>관리자코드<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="acode" required="required">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="등록하기" class="btn">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
</body>
</html>