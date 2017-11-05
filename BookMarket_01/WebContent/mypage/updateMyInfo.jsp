<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Market</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
function passCheck(){
	if($('#password').val().length == 0){
		alert('비밀번호를 입력하세요.');
		$('#password').focus();
		return false;
	}
	return true;
}
	$(document).ready(function(){
		$('#btn-myPwdCheck').on('click', function(){
			if(passCheck()){
				var password = $('#pwd-myPwdCheck').val();
				var params = "command=myPwd_check&password=" + password;

				$.ajax({
					url : 'bookmarket',
					type : 'post',
					data : params,
					dataType : 'json',
					success : function(data) {
						if (data.result == 'false') {
							$('<span>').text("비밀번호가 틀렸습니다.").appnedTo('#frm-myPwdCheck');
						} 
					}
				});
			}
		})
	});
</script>
</head>
<body>
<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div id="container">
			<div id="mypage side-menu" class="side-menu">
				<ul id="mypage side-menu-list" class="side-menu"><span>마이페이지</span>
					<li><a href="bookmarket?command=myPwd_check">회원정보수정</a></li>
					<li><a href="bookmarket?command=myPurchase_list">판매내역조회</a></li>
					<li><a href="bookmarket?command=myPurchase_list">구매내역조회</a></li>
					<li><a href="bookmarket?command=myKeep_list">찜내역조회</a></li>
					<li><a href="bookmarket?command=myBookMoney">북머니조회</a></li>
					<li><a href="bookmarket?command=myPwd_check">회원탈퇴</a></li>
				</ul> 			
			</div>
			<c:if test="${checkPass == 'false' }">
				<div id="mypage contents mypwd-check" class="contents">
					<h1> 비밀번호 확인</h1>
					<form id="frm-myPwdCheck" action="bookmarket" name="mypwd-check-frm">
						<input type="hidden" name="command" value="myPwd_check">
						<table id="table-myPwdCheck" style="width: 80%">
							<tr>
								<th>비밀번호</th>
								<td><input type="password" id="pwd-myPwdCheck" size="21"></td>
							</tr>
						</table>
						<br>
						<input type="button" id="btn-myPwdCheck" value="확 인">
					</form>
				</div>
			</c:if>
			<c:if test="${checkPass == 'true' }">
				<div id="mypage contents mypwd-check" class="contents">
					<h1> 회원정보 수정 </h1>
					<form action="bookmarket" name="mypwd-check-frm">
						<input type="hidden" name="command" value="myPwd_check">
						<table style="width: 80%">
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="password" size="21"></td>
							</tr>
						</table>
						<br>
						<input type="submit" name="확 인" onclick="return passCheck()">
						<br><br>${message }
					</form>
				</div>
			</c:if>
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
</div>
	 	
	
</body>
</html>