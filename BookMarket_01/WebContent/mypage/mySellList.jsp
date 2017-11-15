<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Market</title>
</head>
<body>
	<div class="wrap">
		<div class="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div class="container content_parents">
			<div class="row">
				<!-- 사이드 바 -->
				<div id="div-mypage-side-menu" class="side-menu">
					<jsp:include page="myPage_navigation.jsp" />
				</div>
				<!-- 스크립트 영역 -->
				<script type="text/javascript">
					$(document).ready(function() {
						// 판매내역
						$.ajax({
							url : 'bookmarket?command=mySell_list',
							type : 'get',
							dataType: 'json',
							success : function(data) {
								if (data) {
									$('#table-mySellBookList tbody').empty();
									mySellBook_listUpload(data);
								}
								else{
									$('<td>').attr('colspan',9).text('등록하신 상품이 없습니다.').appendTo('#table-mySellBookList tbody');
								}
							},
							error: function(xhr, status, error){
								alert('error')
							}
						});
					});
				</script>
				<!-- 컨텐츠 영역 -->
				<div id="contents-mySellList" class="contents col-md-10">
					<section class="content_wrapper row placeholders ">
						<h1> 내가 판매 등록한 도서 </h1>
						<!-- Default panel contents1 -->
						<div id="div-mySellBook" class="panel panel-default">
							<!-- 찜 도서 table -->
							<div class="panel-heading">[ALL]My Sell Book List</div>
							<div class="panel-body" align="right" style="padding-bottom: 0px">
								<table id="table-mySellBookList" class="table" style="text-align: center" class="display"
									cellspacing="0" width="100%" data-toggle="table"
									data-show-refresh="true" data-show-toggle="true"
									data-show-columns="true" data-search="true"
									data-select-item-name="toolbar1" data-pagination="true">
									<thead style="text-align:center">
											<th>상품번호</th>
											<th>이미지</th>
											<th>Title</th>
											<th>지정/판매</th>
											<th>가격</th>
											<th>경매종료일자</th>
											<th>등록일자</th>
											<th>[판매일자]판매상태</th>
											<th>수정/삭제</th>
									</thead>
									<tbody style="text-align:center">
										<tr></tr>
									</tbody>
								</table>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>