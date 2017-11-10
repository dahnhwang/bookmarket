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
    <script src="js/mypage.js"></script>
<style>
.contents {
	position: absolute;
	overflow: hidden;
}

.content_wrapper {
	padding-bottom: 30px;
	padding-left: 70px;
}
#btn-mypwd-check{
	margin-top: 10px; 
}
#div-myInfo-delete{
	height: 500px;
	width: 100%; 
/* 	border: 1px solid gray; */
	margin: 10px auto;
	padding: 5%;
	text-align: center;
}
#div-myInfo-delete table{
	width: 60%;
	text-align: center;
}

</style>
</head>
<body>
<div class="wrap">
	<div class="navigation">
		<jsp:include page="../navigation.jsp" />
	</div>
	<!-- 컨테이너 -->
	<div class="container content_parents">
		<div class="row">
			<!-- 사이드 바 -->
			<div id="div-mypage-side-menu" class="side-menu">
				<jsp:include page="myPage_navigation.jsp" />
			</div>
			<!-- 컨텐츠 영역 -->
			<div id="contents-mypage" class="contents col-md-9">
				<section class="content_wrapper row placeholders ">
					<!-- 비밀번호 체크	 -->
					<jsp:include page="myPwdCheck.jsp"/>		
					<!-- 회원 탈퇴	 -->
					<div id="div-myInfo-delete" class="current-div" >
						<div class="panel panel-default ">
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
													<input id="btn-verify-yes" type="button" class="btn btn-danger" name="btn-varify" value="YES" >
												</td>
												<td width="50%" style="padding: 5%">
													<input id="btn-verify-no"type="button" class="btn btn-success" name="btn-varify" value="NO" checked="checked">
												</td>
											</table>
										<br><br><br>
				<!-- 					<input type="submit" id="submit-myInfo-delete" value="VERIFY" class="btn btn-info" data-toggle="modal" data-target="#myModal"></td> -->
										<input type="submit" id="submit-myInfo-delete" value="VERIFY" class="btn btn-primary"></td>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<div class="footer">
		<jsp:include page="../footer.jsp" />
	</div>
</div>	
</body>
</html>