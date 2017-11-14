<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function responseMessage(msg) {
		$('.success-box').fadeIn(200);
		$('.success-box div.text-message').html("<span>" + msg + "</span>");
	}
	$(document).ready(function() {

		//별점 정보 가져와서 보여주기
		var onStar = '${book.book_condition}';
		var stars = $('#stars li').parent().children('li.star');
		for (i = 0; i < stars.length; i++) {
			$(stars[i]).removeClass('selected');
		}

		for (i = 0; i < onStar; i++) {
			$(stars[i]).addClass('selected');
		}

		var msg = "";
		if (onStar == 1) {
			msg = "일부 페이지가 없고 10개 이상의 얼룩, 필기 등의 흔적이 남아있습니다.";
		} else if (onStar == 2) {
			msg = "페이지 소실은 없지만 10개 이상의 얼룩, 필기 등의 흔적이 남아있습니다.";
		} else if (onStar == 3) {
			msg = "5군데 이상의 얼룩, 필기 등의 흔적이 남아있습니다.";
		} else if (onStar == 4) {
			msg = "5군데 이하의 얼룩, 필기 등의 흔적이 남아있고 전체적으로 깨끗합니다.";
		} else if (onStar == 5) {
			msg = "사용흔적이 거의 없어 새 책에 가깝습니다.";
		}
		responseMessage(msg);

	});
</script>
<style>
button.accordion {
	background-color: #eee;
	color: #444;
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
	display: block;
	margin-left: 10px;
	margin-top: 30px;
}

.condition_info_wrapper {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	margin-left: 40px;
}

/* Rating Star Widgets Style */
.rating-stars ul {
	list-style-type: none;
	padding: 0;
	-moz-user-select: none;
	-webkit-user-select: none;
}

.star_condition {
	text-align: center;
}

.summer_note_comment {
	text-align: center;
}

.rating-stars ul>li.star {
	display: inline-block;
}

/* Idle State of the stars */
.rating-stars ul>li.star>i.fa {
	font-size: 2.5em; /* Change the size of the stars */
	color: #ccc; /* Color on idle state */
}

/* Selected state of the stars */
.rating-stars ul>li.star.selected>i.fa {
	color: #FF912C;
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
	<button class="accordion ">
		<b>판매자 ${book.seller }</b>님이 <b>${book.submit_date }</b>에 작성하신 <b>별점
			및 도서상태</b> 정보입니다.
	</button>
	<div class="panel">


		<br>
		<div class="star_condition">
			<h4>책의 상태는 5점 만점에 ${book.book_condition } 점입니다</h4>
			북마켓이 제시하는 중고책 별점기준에 따라 판매자가 평가한 점수입니다.
		</div>
		<br>
		<section class='rating-widget'> <!-- Rating Stars Box -->
		<div class='rating-stars text-center'>
			<ul id='stars'>
				<li class='star' title='일부 페이지가 없고 10개 이상의 얼룩, 필기 등의 흔적이 남아있습니다.'
					data-value='1'><i class='fa fa-star fa-fw'></i></li>
				<li class='star' title='페이지 소실은 없지만 10개 이상의 얼룩, 필기 등의 흔적이 남아있습니다.'
					data-value='2'><i class='fa fa-star fa-fw'></i></li>
				<li class='star' title='5군데 이상의 얼룩, 필기 등의 흔적이 남아있습니다.'
					data-value='3'><i class='fa fa-star fa-fw'></i></li>
				<li class='star' title='5군데 이하의 얼룩, 필기 등의 흔적이 남아있고 전체적으로 깨끗합니다.'
					data-value='4'><i class='fa fa-star fa-fw'></i></li>
				<li class='star' title='사용흔적이 거의 없어 새 책에 가깝습니다.' data-value='5'><i
					class='fa fa-star fa-fw'></i></li>
			</ul>
			<center>
				<div class='success-box'>
					<div class='clearfix'></div>
					<div class='text-message'></div>
					<div class='clearfix'></div>
				</div>
			</center>
		</div>


		</section>

		<div class="summer_note_comment">${book.comment }</div>
		<br>
	</div>
	</section>
</body>
</html>