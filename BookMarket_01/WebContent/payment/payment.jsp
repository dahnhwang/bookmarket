<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	width: 800px;
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
}

.formDiv {
	margin-top: 10px;
	width: 100%;
	height: 600px;
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
</style>


<script type="text/javascript">

	$(document).ready(function() {
	
		$('#purchase_btn').on('click', function() {
			var buyer_money = $('.bookmoney').attr('money');
			var book_price = $('.bprice').attr('money');
           alert("판매자 적림금:"+buyer_money+"\n책가격 :"+book_price);
			
           if (Number(buyer_money) < Number(book_price))  {
				alert("적립금이 부족하여 구매할 수 없습니다!");
			} 
           
           else {
				
				var params =  $('#paymentFrm').serialize();
	        window.location.href = 'bookmarket?'+params;
			}
		}) 
	});
</script>

</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div id="content">

			<div class="strapline">
				<div class="title">&nbsp;구 매 하 기&nbsp;</div>
				<div class="divider"></div>
			</div>

			<div class="formDiv">
				
					<div class="col-md-3 bookImg">
						<img class="bimg" src=${purchaseBook.image}>
					</div>
					<div class="col-md-9 bookDesc">
						<p>
							<span class="btitle">${purchaseBook.title}</span><br> <span
								class="author_pub">${purchaseBook.author} /
								${purchaseBook.publisher}</span><br> <br> <span
								class="condition">책상태 : ${book_condition}</span><br> <span
								class="seller_email">판매자 이메일 : ${seller.email} </span><br>
							<span class="price"> 가격 : ${purchaseBook.price} 원</span><br>

						</p>
					</div>

					<div class="col-md-12 buyerDescc">
						<div class="divider"></div>
						<p>
							<span class="buyer_email">구매자 이메일 : ${buyer.email }</span><br>
							<span class="bookmoney" money="${buyer.money }"> 보유 적립금 :
								${buyer.money }원 </span><br>
						</p>
					</div>

					<div class="col-md-12 purchaseDescc">
						<div class="divider"></div>
						<p>
							<span class="price bprice" money="${purchaseBook.price}">도서
								가격 : ${purchaseBook.price}원</span><br> <span class="date">
								구매 날짜 : <fmt:formatDate pattern="yyyy년 MM월 dd일 hh시 mm분"
									value="${now}"></fmt:formatDate>
							</span><br>
						</p>
					</div>
					<form id="paymentFrm">
					<input name="seller_id" type="hidden" value="${seller.mem_id }">
					<input name="buyer_id" type="hidden" value="${buyer.mem_id }">
					<input name="book_id" type="hidden"value="${purchaseBook.book_id}">
				    <input name="book_price" type="hidden" value="${purchaseBook.price}">
				    <input name="command" type="hidden" value="payment_success">
				    
					<div class="col-md-12 purchaseBtn">
						<div class="divider"></div>
						<button type="button" class="btn btn-primary" id="purchase_btn">구매하기</button>
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