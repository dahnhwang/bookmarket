<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(
			function() {

				$('#price_frm input').on(
						'click',
						function() {
							var priceType = $('input[name=price_type]:checked',
									'#price_frm').val();
							if (priceType == 0) {
								$('#price_input').html("<div>원하는 판매가격을 입력해주세요 : <input type=\"text\" name=\"price\">원</div>");
							} else {

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
</style>
</head>
<body>
	<section class="condition_info_wrapper row placeholders">
	<div class="accordion ">
		<b>STEP 2</b> &nbsp; 원하는 도서판매가격을 입력해 주세요.
	</div>
	<div class="panel">
		<form id="price_frm">
			<label class="container"> <input type="radio"
				name="price_type" value="0"> 지정가격
			</label> <label class="container"> <input type="radio"
				name="price_type" value="1"> 경매가격
			</label>
		</form>
		<div id="price_input"></div>
	</section>
</body>
</html>