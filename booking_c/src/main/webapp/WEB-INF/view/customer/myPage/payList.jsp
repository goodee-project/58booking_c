<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 | 페이 내역</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
			});
		</script>
	</head>
	<body>
		현재 보유 페이 : ${customerOne.customerPay}
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">충전하기</button>
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Pay 충전</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<form action="${pageContext.request.contextPath}/customer/pay/insertPay" method="post">
						<div class="modal-body">
							<div class="mb-3">
								<label for="recipient-name" class="col-form-label">아이디</label>
								<input type="text" class="form-control" name="customerId" value="${customerOne.customerId}" readonly>
								<label for="recipient-name" class="col-form-label">충전 페이</label>
								<input type="text" class="form-control" name="price" id="price">
								<!-- 자주 쓰는 금액 -->
								<input type="radio" name="priceBtn" value="10000">1만원
								<input type="radio" name="priceBtn" value="20000">2만원
								<input type="radio" name="priceBtn" value="50000">5만원
								<input type="radio" name="priceBtn" value="100000">10만원
							</div>
							<label for="recipient-name" class="col-form-label">카드 정보</label><br>
							<div>
								<select class="form-select">
									<option>BC</option>
									<option>신한</option>
									<option>현대</option>
									<option>삼성</option>
									<option>롯데</option>
									<option>NH</option>
									<option>우리</option>
								</select>
							</div>
							<div>카드번호 : <input type="text" class="form-control"></div>
							<div>유효기간 : <input type="text" class="form-control"></div>
							<div>CVC : <input type="text" class="form-control"></div>
							<div>비밀번호 앞 2자리 : <input type="password" class="form-control"></div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary">충전 하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<br>
		<form action="${pageContext.request.contextPath}/customer/pay/payList" method="get" id="priceForm">
			<input type="radio" name="priceState" value="" <c:out value="${priceState == '' ? 'checked':'' }"/>>All
			<input type="radio" name="priceState" value="+" <c:out value="${priceState == '+' ? 'checked':'' }"/>>+ Pay
			<input type="radio" name="priceState" value="-"<c:out value="${priceState == '-' ? 'checked':'' }"/>>- Pay
		</form>
		<table border="1">
			<c:forEach var="p" items="${payList}">
				<tr>
					<td>${p.category}</td>
					<td>${p.price}</td>
					<td>${p.createdate}</td>
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