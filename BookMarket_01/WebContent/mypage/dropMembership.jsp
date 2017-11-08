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
<!-- 	<link rel="stylesheet"  -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"  -->
<!-- 	crossorigin="anonymous"> -->
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
// 		alert('클릭')
		if(passCheck()){
			var password = $('#pwd-mypwd-check').val();
			var params = "command=myPwd_check&password=" + password;

			$.ajax({
				url : 'bookmarket',
				type : 'post',
				data : params,
				dataType : 'json',
				success : function(data) {
// 					alert(data.result);
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
				$('<div>')
			}
		});
	});
</script>
<style>
button:clicked {
	background-color: gray()
}
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
#div-myInfo-delete{
	height: 500px;
	width: 100%; 
	border: 1px solid gray;
	margin: 10px auto;
	padding: 5%;
	text-align: center;
}
#div-myInfo-delete table{
	width: 60%;
	text-align: center;
}
.panel-body{height: 500px;}
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
			
			<div class="contents content_child col-md-8">
				<div id="div-mypwd-check" class="">
					<h1> 비밀번호 확인</h1>
					<form id="frm-mypwd-check" action="bookmarket" name="frm-mypwd-check">
						<input type="hidden" id="command" name="command" value="myPwd_check">
						<table id="table-mypwd-check" style="width: 80%" align="center">
							<tr>
								<th>비밀번호</th>
								<td><input type="password" id="pwd-mypwd-check" size="21"></td>
							</tr>
						</table>
						<input id="btn-mypwd-check" class="btn" type="button" value="확 인">
					</form>
				</div>
				<div id="div-myInfo-delete" class="panel panel-default" >
					<!-- Default panel contents -->
					<div class="panel-heading">회원 멤버십 탈퇴</div>
					<div class="panel-body" align="center" style="padding-bottom: 0px">
						<div id="div-form-myInfo-delete">
							<form action="bookmarket" method="post" name="myInfo-delete" style="height: 350px">
								<input type="hidden" name="command" value="drop_member">
								<h3>정말 탈퇴하시겠습니까?</h3><br><br>
									<table>
										<tr>							
										<td width="50%" style="padding: 5%">
											<input type="button" class="btn btn-danger" name="btn-varify" value="YES" >
										</td>
										<td width="50%" style="padding: 5%">
											<input type="button" class="btn btn-success" name="btn-varify" value="NO" checked="checked">
										</td>
									</table>
								<br><br><br>
	<!-- 							<input type="submit" id="submit-myInfo-delete" value="VERIFY" class="btn btn-info" data-toggle="modal" data-target="#myModal"></td> -->
								<input type="submit" id="submit-myInfo-delete" value="VERIFY" class="btn btn-primary"></td>
							</form>
						</div>
					</div>
					<div class="panel panel-footer"></div>  
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>