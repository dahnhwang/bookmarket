<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(
			function() {

				var typeStr = "";
				var isSoldStr = "";
				var user_id = "${user_id}";
				var seller_id = "${book.seller}";
				var due_date = "";
				var input_price = "";
							
				if ('${book.price_type}' == 0) {
					typeStr = "지정가격";
					$('p.stn_price_info').appendTo('#price_input').show();
					$('#auction_tab').hide();
					$('#bidding_price_form').hide();
					$('p.auction_price_info').hide();
				} else if ('${book.price_type}' == 1) {
					typeStr = "경매가격";
					due_date = "(경매종료일자 : ${book.due_date} )";
					$('p.auction_price_info').appendTo('#price_input').show();
					$('#auction_tab').appendTo('p.auction_price_info').show();
					$('p.stn_price_info').hide();
					if (seller_id != user_id) {
						$('#bidding_price_form').appendTo('#auction_tab')
								.show();
						$('input[name=bidding_price]', '#price_input').blur(
								function() {
									input_price = $(
											'input[name=bidding_price]').val();
									if (input_price < ${book.price}) {
										alert('경매 시작금액보다 적은 금액은 제시할 수 없습니다.');
										return false;
									} 
								});
					} else {
						$('#bidding_price_form').hide();
					}
					$('#cart_btn').attr("disabled", true);

				}
				if ('${book.isSold}' == 0) {
					isSoldStr = "판매 중인";
				} else {
					isSoldStr = "판매 완료된";
					$('#buy_btn').attr("disabled", true);
					$('#auction_btn').attr("disabled", true);
					$('#cart_btn').attr("disabled", true);
					$('#keep_btn').attr("disabled", true);
				}
				$('span.price_type').html(
						"<b>" + typeStr + "</b>으로 <b>" + isSoldStr
								+ "</b> 상품입니다. " + due_date);

			});
</script>
<style>
.form-control {
	width: 400px;
	display: inline;
}

.form-group {
	margin-top: 10px;
	text-align: center;
}

.success-box {
	margin: 20px 0;
	padding: 10px 10px;
	border: 1px solid #eee;
	background: #f9f9f9;
	width: 500px;
	text-align: center;
}

.success-box>div {
	vertical-align: top;
	display: inline-block;
	color: #888;
}

.auction_table {
	width: 400px;
	margin: 0 auto;
	border: 1px solid #ccc;
}

.auction_table th, .auction_table td {
	text-align: center;
	padding: 15px;
	border-bottom: 0.5px solid #ccc;
}
</style>
</head>
<body>
	<section class="condition_info_wrapper row placeholders">
	<button class="accordion ">
		<span class="price_type">${book.price_type }</span>
	</button>
	<div class="panel">
		<center>
			<div class='success-box'>
				<div class='clearfix'></div>
				<form>
					<div class="form-group" id="price_input">

						<p class="stn_price_info">
							<font style="text-decoration: line-through; color: gray">
								도서 정가 : ￦<fmt:formatNumber value="${book.retail_price}"
									type="currency" pattern="#,###" />
							</font> <font style='font-size: 30px'><br> <b> 도서 판매가 :
									￦<fmt:formatNumber value="${book.price}" type="currency"
										pattern="#,###" />
							</b></font><br> <font style="color: red"><b>정가 대비 <fmt:formatNumber
										value="${(book.retail_price-book.price)/book.retail_price }"
										type="percent" /> 할인 (SAVE ￦<fmt:formatNumber
										value="${book.retail_price-book.price }" type="currency"
										pattern="#,###" />)
							</b></font>
						</p>

						<p class="auction_price_info">
							<font style="text-decoration: line-through; color: gray">
								도서 정가 : ￦<fmt:formatNumber value="${book.retail_price}"
									type="currency" pattern="#,###" />
							</font> <font style='font-size: 30px'><br> <b> 경매 시작가 :
									￦<fmt:formatNumber value="${book.price}" type="currency"
										pattern="#,###" />
							</b></font><br> <font style="color: red"><b>정가대비 최대 <fmt:formatNumber
										value="${(book.retail_price-book.price)/book.retail_price }"
										type="percent" /> 할인 (MAX SAVE ￦<fmt:formatNumber
										value="${book.retail_price-book.price }" type="currency"
										pattern="#,###" />)
							</b></font>
						</p>

						<div id="auction_tab">
							<hr>
							<h4>구매현황 (총 ${dealCount }건의 입찰진행 중)</h4>
							<div class="auction_table">
								<table class="auction_table">
									<tr>
										<th>구매희망가</th>
										<th>입찰자</th>
										<th>입찰일시</th>
									</tr>
									<c:forEach var="deal" items="${dealList }">
										<tr>
											<td>${deal.deal_price }원</td>
											<td>${deal.participant_name}님</td>
											<td>${deal.deal_date_string}</td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan="3"><b>평균 구매희망가 ${avgPrice }원</b></td>
									</tr>
								</table>
							</div>
						</div>


						<div id="bidding_price_form">
							<hr>
							<i class="fa fa-krw" aria-hidden="true"></i>&nbsp;<input
								type="text" class="form-control" id="biddingPriceInput"
								name="bidding_price" placeholder="희망하는 경매 입찰가를 제시해주세요.">
						</div>




					</div>
				</form>
			</div>
			<div class='clearfix'></div>
		</center>
	</div>
	</section>
</body>
</html>