<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 | 메인</title>
	</head>
	<body>
		<div>
			<!-- 프로필처럼 동그랗게 처리 -->
			<img src="${pageContext.request.contextPath}/upload/${customerOne.customerImgOriginName}" width="200" height="200">
			이름 : ${customerOne.customerName}
			닉네임 : ${customerOne.customerNickname}
		</div>
	</body>
</html>