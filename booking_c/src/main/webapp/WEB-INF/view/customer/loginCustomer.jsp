<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<body>
	<h2>고객 로그인</h2>
	<form action="${pageContext.request.contextPath}/customer/loginCustomer" method="post" id="loginForm">
		<table border="1">
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="customerId" id="id">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/customer/'">ID찾기</button>
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
		<button type="button" onclick="location.href='${pageContext.request.contextPath}/customer/addCustomer'">회원가입</button>
	</div>
</body>
</html>