<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script type="text/javascript">
	function load() {
		// 		console.log('load')
		$.ajax({
			url : 'myInfo.do',
			type : 'get',
			dataType : 'json',
			success : function(data) {
				$.each(data.bookList, function(index, item) {
					var tr = $('<tr>').appendTo('#bookTable > tbody');
					var book_id = item.book_id;
					var title = item.title;
					var publisher = item.publisher;
					var year = item.year;
					var price = item.price;
					$('<td>').text(book_id).appendTo(tr);
					$('<td>').text(title).appendTo(tr);
					$('<td>').text(publisher).appendTo(tr);
					$('<td>').text(year).appendTo(tr);
					$('<td>').text(price).appendTo(tr);
					var del_btn = $('<td>').appendTo(tr);
					$('<input>').attr({
						type : 'button',
						id : book_id
					}).val('del').addClass('btn_del').appendTo(del_btn);
				})
			},
			error : function(xhr, status, error) {
				alert('error')
			}

		});

	}
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
			<!-- content 영역 -->
				<div id="contents-mypage" class="contents col-md-9">
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
						</div>
						<div class="panel-footer" align="right">
								<p><button class="btn btn-secondary btn-sm" onclick="location.href='bookmarket?command=myInfo_update_form'">수정하기</button></p>
						</div>
					</div>
					<div id="div-mySell-list" class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading">My Sell Books</div>
						<div class="panel-body">
							<p>판매등록된 도서상품</p>
						</div>
						<!-- Table -->
						<table id="table-mySell" style="text-align: center" id="example"
							class="display table" cellspacing="0" width="100%"
							data-toggle="table" data-show-refresh="true"
							data-show-toggle="true" data-show-columns="true"
							data-search="true" data-select-item-name="toolbar1"
							data-pagination="true">
							<tr>
								<th>상품번호</th>
								<th>Image</th>
								<th>Title(ISBN)</th>
								<th>Book Condition</th>
								<th>Price</th>
								<th>판매상태</th>
								<th>등록일자</th>
							</tr>
						</table>
					</div>
					<div id="div-myPurchase-list" class="panel panel-default">
						<!-- Default panel contents -->
						<div class="panel-heading">My Purchase Books</div>
						<div class="panel-body">
							<p>구매한 도서상품</p>
						</div>
						<!-- Table -->
						<table id="table-myPurchase" id="example" class="display table"
							cellspacing="0" width="100%" data-toggle="table"
							data-show-refresh="true" data-show-toggle="true"
							data-show-columns="true" data-search="true"
							data-select-item-name="toolbar1" data-pagination="true">
							<tr>
								<th>상품번호</th>
								<th>Image</th>
								<th>Title(ISBN)</th>
								<th>Book Condition</th>
								<th>Price</th>
								<th>거래상태</th>
								<th>등록일자</th>
							</tr>
						</table>
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