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
	#logo{
	width:800px;
	margin:0 auto;
	}
	#logo img{
	width:500px;
	height:230px;
	text-align: center;
	padding-left:170px;
	}
	#start{
	margin:0 auto;
	margin-top:140px;
	width:1000px;
	text-align: justify;
	font-size:1.1em;
	margin-bottom:50px;
	}
	#start p{
	color:lightgray;
	}
	#main {
	border:1px dashed #757169;
	margin:0 auto;
	padding:50px;
	width:800px;
	text-align: justify;
	}
	#main img{
	width:250px;
	height:300px;
	}
	#main h3{
	 font-family: 'IBM Plex Sans KR', sans-serif;
	 padding-bottom:10px;
	 color: #757169;
	}
	#main p{
	 font-family: 'IBM Plex Sans KR', sans-serif;
	}
	#sign{
	width:500px;
	margin-bottom:80px;
	margin-left:1100px;
	}
	#sign img{
	width:150px;
	
	}
	</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
		});
	</script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<section>
		
		<div id="start">
			<p>
			&nbsp;&nbsp;&nbsp;Hello, this space is for couples who are about to get married. You can check wedding halls in Seoul at once, and you can check wedding halls in the area you want separately.
			You can make a reservation for a consultation by clicking the Wedding Hall Details view and save your favorite wedding hall through the Steam button.
			In addition, members who are logged in can leave a one-line review of the wedding hall. 
			To use this homepage more efficiently, we recommend that you sign up and log in and use it. 
			you can use various bulletin board functions and write comments. 
			You can leave a review by attaching a picture of the wedding hall you have been to through the review board.
			<p>
		</div>
		<div id="logo">
			<img src="${conPath }/icon/logo.png"> 
		</div>
		<div></div>
		<div id="main">
			<h3>선택의 최소화</h3>
			<p>
			<b>
			결혼준비를 하면서 대부분의 예비 부부들이 초기에 가장 시간을 많이 들이는 것이 웨딩홀 셀렉트 과정입니다. 
			결혼준비를 하는데 고객들의 시간을 최소화 시켜 더 많은 시간을 확보시켜 드림으로써 최대 만족감을 이끌어 내는 것이 본 홈페이지의 취지입니다. 
			웨딩홀 리스트를 천천히 둘러보며 다른 사람들의 후기를 살펴볼 수 있으며, 본인이 결혼을 하고 싶은 혹은 동선이 가장 효율적으로 나올 수 있는 지역의 웨딩홀만
			선택하여 볼 수 있는 서비스가 준비되어 있습니다.</b>  
			</p>
			<br>
			<h3>고객만족 98%</h3>
			<p>
			<b>
			웨딩린과 함께 결혼 준비하신 고객님들을 대상으로 고객만족평가를 진행합니다. 홈페이지에 대한 지속적인 평가와 더불어 
			예약과 상담을 진행했던 업체에 이르기까지 다양한 각도에서 평가가 이뤄집니다.
			다른 사람들이 남긴 후기를 보며 선택의 폭을 좁힐 수 있으며 문의게시판을 통한 관리자와의 활발하고 즉각적인 소통을 통해 보다 더 나은 웨딩홀 서비스를 누릴 수 있습니다. 
			</b>
			</p>
			<br>
			<h3>누릴 수 있는 서비스 </h3>
			<p>
			<b>
			고객은 마이페이지를 통해 예약현황을 확인하고, 자신의 정보을 확인 할 수 있습니다. 또한 찜한 목록을 확인하여 본인의 선택한 웨딩홀 리스트를 따로 확인할 수 있습니다.
			웨딩홀 리스트 상세보기를 통해 사람들이 남긴 웨딩홀 후기를 확인할 수 있으며, 로그인을 했을시 본인또한 한줄 후기를 남길수 있습니다. 
			또한 문의게시판을 통해 웨딩홀 관련 질문을 남길 수 있으며 관리자를 통해 문의에 대한 답변을 받을 수 있습니다. 
			이러한 서비스는 회원만 이용 가능하므로, 해당 서비스를 이용하고 싶으신 분들은 회원가입을 꼭 해주시길 바랍니다. 
			</b>
			</p>		
		</div>
		<div id="sign">
			서예린(인)<img src="${conPath }/icon/sign.jpg">
		</div>
	</section>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>