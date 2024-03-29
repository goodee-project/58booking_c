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
				var msg = "<c:out value='${msg}'/>";
				if(msg != '') {
					alert(msg);
				}
				
				$('input[name="priceState"]').change(function() {
					$('#priceForm').submit();
				});
				
				$('input[name="priceBtn"]').click(function() {
					$('#price').val($('input[name="priceBtn"]:checked').val());
				});
				
				$('#payBtn').click(function() {
					if($('#price').val() == ''
						|| $('#cardN1').val() == ''
						|| $('#cardN2').val() == ''
						|| $('#cardN3').val() == ''
						|| $('#cardN4').val() == ''
						|| $('#MM').val() == ''
						|| $('#YY').val() == '') {
						alert('모든 정보를 입력해주세요.');
						return;
					};
					
					$('#payForm').submit();
				});
			});
		</script>
	</head>
	<body>
		<div class="container margin_60_35">
			<div class="row">
				<jsp:include page="/WEB-INF/view/customer/myPage/inc/sidebar.jsp"></jsp:include>
				<div class="col-lg-9" id="list_sidebar">
					<div class="row">
						<aside class="col-lg-7" id="sidebar"></aside>
						<aside class="col-lg-5" id="sidebar">
							<div id="filters_col">
								<div class="row">
									<div class="col-lg-6">
										<h6 style="font-weight: bold;">보유 페이</h6>
									<h5 style="font-weight: bold;">${customerOne.customerPay}원</h5>
									</div>
									<div class="col-lg-6" align="right">
										<a href="#0" class="btn_1" data-bs-toggle="modal" data-bs-target="#exampleModal">충전하기</a>
									</div>
								</div>
							</div>
						</aside>
					</div>
					<div class="isotope-wrapper">
						<div class="box_list isotope-item latest">
							<div class="row g-0">
								<div class="wrapper">
									<div style="float: left;">
										<h3 style="font-weight: bold;">페이 내역</h3>
									</div>
									<div style="float: right;">
										<form action="${pageContext.request.contextPath}/customer/pay/payList" method="get" id="priceForm">
											<input type="radio" name="priceState" class="form-check-input" value="" <c:out value="${priceState == '' ? 'checked':'' }"/>><span style="font-weight: bold;">&nbsp;&nbsp;All</span>
											<input type="radio" name="priceState" class="form-check-input" value="+" <c:out value="${priceState == '+' ? 'checked':'' }"/>><span style="font-weight: bold;">&nbsp;&nbsp;+ Pay</span>
											<input type="radio" name="priceState" class="form-check-input" value="-"<c:out value="${priceState == '-' ? 'checked':'' }"/>><span style="font-weight: bold;">&nbsp;&nbsp;- Pay</span>
										</form>
										<br>
									</div>
									<table class="table text-center">
										<c:forEach var="p" items="${payList}">
											<tr style="height: 55px; vertical-align: middle;">
												<td style="width: 300px;">
													<c:if test="${p.category eq '예약취소' || p.category eq '충전'}">
														<span style="color: blue;">${p.category}</span>
													</c:if>
													<c:if test="${p.category eq '예약구매' || p.category eq '탈퇴'}">
														<span style="color: red;">${p.category}</span>
													</c:if>
												</td>
												<td style="width: 300px;">
													<c:if test="${p.category eq '예약취소' || p.category eq '충전'}">
														<span style="color: blue;">${p.price}</span>
													</c:if>
													<c:if test="${p.category eq '예약구매' || p.category eq '탈퇴'}">
														<span style="color: red;">${p.price}</span>
													</c:if>
												</td>
												<td>
													<c:set var="createdate" value="${p.createdate}"/>
													${fn:substring(createdate, 0, 16)}
												</td>
											</tr>
										</c:forEach>
									</table>
									<div style="text-align: center;">
										<c:if test="${currentPage == 1}">
											<a>&lt;&lt;</a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${currentPage != 1}">
											<a href="${pageContext.request.contextPath}/customer/pay/payList?currentPage=1&priceState=${priceState}">&lt;&lt;</a>&nbsp;&nbsp;
										</c:if>
												
										<!-- 현재 페이지에 따른 이전 버튼 활성화 -->
										<c:if test="${prev == false}">
											<a>&lt;</a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${prev == true}">
											<a href="${pageContext.request.contextPath}/customer/pay/payList?currentPage=${startPage - 1}&priceState=${priceState}">&lt;</a>&nbsp;&nbsp;
										</c:if>
												
										<c:forEach var="e" begin="${startPage}" end="${endPage}" step="1">
											<a href="${pageContext.request.contextPath}/customer/pay/payList?currentPage=${e}&priceState=${priceState}">${e}</a>&nbsp;&nbsp;
										</c:forEach>
												
										<!-- 현재 페이지에 따른 다음 버튼 활성화 -->
										<c:if test="${next == false}">
											<a>&gt;</a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${next == true}">
											<a href="${pageContext.request.contextPath}/customer/pay/payList?currentPage=${endPage + 1}&priceState=${priceState}">&gt;</a>&nbsp;&nbsp;
										</c:if>
												
										<!-- 현재 페이지에 따른 마지막 버튼 활성화 -->
										<c:if test="${currentPage == lastPage}">
											<a>&gt;&gt;</a>
										</c:if>
										<c:if test="${currentPage != lastPage}">
											<a href="${pageContext.request.contextPath}/customer/pay/payList?currentPage=${lastPage}&priceState=${priceState}">&gt;&gt;</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="menu_fixed modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">pay 충전</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="${pageContext.request.contextPath}/customer/pay/insertPay" method="post" id="payForm">
							<div class="row">
								<div class="form-group col-md-6">
									<label>ID</label>
									<input type="text" name="customerId" value="${customerOne.customerId}" class="form-control" readonly>
								</div>
								<div class="form-group col-md-10">
									<label>Pay</label>
									<input type="text" name="price" id="price" class="form-control" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								</div>
								<div>
									<!-- 자주 쓰는 금액 -->
									<input type="radio" name="priceBtn" class="form-check-input" value="10000"><span style="font-weight: bold;">&nbsp;&nbsp;1만원</span>
									<input type="radio" name="priceBtn" class="form-check-input" value="20000"><span style="font-weight: bold;">&nbsp;&nbsp;2만원</span>
									<input type="radio" name="priceBtn" class="form-check-input" value="50000"><span style="font-weight: bold;">&nbsp;&nbsp;5만원</span>
									<input type="radio" name="priceBtn" class="form-check-input" value="100000"><span style="font-weight: bold;">&nbsp;&nbsp;10만원</span>
								</div>
								<br>
								<br>
								<hr>
								<div class="form-group col-md-12">
									<h5 style="font-weight: bold;">카드 정보</h5>
								</div>
								<div class="form-group col-md-5">
									<label style="font-weight: bold;">은행</label>
									<select class="form-control">
										<option>BC</option>
										<option>신한</option>
										<option>현대</option>
										<option>삼성</option>
										<option>롯데</option>
										<option>NH</option>
										<option>우리</option>
									</select>
								</div>
								<div class="form-group col-md-7"></div>
								<div class="form-group col-md-3">
									<label style="font-weight: bold;">카드 번호</label>
									<input type="text" class="form-control" id="cardN1" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								</div>
								<div class="form-group col-md-3">
									<label style="font-weight: bold;">&nbsp;</label>
									<input type="text" class="form-control" id="cardN2" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								</div>
								<div class="form-group col-md-3">
									<label style="font-weight: bold;">&nbsp;</label>
									<input type="text" class="form-control" id="cardN3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								</div>
								<div class="form-group col-md-3">
									<label style="font-weight: bold;">&nbsp;</label>
									<input type="password" class="form-control" id="cardN4" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								</div>
								<div class="form-group col-md-3">
									<label style="font-weight: bold;">유효 기간</label>
									<input type="text" class="form-control" placeholder="MM" id="MM" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								</div>
								<div class="form-group col-md-3">
									<label style="font-weight: bold;">&nbsp;</label>
									<input type="text" class="form-control" placeholder="YY" id="YY" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								</div>
								<div class="form-group col-md-5">
									<label>CVC</label>
									<input type="text" class="form-control" id="CVC" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								</div>
								<div class="form-group col-md-5">
									<label style="font-weight: bold;">비밀번호 앞 2자리</label>
									<input type="password" class="form-control" id="pw" maxlength="2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
								</div>
								<div class="form-group col-md-12 add_top_20" align="right">
									<button type="button" class="btn_1 outline" id="payBtn">충전하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script src="../../resources/js/common_scripts.js"></script>
		<script src="../../resources/js/main.js"></script>
		<script src="../../resources/phpmailer/validate.js"></script>
		<script src="../../resources/js/input_qty.js"></script>
	</body>
</html>