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
		<title>회원탈퇴</title>
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
				var msg = "<c:out value='${msg}'/>";
				if(msg != '') {
					alert(msg);
				}
				
				$('#deactiveBtn').click(function() {
					if($('#pw').val() == ''
						|| $('#bank').val() == ''
						|| $('#number').val() == ''
						|| $('#name').val() == ''){
						alert('입력되지않은 정보가 있습니다');
					} else {
						if(confirm('정말 탈퇴하시겠습니까?') == true) {
							$('#deactiveForm').submit();
						} else {
							alert('취소되었습니다');
							return;
						}
					}
				})
			});
	    </script>
	    <style>
	    	tr {
	    		height: 57px;
	    	}
	    	
	    	input[type=text], input[type=password] {
				width: 400px;
				margin: auto;
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
									<form action="${pageContext.request.contextPath}/customer/myPage/deactiveCustomer" method="post" id="deactiveForm">
										<table class="table table-borderless text-center">
											<tr>
												<th>아이디</th>
												<td>
													${customerOne.customerId}
													<input type="hidden" name="customerId" value="${customerOne.customerId}" readonly>
												</td>
											</tr>
											<tr>
												<th>비밀번호</th>
												<td><input type="password" name="customerPw" class="form-control" id="pw" oninput="this.value = this.value.replaceAll(^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$, '')"></td>
											</tr>
											<c:if test="${customerOne.customerPay > 0}">
												<tr>
													<th>환불될 페이</th>
													<th>
														<fmt:formatNumber value="${customerOne.customerPay}" pattern="###,###,###,###"/>원
														<input type="hidden" name="price" class="form-control" value="${customerOne.customerPay}" readonly>
													</th>
												</tr>
												<tr>
													<th>은행</th>
													<td><input type="text" id="bank" class="form-control"></td>
												</tr>
												<tr>
													<th>계좌번호</th>
													<td><input type="text" id="number" class="form-control"></td>
												</tr>
												<tr>
													<th>예금주</th>
													<td><input type="text" id="name" class="form-control"></td>
												</tr>
											</c:if>
											<c:if test="${customerOne.customerPay < 0}">
												<tr>
													<th colspan="2">남은 페이가 없습니다</th>
												</tr>
											</c:if>
										</table>
										<div align="right">
											<button type="button" class="btn_1" id="deactiveBtn">회원 탈퇴</button>
										</div>
									</form>
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