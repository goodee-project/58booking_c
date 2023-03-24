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
				$('#point').val(0); 
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
		
		$('#payBtn').click(function(){
		var result = confirm("충전페이지로 이동합니다");
			
		if(result)
			{
			 	location.replace('${pageContext.request.contextPath}/customer/pay/payList');
				return;
			}
		else
			{
				return;
			}
		})
		
		$('#paymentBtn').click(function(){
			var optionTest = $('#option').val();
			if($('#option').val() == '[]')
				{
					$('#option').val(optionTest.replace('[]',0));
					var beChangNo = parseInt($('#option').val());
					console.log($('#option').val()+"<--option if");
					console.log(typeof beChangNo+"<--option if typeof");
					
					console.log($('#productTime').val());
					console.log(typeof $('#productTime').val());
					/*
					$('#productTime').val(productTimeInt);
					console.log($('#productTime').val());
					*/
					$('#paymentForm').submit();
					return;
				}
			var no1 = optionTest.replace('[','');
			var no2 = no1.replace(']','');
			console.log($('#option').val()+"<--option");
			console.log(no2+"<--no2");
			$('#option').val(no2);
			console.log($('#productTime').val());
			$('#paymentForm').submit();
		});
		
		
		
	});
	</script>
<title> </title>
</head>
<body>
	<!-- 임시메뉴 -->
	<jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include><br><br>
	
	<form action="${pageContext.request.contextPath}/customer/booking/addBooking" method="post" id=paymentForm>
		<input type="hidden" name="customerId" value="${loginCustomer.customerId }">
		<input type="hidden" name="bkcId" value="${bookingPaymentCompany.bkcId}">
		<input type="hidden" name="dates" value="${dates}">
		<input type="hidden" name="bkpNo" value="${bkpNo }">
		<input type="hidden" name="bkpPrice" value="${bkpPrice }">
		<input type="hidden" name="bkpRankDiscount" value="${bkpPrice -  rankDiscount}">
		<input type="hidden" name="bookingPeople" value="${qtyInput }">
		<input type="hidden" name="option" value="${option }" id="option">
		<input type="hidden" name="optionSize" value="${optionSize }">
		<input type="hidden" name="havePoint" value="${loginCustomer.customerPoint}">
		<input type="hidden" name="bkpName" value="${bkpName }">
		
		
		<c:if test="${bookingDayList != null}">
			<input type="hidden" name="productTime" value="00:00:00" id="productTime">
			<c:forEach var="dayList" items="${bookingDayList}">
				<input type="hidden" name="dayList" value="${dayList.selecteDate }"><br>
			</c:forEach>
		</c:if>
		<c:if test="${bookingDayList == null}">
			<span>dates</span>
			<input type="hidden" name="dayList" value="${dates }">
			<input type="hidden" name="productTime" value="${productTime }" id="productTime">
		</c:if>
		
		<span>${bkpName } 결제 상세페이지 </span><br>
		<span>날짜 : ${dates}</span><br>
		<c:if test="${productTime != ''}">
			<span>시간 : ${productTime}</span><br>
		</c:if>
		<span>인원 : ${qtyInput }</span><br>
		<span>상품가격 : ${bkpPrice }원 </span><br>
		<span>선택 옵션</span><br>
		

			<c:forEach var="tbkpoNo" items="${bookingOptionList }" varStatus="status">
					<c:forEach var="bkpoNo" items="${option }" varStatus="status">
							<c:if test="${tbkpoNo.optionNo ==bkpoNo }">
								- ${tbkpoNo.optionName}<br>
								<input type="hidden" name="bkpoNo" value="${bkpoNo }">
								<input type="text" name="bkpoName" value="${tbkpoNo.optionName}">
							</c:if>
					</c:forEach>
			</c:forEach>		
	
		
		<span>총 옵션 가격 : ${optionPrice}원 </span><br><br><br>
		
		<span>기업명 : ${bookingPaymentCompany.bkcName}</span><br>
		<span>사업자번호 : ${bookingPaymentCompany.bkcNumber}</span><br>
		<span>전화번호 : ${bookingPaymentCompany.bkcPhone}</span><br>
		<span>주소 : ${bookingPaymentCompany.bkcAddress}</span><br><br><br>
		
		<span>예약자 정보</span><br>
		<span>예약자 : ${loginCustomer.customerName }</span><br>
		<span>전화번호 : ${loginCustomer.customerPhone }</span><br>
		<span>이메일 : ${loginCustomer.customerEmail }</span><br><br><br>
		
		<span>결제</span><br>
		<span>등급 할인받은 금액 : ${bkpPrice -  rankDiscount}</span><br>
		<span>상품금액 : ${rankDiscount +  optionPrice}원 </span><br>
		<span>보유 포인트 : ${loginCustomer.customerPoint}P</span><br>
		<span>사용 포인트 : <input type="text" name="point" id="point" value="0">P &nbsp;
					<button type="button" id="pointBtn">사용</button>	
		</span><br>
		<span>회원등급 : ${loginCustomer.customerRank} </span><br>
		<span>페이잔액 : ${loginCustomer.customerPay}P 
				<button type="button" class="btn_1" id="payBtn">충전하기</button>
		</span><br>
		
		<span>총결제 금액 : 
				<input type="text" name="finalCount" id="finalCount" value="${rankDiscount +  optionPrice}">원 
		</span><br>
		
		<button type="button" id="paymentBtn">예약하기</button>
	</form>
		
	
	
	
	<script src="../../resources/js/common_scripts.js"></script>
	<script src="../../resources/js/main.js"></script>
	<script src="../../resources/phpmailer/validate.js"></script>
	<script src="../../resources/js/input_qty.js"></script>
	
	
	
</body>
</html>