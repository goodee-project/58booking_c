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

    <!-- BASE CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
<title></title>
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
	});
</script>
</head>
<body id="login_bg">
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
			  <form action="${pageContext.request.contextPath}/customer/loginCustomer" method="post" id="loginForm">
				<div class="form-group">
					<label>ID</label>
					<input type="email" class="form-control"  name="customerId" id="id">
					<i class="ti-user"></i>
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="customerPw" id="pw">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_30">
					<div class="checkboxes float-start">
						<div class="float-end mt-1"><a id="forgot" href="${pageContext.request.contextPath}/customer/findId">아이디찾기</a></div>
					</div>
					<div class="float-end mt-1"><a id="forgot" href="javascript:void(0);">패스워드찾기</a></div>
				</div>
				<button type="button" class="btn_1 rounded full-width">로그인</button>
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
	<!-- 임시메뉴 -->
    <jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include>
	<h2>고객 로그인</h2>
	<form action="${pageContext.request.contextPath}/customer/loginCustomer" method="post" id="loginForm">
		<table border="1">
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="customerId" id="id">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/customer/findId'">ID찾기</button>
				</td>
			</tr>
			<tr>
				<th>PASSWORD</th>
				<td>
					<input type="password" name="customerPw" id="pw">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/customer/'">PW찾기</button>
				</td>
			</tr>
		</table>
		<button type="button" id="loginBtn">로그인</button>
	</form>
	<div>
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/log/addCustomer'">회원가입</button>
	</div>
</html>