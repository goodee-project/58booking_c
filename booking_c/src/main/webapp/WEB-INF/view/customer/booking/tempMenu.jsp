<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
	<span>임시 공통 메뉴</span><br>
	<a href="${pageContext.request.contextPath }/log/loginCustomer">로그인</a>
	<a href="${pageContext.request.contextPath }/log/addCustomer">회원가입</a>
	<a href="${pageContext.request.contextPath }/customer/booking/bookingCompanyList">예약업체 검색페이지</a>
	<a href="${pageContext.request.contextPath }/customer/myPage/myPageMain">마이페이지</a>
</body>
</html>