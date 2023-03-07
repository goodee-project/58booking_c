<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 회원가입</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script>
	function readURL(input) { // 사진 미리보기
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
		}
</script>
</head>
<body>
	<h2>고객 회원가입</h2>
	<div>${errorMsg}</div>
	<form method="post" action="${pageContext.request.contextPath}/customer/addCustomer" enctype="multipart/form-data">
		<input type="hidden" name="customerRank" value="">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="customerId"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="customerPw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="customerName"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="customerNickname"></td>
			</tr>
			<tr>
				<td>프로필사진</td>
				<td>
					<input type="file" name="file" onchange="readURL(this);">
					<img id="preview" style="width: 150px; height: 80px;">
				</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><input type="text" name="customerPostcode"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="customerAddress"></td>
			</tr>
			<tr>
				<td>휴대폰번호</td>
				<td><input type="text" name="customerPhone"></td>
			</tr>
			<tr>
				<td>이메일주소</td>
				<td><input type="text" name="customerEmail"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="customerBirth"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="customerGender" value="남">남
					<input type="radio" name="customerGender" value="여">여
				</td>
			</tr>
			<tr>
				<td>마케팅 수신 동의 여부</td>
				<td>
					<input type="checkbox" name="emailMarketingAccept" value="동의">동의
					<input type="checkbox" name="emailMarketingAccept" value="미동의">미동의
				</td>
			</tr>
			<tr>
				<td>개인정보 보관 동의 여부</td>
				<td>
					<input type="checkbox" name="infoAgree" value="동의">동의
					<input type="checkbox" name="infoAgree" value="미동의">미동의
				</td>
			</tr>
		</table>
		<button type="submit">회원가입</button>
	</form>
</body>
</html>