<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document)
			.ready(
					function() {

						$('#price_frm input')
								.on(
										'click',
										function() {
											var priceType = $(
													'input[name=price_type]:checked',
													'#price_frm').val();
											if (priceType == 0) {
												$('#auction_price',
														'#price_input')
														.remove();
												var output = "<label for=\"formGroupExampleInput\"><div id=\"stn_price\">원하는 판매가격을 입력해주세요</label><hr><i class=\"fa fa-krw\" aria-hidden=\"true\"></i>&nbsp;<input type=\"text\" class=\"form-control\" id=\"formGroupExampleInput\" name=\"price\" placeholder=\"지정가격으로 판매 시, 정해진 가격으로만 상품거래가 가능합니다.\"></div>";
												$('#price_input').html(output);
											} else if (priceType == 1) {
												$('#stn_price', '#price_input')
														.remove();
												var output2 = "<label for=\"formGroupExampleInput\"><div id=\"auction_price\">원하는 경매최소가격(시작가)를 입력해주세요</label><hr><i class=\"fa fa-krw\" aria-hidden=\"true\"></i>&nbsp;<input type=\"text\" class=\"form-control\" id=\"formGroupExampleInput\" name=\"price\" placeholder=\"경매가격으로 판매 시, 경매 중 상품정보수정이 불가합니다.\"></div>";
												output2 += "<hr><div id=\"price_date\">경매 종료일자를 선택해주세요 (낙찰시 자동종료, 유찰시 종료일자 기준 종료)";
												output2 += "<hr><i class=\"fa fa-calendar-check-o\" aria-hidden=\"true\"></i>&nbsp;<input type=\"date\" class=\"form-control\" name=\"due_date\"></div>";
												$('#price_input').html(output2);
											}
										});

					});
</script>
<style>
.accordion {
	background-color: #eee;
	color: #444;
	padding: 18px;
	width: 100%;
	text-align: left;
	border: none;
	outline: none;
}

div.panel {
	background-color: white;
}

.condition_info_wrapper {
	border-top: 1px solid #ddd;
	margin-left: 40px;
}

.price_input {
	display: none;
}

.panel_price {
	padding: 30px;
}

#price_frm {
	text-size: 30px;
	text-align: center;
}

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
</style>
</head>
<body>
	<section class="condition_info_wrapper row placeholders">
	<div class="accordion ">
		<b>STEP 2</b> &nbsp; 원하는 도서판매방식과 가격정보를 입력해 주세요.
	</div>
	<div class="panel panel_price">
		<form id="price_frm">
			<label class="radio-inline"> <input type="radio"
				name="price_type" value="0"> <b>지정가격</b>
			</label> <label class="radio-inline"> <input type="radio"
				name="price_type" value="1"> <b>경매가격</b>
			</label>
		</form>
		<center>
			<div class='success-box'>
				<div class='clearfix'></div>
				<form>
					<div class="form-group" id="price_input"></div>
			</div>
	</div>
	</form>
	<div class='clearfix'></div>
	</center>
	</section>
</body>
</html>