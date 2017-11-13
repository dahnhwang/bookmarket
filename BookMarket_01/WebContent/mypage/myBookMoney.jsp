<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery-min -->
<!-- <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script> -->
<!-- Bootstrap -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<!-- <script src="js/bootstrap.min.js"></script> -->
<!-- <script src="js/mypage.js"></script> -->
<style type="text/css">
.contents {
	position: absolute;
	overflow: hidden;
}

.content_wrapper {
	padding-bottom: 30px;
	padding-left: 70px;
}
#btn-mypwd-check{
	margin-top: 10px; 
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div class="container content_parents">
		<div class="row">
			<!-- 사이드 바 -->
			<div id="div-mypage-side-menu" class="side-menu">
				<jsp:include page="myPage_navigation.jsp" />
			</div>
			<!-- 컨텐츠 영역 -->
			
			<div id="contents-mypage" class="contents col-md-9">
				<section class="content_wrapper row placeholders ">
					<h3>북 머니 조회 페이지</h3>
					<!-- Default panel contents1 -->
					<div id="div-myBookMoneyInfo" class="panel panel-default">
						<!-- 북머니기본정보 -->
						<div class="panel-heading">BookMoney Info</div>
						<div class="panel-body" align="right" style="padding-bottom: 0px">
							<table id="table-myBookMoneyInfo" class="table" style="border-bottom: 1px solid #dddddd">
								<tr>
									<th style="text-align: center">현재 북머니 조회</th>
									<td >${loginUser.money}</td>
								</tr>
								<tr style="text-align:center">
									<td colspan="2"><button id="btn-charge" class="btn btn-primary" data-toggle="modal" data-target="#modal-charge">충전하기</button></td>
								</tr>
							</table>
						</div>
					</div>
					<!-- Default panel contents2 -->
					<script type="text/javascript">
						$(document).ready(function(){
							$.ajax({
								url : 'bookmarket?command=myBookMoney',
								type : 'get',
								dataType : 'json',
								success : function(data) {
									alert(data.bookMoneyList[0].bookMoney);
									if (data) {
										$('#table-myBookMoney tbody').empty();
										myBookMoney_listUpload(data);

									}
								}
							});
							// 북머니
							$('#btn-charge-submit').on('click', function(event){
								event.preventDefault();
								if(checkChargeBookMoney()){
									var charge = $('#charge').val();
									var params = "command="+$('#hidden').val()+"&charge=" + charge;
									alert(params)
									$.ajax({
										url : 'bookmarket',
										type : 'post',
										data : params,
										async: true,
										success: function(data){
											if(data.result == true){
												alert('북머니 충전 성공: ${loginUser.money}');
												document.reload();
											}
											else{
												alert('충전에 실패하였습니다. 다시 시도해 주세요')
												$('#charge').focus();
											}
										},
										error: function(xhr, status, error){
											alert('실패')
										}
									});
								}
							});
						})
					</script>
					<div id="div-myBookMoneyTable" class="panel panel-default">
						<!-- 북머니기록조회 -->
<!-- 						<div class="panel-heading">BookMoney Info</div> -->
						<div class="panel-body" align="right" style="padding-bottom: 0px">
							<table id="table-myBookMoney" class="table">
								<thead style="text-align:center">
									<td>#</td><td>DATE</td><td>[입금/출금/충전]</td><td>사용금액</td><td>북머니</td>
								</thead>
								<tbody style="text-align:center">
									<tr>
										<td>(test)</td>
										<td>2017/11/10</td>
										<td>-</td>
										<td>-</td>
										<td>-</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</section>
			</div>
		</div>
		</div>
		<!-- Button trigger modal -->

		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
	
<div  id="modal-charge" class="modal fade">
	<div class="modal-dialog" role="dialog">                                 
		<div class="modal-content">                                                            
	      	<div class="modal-body">                                                              
		        <form id="frm-charge" class="frm" method="post" action="bookmarket">
					<input id="hidden-command" type="hidden" name="command" value="myBookMoney_charge">
			        <button id="btn-close" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>                                        
					<h2 class="form-signin-heading">BOOKMONEY 충전</h2>
					<table class="table" style="margin: 0 auto">
						<thead><th colspan="2">현재 ${loginUser.money } 원</th><th></th></thead> 
						<tbody style="text-align:center">
							<td style="padding-top:15px;"> 충전금액 </td>
							<td><input type="text" class="form-control" id="charge" name="charge" required="" autofocus="" data-placement="top"/></td>				
		 				</tbody>
		 				<tfoot>
		 					<td colspan="2">
								<button id="btn-charge-submit" class="btn btn-lg btn-primary btn-block" type="submit">충전</button>
							</td>
		 				</tfoot>
					</table>
				</form>
	      	</div>
		    <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
	    </div>
	</div>	
</div>
</body>
</html>