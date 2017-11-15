<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Book Button</title>
<script>
	$(document)
			.ready(
					function() {
						var book_id = '${book.book_id}';
						var seller_email = '${member.email}';

						if ('${book.price_type}' == 0) {
							$('#btn-change > button').attr("id", "buy_btn")
									.text("구매하기");
						} else if ('${book.price_type}' == 1) {
							$('#btn-change > button').attr("id", "auction_btn")
									.text("경매 참여하기");
						}

						$('#buy_btn')
								.on(
										'click',
										function() {
											//판매자와 구매자가 같은 사람인지 판별하기 
											var params = "command=payment_check_pass&seller_email="
													+ seller_email;
											$
													.ajax({
														url : 'bookmarket',
														type : 'get',
														data : params,
														success : function(data) {
															if (data == 0) {
																alert('본인이 판매하는 상품은 구매할 수 없습니다!');
															} else if (data == 1) {
																window.location.href = 'bookmarket?command=payment&book_id='
																		+ book_id;
															} else if (data == -1) {
																alert('로그인 후 구매하실 수 있습니다.')
															}
														}
													});
										});

						$('#auction_btn')
								.on(
										'click',
										function() {
											//판매자와 구매자가 같은 사람인지 판별하기 
											var params = "command=payment_check_pass&seller_email="
													+ seller_email;
											$
													.ajax({
														url : 'bookmarket',
														type : 'get',
														data : params,
														success : function(data) {
															if (data == 0) {
																alert('본인이 판매하는 상품은 구매할 수 없습니다!');
															} else if (data == 1) {
																window.location.href = 'bookmarket?command=bidding_form&book_id='
																		+ book_id;
															} else if (data == -1) {
																alert('로그인 후 경매에 참여하실 수 있습니다.')
															}
														}
													});
										});

						$('#cart_btn').on('click', function() {
							var params = "command=cart_add&book_id=" + book_id;
							$.ajax({
								url : 'bookmarket',
								type : 'get',
								data : params,
								success : function(data) {
									alert(data);
								}
							});

						})

						$('#keep_btn')
								.on(
										'click',
										function() {
											var params = "command=keepBook_add&book_id="
													+ book_id;
											$.ajax({
												url : 'bookmarket',
												type : 'get',
												data : params,
												success : function(data) {
													alert(data);
												}
											});

										})
					});
</script>
<style>
.condition_info_wrapper {
	border-top: 1px solid #ddd;
	margin-left: 40px;
}

.button_div {
	width: 20%;
	float: left;
	height: 100%;
}

.button_large {
	width: 60%;
}
</style>
</head>
<body>
	<section class="condition_info_wrapper row placeholders">
	<div class="button_div button_large" id="btn-change">
		<button type="button"
			class="btn btn-primary btn-lg btn-block btn-half"></button>
	</div>
	<div class="button_div">
		<button type="button"
			class="btn btn-primary btn-lg btn-block btn-half" id="cart_btn">
			<i class="fa fa-shopping-cart" aria-hidden="true"></i>
		</button>
	</div>
	<div class="button_div">
		<button type="button"
			class="btn btn-primary btn-lg btn-block btn-half" id="keep_btn">
			<i class="fa fa-heart" aria-hidden="true"></i>
		</button>
	</div>
	</section>
</body>
</html>