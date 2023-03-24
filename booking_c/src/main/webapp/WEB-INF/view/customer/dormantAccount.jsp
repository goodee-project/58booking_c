<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<!-- 임시메뉴 -->
    <jsp:include page="/WEB-INF/view/customer/booking/tempMenu.jsp"></jsp:include>
	<div>
		<p>안녕하십니까?</p>
		<p>고객님의 소중한 개인정보보호를 위해 서비스를 
		1년간 이용하지 않은 계정은 휴면상태로 전환하고 있습니다</p>
		<p>휴면 상태를 해제하기 위해서는 이메일 인증을 진행해주시길 바랍니다.</p>
	</div>
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" name=""></td>
		</tr>
		<tr>
			<th>이메일주소</th>
			<td>
				<input type="text" id="email1" name="customerEmail1">
				<span>@</span>
				<select id="email2" name="customerEmail2">
					<option value="gmail.com">gmail.com</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="nate.com">nate.com</option>
					<option value="test.com">test.com</option>
				</select>
				<button type="button" id="emailCkBtn">인증번호 발송</button>
				<div id="emailMsg"></div>
				<div id="emailSendMsg"></div>
			</td>
		</tr>
		<tr>
			<th>인증번호</th>
			<td>
				<input type="text" id="codeCk" placeholder="인증번호를 입력해주세요." disabled>
				<button type="button" id="codeCkBtn" disabled>인증번호 확인</button>
				<div id="emailResultMsg"></div>
			</td>
		</tr>
	</table>
	<script>
		// 이메일 인증
		var code = ''; // 인증번호를 담을 변수
		$('#emailCkBtn').click(function() {
			if($('#email1').val() == ''){ // 이메일 유효성 확인
				alert('이메일을 입력해주세요.');
			} else {
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				
				$.ajax({
					url:'emailCk'
					, type:'get'
					, data:{customerEmail1:$('#email1').val(), customerEmail2:$('#email2').val()}
					, success:function(model) {
						code = model;
						console.log(code);
						
						if(code == 'fail'){
							alert('인증번호 전송에 실패하였습니다. 입력한 이메일을 확인해주세요.');
							$('#email').attr('disabled',false); // 입력 재활성화
							$('#emailCkBtn').attr('disabled',false); // 버튼 재활성화
						} else {
							alert('인증번호가 전송되었습니다. 전송된 인증번호를 입력해주세요.');
							$('#codeCk').attr('disabled',false); // 인증번호 입력 활성화
							$('#codeCkBtn').attr('disabled',false); // 인증확인 버튼 활성화
							$('#email').attr('value', $('#email1').val()+'@'+$('#email2').val());
						}
					}			
				});
			}
		});
		
		// 인증번호 비교
		var ckResult = false; // 이메일 인증 성공 여부를 담을 변수 (false : 인증실패, true : 인증성공)
		$('#codeCkBtn').click(function() {
			if($('#codeCk').val() == code){ // 인증번호 일치 시
				$('#email1').attr('readonly',true);
				$('#email2').attr('readonly',true);
				$('#emailCkBtn').attr('disabled',true); // 중복 전송 방지위한 비활성화
				$('#codeCkBtn').attr('disabled',true); // 중복 인증 방지위한 버튼 비활성화
				alert('이메일 인증에 성공하였습니다.');
				ckResult = true;
				console.log(ckResult);
			} else { // 인증번호 실패 시
				alert('이메일 인증에 실패하였습니다.\n인증번호를 확인해주세요.');
			}
		});
	</script>
</body>
</html>