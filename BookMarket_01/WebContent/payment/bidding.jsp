<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경매 입찰하기</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

* {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	list-style: none;
	font-family: 'Noto Sans KR';
	color: #484f4f;
}

#content {
	width: 900px;
	height: 1000px;
	margin: 0 auto;
	align: center;
}

.strapline {
	margin-left: 10px;
	width: 98%;
	display: flex;
	flex-direction: row;
	align-items: center;
}

.title {
	margin: 0 5PX 5px 0;
	font-weight: bold;
	font-size: 25px;
	color: #3c3c3c;
	flex-grow: 0;
	background-color: #cfe0e8;
}

.divider {
	flex-grow: 1;
	height: 1px;
	background-color: #9f9f9f;
	margin-bottom : 10px;
}

.formDiv {
	margin-top: 10px;
	width: 100%;
	height: 650px;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	width: 100%;
}

.bookImg {
	text-align: center;
	height: 160x;
	vertical-align: middle;
}

.bookDesc {
	height: 160px;
}

.buyerDescc {
	height: 160px;
}

.purchaseDescc {
	height: 120px;
}

.purchaseBtn {
	text-align: center;
	line-height: 70px;
	height: 120px;
}

.bimg {
	width: 107px;
	height: 147px;
	border: 1px solid #cccccc;
}

.btitle {
	font-size: 22px;
}

.author_pub, .condition, .seller_email, .price, .date, .bookmoney,
	.buyer_email {
	font-size: 17px;
	color: #66757F;
}

.divider {
	margin: 20px 0;
}

.biddingBtn {

width : 100%;
text-align: center;
}

</style>


<script type="text/javascript">
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

		$('#bidding_btn').on('click', function() {
			var buyer_money = $('.bookmoney').attr('money');
			var bidding_price = $('.bprice').attr('money');

			if (Number(buyer_money) < Number(bidding_price)) {
				alert("적립금이 부족하여 입찰할 수 없습니다!");
			}

			else {

				var params = $('#biddingFrm').serialize();
				window.location.href = 'bookmarket?' + params;
			}
		})
	});
</script>
<style>
/* Rating Star Widgets Style */
.rating-stars {
	display: inline-block;
}

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
	font-size: 1.5em; /* Change the size of the stars */
	color: #ccc; /* Color on idle state */
}

/* Selected state of the stars */
.rating-stars ul>li.star.selected>i.fa {
	color: #FF912C;
}
.book_img{
width:135px;
height:194px;
}
</style>
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div id="content">

			<div class="strapline">
				<div class="title">&nbsp;경매 입찰하기&nbsp;</div>
				<div class="divider"></div>
			</div>

			<div class="formDiv">

				<div class="col-md-3 bookImg">
					<img class="book_img" src=${book.image}>
				</div>
				<div class="col-md-9 bookDesc">
					<p>
						<span class="btitle">[${genre}]${book.title}</span><br> <span
							class="author_pub">저자 : ${book.author} &nbsp; | &nbsp; 출판사
							: ${book.publisher}</span><br> <br> <span class="condition">책상태
							</span>
					<div class='rating-stars'>
						<ul id='stars'>
							<li class='star' title='일부 페이지가 없고 10개 이상의 얼룩, 필기 등의 흔적이 남아있습니다.'
								data-value='1'><i class='fa fa-star fa-fw'></i></li>
							<li class='star'
								title='페이지 소실은 없지만 10개 이상의 얼룩, 필기 등의 흔적이 남아있습니다.' data-value='2'><i
								class='fa fa-star fa-fw'></i></li>
							<li class='star' title='5군데 이상의 얼룩, 필기 등의 흔적이 남아있습니다.'
								data-value='3'><i class='fa fa-star fa-fw'></i></li>
							<li class='star' title='5군데 이하의 얼룩, 필기 등의 흔적이 남아있고 전체적으로 깨끗합니다.'
								data-value='4'><i class='fa fa-star fa-fw'></i></li>
							<li class='star' title='사용흔적이 거의 없어 새 책에 가깝습니다.' data-value='5'><i
								class='fa fa-star fa-fw'></i></li>
						</ul>
					</div>
					<br> <span class="seller_email">판매자 이메일 :
						${seller.email} </span><br> <span class="price"> 경매 시작가격 :
						${book.price} 원</span><br><br><br>

				</div>

				<div class="col-md-12 buyerDescc">
					<div class="divider"></div>
					<p>
						<span class="bookmoney" money="${participant.money }"> 나의 보유 적립금 :
							${participant.money }원 </span><br>
					</p>
				</div>

				<div class="col-md-12 purchaseDescc">
					<div class="divider"></div>
					<p>
						<span class="price bprice" money="${bidding_price}">입찰희망가 : ${bidding_price}원</span><br> <span class="date">
							입찰 날짜 : <fmt:formatDate pattern="yyyy년 MM월 dd일 hh시 mm분"
								value="${now}"></fmt:formatDate>
						</span><br>
					</p>
				</div>
				<form id="biddingFrm">
					<input name="seller_id" type="hidden" value="${seller.mem_id }">
					<input name="participant_id" type="hidden" value="${participant.mem_id }">
					<input name="book_id" type="hidden" value="${book.book_id}">
					<input name="bidding_price" type="hidden"
						value="${bidding_price}"> <input name="command"
						type="hidden" value="bidding">

					<div class="col-md-12 biddingBtn">
						<div class="divider"></div>
						<button type="button" class="btn btn-primary" id="bidding_btn">입찰하기</button>
						<button type="button" class="btn btn-danger"
							onclick="window.history.go(-1); return false;">취소하기</button>
					</div>

				</form>
			</div>

		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>