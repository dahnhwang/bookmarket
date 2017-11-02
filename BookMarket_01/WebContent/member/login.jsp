<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>로그인</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="css/login.css" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
<script>
	function openwin() {
		window.open('about:blank', 'LoginC', 'width=400,height=300');
		f1.submit();
	}
	// 이거 main이나 navigation에 갖다 놓기
	function openwin() {
		window.open('http://localhost:8080/BookMarket_01/member/login.jsp',
				'LoginC', 'width=600,height=600');
		f1.submit();
	}
	$(document).ready(function() {
		var id = $(session).attr('loginUser');
		if (id != null) {
			if (id == "true") {
				alert('로그인 상태입니다.');
			}
		}
		$('#btn-login-submit').on('click', function() {
			var url = "bookmarket?command=login"
		});
	});
</script>
</head>
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
		<form class="form-signin">
			<h2 class="form-signin-heading">Please login</h2>
			<input type="text" class="form-control" name="username"
				placeholder="ID" required="" autofocus="" /> <input type="password"
				class="form-control" name="password" placeholder="Password"
				required="" /> <label class="checkbox"> <input
				type="checkbox" value="remember-me" id="rememberMe"
				name="rememberMe"> Remember me </label>
			<button id="btn-login-submit"
				class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
		</form>
		<%
			}
		%>
	</div>


</body>
</html>
