<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Book Button</title>
<script>
	$(document).ready(function() {

		//지정상품일 경우 삭제 가능. 경매상품일 경우 참여자가 있는지 검사해서 없을 경우에만 삭제 가능.
		var price_type = '${book.price_type}';
		var book_id = '${book.book_id}'

		$('#btn_del').on('click', function() {
			if (price_type == 0) {
				var params = "command=book_delete&book_id=" + book_id;
				$.ajax({
					url : 'bookmarket',
					type : 'get',
					data : params,
					success : function(data) {
						if (data == 1) {
							alert('삭제되었습니다');
							location.href = "bookmarket?command=book_list";
						} else {
							alert('먼가 에러가 났네요...다시 시도해주세요');
							location.href = "bookmarket?command=book_list";
						}
					}
				});
			} else if (price_type == 1) {
				var deal_count = '${deal_count}';

				if (deal_count == 0) {
					//삭제
					var params = "command=book_delete&book_id=" + book_id;
					$.ajax({
						url : 'bookmarket',
						type : 'get',
						data : params,
						success : function(data) {
							if (data == 1) {
								alert('삭제되었습니다');
								location.href = "bookmarket?command=book_list";
							} else {
								alert('먼가 에러가 났네요...다시 시도해주세요');
								location.href = "bookmarket?command=book_list";
							}
						}
					});
				} else if (deal_count > 0) {
					//삭제불가
					console.log('경매참여자가 있어서 삭제가 불가함');
				} else if (deal_count < 0) {
					console.log('dao단에서 발생한 에러임');
				}

			}

		});

	});
</script>
<style>
.condition_info_wrapper {
	border-top: 1px solid #ddd;
	margin-left: 40px;
}

.button_div {
	width: 100%;
	float: left;
}
</style>
</head>
<body>
	<section class="condition_info_wrapper row placeholders">
	<div class="button_div">
		<button type="button"
			class="btn btn-primary btn-lg btn-block btn-half" id="btn_del">삭제하기</button>
	</div>
	</section>
</body>
</html>