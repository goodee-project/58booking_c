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
  		<link href="../../resources/css/perfect-scrollbar.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="/booking_c/webjars/sockjs-client/1.5.1/sockjs.min.js"></script>
		<script src="/booking_c/webjars/webstomp-client/1.2.6/dist/webstomp.min.js"></script>
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
								
									<!--start content-->
									<main class="page-content">
										<div class="chat-wrapper">					
											
											<div class="chat-header d-flex align-items-center">
												<div class="chat-toggle-btn"><i class='bx bx-menu-alt-left'></i>
												</div>
												<div>
													<h4 class="mb-1 font-weight-bold">${chattingRoomName}</h4>
												</div>
												<div class="chat-top-header-menu ms-auto">
													<a href="javascript:;"><i class='bx bx-user-plus'></i></a>
												</div>
											</div>
											<!-- chat -->
											<input type="hidden" value="${chattingRoomName}" id="chattingRoomName">
											<input type="hidden" value="${sessionScope.login}" id="login">
											<div class="chat-content">
												<div id="msgArea" style="min-height:520px;">
							            			<c:forEach var="cl" items="${chatList}">
														<c:if test="${sessionScope.login != cl.fromId}">
															<div class="chat-content-leftside">
																<div class="d-flex">
																	<img src="/58platform/assets/images/avatars/avatar-3.png" width="48" height="48" class="rounded-circle" alt="" />
																	<div class="flex-grow-1 ms-2">
																		<p class="mb-0 chat-time">관리자, ${cl.createdate}</p>
																		<p class="chat-left-msg">${cl.chattingMemo}</p>
																	</div>
																</div>
															</div>
														</c:if>
														<c:if test="${sessionScope.login == cl.fromId}">						
															<div class="chat-content-rightside">
																<div class="d-flex ms-auto">
																	<div class="flex-grow-1 me-2">
																		<p class="mb-0 chat-time text-end">${cl.fromId}, ${cl.createdate}</p>
																		<p class="chat-right-msg" style="float:right">${cl.chattingMemo}</p>
																	</div>
																</div>
															</div>
														</c:if>
													</c:forEach>
												</div>
											</div>
											<div class="chat-footer d-flex align-items-center">
												<div class="flex-grow-1 pe-2">
													<div class="input-group">	<span class="input-group-text"><i class='bx bx-smile'></i></span>
														<input type="text" id="msg" class="form-control" placeholder="Type a message">
														<button class="btn btn-secondary" type="button" id="button-send">Button</button>
													</div>
												</div>
												<div class="chat-footer-menu"> <a href="javascript:;"><i class='bx bx-file'></i></a>
													<a href="javascript:;"><i class='bx bx-dots-horizontal-rounded'></i></a>
												</div>
											</div>
											<!--start chat overlay-->
											<div class="overlay chat-toggle-btn-mobile"></div>
											<!--end chat overlay-->
										</div>
									</main>
						       		<!--end page main-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<script>
	$(document).ready(function(){		
		const chattingRoomName = $("#chattingRoomName").val();
		const username = $("#login").val();		
		
		console.log("chattingRoomName: " + chattingRoomName);
		console.log("username: " + username);
		
		/* const websocket = new WebSocket("ws://localhost:8080/ws/chat");
		console.log("websocket");
		console.log(websocket); */
		// console.log(websocket);
		
		let sockJs = new SockJS("/booking_c/stomp/chat"); // registerStompEndpoints - registry.addEndpoint("/stomp/chat")
		// var sockJs = new SockJS("http://localhost:8080/ws/chat", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]});
		console.log("sockJs");
		console.log(sockJs);
		
		var stomp = webstomp.over(sockJs);
		console.log(stomp);
		
		// ajax 채팅
		setInterval(ajaxChat, 2000);
		function ajaxChat(){
				$.ajax({
					type : 'get',
					url : '/booking_c/customer/myPage/chat',
					// 채팅 방 번호와 자기 자신의 workMemberNo를 전송
					data: { chattingRoomName : chattingRoomName},
					success: function (json) {
			            console.log("성공");            
			        },
			        error: function (request, status, error) {
			            console.log("에러");
			        },
			        complete: function() {
			            // location.reload();
			            // 리로드하고싶은 div 아이디값 적용 !! 
			            $('#msgArea').load(location.href+' #msgArea');
			            // 두번째 ' #left_body' 앞 공백까지 포함하기 !!!
			        }
				}); // end for ajax
		}
		
		// 2. connection이 이루어지면 실행할 콜백함수
		stomp.connect({}, function(){
			console.log("STOMP connected!");
			//3. send(path, header, chattingMemo)로 메세지를 보낼 수 있음
            stomp.send('/pub/chat/enter', JSON.stringify({chattingRoomName: chattingRoomName, fromId: username}));
			
			//4. subscribe(path, callback)으로 메세지를 받을 수 있음
            stomp.subscribe("/sub/chat?chattingRoomName=" + chattingRoomName, function (chat) {
            	console.log("subscribe!!!");
            	console.log("chat");
            	console.log(chat.body);
            	
                var content = JSON.parse(chat.body);
            	console.log(content);

                var fromId = content.fromId;
                let chattingMemo = content.chattingMemo;
                let createdate = content.createdate;
                console.log("SUBSCRIBE")
                console.log(fromId + ": " + chattingMemo);
                var str = '';

                if(fromId != username){
                    str = '<div class="chat-content-leftside">';
                    str += '<div class="d-flex">';
                    str += '<img src="assets/images/avatars/avatar-3.png" width="48" height="48" class="rounded-circle" alt="" />';
                    str += '<div class="flex-grow-1 ms-2">';
                    str += '<p class="mb-0 chat-time">' + fromId + ', ' + createdate + '</p>';
                    str += '<p class="chat-left-msg">' + chattingMemo + '</p>';
                    str += '</div></div></div>';
                } else {
                    str = '<div class="chat-content-rightside">';
                    str += '<div class="d-flex ms-auto">';
                    str += '<div class="flex-grow-1 me-2">';
                    str += '<p class="mb-0 chat-time text-end">' + fromId + ', ' + createdate + '</p>';
                    str += '<p class="chat-right-msg" style="float:right;">' + chattingMemo + '</p>';
                    str += '</div></div></div>';
                }                
                
                $("#msgArea").append(str);
			}); 
			
	        $("#button-send").on("click", function(e){
                var msg =  $("#msg").val();
                console.log(username + ":" + msg);
                
                stomp.send('/pub/chat/message', JSON.stringify({chattingRoomName: chattingRoomName, chattingMemo: msg, fromId: username}));
                $("#msg").val('');
            });	        
	     	// 엔터키를 누르면 submit 버튼이 눌리도록
	        $("#msg").keyup(function(event) {
				if (event.which === 13) {
					// console.log("enter key pressed!");
    				$("#button-send").click();
				}
			});
        });
	});
  </script>
		<script src="../../resources/js/common_scripts.js"></script>
		<script src="../../resources/js/main.js"></script>
		<script src="../../resources/phpmailer/validate.js"></script>
		<script src="../../resources/js/input_qty.js"></script>
  		<script src="../../resources/js/perfect-scrollbar.js"></script>
  		<script src="../../resources/js/app-chat-box.js"></script>
	</body>
</html>