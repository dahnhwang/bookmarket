<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-md-2">
		<div class="list-group">
			<a id="anchor-mypage" href="bookmarket?command=mypage"><h2>마이페이지</h2></a>
<!-- 			<li class="list-group-item"><a id="anchor-updateMyInfo">회원정보수정</a></li>  -->
<!-- 			<li class="list-group-item"><a id="anchor-viewMySellList">판매내역조회</a></li>     -->
<!-- 			<li class="list-group-item"><a id="anchor-viewMyPurchaseList">구매내역조회</a></li>     -->
<!-- 			<li class="list-group-item"><a id="anchor-viewMyKeepBookList">찜내역조회</a></li>          -->
<!-- 			<li class="list-group-item"><a id="anchor-viewMyBookMoney">북머니조회</a></li>          -->
<!-- 			<li class="list-group-item"><a id="anchor-dropMembership">회원탈퇴</a></li>           -->
			<li class="list-group-item"><a href="bookmarket?command=myInfo_update_form">회원정보수정</a></li> 
			<li class="list-group-item"><a href="bookmarket?command=mySell_list">판매내역조회</a></li>    
			<li class="list-group-item"><a href="bookmarket?command=myPurchase_list">구매내역조회</a></li>    
			<li class="list-group-item"><a href="bookmarket?command=myKeep_list">찜내역조회</a></li>         
			<li class="list-group-item"><a href="bookmarket?command=myBookMoney">북머니조회</a></li>         
			<li class="list-group-item"><a href="bookmarket?command=drop_member_from">회원탈퇴</a></li>          
		</div>
	</div>
</body>
</html>