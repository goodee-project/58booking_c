<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원탈퇴</title>
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
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/customer/myPage/deactiveCustomer" method="post" id="deactiveForm">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="customerId" value="${customerOne.customerId}" readonly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="customerPw" id="pw" oninput="this.value = this.value.replaceAll(^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$, '')"></td>
				</tr>
				<c:if test="${customerOne.customerPay > 0}">
					<tr>
						<th colspan="2">페이 환불</th>
					</tr>
					<tr>
						<td colspan="2">보유 페이 : ${customerOne.customerPay}</td>
					</tr>
					<tr>
						<th>은행</th>
						<td><input type="text" id="bank"></td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td><input type="text" id="number"></td>
					</tr>
					<tr>
						<th>예금주</th>
						<td><input type="text" id="name"></td>
					</tr>
				</c:if>
				<c:if test="${customerOne.customerPay < 0}">
					<tr>
						<th colspan="2">남은 페이가 없습니다</th>
					</tr>
				</c:if>
			</table>
			<button type="button" id="deactiveBtn">회원 탈퇴</button>
		</form>
	</body>
</html>