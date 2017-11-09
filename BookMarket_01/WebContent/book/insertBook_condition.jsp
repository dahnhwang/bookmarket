<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 200,
			width : '100%',
			minHeight : null,
			maxHeight : null,
			focus : true,
			placeholder : '책의 상태를 자세하게 알려주세요'
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
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<section class="condition_info_wrapper row placeholders">
	<div class="accordion ">
		<b>STEP 1</b> &nbsp; 도서상태를 별점과 글 또는 사진으로 알려주세요.
	</div>
	<div class="panel">
		<br>
		<div class="stars">
			<i class="fa fa-star"></i><i class="fa fa-star"></i><i
				class="fa fa-star"></i><i class="fa fa-star"></i><i
				class="fa fa-star"></i>
		</div>
		<br>

		<div id="summernote"></div>

	</div>
	</section>
</body>
</html>