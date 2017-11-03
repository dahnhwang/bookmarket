<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<style type="text/css">
body {
	margin-top: 100px;
}
</style>

</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<a class="navbar-brand" href="bookmarket?command=main">BOOK MARKET</a>
			<div class="navbar-header">
				<button class="navbar-toggle collapsed" data-toggle="collapse"
					data-target="#target">
					<span class="sr-only">Toogle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="target">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <span>구매하기</span> <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="#">소설</a></li>
							<li><a href="#">시/에세이</a></li>
							<li class="divider"></li>
							<li><a href="#">경제/경영</a></li>
							<li><a href="#">자기계발</a></li>
							<li class="divider"></li>
							<li><a href="#">인문</a></li>
							<li><a href="#">역사/문화</a></li>
							<li><a href="#">사회</a></li>
							<li><a href="#">과학/공학</a></li>
							<li><a href="#">예술/대중문화</a></li>
							<li><a href="#">종교</a></li>
							<li class="divider"></li>
							<li><a href="#">유아</a></li>
							<li><a href="#">어린이</a></li>
							<li><a href="#">가정/생활/요리</a></li>
							<li><a href="#">건강</a></li>
							<li><a href="#">취미/레저</a></li>
							<li><a href="#">여행/지도</a></li>
							<li class="divider"></li>
							<li><a href="#">국어/외국어</a></li>
							<li><a href="#">사전</a></li>
							<li><a href="#">컴퓨터/IT</a></li>
							<li class="divider"></li>
							<li><a href="#">청소년</a></li>
							<li><a href="#">학습/참고서</a></li>
							<li><a href="#">취업/수험서</a></li>
							<li><a href="#">만화</a></li>
							<li><a href="#">잡지</a></li>
							<li class="divider"></li>
							<li><a href="#">해외도서</a></li>
						</ul></li>
					<li><a href="#">판매하기</a></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">  
					<li><a href="#">장바구니</a></li>
					<c:choose>
						<c:when test="${empty loginUser}">
							<li><a href="bookmarket?command=login_form">로그인</a></li>
							<li><a href="bookmarket?command=join_form">회원가입</a></li>
						 </c:when>  
						<c:otherwise>
							<li><a href="bookmarket?command=logout">로그아웃</a></li>
							<li><a href="bookmarket?command=mypage">마이페이지</a></li>
						 </c:otherwise>  
					</c:choose>
					 
				</ul> 


				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search" /> <input
						type="submit" class="form-control" placeholder="Submit" value="검색" />
				</form>

			</div>
		</div>
	</div>




</body>
</html>