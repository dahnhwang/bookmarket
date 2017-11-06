<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function() {
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].onclick = function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.display === "block") {
					panel.style.display = "none";
				} else {
					panel.style.display = "block";
				}
			}
		}

	});
</script>
<style>
button.accordion {
	background-color: white;
	color: #444;
	cursor: pointer;
	padding: 18px;
	width: 100%;
	text-align: left;
	border: none;
	outline: none;
	transition: 0.4s;
}

button.accordion.active, button.accordion:hover {
	background-color: #eee;
}

div.panel {
	padding: 0 18px;
	background-color: white;
	display: none;
	margin-left: 10px;
	margin-top: 30px;
}

button.accordion:after {
	content: '\02795'; /* Unicode character for "plus" sign (+) */
	font-size: 13px;
	color: #777;
	float: right;
	margin-left: 5px;
}

button.accordion.active:after {
	content: "\2796"; /* Unicode character for "minus" sign (-) */
}

.condition_info_wrapper {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	margin-left: 40px;
}
</style>
</head>
<body>
	<section class="condition_info_wrapper row placeholders">
	<button class="accordion ">
		도서상태 (판매자 작성) <i class="fa fa-star" aria-hidden="true"></i> 
	</button>
	<div class="panel">
		<p>도서상태에 대해 알려드리겠습니다 도서상태에 대해 알려드리겠습니다 도서상태에 대해 알려드리겠습니다 도서상태에 대해
			알려드리겠습니다 도서상태에 대해 알려드리겠습니다 도서상태에 대해 알려드리겠습니다 도서상태에 대해 알려드리겠습니다 도서상태에
			대해 알려드리겠습니다</p>
	</div>
	</section>
</body>
</html>