<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>로그인</title>
</head>

<link href="../css/login.css" rel="stylesheet">
	<link href="../css/bootstrap.min.css" rel="stylesheet">

		<script>
			function openwin() {
				window.open('about:blank', 'LoginC', 'width=400,height=300');
				f1.submit();
			}
		</script>

		<body>
			<%
				session = request.getSession(true);
				if (session.getAttribute("id") != null && ((String) session.getAttribute("id")).equals("true")) {
					out.print("로그인 상태입니다. ");
			%>
			<input type="button" name="input" value="로그아웃"
				onClick="javascript:window.location.href('LogoutC.jsp')" />
			<%
				} else {
			%>
			<div class="wrapper">
				<form class="form-signin" method="post" action="LoginC.jsp"
					target="LoginC">
					<h2 class="form-signin-heading">Please login</h2>
					<input type="text" class="form-control" name="username"
						placeholder="ID" required="" autofocus="" /> <input
						type="password" class="form-control" name="password"
						placeholder="Password" required="" /> <label class="checkbox">
						<input type="checkbox" value="remember-me" id="rememberMe"
						name="rememberMe"> Remember me 
					</label>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
				</form>
				<%
					}
				%>
			</div>


		</body>
</html>
