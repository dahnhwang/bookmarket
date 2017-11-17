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

#btn-mypwd-check {
	margin-top: 10px;
}


#div-myInfo-update{

width : 700px;
height : 700px;


}

#update-frm-div{

margin :30px 0 0 20px;

}

#update-frm-btn{ 
width : 90%;
text-align : center;

}

.strapline {
	margin-left: 10px;
	width: 80%;
	display: flex;
	flex-direction: row;
	align-items: center;
}

.title {
	margin: 0 5PX 5px 0;
	font-weight: bold;
	font-size: 25px;
	color: #3c3c3c;
	flex-grow: 0;
	background-color: #cfe0e8;
}

.divider {
	flex-grow: 1;
	height: 1px;
	background-color: #9f9f9f;
	margin-bottom : 10px;
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
					<section class="content_wrapper row placeholders "> <!-- 비밀번호 체크	 -->
					<jsp:include page="myPwdCheck.jsp" /> <!--	회원정보 수정	 -->
					<div id="div-myInfo-update" class="current-div">
						<div class="strapline">
							<div class="title">&nbsp;회원정보 수정&nbsp;</div>
							<div class="divider"></div>
						</div>
						<div id="update-frm-div"> 
						<form action="bookmarket" method="post" name="frm-myInfo-update">
							<input type="hidden" name="command" value="myInfo_update">
							<table class="table" style="width: 80%">
								<tr>
									<th>Email</th>
									<td><input type="text" id="update-email" name="email"
										value="${loginUser.email }"></td>
								</tr>
								<tr>
									<th>Name</th>
									<td><input type="text" id="update-name" name="name"
										value="${loginUser.name }"></td>
								</tr>
								<tr>
									<th>Password</th>
									<td><input type="password" id="update-pwd" name="pwd"
										value="${loginUser.pwd }"></td>
								</tr>
							</table>
							
							<div id="update-frm-btn">
							 <input type="submit" class="btn" name="확인">
						   </div>
						</form>
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