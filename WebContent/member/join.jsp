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
<link href="${conPath }/css/member/join.css" rel="stylesheet">
	<style></style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		$('input[name="mid"]').keyup(function(){
			var mid = $('input[name="mid"]').val();
			$.ajax({
				url : '${conPath}/memberIdConfirm.do',
				type : 'get',
				dataType : 'html',
				data : "mid=" + mid,
				success : function(data){
					$('#idConfirmResult').html(data);
				}
			}); //ajax
		});//mid key up 이벤트
		$('input[name="mpw"], input[name="mpwChk"]').keyup(function(){
			var mpw = $('input[name="mpw"]').val();
			var mpwChk = $('input[name="mpwChk"]').val();
			if(mpw == mpwChk){
				$('#pwChkResult').text('비밀번호 일치');
			}else{
				$('#pwChkResult').text('비밀번호 불일치');
			}
		});// mpw key up 이벤트
		$('input[name="memail"]').keyup(function(){
			var patternMail = /^[a-zA-Z0-9_]+@[a-zA-Z0-9]+(\.[a-zA-Z]+){1,2}$/; // 메일 패턴
			var memail = $('input[name="memail"]').val();
			if(patternMail.test(memail)){
				$.ajax({
					url : '${conPath}/emailConfirm.do',
					type : 'get',
					dataType : 'html',
					data : "memail="+memail,
					success : function(data){
						$('#emailConfirmResult').html(data);
					}
				});//ajax
			}else if(!memail){
				$('#emailConfirmResult').html(' &nbsp; ');
			}else{
				$('#emailConfirmResult').html('메일 형식을 지켜주세요');
			}//if
		});// mEmail keyup 이벤트
		$('form').submit(function(){
			var idConfirmResult = $('#idConfirmResult').text().trim();
			var pwChkResult     = $('#pwChkResult').text().trim();
			var emailConfirmResult = $('#emailConfirmResult').text().trim();
			if(idConfirmResult!='사용 가능한 ID 입니다'){
				alert('사용가능한 ID로 가입하세요');
				$('input[name="mid"]').focus();
				return false;
			}else if(pwChkResult !='비밀번호 일치'){
				alert('비밀번호를 확인하세요');
				$('input[name="mpw"]').focus();
				return false;
			}else if(emailConfirmResult!='' && emailConfirmResult != '사용 가능한 메일입니다'){
				alert('이메일을 확인하세요');
				$('input[name="memail"]').focus();
				return false;
			}
		});
		});//ready
	</script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  	<script>
  $( function() {
    $( "#mbirth" ).datepicker({
    	dateFormat : 'yy-mm-dd',
    	changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
    	monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	showMonthAfterYear : true,
    	yearSuffix : '년', // "2020년 3월"
    	showOtherMonths : true,
    	dayNamesMin:['일','월','화','수','목','금','토'],
			changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
			minDate : '-100y', // 현재 날짜로부터 100년 이전까지 표시
			maxDate : 'y', // 현재 날짜이전까지만 표시
			yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
    });
  } );
  </script>
</head>
<body>
 <form action="${conPath }/memberJoin.do" method=post>
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
                            <input type="text" name="mid" required="required">
                            <div id="idConfirmResult"> &nbsp; </div>
                        </td>
                    </tr>

                    <tr>
                        <td>비밀번호<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="mpw" required="required">
                        </td>
                    </tr>

                    <tr>
                        <td>비밀번호확인<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" name="mpwChk" required="required">
                            <div id="pwChkResult"> &nbsp; </div>
                        </td>
                    </tr>

                    <tr>
                        <td>이름<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mname" required="required">
                        </td>
                    </tr>
					
					<tr>
                        <td>전화번호<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mtel" required="required" placeholder="010-0000-0000">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>메일</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="email" name="memail" required="required" placeholder="you@example.com">
                            <div id="emailConfirmResult"> &nbsp; </div>
                        </td>
                    </tr>

                    <tr>
                        <td>생년월일<b>*</b></td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="mbirth" id="mbirth">
                        </td>
                    </tr>
                    <tr>
                        <td>주소</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" name="maddress" placeholder="서울특별시 강남구">
                        </td>
                    </tr>

                   
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="회원가입" class="btn">
                        </td>
                    </tr>
                </table>
            </div>
        </form>
</body>
</html>