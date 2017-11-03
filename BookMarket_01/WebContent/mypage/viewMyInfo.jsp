<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div id="container">
			<div id="mypage side-menu" class="side-menu">
				<ul id="mypage side-menu-list" class="side-menu"><span>마이페이지</span>
					<li><ahref="bookmarket?command=myInfo_update_form">회원정보수정</a></li>
					<li><ahref="bookmarket?command=myPurchase_list">판매내역조회</a></li>
					<li><ahref="bookmarket?command=myPurchase_list">구매내역조회</a></li>
					<li><ahref="bookmarket?command=myKeep_list">찜내역조회</a></li>
					<li><ahref="bookmarket?command=myBookMoney">북머니조회</a></li>
					<li><ahref="bookmarket?command=drop_member">회원탈퇴</a></li>
				</ul> 			
			</div>
			<div id="contents">
				마이페이지
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>