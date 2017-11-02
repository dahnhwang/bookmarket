<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">

<title>회원가입</title>
<script type="text/javascript" src="js/member.js"></script>
<link rel="stylesheet" type="text/css" href="css/join.css">
</head>

<body>
	<header> <!-- import navigation --> <jsp:include
		page="../navigation.jsp" /> </header>

	<div id="content"> 
  
		<form id="joinForm" method="post" action="bookmarket" name="joinForm">
			<input type="hidden" name="command" value="join">
			<div class="form-row">
				<div class="form-group">
					<label for="inputEmail4">Email</label> <input type="email"
						class="form-control" id="inputEmail4" placeholder="이메일을 입력하세요"
						name="email">
				</div>

				<div class="form-group">
					<label for="inputEmail4">Name</label> <input type="name"
						class="form-control" id="inputEmail4" placeholder="이름을 입력하세요"
						name="name">
 
				</div>


				<div class="form-group">
					<label for="inputPassword4">Password</label> <input type="password"
						class="form-control" id="inputPassword4" placeholder="비밀번호를 입력하세요" name="pwd">
				</div>


				<div class="form-group">
					<label for="inputPassword4">Re-Password</label> <input
						type="password" class="form-control" id="inputPassword4"
						placeholder="비밀번호를 다시 입력하세요" name="pwd_check">
				</div>

				<div id="joinFormBtn">
					<button type="submit" class="btn btn-primary"
						onclick="return joinCheck()">회원가입</button>
					<button type="reset" class="btn btn-danger">취소</button>
				</div>
		</form>
	</div>

</body>
