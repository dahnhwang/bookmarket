<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Book Button</title>
<script>
	$(document)
			.ready(
					function() {

						$('#btn_reset').on('click', function() {
							$('#summernote').summernote('reset');
						});

						$('#btn_fin')
								.on(
										'click',
										function() {
											$
													.ajax({
														type : "POST",
														dataType : "json",
														url : "bookmarket?command=book_insert",
														data : {
															comment : $(
																	'#summernote')
																	.summernote(
																			'code'),
															condition : parseInt(
																	$(
																			'#stars li.selected')
																			.last()
																			.data(
																					'value'),
																	10)
														},
														success : function(data) {
															if (data.result == "0") {
																alert('정보가 제대로 저장되지 못했습니다. 개발자를 불러주세요....--;');
															} else {
																alert('판매를 개시합니다!');
															}
														}
													});
										});
					});
</script>
<style>
.condition_info_wrapper {
	border-top: 1px solid #ddd;
	margin-left: 40px;
}

.button_div {
	width: 50%;
	float: left;
}
</style>
</head>
<body>
	<section class="condition_info_wrapper row placeholders">
	<div class="button_div">
		<button type="button"
			class="btn btn-primary btn-lg btn-block btn-half" id="btn_reset">다시
			입력하기</button>
	</div>
	<div class="button_div">
		<button type="button"
			class="btn btn-primary btn-lg btn-block btn-half" id="btn_fin">판매준비
			완료!</button>
		<!-- book_insert 여기로 보내야 함!! -->
	</div>
	</section>
</body>
</html>