<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
		<meta name="author" content="Ansonika">
		<title>마이페이지 | 내 정보 보기</title>
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
	    <style>
	    	th {
	    		width: 200px;
	    	}
	    	
	    	tr {
	    		height: 57px;
	    	}

			#textarea {
				height: 70px;
				resize: none;
			}
	    </style>
	</head>
	<body>
		<div class="container margin_60_35">
			<div class="row">
				<jsp:include page="/WEB-INF/view/customer/myPage/inc/sidebar.jsp"></jsp:include>
				<div class="col-lg-9" id="list_sidebar">
					<div class="isotope-wrapper">
						<div class="box_list isotope-item latest">
							<div class="row g-0">
								<div class="wrapper">
									<div style="float: left;">
										<h3 style="font-weight: bold;">내 정보</h3>
									</div>
									<table class="table table-borderless">
										<tr>
											<td rowspan="13" style="width: 100px;">
												<img src="${pageContext.request.contextPath}/upload/${customerOne.customerImgOriginName}" width="150" height="150">
											</td>
											<th>아이디</th>
											<td>${customerOne.customerId}</td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td>
												****
												 
											</td>
										</tr>
										<tr>
											<th>닉네임</th>
											<td>${customerOne.customerNickname}</td>
										</tr>
										<tr>
											<th>이름</th>
											<td>${customerOne.customerName}</td>
										</tr>
										<tr>
											<th>성별</th>
											<td>${customerOne.customerGender}</td>
										</tr>
										<tr>
											<th>생년월일</th>
											<td>
												<c:set var="birth" value="${customerOne.customerBirth}"/>
												${fn:substring(birth,0,4)}년 ${fn:substring(birth,4,6)}월 ${fn:substring(birth,6,8)}일
											</td>
										</tr>
										<tr>
											<th>나이</th>
											<td>만 ${customerOne.customerAge}세</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td>
												<c:set var="phone" value="${customerOne.customerPhone}"/>
												${fn:substring(phone,0,3)}-${fn:substring(phone,3,7)}-${fn:substring(phone,7,11)}
											</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td>${customerOne.customerEmail}</td>
										</tr>
										<tr>
											<th>우편번호</th>
											<td>${customerOne.customerPostcode}</td>
										</tr>
										<tr>
											<th>주소</th>
											<td>${customerOne.customerAddress}</td>
										</tr>
										<tr>
											<th>포인트</th>
											<td><fmt:formatNumber value="${customerOne.customerPoint}" pattern="###,###,###,###"/>P</td>
										</tr>
										<tr>
											<th>페이</th>
											<td><fmt:formatNumber value="${customerOne.customerPay}" pattern="###,###,###,###"/>원</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="../../resources/js/common_scripts.js"></script>
		<script src="../../resources/js/main.js"></script>
		<script src="../../resources/phpmailer/validate.js"></script>
	</body>
</html>