<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
	    <meta name="author" content="Ansonika">
	
	    <!-- Favicons-->
	    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon">
	    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-57x57-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-72x72-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-114x114-precomposed.png">
	    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-144x144-precomposed.png">
	
	    <!-- GOOGLE WEB FONT -->
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	
	    <!-- BASE CSS -->
	    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/resources/css/vendors.css" rel="stylesheet">
	
	    <!-- YOUR CUSTOM CSS -->
	    <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
		<title>비밀번호 변경</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	</head>
	
	<body>
		<!-- 임시메뉴 -->
	    <jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include>
		<nav id="menu" class="fake_menu"></nav>
		
		<div id="preloader">
			<div data-loader="circle-side"></div>
		</div>
		<!-- End Preload -->
		
		<div>
			<aside style="width:30%;">
				<figure>
					<h2>비밀번호 변경</h2>
				</figure>
				<form method="post" action="${pageContext.request.contextPath}/log/modifyPw" id="modifyForm">
					<input type="hidden" name="customerId" value="${id}">
					<input type="hidden" name="customerEmail" value="${email}">
					<div class="form-group">
						<label>변경할 비밀번호</label>					
						<input class="form-control" type="password" name="customerPw" id="newPw">
					</div>
					<div class="form-group">
						<label>변경할 비밀번호 확인</label>					
						<input class="form-control" type="password" name="customerPwCk" id="newPwCk">
					</div>
	
					<div id="a"></div>
					<div id="pass-info" class="clearfix"></div>
					<button type="button" id="modifyBtn" class="btn_1 rounded full-width add_top_30" id="addBtn">변경하기</button>
					<div class="text-center add_top_10">문제가 생겼나요?  <a href="">자주묻는질문</a></div>
					<div class="text-center add_top_10">
						<strong><a href="${pageContext.request.contextPath}/log/loginCustomer">로그인</a></strong> /
						<strong><a href="${pageContext.request.contextPath}/log/findId">아이디찾기</a></strong>
					</div>
				</form>
				<div class="copy">Booking</div>
			</aside>
		</div>
		<!-- /login -->
		
		<!-- COMMON SCRIPTS -->
	    <script src="${pageContext.request.contextPath}/resources/js/common_scripts.js"></script>
	    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
		<script src="${pageContext.request.contextPath}/resources/phpmailer/validate.js"></script>
		
		<!-- SPECIFIC SCRIPTS -->
		<script src="${pageContext.request.contextPath}/resources/js/pw_strenght.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
				// 유효성 검사 후 폼 제출
				var ck = false;
				$('#modifyBtn').click(function(){
					console.log('유효성, 정규식 검사 결과 :'+formCheck());
					if(ck){
						$('#modifyForm').submit();
						alert('비밀번호가 변경되었으니 다시 로그인해주세요.');
					}
				});
				
				formCheck = function() {
					var p1 = document.getElementById('newPw').value;
					var p2 = document.getElementById('newPwCk').value;
					console.log('#newPw :'+p1);
					console.log('#newPwCk :'+p2);
					
					// 비밀번호 정규식
					var password = $('#newPw').val();
					var num = password.search(/[0-9]/g);
					var eng = password.search(/[a-z]/ig);
					var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
					
					// 유효성 검사
					if($('#newPw').val() == '') {
						alert('비밀번호를 입력하세요.');
						return false;
					} else if($('#newPwCk').val() == '') {
						alert('비밀번호를 입력하세요.');
						return false;
					} else if(p1 != p2) {
						alert('비밀번호가 일치하지 않습니다.');
						return false;
					} else if(password.length < 8 || password.length > 20){
						alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
						return false;
					} else if(password.search(/\s/) != -1){
						alert("비밀번호는 공백 없이 입력해주세요.");
						return false;
					} else if(num < 0 || eng < 0 || spe < 0 ){
						alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
						return false;
					} else {
						console.log("통과"); 
						ck = true;
					}
					return true;
				}
			});
		</script>
	</body>
</html>