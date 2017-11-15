<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>로그인</title>
	<link href="css/login.css" rel="stylesheet" />
</head> 
<body>
	<!-- Modal -->
	<script type="text/javascript">
	function loginPWDCheck(){
		if($('#password').val().length == 0){
// 			alert('비밀번호를 입력하세요')
			$('#password').attr({
				'title':"WRONG",
				'data-content':
					"비밀번호를 입력하세요"
			}).popover('show');
			$('#password').focus();
			return false;
		}
		return true;
	}
	function myPwdCheck(){
		if(loginPWDCheck()){
			var returnUrl = $('#hidden-returnUrl').val();
			var email = $('#email').val();
			var password = $('#password').val();
			var params = "command=login&email="+email+"&password=" + password +"&returnUrl="+returnUrl;

			$.ajax({
				url : 'bookmarket',
				type : 'post',
				data : params,
//				async: true,
				success : function(data) {
// 					alert(data);
					
					if(data > 0){
						alert('성공')
						location.href=returnUrl;
					}
					else if(data == -1){
						$('#password').attr({
							'title':"WRONG",
							'data-content':
								"비밀번호가 틀렸습니다."
						}).popover('show');
					}
					else if(data == 0) {
						$('#email').attr({
							'title':"WRONG",
							'data-content':
								"회원 정보가 없습니다."
						}).popover('show');
					}
				}
			});
		}
	}
		$(document).ready(function() {
			$('#btn-login-submit').on('click', function(event){
				event.preventDefault();
				myPwdCheck();
				
			})
		})
	</script>	     
	<div id="login" class="modal fade" role="dialog">                                                                               
		<div id="modal-login" class="modal-dialog " role="document">                                 
			<div class="modal-content">                                                            
		      <div class="modal-body">    
		        <form class="form-signin" method="post" action="bookmarket">
					<input id="hidden-command" type="hidden" name="command" value="login">
					<input id="hidden-returnUrl" type="hidden" name="returnUrl" value="bookmarket?command=main">
			        <button id="btn-close" type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
		        	</button>                                                                  
					<h2 class="form-signin-heading">Please login</h2>
					<input type="email" class="form-control" id="email" name="email" data-toggle="popover" data-placement="right" placeholder="email" required="" autofocus="" /> 
					<input type="password"	class="form-control" id="password" name="password" data-toggle="popover" data-placement="right" placeholder="Password"	required="" /> 
					<label for="rememberMe" class="checkbox"> Remember me</label>
						<input id="rememberMe"	name="rememberMe" type="checkbox" value="remember-me" style="display:'inline'">
					<button id="btn-login-submit" class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		<!-- 	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
				</form>
		      </div>
		    </div>
		</div>
	</div>
</body>
</html>
