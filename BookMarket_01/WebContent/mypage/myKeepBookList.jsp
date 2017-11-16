<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>  
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
						// 찜상품
						$.ajax({
							url : 'bookmarket?command=myKeep_list',
							type : 'get',
							dataType: 'json',
							success : function(data) {
// 								alert(data)
								if (data) {
									$('#table-myKeepBookList tbody').empty();
									myKeepBook_listUpload(data);
								}else{
									$('#table-myKeepBookList tbody').empty();
									$('<td>').attr('colspan',8).text('찜하신 상품이 없습니다.').appendTo('#table-myKeepBookList tbody');
								}
							},
							error: function(xhr, status, error){
								alert('error')
							}
						
						});
					});
				</script>
				<!-- 컨텐츠 영역 -->
				<div id="contents-myKeepBook" class="contents col-md-9">
					<section class="content_wrapper row placeholders ">
						<h1> 내가 찜한 도서 </h1>
						<!-- Default panel contents1 -->
						<div id="div-myKeepBook" class="panel panel-default">
							<!-- 찜 도서 table -->
							<div class="panel-heading">[ALL]My KeepBook List</div>
							<div class="panel-body" align="right" style="padding-bottom: 0px">
								<table id="table-myKeepBookList" class="table" style="text-align: center" class="display"
									cellspacing="0" width="100%" data-toggle="table"
									data-show-refresh="true" data-show-toggle="true"
									data-show-columns="true" data-search="true"
									data-select-item-name="toolbar1" data-pagination="true">
									<thead style="text-align:center">
											<th>[#]</th>
											<th>이미지</th>
											<th>Title(ISBN)</th>
											<th>판매자</th>
											<th>[일반/경매(종료일자)]</th>
											<th>가격</th>
											<th>찜 추가 날짜</th>
											<th>구매/삭제</th>
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