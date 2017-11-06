<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function passCheck(){
	if($('#pwd-mypwd-check').val().length == 0){
		alert('비밀번호를 입력하세요.');
		$('#pwd-mypwd-check').focus();
		return false;
	}
	return true;
}
	$(document).ready(function(){
		
		$('#div-myInfo-delete').hide();
		
		$('#btn-mypwd-check').on('click', function(){
			alert('클릭')
			if(passCheck()){
				var password = $('#pwd-mypwd-check').val();
				var params = "command=myPwd_check&password=" + password;

				$.ajax({
					url : 'bookmarket',
					type : 'post',
					data : params,
					dataType : 'json',
					success : function(data) {
						if (data.result == false) {							
							$('<p>').text("비밀번호가 틀렸습니다.").appendTo('#table-mypwd-check');
						}
						else if(data.result == true){
							alert('비밀번호 확인!')
							$('#div-mypwd-check').hide();
							$('#div-myInfo-delete').show();
						}
					}
				});
			}
		});
// 		$('#submit-myInfo-delete').preventDefault();
		$('#submit-myInfo-delete').on('click', function(){
			if($('#div-myInfo-delete button').val() == 'NO'){
				alert('멤버십 탈퇴 신청 하지 않습니다.<br>페이지를 나갑니다.');
				$('#command').val() = mypage;
			}
			else{
				$('<div')
			}
		});
	});
</script>
<style>
button:clicked {
	background-color: gray()
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div id="container">
			<div id="div-mypage-side-menu" class="side-menu">
				<jsp:include page="myPage_navigation.jsp" />
			</div>
			<div id="div-mypwd-check" class="contents">
				<h1> 비밀번호 확인</h1>
				<form id="frm-mypwd-check" action="bookmarket" name="frm-mypwd-check">
					<input type="hidden" id="command" name="command" value="myPwd_check">
					<table id="table-mypwd-check" style="width: 80%">
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="pwd-mypwd-check" size="21"></td>
						</tr>
					</table>
					<input type="button" id="btn-mypwd-check" value="확 인">
				</form>
			</div>
			
			
			<div id="div-myInfo-delete" class="contents">
				<h1> 회원 멤버십 탈퇴 </h1>
				<span>
					<form action="bookmarket" method="post" name="myInfo-delete">
					<input type="hidden" name="command" value="drop_member">
					<table style="width: 80%">
						<tr>
							<th><h3>정말 탈퇴하시겠습니까?</h3></th>
						</tr>
						<tr>
							<td>
								<input type="button" class="btn btn-danger" name="btn-varify" value="YES" >
								<input type="button" class="btn btn-primary" name="btn-varify" value="NO" checked="checked">
							</td>
						</tr>
						<tr>
							<td align="center"><input type="submit" id="submit-myInfo-delete" name="VERIFY" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"></td>
						</tr>
					</table>
					<br>
				</form>
			</span>
		</div>
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>