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
 
#cartList td{
text-align: center;
vertical-align: middle;
}

</style>
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
								<th>이미지</th>
						 		<th>제목</th>
								<th>판매자 이메일</th>
								<th>가격</th>
								<th>구매하기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach begin="0" end="4">
								<tr>
									<td><img id="book_image" src='http://placehold.it/70x92' /></td>
									<td>나미야 잡화점의 기적</td>
									<td>slokang@naver.com</td>
									<td>300000원</td>
									<td><button type='button' class='btn btn-primary btn-sm'>Purchase!
										</button></td>
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