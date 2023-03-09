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
		<title>마이페이지 | 에약 내역</title>
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
		<style>
			textarea {
				resize: none;
			}
		</style>
		<script>
			$(document).ready(function() {
				$('#bookingState').change(function() {
					$('#bookingForm').submit();
				});
				
				$('#date').click(function() {
					if($('#dateSort').val() == 'DESC') {
						$('#dateSort').val('ASC');
					} else if($('#dateSort').val() == 'ASC') {
						$('#dateSort').val('DESC');
					}
					$('#bookingForm').submit();
				});
			});
		</script>
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
										<h3 style="font-weight: bold;">예약 내역</h3>
									</div>
									<div style="float: right;">
										<form action="${pageContext.request.contextPath}/customer/booking/bookingList" method="get" id="bookingForm">
											<select name="bookingState" id="bookingState" class="form-control">
												<option value="" <c:out value="${bookingState == '' ? 'selected':'' }"/>>전체</option>
												<option value="예약승인대기" <c:out value="${bookingState == '예약승인대기' ? 'selected':'' }"/>>예약승인대기</option>
												<option value="예약확정" <c:out value="${bookingState == '예약확정' ? 'selected':'' }"/>>예약확정</option>
												<option value="방문완료" <c:out value="${bookingState == '방문완료' ? 'selected':'' }"/>>방문완료</option>
												<option value="취소" <c:out value="${bookingState == '취소' ? 'selected':'' }"/>>취소</option>
											</select>
											<input type="hidden" name="dateSort" id="dateSort" value="${dateSort}">
										</form>
										<br>
									</div>
									<table class="table" style="text-align: center; margin-top: 50px; vertical-align: middle;">
										<tr>
											<th>업체</th>
											<th>예약상품</th>
											<th><span id="date">예약일자</span></th>
											<th>결제금액</th>
											<th>예약상태</th>
											<th>리뷰</th>
											<th>신고</th>
										</tr>
										<c:forEach var="b" items="${bookingList}">
											<tr style="height: 70px;">
												<td>${b.companyName}</td>
												<td>${b.productName}</td>
												<td>
													<c:set var="bookingDate" value="${b.bookingDate}"/>
													${fn:substring(bookingDate, 0, 16)}
												</td>
												<td>
													<fmt:formatNumber value="${b.totalPrice}" pattern="#,###" />원
												</td>
												<td>
													<c:if test="${b.bookingState eq '예약승인대기'}">
														${ b.bookingState}<br>
														<a href="#0" data-bs-toggle="modal" data-bs-target="#exampleModal">(&nbsp;취소하기&nbsp;)</a>
														<div class="menu_fixed modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align: left;">
															<div class="modal-dialog modal-dialog-centered" role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h4 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">예약 취소</h4>
																		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>
																	<div class="modal-body">
																		<form action="${pageContext.request.contextPath}/customer/booking/updateBooking" method="post" id="cancelForm">
																			<div class="row">
																				<input type="hidden" name="bookingNo" value="${b.bookingNo}">
																				<input type="hidden" name="usePoint" value="${b.usePoint}">
																				<input type="hidden" name="totalPrice" value="${b.totalPrice}">
																				<input type="hidden" name="cancelSubject" value="고객">
																				<input type="hidden" name="reportCategory" value="예약">
																				<input type="hidden" name="reportContent" value="${b.bookingNo}">
																				<div class="form-group col-md-8">
																					<label style="font-weight: bold;">예약 상품</label>
																					<input type="text" class="form-control" value="${b.productName}">
																				</div>
																				<div class="form-group col-md-8">
																					<label style="font-weight: bold;">예약 일자</label>
																					<input type="text" class="form-control" value="${fn:substring(bookingDate, 0, 16)}">
																				</div>
																				<div class="form-group col-md-12">
																					<label style="font-weight: bold;">취소 사유</label>
																					<textarea class="form-control" id="message-text" name="cancelMemo" style="height: 200px;"></textarea>
																				</div>
																				<div class="form-group col-md-12 add_top_20" align="right">
																					<button type="button" class="btn_1 outline">취소하기</button>
																				</div>
																			</div>
																		</form>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
													<c:if test="${b.bookingState ne '예약승인대기'}">
														<a>${b.bookingState}</a>
													</c:if>
												</td>
												<td>
													<c:if test="${b.review eq 'true'}">
														<a>리뷰쓰기</a>
													</c:if>
													<c:if test="${b.review ne 'true'}">
														<a>리뷰보기</a>
													</c:if>
												</td>
												<td>
													<c:if test="${b.report eq 'true'}">
														<a href="#0" class="btn_1" data-bs-toggle="modal" data-bs-target="#exampleModa2">신고하기</a>
														<div class="menu_fixed modal fade" id="exampleModa2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="text-align: left;">
															<div class="modal-dialog modal-dialog-centered" role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h4 class="modal-title" id="exampleModalLabel" style="font-weight: bold;">예약 취소</h4>
																		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>
																	<div class="modal-body">
																		<form action="${pageContext.request.contextPath}/customer/myPage/insertReport" method="post">
																			<div class="row">
																				<div class="form-group col-md-8">
																					<label style="font-weight: bold;">신고 업체</label>
																					<input type="text" class="form-control" value="${b.companyName}" readonly>
																					<input type="hidden" name="reportCategory" value="예약" readonly>
																					<input type="hidden" name="reportContent" value="${b.bookingNo}" readonly>
																				</div>
																				<div class="form-group col-md-12">
																					<label style="font-weight: bold;">신고 사유</label>
																					<textarea class="form-control" id="message-text" name="reportMemo" style="height: 200px;"></textarea>
																				</div>
																				<div class="form-group col-md-12 add_top_20" align="right">
																					<button type="button" class="btn_1 outline">신고하기</button>
																				</div>
																			</div>
																		</form>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
													<c:if test="${b.report ne 'true'}">
														접수완료
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</table>
									<div style="text-align: center;">
										<c:if test="${currentPage == 1}">
											<a>&lt;&lt;</a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${currentPage != 1}">
											<a href="${pageContext.request.contextPath}/customer/booking/bookingList?currentPage=1&bookingState=${bookingState}">&lt;&lt;</a>&nbsp;&nbsp;
										</c:if>
												
										<!-- 현재 페이지에 따른 이전 버튼 활성화 -->
										<c:if test="${prev == false}">
											<a>&lt;</a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${prev == true}">
											<a href="${pageContext.request.contextPath}/customer/booking/bookingList?currentPage=${startPage - 1}&bookingState=${bookingState}">&lt;</a>&nbsp;&nbsp;
										</c:if>
												
										<c:forEach var="e" begin="${startPage}" end="${endPage}" step="1">
											<a href="${pageContext.request.contextPath}/customer/booking/bookingList?currentPage=${e}&bookingState=${bookingState}">${e}</a>&nbsp;&nbsp;
										</c:forEach>
												
										<!-- 현재 페이지에 따른 다음 버튼 활성화 -->
										<c:if test="${next == false}">
											<a>&gt;</a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${next == true}">
											<a href="${pageContext.request.contextPath}/customer/booking/bookingList?currentPage=${endPage + 1}&bookingState=${bookingState}">&gt;</a>&nbsp;&nbsp;
										</c:if>
												
										<!-- 현재 페이지에 따른 마지막 버튼 활성화 -->
										<c:if test="${currentPage == lastPage}">
											<a>&gt;&gt;</a>
										</c:if>
										<c:if test="${currentPage != lastPage}">
											<a href="${pageContext.request.contextPath}/customer/booking/bookingList?currentPage=${lastPage}&bookingState=${bookingState}">&gt;&gt;</a>
										</c:if>
									</div>
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
		<script src="../../resources/js/input_qty.js"></script>
	</body>
</html>