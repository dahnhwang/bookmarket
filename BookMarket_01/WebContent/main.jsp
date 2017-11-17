<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Market</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

1
* {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	list-style: none;
	font-family: 'Noto Sans KR';
}

.wrap {
	width: 100%;
	height : 1300px;
}

#contents {
	width: 70%;
	height: 1200px;
	margin-left: 20px;
}

#contents .section {
	width: 100%;
	height: 30%;
	margin: 20px 0 10px 0;
}

#contents .section ul {
	margin: 40px 0 20px 35px;
}

#contents .section ul li {
	display: inline-block;
	float: left;
	margin: 0 30px 0 0;
	box-sizing: border-box;
}

.bookList {
	position: relative;
}

.book_img {
	width: 130px;
	height: 176px;
	box-shadow: 7px 7px 3px #cccccc;
	opacity: 1;
	display: block;
	transition: .5s ease;
	backface-visibility: hidden;
	transition: .5s ease;
}

.middle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.bookList:hover .book_img {
	opacity: 0.8;
}

.bookList:hover .middle {
	opacity: 1;
}

.text {
	background-color: #006E51;
	color: white;
	font-size: 13px;
	color: white;
	width: 130px;
	height: 120px;
	text-align: center;
}

.strapline {
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
	background-color: #ffffff;
	border :1px solid #9f9f9f;
}

.divider {
	flex-grow: 1;
	height: 1px;
	background-color: #9f9f9f;
}
  
#banner {
	width: 100%;
	height: 160px;
    background-color : #bdcebe;
	margin: 0 0 50px 0;
	font-size: 30px;
	font-weight: normal;
	overflow: hidden;
	text-align: center;
	
}

#banner_img{


}

#sideBar {
	margin-left: 20px;
	width: 350px;
	height: 400px;
	border: 1px solid #cccccc;
	margin-right: 0px;
    padding: 5px;
}
#sideBar table{
	text-align: center;
	display: block;
	paddind-bottom : 0;
	
}
#sideBar td{
	height: 40px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
/* 	display: block; */
}
.shelf_img {
	
}

</style>

<script type="text/javascript">

$(document).ready(function() {
	
	$(document).on('click', '.middle', function() {
		var book_id =$(this).attr('data-id');
		window.location.href = 'bookmarket?command=detail_book&book_id='+ book_id;


	});

	
});

</script>
</head>
<body>
	<div class="wrap">
		<div class="navigation">
			<jsp:include page="navigation.jsp" />
		</div>

		<div id="contents" class="col-md-10">
			<div id="banner">
		     <img alt="" src="img/banner.png" id="banner_img">
			</div>
			<div class="section">
				<div class="strapline">
					<div class="title">&nbsp;오늘의 신간 도서 TOP 5&nbsp;</div>
					<div class="divider"></div>
				</div>
				<ul>
					<c:forEach var="book" items="${section1_list }" >
						<li>
							<div class="bookList">
								<img class="book_img"
									src='${book.image } ' />
								<div class="middle" data-id ="${book.book_id }">
									<div class="text">
										<br> <span>${book.title }</span><br>
										<span>${book.price }원</span>
									</div>
								</div>
								
							</div>

						</li>
					</c:forEach>
				</ul>
				<img class="shelf_img" alt="" src="img/shelf6.png" width="850px"
					height="70px">
			</div>


			<div class="section">
				<div class="strapline">
					<div class="title">&nbsp;오늘의 입찰 도서 TOP 5&nbsp;</div>
					<div class="divider"></div>
				</div>
				<ul>
					<c:forEach var="book" items="${section2_list }" >
						<li>
							<div class="bookList">
								<a href="#"> 
								<img class="book_img"
									src='${book.image } ' /></a>
								<div class="middle"  data-id ="${book.book_id }">
									<div class="text">
										<br> <span>${book.title }</span><br><span>${book.price }원</span>
									</div>
								</div>
							</div>

						</li>
					</c:forEach>
				</ul>
				<img class="shelf_img" alt="" src="img/shelf6.png" width="850px"
					height="70px">
			</div>




			<div class="section">
				<div class="strapline">
					<div class="title">&nbsp;마감임박 도서 TOP 5&nbsp;</div>
					<div class="divider"></div>
				</div>
				<ul>
					<c:forEach var="book" items="${section3_list }" >
						<li>
							<div class="bookList">
								<a href="#"> 
								<img class="book_img"
									src='${book.image } ' /></a>
								<div class="middle"  data-id ="${book.book_id }">
									<div class="text">
										<br> <span>${book.title }</span><br><span>${book.price }원</span>
									</div>
								</div>
							</div>

						</li>
					</c:forEach>
				</ul>
				<img class="shelf_img" alt="" src="img/shelf6.png" width="850px"
					height="70px">
			</div>

		</div>
<script type="text/javascript">
	$(document).ready(function(){
		$('#sideBar').hide(); 
		setInterval(function(){ 
			if("${loginUser}" != ""){
				$('#sideBar').show();
				loadLog();
			}
			else{ 
				$('#sideBar').hide();
			}
		}, 1000);
		
	})
	function loadLog(){
		$.ajax({
	 		url : 'bookmarket?command=myLog_list',
	 		type : 'get',
	 		dataType: 'json',
	 		success : function(data) {
//		 			alert(data) 
	 			if (data) {
	 				$('#table-myTradeLog tbody').empty();
	 				var bookList = data.bookList;
	 				var logList = data.logList;
					
	 				for(var i=0; i<logList.length; i++){
	 					var order_id = logList[i].order_id
	 					var book_id = logList[i].book_id;
	 					var seller_id = logList[i].seller_id;
	 					var buyer_id = logList[i].buyer_id;
	 					var sold_date = logList[i].sold_date_string;
	 					var sold_price = logList[i].sold_price;
	 					var title = bookList[i].title;
//		 					alert(title);
	 					var price_type = bookList[i].price_type;
	 					var titleTag =$('<a>').attr(
	 							  'href', 'bookmarket?command=detail_book&book_id='+book_id)
	 							  .addClass("bookTitle")
	 							  .attr('display', 'block')
	 							  .text(title);
						
						
	 					var tr = $('<tr>').appendTo('#table-myTradeLog tbody');
	 					$('<td>').text(order_id).css('width', '5%').appendTo(tr);
	 					$('<td>').text(sold_date).css('width', '25%').appendTo(tr);
	 					$('<td>').append(titleTag).css({
	 						'width': '100px',
	 						'display': 'block',
	 					    'white-space': 'nowrap',
		 				    'overflow': 'hidden',
		 				    'text-overflow': 'ellipsis',
		 				    'display': 'block'
	 						}).appendTo(tr);
	 					if(price_type == 0)
	 						$('<td>').text('일반').css('width', '5%').appendTo(tr);
	 					else if(price_type == 1)
	 						$('<td>').text('경매').css('width', '5%').appendTo(tr);
						
	 					if(seller_id == '${loginUser.mem_id}'){
	 						// 판매자일때 
	 						$('<td>').text(sold_price).css('width', '25%').css('color', 'blue').appendTo(tr);
	 					}
	 					else if(buyer_id == '${loginUser.mem_id}'){
	 						// 구매자일때 
	 						$('<td>').text(sold_price).css('width', '25%').css('color', 'red').appendTo(tr);
	 					}
	 				}
	 			}
	 			else{
	 				$('#table-myTradeLog tbody').empty();
	 				$('<td>').attr('colspan',5).text('no records').appendTo('#table-myTradeLog tbody');
	 			}
	 		}, 
	 		error: function(xhr, status, error){
//		 			alert('error')
	 		}
	 	});
	}
</script>
		<div id="sideBar" class="col-md-2">
			<table id="table-myTradeLog" class="table">
				<thead >
					<tr>
						<th width="5%">#</th>
						<th width="25%" style="text-align: center">DATE</th>
						<th width="100px" style="border-bottom:0px;text-align: center">TITLE</th>
						<th width="5%" style="text-align: center">TYPE</th>
						<th width="25" style="text-align: center">PRICE</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<jsp:include page="member/cart.jsp" />
		<div class="footer">
			<jsp:include page="footer.jsp" />
		</div>


	</div>


</body>
</html>