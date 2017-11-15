<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {

		var typeStr = "";
		var priceStr = "";
		var due_date = "";
		var retail_price = "";
		if ('${book.price_type}' == 0) {
			typeStr = "지정가격";
			priceStr = "${book.price}원";
			retail_price = "${book.retail_price}원";
		} else if ('${book.price_type}' == 1) {
			typeStr = "경매가격";
			priceStr = "${book.price}원";
			due_date = "${book.due_date}";
		}
		$('span.price_type').html("<b>" + typeStr + "</b>으로 판매하는 상품입니다.");
		$('p.price_info').html(priceStr + due_date + '리테일가:' + retail_price);
	});
</script>
<style>
</style>
</head>
<body>
	<section class="condition_info_wrapper row placeholders">
	<button class="accordion ">
		<span class="price_type">${book.price_type }</span>
	</button>
	<div class="panel">
		<p class="price_info"></p>
	</div>
	</section>
</body>
</html>