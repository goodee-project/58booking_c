<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 | 내 정보 보기</title>
	</head>
	<body>
		<div>
			아이디 : ${customerOne.customerId}<br>
			<!-- 특수문자 치환하기 -->
			비밀번호 : ${customerOne.customerId}<br>
			닉네임 : ${customerOne.customerNickname}<br>
			이름 : ${customerOne.customerName}<br>
			성별 : ${customerOne.customerGender}<br>
			나이 : ${customerOne.customerBirth}<br>
			전화번호 : ${customerOne.customerPhone}<br>
			이메일 : ${customerOne.customerEmail}<br>
			주소 : ${customerOne.customerAddress}<br>
			우편번호 : ${customerOne.customerPostcode}<br>
			보유포인트 : ${customerOne.customerPoint}p<br>
			페이잔액 : ${customerOne.customerPay}원<br>
		</div>
	</body>
</html>