<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	<h2>비밀번호 변경</h2>
	<form method="post" action="${pageContext.request.contextPath}/log/modifyPw" id="modifyForm">
		<input type="hidden" name="customerId" value="${id}">
		<input type="hidden" name="customerEmail" value="${email}">
		<table border="1">
			<tr>
				<th>변경할 비밀번호</th>
				<td><input type="password" name="customerPw" id="newPw"></td>
			</tr>
			<tr>
				<th>변경할 비밀번호 확인</th>
				<td><input type="password" name="customerPwCk" id="newPwCk"></td>
			</tr>
		</table>
		<button type="button" id="modifyBtn">비밀번호 변경</button>
	</form>
	<script>
		$(document).ready(function(){
			$('#modifyBtn').click(function(){
				var p1 = document.getElementById('newPw').value;
				var p2 = document.getElementById('newPwCk').value;
				// 유효성 검사
				if($('#newPw').val() == '') {
					alert('비밀번호를 입력하세요.');
					return;
				}
				if($('#newPwCk').val() == '') {
					alert('비밀번호를 입력하세요.');
					return;
				}
				
				if(p1 != p2) {
					alert('비밀번호가 일치하지 않습니다.');
					return;
				}
				console.log('#newPw');
				console.log('#newPwCk');
				// 폼 전송
				alert('비밀번호가 변경되었습니다.');
				$('#modifyForm').submit();
			});
		});
	</script>
</body>
</html>