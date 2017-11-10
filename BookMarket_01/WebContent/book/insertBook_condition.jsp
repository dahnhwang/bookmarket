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
	function responseMessage(msg) {
		$('.success-box').fadeIn(200);
		$('.success-box div.text-message').html("<span>" + msg + "</span>");
	}
	$(document)
			.ready(
					function() {
						$('#summernote').summernote({
							lang : 'ko_KR',
							height : 200,
							width : '100%',
							minHeight : null,
							maxHeight : null,
							focus : false,
							placeholder : '책의 상태를 자세하게 알려주세요'
						});

						/* 1. Visualizing things on Hover - See next part for action on click */
						$('#stars li').on(
								'mouseover',
								function() {
									var onStar = parseInt(
											$(this).data('value'), 10); // The star currently mouse on

									// Now highlight all the stars that's not after the current hovered star
									$(this).parent().children('li.star').each(
											function(e) {
												if (e < onStar) {
													$(this).addClass('hover');
												} else {
													$(this)
															.removeClass(
																	'hover');
												}
											});

								}).on(
								'mouseout',
								function() {
									$(this).parent().children('li.star').each(
											function(e) {
												$(this).removeClass('hover');
											});
								});

						/* 2. Action to perform on click */
						$('#stars li')
								.on(
										'click',
										function() {
											var onStar = parseInt($(this).data(
													'value'), 10); // The star currently selected
											var stars = $(this).parent()
													.children('li.star');

											for (i = 0; i < stars.length; i++) {
												$(stars[i]).removeClass(
														'selected');
											}

											for (i = 0; i < onStar; i++) {
												$(stars[i])
														.addClass('selected');
											}

											// JUST RESPONSE (Not needed)
											var ratingValue = parseInt($(
													'#stars li.selected')
													.last().data('value'), 10);
											var msg = "";
											if (ratingValue > 1) {
												msg = "Thanks! You rated this "
														+ ratingValue
														+ " stars.";
											} else {
												msg = "We will improve ourselves. You rated this "
														+ ratingValue
														+ " stars.";
											}
											responseMessage(msg);

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

.success-box {
	margin: 50px 0;
	padding: 10px 10px;
	border: 1px solid #eee;
	background: #f9f9f9;
}

.success-box img {
	margin-right: 10px;
	display: inline-block;
	vertical-align: top;
}

.success-box>div {
	vertical-align: top;
	display: inline-block;
	color: #888;
}

/* Rating Star Widgets Style */
.rating-stars ul {
	list-style-type: none;
	padding: 0;
	-moz-user-select: none;
	-webkit-user-select: none;
}

.rating-stars ul>li.star {
	display: inline-block;
}

/* Idle State of the stars */
.rating-stars ul>li.star>i.fa {
	font-size: 2.5em; /* Change the size of the stars */
	color: #ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul>li.star.hover>i.fa {
	color: #FFCC36;
}

/* Selected state of the stars */
.rating-stars ul>li.star.selected>i.fa {
	color: #FF912C;	
}
.star_condition{
text-align: center;
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
		<div class="star_condition">
			<h4>책의 상태는 5점 만점에 몇 점인가요?</h4>
			북마켓이 제시하는 별점기준을 보시려면 별에 마우스를 올려주세요
					</div><br>
		<section class='rating-widget'> <!-- Rating Stars Box -->
		<div class='rating-stars text-center'>
			<ul id='stars'>
				<li class='star' title='일부 페이지가 없고 10개 이상의 얼룩, 필기 등의 흔적이 남아있습니다.' data-value='1'><i
					class='fa fa-star fa-fw'></i></li>
				<li class='star' title='페이지 소실은 없지만 10개 이상의 얼룩, 필기 등의 흔적이 남아있습니다.' data-value='2'><i
					class='fa fa-star fa-fw'></i></li>
				<li class='star' title='5군데 이상의 얼룩, 필기 등의 흔적이 남아있습니다.' data-value='3'><i
					class='fa fa-star fa-fw'></i></li>
				<li class='star' title='5군데 이하의 얼룩, 필기 등의 흔적이 남아있고 전체적으로 깨끗합니다.' data-value='4'><i
					class='fa fa-star fa-fw'></i></li>
				<li class='star' title='사용흔적이 거의 없어 새 책에 가깝습니다.' data-value='5'><i
					class='fa fa-star fa-fw'></i></li>
			</ul>
		</div>

		<div class='success-box'>
			<div class='clearfix'></div>
			<img alt='tick image' width='32'
				src='https://i.imgur.com/3C3apOp.png' />
			<div class='text-message'></div>
			<div class='clearfix'></div>
		</div>



		</section>

		<br>

		<div id="summernote"></div>

	</div>
	</section>
</body>
</html>