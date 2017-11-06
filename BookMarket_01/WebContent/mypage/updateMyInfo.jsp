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
	if($('#pwd-mypwd-check').val().length == 0){
		alert('비밀번호를 입력하세요.');
		$('#pwd-mypwd-check').focus();
		return false;
	}
	return true;
}
	$(document).ready(function(){
		$('#div-myInfo-update').hide();
		
		$('#btn-mypwd-check').on('click', function(){
			alert('클릭')
			if(passCheck()){
				var password = $('#pwd-mypwd-check').val();
				var params = "command=myPwd_check&password=" + password;

				$.ajax({
					url : 'bookmarket',
					type : 'post',
					data : params,
					dataType : 'json',
					success : function(data) {
						if (data.result == false) {							
							$('<br>').text("비밀번호가 틀렸습니다.").appnedTo('#frm-mypwd-check');
						}
						else if(data.result == true){
							alert('비밀번호 확인!')
							$('#div-mypwd-check').hide();
							$('#div-myInfo-update').show();
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
			<div id="div-mypwd-check" class="contents">
				<h1> 비밀번호 확인</h1>
				<form id="frm-mypwd-check" action="bookmarket" name="frm-mypwd-check">
					<input type="hidden" name="command" value="myPwd_check">
					<table id="table-mypwd-check" style="width: 80%">
						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="pwd-mypwd-check" size="21"></td>
						</tr>
					</table>
					<input type="button" id="btn-mypwd-check" value="확 인">
				</form>
			</div>
			<div id="div-myInfo-update" class="contents">
				<h1> 회원정보 수정 </h1>
				<form action="bookmarket" method="post" name=myInfo-update>
				<input type="hidden" name="command" value="myInfo_update">
				<table style="width: 80%">
					<tr>
						<th>Email</th>
						<td><input type="text" id="update-email" name="email"></td>
					</tr>
					<tr>
						<th>Name</th>
						<td><input type="password" id="update-name" name="name"></td>
					</tr>
					<tr>
						<th>Password</th>
						<td><input type="password" id="update-pwd" name="pwd"></td>
					</tr>
				</table>
				<br>
				<input type="submit" name="verify">
			</form>
		</div>
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
</div>
	 	
	
</body>
</html>