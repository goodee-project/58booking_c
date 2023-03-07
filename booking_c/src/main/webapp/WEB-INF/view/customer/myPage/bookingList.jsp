<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 | 예약내역</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
		<form action="${pageContext.request.contextPath}/customer/booking/bookingList" method="get" id="bookingForm">
			<select name="bookingState" id="bookingState">
				<option value="" <c:out value="${bookingState == '' ? 'selected':'' }"/>>전체</option>
				<option value="예약승인대기" <c:out value="${bookingState == '예약승인대기' ? 'selected':'' }"/>>예약승인대기</option>
				<option value="예약확정" <c:out value="${bookingState == '예약확정' ? 'selected':'' }"/>>예약확정</option>
				<option value="방문완료" <c:out value="${bookingState == '방문완료' ? 'selected':'' }"/>>방문완료</option>
				<option value="취소" <c:out value="${bookingState == '취소' ? 'selected':'' }"/>>취소</option>
			</select>
			<input type="hidden" name="dateSort" id="dateSort" value="${dateSort}">
		</form>
		<table class="table" style="width: 1000px; text-align: center;">
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
				<tr>
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
							<a href="${pageContext.request.contextPath}/customer/booking/updateBooking?bookingNo=${b.bookingNo}&usePoint=${b.usePoint}">(취소하기)</a>
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
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">신고하기</button>
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">신고</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<form action="${pageContext.request.contextPath}/customer/myPage/insertReport" method="post">
										<div class="modal-body">
											<div class="mb-3">
												<label for="recipient-name" class="col-form-label">신고 업체</label>
												<input type="text" class="form-control" id="recipient-name" value="${b.companyName}" readonly>
												<input type="hidden" name="reportCategory" value="예약" readonly>
												<input type="hidden" name="reportContent" value="${b.bookingNo}" readonly>
											</div>
											<div class="mb-3">
												<label for="message-text" class="col-form-label">신고사유</label>
												<textarea class="form-control" id="message-text" name="reportMemo"></textarea>
											</div>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">신고하기</button>
										</div>
									</form>
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
		<div>
			<!-- 부트스탧 적용 전 -->
			<!-- 현재 페이지에 따른 처음 버튼 활성화 -->
			<c:if test="${currentPage == 1}">
				처음 불가
			</c:if>
			<c:if test="${currentPage != 1}">
				처음 가능
			</c:if>
					
			<!-- 현재 페이지에 따른 이전 버튼 활성화 -->
			<c:if test="${prev == false}">
				이전 비활성화
			</c:if>
			<c:if test="${prev == true}">
				이전 활성화
			</c:if>
					
			<c:forEach var="e" begin="${startPage}" end="${endPage}" step="1">
				${e}
			</c:forEach>
					
			<!-- 현재 페이지에 따른 다음 버튼 활성화 -->
			<c:if test="${next == false}">
				다음 비활성화
			</c:if>
			<c:if test="${next == true}">
				다음 활성화	
			</c:if>
					
			<!-- 현재 페이지에 따른 마지막 버튼 활성화 -->
			<c:if test="${currentPage == lastPage}">
				마지막 비활성화
			</c:if>
			<c:if test="${currentPage != lastPage}">
				마지막 활성화
			</c:if>
		</div>
	</body>
</html>