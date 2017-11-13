<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

* {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	list-style: none;
	font-family: 'Noto Sans KR';
}

#cartList td {
	text-align: center;
	vertical-align: middle;
}

#cartList th {
	text-align: center;
	vertical-align: middle;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		$('#cartList').on('click', '.cart_delete', function() {

			var book_id = $(this).attr('data-id');
			var params ="command=cart&book_id="+book_id;
			 $(this).closest('tr').remove();
			$.ajax({
				url : 'bookmarket',
				type : 'get',
				data : params,
				success : function(data) {
			
					
				}
			});
// 			

		})

	});
</script>


</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="cart" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">장 바 구 니</h4>
				</div>
				<div class="modal-body">

					<table class="table table-striped" id="cartList">
						<thead>
							<tr>
								<th>번호</th>
								<th>이미지</th>
								<th>제목</th>
								<th>가격</th>
								<th>구매하기</th>
								<th>삭제하기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="book" items="${cartList }" varStatus="status">
								<tr>
									<td>${status.count }</td>
									<td><img id="book_image" src=${book.image } /></td>
									<td>${book.title }</td>
									<td>${book.price }</td>
									<c:choose>
									<c:when test="${book.isSold==0 }">
									<td><button type='button' class='btn btn-primary btn-sm'>구매하기</button></td>
									</c:when>
									<c:otherwise>
									<td><button type='button' class='btn btn-danger btn-sm' disabled="disabled">판매완료 </button></td>
									</c:otherwise>
									</c:choose>
									<td><button type='button'
											class='btn btn-danger btn-sm cart_delete' data-id=${book.book_id }>삭제하기</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


</body>
</html>