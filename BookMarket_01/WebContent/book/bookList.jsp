<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<link href="css/bootstrap-table.min.css" rel="stylesheet">

<!-- jQuery -->
 
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<script src="js/bootstrap-table.min.js"></script>


<style type="text/css">

#wrap{

width : 100%;
height : 900px;

}

#contents{
height : 700px;
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
</style>

<script>

	function listUpload(list) {
		var bookList = list.bookList;
		var memberList = list.memberList;
		$.each(bookList, function(index, item) {
			var tr = $('<tr>').appendTo('#listTable tbody');
			var td = $('<td>');

			var title = item.title;
			var genre = item.genre;
			var author = item.author;
			var publisher = item.publisher;
			var seller = memberList[index].email;
			var submit_date = item.submit_date;
			var price = item.price;
			
			
			var condition = ''; 
			if(item.book_condition===1){
				condition="A";
			}
			
			else if(item.book_condition===2){
				condition="B";
			}
			
			else if(item.book_condition===3){
				condition="C";
			}
			
			else if(item.book_condition===4){
				condition="D";
			}
			
			var price_type ='';
			if(item.price_type===0){price_type = '지정';}
			else if(item.price_type===1){price_type= '경매';}
			
	   


			var purchase_button = "<button type='button' class='btn btn-primary btn-sm'>Purchase!</button>";
			var keep_button = "<button type='button' class='btn btn-warning btn-sm'>Keep!</button>";
			var cart_button = "<button type='button' class='btn btn-success btn-sm'>Cart!</button>";
			var img = "<img src='http://placehold.it/70x92' />";

			$('<td>').html(img).appendTo(tr);
			$('<td>').text(title).appendTo(tr);
			$('<td>').text(genre).appendTo(tr);
			$('<td>').text(author +"  "+ publisher).appendTo(tr);
			$('<td>').text(condition).appendTo(tr);
			$('<td>').text(seller).appendTo(tr);
			$('<td>').text(submit_date).appendTo(tr);
			$('<td>').text(price+'원').appendTo(tr);
			$('<td>').text(price_type).appendTo(tr);
			$('<td>').html(purchase_button+'<br><br>'+keep_button+' &nbsp;'+cart_button).appendTo(tr);

		});
	}


	$(document).ready(function() {
		$('#searchForm').submit(function(){
			return false;
		})
		
		var params = "searchSel=all&command=book_search";
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



		$('#optionSel').on('change', function() {
			var params = "option=" + this.value + "&command=book_option&genre=1";
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
				<table id="listTable" style="text-align: center" class="display"
					cellspacing="0" width="100%" data-toggle="table"
					data-show-refresh="true" data-show-toggle="true"
					data-show-columns="true" data-search="true"
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
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>