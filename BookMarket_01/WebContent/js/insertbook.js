// 모든 필드를 기입했는지 체크
function formCheck() {
	var condition = parseInt($('#stars li.selected').last().data('value'), 10);
	var price_type = $('input[name=price_type]:checked', '#price_frm').val();

	if (isNaN(condition)) {
		alert('별점을 입력해주세요');
		return false;
	}

	if ($('#summernote').summernote('code') == '<p><br></p>') {
		alert('상세정보를 입력해주세요');
		return false;
	}

	if (price_type != 0 && price_type != 1) {
		alert('판매방식을 입력해주세요');
		return false;
	}

	if (price_type == 0) {
		if ($('input[name=price]', '#price_input').val().length() == 0) {
			alert('판매가격을 입력해주세요');
			return false;
		}
	}

	if (price_type == 1) {
		if ($('input[name=price]', '#price_input').val() != "") {
			alert('경매가격을 입력해주세요');
			return false;
		}

		if ($('input[type=date]', '#price_date').val() != "") {
			alert('경매기간을 입력해주세요');
			return false;
		}
	}

	return true;
}

// 모든 필드 작성완료했을 경우 데이터 전송
function sendData() {

	$.ajax({
		type : "POST",
		dataType : "json",
		url : "bookmarket?command=book_insert",
		data : {
			comment : $('#summernote').summernote('code'),
			condition : parseInt($('#stars li.selected').last().data('value'),
					10),
			price_type : $('input[name=price_type]:checked', '#price_frm')
					.val(),
			price : $('input[name=price]', '#price_input').val(),
			due_date : ($('input[type=date]', '#price_date').val() != "") ? $(
					'input[type=date]', '#price_date').val() : "0"
		},
		success : function(data) {
			if (data.result == "0") {
				alert('정보가 제대로 저장되지 못했습니다. 개발자를 불러주세요....--;');
			} else {
				alert('판매를 개시합니다!');
				var book_id = data.book_id;
				var url = "bookmarket?command=detail_book&book_id=";
				$(location).attr('href', url + book_id);
			}
		}
	});
}
