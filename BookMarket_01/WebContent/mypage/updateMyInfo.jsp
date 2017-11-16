<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Market</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="js/mypage.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">
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
			<div id="contents-mypage" class="contents col-md-10">
				<section class="content_wrapper row placeholders ">
					<!-- 비밀번호 체크	 -->
					<jsp:include page="myPwdCheck.jsp"/>	
					<!--	회원정보 수정	 -->
					<div id="div-myInfo-update" class="current-div">
						<h1> 회원정보 수정 </h1>
						<form action="bookmarket" method="post" name="frm-myInfo-update">
							<input type="hidden" name="command" value="myInfo_update">
							<table class="table" style="width: 80%">
								<tr>
									<th>Email</th>
									<td><input type="text" id="update-email" name="email" value="${loginUser.email }"></td>
								</tr>
								<tr>
									<th>Name</th>
									<td><input type="text" id="update-name" name="name" value="${loginUser.name }"></td>
								</tr>
								<tr>
									<th>Password</th>
									<td><input type="password" id="update-pwd" name="pwd" value="${loginUser.pwd }"></td>
								</tr>
							</table>
							<br>
							<input type="submit" class="btn" name="확인">
						</form>
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