<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 리스트</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<link href="css/bootstrap-table.min.css" rel="stylesheet">


<!-- jQuery -->

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 
<!-- Bootstrap Core JavaScript -->
<!--<script src="js/bootstrap.min.js"></script> 이걸지우자-->


<script src="js/bootstrap-table.min.js"></script>

<style type="text/css">
.bookTitle {
	color: #282828;
}

#wrap {
	width: 100%;
}

#contents {
	height: 1600px;
}

#searchBar {
	width: 100%;
	height: 100px;
	overflow: hidden;
	margin: 0 auto;
}

#search {
	width: 100%;
	height: 50%;
	text-align: center;
}

#option {
	width: 100%;
	height: 50%;
	text-align: left;
	margin-top: 20px;
	margin-right: 20px;
}

#listTableDiv{
 margin-top : 30px;
}

#listTable th {
	text-align: center;
	vertical-align: middle;
}

#listTable td {
	text-align: center;
	vertical-align: middle;
}

#searchInput {
	border: 1px solid #968d8d;
	border-radius: 5px;
}

.paginationDiv {
	width: 95%;
	text-align: right;
}

.pagination {
	border: 1px solid #92a8d1;
}


#footer{
margin-top : 50px;
}
</style>

<script>
	function listUpload(list) {
		var bookList = list.bookList;
		var memberList = list.memberList;
		var genreList = list.genreList;
		$.each(bookList, function(index, item) {

			var tr = $('<tr>').appendTo('#listTable tbody');
			var td = $('<td>');
			var book_id = item.book_id;
			var image = item.image;
			var title = item.title;
			var genre = genreList[index];
			var author = item.author;
			var publisher = item.publisher;
			var seller = memberList[index].email;
			var submit_date = item.submit_date;
			var price = item.price;
			var isSold = item.isSold;
            var retail_price= item.retail_price;
			var condition = '';
			if (item.book_condition === 5) {
				condition = "A";
			} else if (item.book_condition === 4) {
				condition = "B";
			} else if (item.book_condition === 3) {
				condition = "C";
			} else if (item.book_condition === 2) {
				condition = "D";
			} else if (item.book_condition === 1) {
				condition = "D";
			}

			var price_type = '';
			if (item.price_type === 0) {
				price_type = '지정';
			} else if (item.price_type === 1) {
				price_type = '경매';
			} 

			
			var titleTag = $('<a>').attr('href',
				'bookmarket?command=detail_book&book_id=' + book_id)
				.addClass("bookTitle").text(title);
			var img = "<img src=" + image + " width='80' height ='110' style ='border : 1px solid #cccccc'/>";

			$('<td>').html(img).appendTo(tr);
			$('<td>').append(titleTag).appendTo(tr);
			$('<td>').text(genre).appendTo(tr);
			$('<td>').html(author + '<br>' + publisher).appendTo(tr);
			$('<td>').text(condition).appendTo(tr);
			$('<td>').text(seller).appendTo(tr);
			$('<td>').text(submit_date).appendTo(tr);
			$('<td>').text(price + '원').appendTo(tr);
			$('<td>').text(price_type).appendTo(tr);

			var cartBtn = $('<input>').attr('type', 'button').attr('data-id', book_id)
				.addClass('cart_btn').css({
				'margin' : '5px'
			}).val('Cart').addClass('btn btn-light btn-sm');

			var keepBtn = $('<input>').attr('type', 'button').attr('data-id',
				book_id).addClass('keep_btn').css({
				'margin' : '1px'
			}).val('Keep').addClass('btn btn-light btn-sm');
			
			var purchaseBtn = $('<input>').attr('type', 'button').attr(
				'data-id', book_id).attr("email", seller).addClass('purchase_btn').css('margin',
				'5px').val('구매하기').addClass('btn btn-primary ');
			
			var biddingBtn = $('<input>').attr('type', 'button').addClass('btn btn-warning')
			.attr('data-id', book_id).attr('retail_price',retail_price)
			.attr("email", seller).addClass('bidding_btn').css('margin',
					'5px').val('경매 참여하기');

			var soldOutBtn = $('<input>').attr('type', 'button').addClass('btn btn-danger')
				.addClass('soldOut_btn').css('margin', '5px').val('SoldOut!').attr("disabled", 'disabled');


            
			
			if (isSold === 0) {
				if (item.price_type === 0) {
					//지정 
					$('<td>').append(purchaseBtn).append('<br>').append(keepBtn).append(cartBtn)
					.appendTo(tr);
					
				} else if (item.price_type === 1) {
					$('<td>').append(biddingBtn).append('<br>').append(keepBtn).appendTo(tr);
				}
				
				
			} else if (isSold === 1) {
				$('<td>').append(soldOutBtn).appendTo(tr);
			}



		});
	}

	$(document).ready(function() {


		$('.paginationDiv').css('visibility','visible');
		var current_page_genre = 0;
		var params = "command=booklist_pagenation&page_num=" + 1;
		$.ajax({
			url : 'bookmarket',
			type : 'get',
			data : params,
			dataType : 'json',
			success : function(data) {
				if (data) {
					$('#listTable tbody').empty();
					listUpload(data);
				}

			}
		})

		$('#searchForm').submit(function() {
			return false;
		})

		$('#optionSel').on('change', function() {
			var params = "option=" + this.value + "&command=book_option&genre=" + current_page_genre;
			$('.paginationDiv').css('visibility','hidden');
			$.ajax({
				url : 'bookmarket',
				type : 'get',
				data : params,
				dataType : 'json',
				success : function(data) {
					if (data) {

						$('#listTable tbody').empty();
						listUpload(data);

					}
				}
			});

		});

		$('#searchBtn').on('click', function() {
			$('.paginationDiv').css('visibility','hidden');
			$.ajax({
				url : 'bookmarket',
				type : 'get',
				data : $('#searchForm').serialize(),
				dataType : 'json',
				success : function(data) {
					if (data) {

						$('#listTable tbody').empty();
						listUpload(data);

					}
				}
			});

		});




		$(document).on('click', '.book_navigation_a', function() {
			$('.paginationDiv').css('visibility','hidden');
			var genre_id = $(this).attr('data-id');
			var params = "option=only_genre&command=book_option&sel=1&genre=" + genre_id;
			current_page_genre = genre_id;
			console.log(current_page_genre);
			$.ajax({
				url : 'bookmarket',
				type : 'get',
				data : params,
				dataType : 'json',
				success : function(data) {
					if (data) {
						$('#listTable tbody').empty();
						listUpload(data);

					}
				}
			});

		});


		$(document).on('click', '.cart_btn', function() {
			
			var book_id = $(this).attr('data-id');
			var params = "command=cart_add&book_id=" + book_id;
			$.ajax({
				url : 'bookmarket',
				type : 'get',
				data : params,
				success : function(data) {
					alert(data);
				}
			});

		})

		$(document).on('click', '.keep_btn', function() {

			var book_id = $(this).attr('data-id');
			var params = "command=keepBook_add&book_id=" + book_id;
			$.ajax({
				url : 'bookmarket',
				type : 'get',
				data : params,
				success : function(data) {
					if(data == 0 ) {
						loginCheck('bookmarket?command=book_list');
					}
					
					else {
					alert(data);
					}
				}
			});

		})


		$(document).on('click', '.purchase_btn', function() {
			var seller_email = $(this).attr('email');
			var book_id = $(this).attr('data-id');
			//판매자와 구매자가 같은 사람인지 판별하기 
			var params = "command=payment_check_pass&seller_email=" + seller_email;
			$.ajax({
				url : 'bookmarket',
				type : 'get',
				data : params,
				success : function(data) {
                 
					if (data == 0) {
						alert('본인이 판매하는 상품은 구매할 수 없습니다!');
					} else if (data == 1) {

						window.location.href = 'bookmarket?command=payment&book_id=' + book_id;


					}else if (data == -1) {
						loginCheck('bookmarket?command=book_list');
					}
				}
			})

		});

		
		$(document).on('click', '.bidding_btn', function() {
			var seller_email = $(this).attr('email');
			var book_id = $(this).attr('data-id');
			//판매자와 구매자가 같은 사람인지 판별하기 
			var params = "command=payment_check_pass&seller_email=" + seller_email
			+"&book_id="+book_id ;
			$.ajax({
				url : 'bookmarket',
				type : 'get',
				data : params,
		     	success : function(data) {
			
					if (data == 0) {
						alert('본인이 경매하는 상품은 참여할 수 없습니다 !');
					} 
					else if (data == 1) {

						window.location.href = 'bookmarket?command=detail_book&book_id='+ book_id;


					}else if (data == -1) {
						loginCheck('bookmarket?command=book_list');
					}
				}
			})

		});

		




		$(document).on('click', '.page_num', function() {

			var page_num = $(this).attr('data-id');
			var params = "command=booklist_pagenation&page_num=" + page_num;
			$.ajax({
				url : 'bookmarket',
				type : 'get',
				data : params,
				dataType : 'json',
				success : function(data) {
					if (data) {
						$('#listTable tbody').empty();
						listUpload(data);
					}

				}
			})

		});

	});
</script>
</head>
<body>

	<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div id="contents">
			<div id="bookList_naviation">
				<jsp:include page="book_navigation.jsp" />
			</div>


			<div id="listWrap" class="col-md-10">
				<div id="searchBar">
					<div id="search">
						<form id="searchForm">
							<span>결과 내 검색&nbsp;</span> <select size=1 name="searchSel">
								<option value="title">도서명 </option>
								<option value="author">저자명 </option>
								<option value="publisher">출판사명</option>
								<option value="seller_email">판매자 이메일 </option>
							</select> <input type="hidden" name="command" value="book_search">
							<input type="text" size="40" id="searchInput" name="searchInput">
							<input type="button" id="searchBtn" class="btn btn-dark"
								value="검색">
						</form>
					</div>

					<div id="option">
						<span>책보기 옵션&nbsp;</span> <select size=1 id="optionSel">
							<option value="fixedPrice" name="fixedPrice">지정판매 </option>
							<option value="biddingPrice" name="biddingPrice">경매판매 </option>
							<option value="Condition" name="Condition">책상태</option>
							<option value="lower" name="lower">낮은 가격순</option>
							<option value="lately" name="lately">최근 등록 순 </option>
						</select>

					</div>
				</div>
				<div id="listTableDiv">
				<table id="listTable" style="text-align: center" class="display"
					cellspacing="0" width="100%" data-toggle="table"
					 data-select-item-name="toolbar1" data-pagination="true">
					<thead>
						<tr>
							<th>이미지</th>
							<th>제목</th>
							<th>장르</th>
							<th>저자 / 출판사</th>
							<th>상태</th>
							<th>판매자 이메일</th>
							<th>업데이트 날짜</th>
							<th>가격</th>
							<th>지정/판매</th>
							<th>구매 버튼</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				</div>
			</div>

			<div class="paginationDiv">

				<ul class="pagination">
				<c:forEach begin="1" end="${page_num }" varStatus="status">
					<li><a href="#" data-id="${status.count }" class="page_num">${status.count }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>