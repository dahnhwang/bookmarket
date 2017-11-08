<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Market</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
function passCheck(){
	if($('#btn-mypwd-check').val().length == 0){
		alert('비밀번호를 입력하세요.');
		$('#btn-mypwd-check').focus();
		return false;
	}
	return true;
}
	$(document).ready(function(){
		$('#div-myInfo-update').hide();
		
		$('#btn-mypwd-check').on('click', function(){
// 			alert('클릭')
			if(passCheck()){
				var password = $('#pwd-mypwd-check').val();
				var params = "command=myPwd_check&password=" + password;

				$.ajax({
					url : 'bookmarket',
					type : 'post',
					data : params,
					dataType : 'json',
					success : function(data) {
// 						alert(data.result);
						if (data.result == false) {							
							$('#pwd-mypwd-check').attr({
								'title':"WRONG",
								'data-content':
									"비밀번호가 틀렸습니다."
							});
							$('#pwd-mypwd-check').popover('show');
						}
						else if(data.result == true){
							alert('비밀번호 확인!')
							$('#div-mypwd-check').hide();
							$('#div-myInfo-update').show();
						}
					}
				});
			}
		});
	});
</script>
<style type="text/css">
.content_parents {
	position: absolute;
	overflow: hidden;
}

.content_child {
	margin-left: 20px;
	padding: 10px 15px;
}
#btn-mypwd-check{
	margin-top: 10px; 
}
</style>
</head>
<body>
<div class="wrap">
		<div class="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		
		<div class="container content_parents">
			<div id="div-mypage-side-menu" class="side-menu">
				<jsp:include page="myPage_navigation.jsp" />
			</div>
			<div class="contents content_child col-md-6">
				<div id="div-mypwd-check" class="">
					<h1> 비밀번호 확인</h1>
					<form id="frm-mypwd-check" action="bookmarket" name="frm-mypwd-check"  align="center" >
						<input type="hidden" name="command" value="myPwd_check">
						<table id="table-mypwd-check" style="width: 80%">
							<tr>
								<th>비밀번호</th>
								<td><input type="password" id="pwd-mypwd-check" 
								title="WRONG" data-content="비밀번호가 틀렸습니다." size="21" ></td>
							</tr>
						</table>
						<input id="btn-mypwd-check" class="btn" type="button" value="확 인">
					</form>
				</div>
				<div id="div-myInfo-update" class="">
					<h1> 회원정보 수정 </h1>
					<form action="bookmarket" method="post" name="frm-myInfo-update">
						<input type="hidden" name="command" value="myInfo_update">
						<table class="table" style="width: 80%">
							<tr>
								<th>Email</th>
								<td><input type="text" id="update-email" name="email"></td>
							</tr>
							<tr>
								<th>Name</th>
								<td><input type="password" id="update-name" name="name"></td>
							</tr>
							<tr>
								<th>Password</th>
								<td><input type="password" id="update-pwd" name="pwd"></td>
							</tr>
						</table>
						<br>
						<input type="submit" class="btn" name="확인">
					</form>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
</div>
	 	
	
</body>
</html>