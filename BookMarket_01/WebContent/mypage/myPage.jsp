<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.contents {
	position: absolute;
	overflow: hidden;
}
.content_wrapper {
	padding-bottom: 30px;
/* 	padding-left: 70px; */
}
/* body{ */
/* 	margin-top: 100px; */
/* } */
</style>
<title>Book Market</title>
</head>
<body>
	<div class="wrap">
		<div class="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<!-- 컨테이너 -->
		<div class="container">
			<div class="row">
			<!-- 사이드 바 -->
				<div id="div-mypage-side-menu" class="side-menu">
					<jsp:include page="myPage_navigation.jsp" />
				</div>
<!-- script -->
<script>
	$(document).ready(function(){
		$.ajax({
			url : 'bookmarket?command=myPurchase_list&from=deal',
			type : 'get',
			dataType: 'json',
			success : function(data) {
// 				alert(data)
				if (data) {
					$('#table-myBiddingList tbody').empty();
					myBiddingBook_listUpload(data);
				}
				else{
					$('#table-myBiddingList tbody').empty();
					$('<td>').attr('colspan',8).text('경매 참여한 상품이 없습니다.').appendTo('#table-myPurchaseBookList tbody');
				}
			},
			error: function(xhr, status, error){
				alert('error')
			}
		});
	})
</script>
			<!-- content 영역 -->
				<div id="contents-mypage" class="contents col-md-10">
					<section class="content_wrapper row placeholders ">
					<h3>마이페이지</h3>
					<div id="div-myInfo" class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading">Membership Info</div>
						<div class="panel-body" align="right" style="padding-bottom: 0px">
							<!-- Table -->
							<table id="table-myInfo" class="table">
								<tr>
									<th>회원 ID</th>
									<td>${loginUser.mem_id}</td>
								</tr>
								<tr>
									<th>Email</th>
									<td>${loginUser.email}</td>
								</tr>
								<tr>
									<th>Name</th>
									<td>${loginUser.name}</td>
								</tr>
								<tr>
									<th style="border-bottom: 1px solid #dddddd">Book Money</th>
									<td style="border-bottom: 1px solid #dddddd">${loginUser.money}</td>
								</tr>
							</table>
							<div class="panel-footer" align="right">
									<p><button class="btn btn-secondary btn-sm" onclick="location.href='bookmarket?command=myInfo_update_form'">수정하기</button></p>
							</div>
						</div>
					</div>
					<div id="div-myBidding-list" class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading">My Bidding List</div>
						<div class="panel-body">
							<p>최근 경매 입찰한 도서</p>
							<!-- Table -->
							<table id="table-myBiddingList" style="text-align: center" id="example"
								class="display table" cellspacing="0" width="100%"
								data-toggle="table">
								<thead>
									<tr>
										<th>[거래번호/상품번호]</th>
										<th>Image</th>
										<th>Title</th>
										<th>판매자</th>
										<th>가격</th>
										<th>내 입찰 가격</th>
										<th>입찰일자</th>
										<th>경매종료일자</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="panel-footer" align="right">
						</div>
					</div>
<!-- 					<div id="div-myPurchase-list" class="panel panel-default"> -->
<!-- 						Default panel contents -->
<!-- 						<div class="panel-heading">My Purchase Books</div> -->
<!-- 						<div class="panel-body"> -->
<!-- 							<p>최근 성사된 거래내역 </p> -->
<!-- 						</div> -->
<!-- 						Table -->
<!-- 						<table id="table-myBookList" id="example" class="display table" -->
<!-- 							cellspacing="0" width="100%" data-toggle="table" -->
<!-- 							data-show-refresh="true" data-show-toggle="true" -->
<!-- 							data-show-columns="true" data-search="true" -->
<!-- 							data-select-item-name="toolbar1" data-pagination="true"> -->
<!-- 							<tr> -->
<!-- 								<th>상품번호</th> -->
<!-- 								<th>Image</th> -->
<!-- 								<th>Title(ISBN)</th> -->
<!-- 								<th>Book Condition</th> -->
<!-- 								<th>Price</th> -->
<!-- 								<th>거래상태</th> -->
<!-- 								<th>등록일자</th> -->
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</div> -->
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