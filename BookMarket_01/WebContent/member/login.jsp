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
	<div id="login" class="modal fade" role="dialog">                                                                               
		<div id="modal-login" class="modal-dialog " role="document">                                 
			<div class="modal-content">                                                            
		      <div class="modal-body">    
		      <%= request.getRequestURI() %>       
		        <form class="form-signin" method="post" action="bookmarket">
					<input id="hidden-command" type="hidden" name="command" value="login">
					<input id="hidden-returnUrl" type="hidden" name="returnUrl" value="">
			        <button id="btn-close" type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
		        	</button>                                                                  
					<h2 class="form-signin-heading">Please login</h2>
					<input type="text" class="form-control" id="email" name="email" placeholder="ID" required="" autofocus="" /> 
					<input type="password"	class="form-control" id="password" name="password" placeholder="Password"	required="" /> 
					<label for="rememberMe" class="checkbox"> Remember me</label>
						<input id="rememberMe"	name="rememberMe" type="checkbox" value="remember-me" style="display='inline'">
					<button id="btn-login-submit" class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		<!-- 	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
				</form>
		      </div>
		    </div>
		</div>
	</div>
</body>
</html>
