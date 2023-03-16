<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
		<meta name="author" content="Ansonika">
		<title>마이페이지 | 페이 내역</title>
		<link rel="shortcut icon" href="../../resources/img/favicon.ico" type="image/x-icon">
	    <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	    <link href="../../resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="../../resources/css/style.css" rel="stylesheet">
		<link href="../../resources/css/vendors.css" rel="stylesheet">
	    <link href="../../resources/css/blog.css" rel="stylesheet">
	    <link href="../../resources/css/custom.css" rel="stylesheet">


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
	$(document).ready(function() {
		$('#pointBtn').click(function(){
			
		if($('#point').val() > ${loginCustomer.customerPoint})
			{
				alert('보유 포인트 초과');
				return;
			} 
		var totalCount = ${rankDiscount + optionPrice};
		console.log(totalCount);
		console.log($('#point').val());
 		var useCount = $('#point').val();
		console.log(useCount+"<--useCount");
		if($('#point').val() > totalCount)
			{
				$('#point').val(totalCount);
				$('#finalCount').val(0);
				return;
			}
		if(useCount<=totalCount)
			{
				var change = totalCount - useCount
				$('#finalCount').val(change);
				return;
			}
		});
		
		var msg = "<c:out value='${msg}'/>";
		if(msg != '') {
			alert(msg);
		}
		

		$('#payBtn').click(function() {
			alert("충전 페이지로 이동합니다.");
		});
	});
	</script>
<title> </title>
</head>
<body>
	<!-- 임시메뉴 -->
	<jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include><br><br>
	<span>결제 상세페이지 </span><br>
	<span>상품명 : ${bkpName } - ${bkpPrice }원 </span><br>
	<span>인원 : ${qtyInput }</span><br>
	<span>날짜 : ${dates}</span><br>
	<c:if test="${productTime != ''}">
		<span>시간 : ${productTime}</span><br>
	</c:if>
	<span>옵션 : ${bkpoName } - ${optionPrice}원</span><br><br><br>
	
	<span>기업명 : ${bookingPaymentCompany.bkcName}</span><br>
	<span>사업자번호 : ${bookingPaymentCompany.bkcNumber}</span><br>
	<span>전화번호 : ${bookingPaymentCompany.bkcPhone}</span><br>
	<span>주소 : ${bookingPaymentCompany.bkcAddress}</span><br><br><br>
	
	<span>예약자 정보</span><br>
	<span>예약자 : ${loginCustomer.customerName }</span><br>
	<span>전화번호 : ${loginCustomer.customerPhone }</span><br>
	<span>이메일 : ${loginCustomer.customerEmail }</span><br><br><br>
	
	<span>결제</span><br>
	<span>상품금액 : ${rankDiscount +  optionPrice}원 </span><br>
	<span>보유 포인트 : ${loginCustomer.customerPoint}P</span><br>
	<span>사용 포인트 : <input type="text" name="point" id="point" value="10">P &nbsp;
				<button type="button" id="pointBtn">사용</button>	
	</span><br>
	<span>회원등급 : ${loginCustomer.customerRank} </span><br>
	<span>페이잔액 : ${loginCustomer.customerPay}P 
			<a href="${pageContext.request.contextPath}/customer/pay/payList" class="btn_1" id="payBtn">충전하기</a>
	</span><br>
	
	<span>총결제 금액 : 
			<input type="text" name="finalCount" id="finalCount" value="${rankDiscount +  optionPrice}">원 
	</span><br>
	
	
	
	
	<script src="../../resources/js/common_scripts.js"></script>
	<script src="../../resources/js/main.js"></script>
	<script src="../../resources/phpmailer/validate.js"></script>
	<script src="../../resources/js/input_qty.js"></script>
	
	
	
</body>
</html>