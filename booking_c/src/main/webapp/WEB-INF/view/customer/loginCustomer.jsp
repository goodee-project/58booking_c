<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>로그인</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="${pageContext.request.contextPath}/resources/img/apple-touch-icon-144x144-precomposed.png">

    <!-- GOOGLE WEB FONT -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    
    <!-- Icon fonts-->
	<link href="${pageContext.request.contextPath}/resources/admin_section/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
   
    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#loginBtn').click(function(){
				
				// ID,PASSWORD 유효성 검사
				if($('#id').val() == '') { 
					alert('아이디를 확인해주세요.');
					return;
				}
				
				if($('#pw').val() == '') {
					alert('비밀번호를 확인해주세요.');
					return;
				}
				
				$('#loginForm').submit();
			});
			
			// 비밀번호 보이게
		    $('.main i').on('click',function(){ 
		        $('input').toggleClass('active');
		        if($('input').hasClass('active')){
		            $(this).attr('class',"fa fa-eye-slash fa-lg")
		            .prev('input').attr('type',"text");
		        }else{
		            $(this).attr('class',"fa fa-eye fa-lg")
		            .prev('input').attr('type','password');
		        }
		    });
		});
	</script>
	<style>
	.log {
	    background-image: url("${pageContext.request.contextPath}/resources/img/bg.jpg");
	    background-size: cover;
	}
	</style>
</head>
<body class="log">
	<!-- 임시메뉴 -->
    <jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include>
	<nav id="menu" class="fake_menu"></nav>
	
	<div id="preloader">
		<div data-loader="circle-side"></div>
	</div>
	<!-- End Preload -->
	
	<div id="login">
		<aside>
			<figure>
				<a href="index.html"><img src="${pageContext.request.contextPath}/resources/img/logo_sticky.svg" width="155" height="36" alt="" class="logo_sticky"></a>
			</figure>
			<form action="${pageContext.request.contextPath}/log/loginCustomer" method="post" id="loginForm">
				<div>
					<label>ID</label>
					<input type="text" class="form-control"  name="customerId" id="id" value="cus1">
				</div>
				<div class="main" style="position: relative;">
					<label>Password</label>
					<input type="password" class="form-control" name="customerPw" id="pw" value="1234">
					<i class="fa fa-eye fa-lg" style="position: absolute; left: 90%; top: 40px;"></i>
				</div>
				<div class="clearfix add_bottom_30">
					<div class="checkboxes float-start">
						<div class="float-end mt-1"><a id="forgot" href="${pageContext.request.contextPath}/log/findId">아이디찾기</a></div>
					</div>
					<div class="float-end mt-1"><a id="forgot" href="${pageContext.request.contextPath}/log/findPw">패스워드찾기</a></div>
				</div>
				<button type="button" class="btn_1 rounded full-width" id="loginBtn">로그인</button>
				<div class="text-center add_top_10">처음이신가요? <strong><a href="${pageContext.request.contextPath}/log/addCustomer">회원가입</a></strong></div>
			</form>
			<div class="copy">© Panagea</div>
		</aside>
	</div>
	<!-- /login -->
		
	<!-- COMMON SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/js/common_scripts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/phpmailer/validate.js"></script>	
  
</body>
</html>