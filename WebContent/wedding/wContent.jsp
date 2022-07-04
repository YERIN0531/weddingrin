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
<link href="${conPath }/css/wedding/wcontent.css" rel="stylesheet">
 <link rel="stylesheet"
            href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			//로그인 id가 이 웨딩을 선택했을경우 count 되어 있으면 request.setATtribute 
			//1이면 취소하는것, 0이면 insert 하는 것으로 .. 
			$('.heart').click(function(){
				var zimno = Number('${ZimCount }');
				if(zimno==0){
				$(this).attr('src','icon/heart.png');
					location.href='${conPath}/insertZim.do?wno='+'${weddinghall.wno}&mid='+'${member.mid}';
				}else if(zimno>=1){
					zimno=0;
					$(this).attr('src','icon/love.png');
					location.href='${conPath}/deleteZim.do?wno='+'${weddinghall.wno}&mid='+'${member.mid}';
				}
			});
			});
	</script>
</head>
<body>
	<c:if test="${not empty reserveResult }">
		<script>
			alert('${reserveResult}');
		</script>
	</c:if>
	
	<jsp:include page="../main/header.jsp"/>
	<div>&nbsp;</div>
    <div id="lnb">
            <ul>
            <li><a href="${conPath }/WListView.do">전체목록</a></li>
            <li><a href="${conPath }/WLocalListView.do">지역별</a></li>
            <li><a href="${conPath }/ReviewList.do">후기게시판</a></li>
            <li><a href="${conPath }/QnaList.do">문의사항</a></li>
            </ul>
            </div>
	
	<div id="tableview">
<!-- 	<div id="weddingrin"><p>WEDDING_RIN</p></div> -->
	<table id="tacontent">
	<tr><td class="hallname">${weddinghall.wname }
	
	</td></tr>
	<tr>
	<td class="placename"><img src="${conPath }/icon/placeholder.png" class="place">  ${weddinghall.wloc }</td>
	</tr>
	
	<tr><td colspan="2"></td></tr>
	<tr><td><img src="${conPath }/wimg/${weddinghall.wimage}" class="hall"></td></tr>
	<tr><td>
	<c:if test="${ZimCount eq 0}">
	<img src="${conPath }/icon/love.png" class="heart"><!-- 안눌러진상태 -->
			</c:if>
	<c:if test="${ZimCount >= 1}">
	<img src="${conPath }/icon/heart.png" class="heart"> <!-- 눌러진상태 -->
			</c:if>
	</td></tr>
	<tr><td class="hallinfo">업체정보</td></tr>
	<tr><td></td></tr>
	<tr>
		<td class="detail">
		<b>홀이름 </b>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${weddinghall.wname }
			
		</td>
	</tr>
	<tr><td class="detail"><b>상세주소 </b>&nbsp;&nbsp;${weddinghall.waddress }</td></tr>
	<tr><td class="detail"><b>홀소개  </b>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${weddinghall.wcontent }</td></tr>
	
	
	</table>
	
	<form action="${conPath }/WeddingRs.do">
	<input type="hidden" name="wno" value="${param.wno }">
	
	<table id="tareserve">
		<tr><td class="reserve">방문날짜</td></tr>
		<tr><td><input type="text" name="wrate" class="datereserve" id="datepicker" placeholder="날짜를 선택해주세요"></td></tr>
		<tr><td></td></tr>
		<tr><td class="reserve">방문시간</td></tr>
		<tr><td>
		<select name="wtime" class="timereserve">
			<option value="none">선택</option>
			<option>11:00</option>
			<option>12:00</option>
			<option>13:00</option>
			<option>14:00</option>
			<option>15:00</option>
			<option>16:00</option>
			<option>17:00</option>
			<option>18:00</option>
			<option>20:00</option>
			<option>21:00</option>
		</select>
		</td></tr>
		<tr><td>
		<c:if test="${not empty member }">
		<input type="submit" value="방문예약">
		</c:if>
		<c:if test="${empty member }">
		<tr><td class="noreserve">로그인 후 이용 가능한 서비스입니다</td></tr>
		</c:if>
		</td></tr>
	</table>
	</form>
	</div> <!-- #tableView -->
	<div id="replyview">
		<form action="${conPath }/weddingReply.do">
			<input type="hidden" name="wno" value="${param.wno }">
			<input type="hidden" name="mid" value="${member.mid }">
			<table id="tareply">
			<tr><td class="onereview">한줄평후기</td></tr>
			<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
			<c:if test="${not empty member }">
			<tr><td>
			<input type="text" name="wmemo" class="textreview" placeholder="한줄평을 남겨주세요">
<!-- 			<textarea rows="2" cols="120" name="wmemo"  class="textreview"></textarea> -->
			<input type="submit" value="댓글달기">
			</td></tr>
			</c:if>
			<c:if test="${empty member }"><tr><td class="noreview"><a href="${conPath }/memberLoginView.do">글쓰기는 사용자 로그인 이후에만 가능합니다</a></td></tr></c:if>
			</table>
		</form>
	
	<!-- 얘는 Wcontent.do 의 wContent.jsp -->
	<!-- 댓글 list 뿌릴 공간  -->	
	
		<table id="onelist">
		<tr><th>한줄평</th><th>작성자</th><th>글쓴날짜</th><th>삭제</th></tr>
		<c:if test="${totCnt==0 }">
		<tr><td colspan="4">등록된 후기가 없습니다 첫 후기를 남겨주세요!</td></tr>
		</c:if>
		<c:if test="${totCnt!=0 }">
		<c:forEach items="${replylist }" var="reply">
		<tr>
		<td class="memo">${reply.wmemo }<p></td>
		<td class="id">${reply.mid }</td>
		<td class="date"><fmt:formatDate value="${reply.wredate }" type="date" dateStyle="short"/></td>
		<c:if test="${reply.mid eq member.mid }">
		<td class="delete"><img src="${conPath }/icon/trash.png" class="trash"></td>
		</c:if>
		<c:if test="${reply.mid != member.mid }">
		<td class="delete"></td>
		</c:if>
		</tr>
		</c:forEach>
		</c:if>
		</table>
	</div> <!-- replyview -->
	
	
	<div class="paging">
		<c:if test="${startPage > BLOCKSIZE }">
			[ <a href="${conPath }/Wcontent.do?pageNum=${startPage-1}&wno=${weddinghall.wno}&mid=${member.mid}"> 이전 </a> ]
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i == pageNum }">
				<b> [ ${i } ] </b>
			</c:if>
			<c:if test="${i != pageNum }">
				[ <a href="${conPath }/Wcontent.do?pageNum=${i}&wno=${weddinghall.wno}&mid=${member.mid}"> ${i } </a> ]
			</c:if>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
		  [ <a href="${conPath }/Wcontent.do?pageNum=${endPage+1}&wno=${weddinghall.wno}&mid=${member.mid}"> 다음 </a> ]
		</c:if>
	</div>
	
	<jsp:include page="../main/footer.jsp"/>
	
	
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script>
   $(function() {
      $("#datepicker").datepicker(
            {            
               dateFormat : 'yy-mm-dd',
               changeMonth : true, // 월을 바꿀 수 있는 셀렉트 박스 표시
               monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
                                 '7월', '8월', '9월', '10월', '11월', '12월' ],
               showMonthAfterYear : true,
               yearSuffix : '년', // "2020년 3월"
               showOtherMonths : true,
               dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
               changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스 표시
               minDate : '-100y', // 현재 날짜로부터 100년 이전까지 표시
               maxDate : 'y', // 현재 날짜이전까지만 표시
               yearRange : 'c-100:c+100', // 년도 선택 셀렉트 
            });
   });  
</script>
	
</body>
</html>