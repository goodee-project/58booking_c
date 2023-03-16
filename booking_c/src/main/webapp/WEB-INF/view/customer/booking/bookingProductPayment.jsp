<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<span>상품금액 : (추가) </span><br>
	<span>포인트 : ${loginCustomer.customerPoint} </span><br>
	<span>회원등급 : ${loginCustomer.customerRank} </span><br>
	<span>페이잔액 : ${loginCustomer.customerPay}P </span><br>
	
	<span>총결제 금액 : (추가) </span><br>
	
	
	
	
	
	
</body>
</html>