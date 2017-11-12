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
				<!-- 컨텐츠 영역 -->
				<script type="text/javascript">
// 					$(document).ready(function(){
// 						// 관심목록
// // 						$('#table-myKeepBookList')
// 					})
				
				</script>
				<div id="contents-mypage" class="contents col-md-9">
					<section class="content_wrapper row placeholders ">
						<h1> 내가 찜한 도서 </h1>
						<!-- Default panel contents1 -->
						<div id="div-myKeepBook" class="panel panel-default">
							<!-- 찜 도서 table -->
							<div class="panel-heading">[ALL]My KeepBook List</div>
							<div class="panel-body" align="right" style="padding-bottom: 0px">
								<table id="table-myKeepBookList" style="text-align: center" class="display"
									cellspacing="0" width="100%" data-toggle="table"
									data-show-refresh="true" data-show-toggle="true"
									data-show-columns="true" data-search="true"
									data-select-item-name="toolbar1" data-pagination="true">
									<thead align="center">
											<th></th>
											<th>[상품ID/ISBN]</th>
											<th>title</th>
											<th>판매자</th>
											<th>가격</th>
											<th>판매상태</th>
											<th>찜 추가 날짜</th>
											<th>구매/삭제</th>
									</thead>
									<tbody>
<%-- 										<c:forEach var="myKeepBook" items="${KeepBookList }" varStatus="status"> --%>
<%-- 											<c:set var="book_id" value="${myKeepBook.book_id }" /> --%>
<%-- 											<c:forEach var="Book" items="${Book }" varStatus="status"> --%>
<%-- 											<c:if test="${book_id  }  > --%>
<%-- 												<tr> --%>
<%-- 													<td>${status.count }</td> --%>
<%-- 													<td><img id="book_image" src=${book.image } /></td> --%>
<%-- 													<td>${book.title }</td> --%>
<%-- 													<td>${book.price }</td> --%>
<%-- 													<td><button type='button' class='btn btn-primary btn-sm'>구매하기 --%>
<%-- 														</button></td> --%>
<%-- 													<td><button type='button' --%>
<%-- 															class='btn btn-danger btn-sm cart_delete' data-id=${book.book_id }>삭제하기</button></td> --%>
<%-- 												</tr> --%>
<%-- 											</c:forEach> --%>
<%-- 										</c:forEach> --%>
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