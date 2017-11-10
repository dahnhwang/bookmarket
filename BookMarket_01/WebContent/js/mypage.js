/**
 * 		마이페이지
 */
$(document).ready(function() {
		$('#div-myInfo-delete').hide();
		$('#div-myInfo-update').hide();
		$('#btn-mypwd-check').on('click', function(){
	// 		alert('클릭')
			var current= $('.current-div')
			myPwdCheck(current);
		});
});
/* myPage*/
function load() {
	// 		console.log('load')
	$.ajax({
		url : 'myInfo.do',
		type : 'get',
		dataType : 'json',
		success : function(data) {
			$.each(data.bookList, function(index, item) {
				var tr = $('<tr>').appendTo('#bookTable > tbody');
				var book_id = item.book_id;
				var title = item.title;
				var publisher = item.publisher;
				var year = item.year;
				var price = item.price;
				$('<td>').text(book_id).appendTo(tr);
				$('<td>').text(title).appendTo(tr);
				$('<td>').text(publisher).appendTo(tr);
				$('<td>').text(year).appendTo(tr);
				$('<td>').text(price).appendTo(tr);
				var del_btn = $('<td>').appendTo(tr);
				$('<input>').attr({
					type : 'button',
					id : book_id
				}).val('del').addClass('btn_del').appendTo(del_btn);
			})
		},
		error : function(xhr, status, error) {
			alert('error')
		}

	});

}
/* PWD CHECK */
function inputPWDCheck(){
	if($('#btn-mypwd-check').val().length == 0){
		alert('비밀번호를 입력하세요.');
		$('#btn-mypwd-check').focus();
		return false;
	}
	return true;
}
function myPwdCheck(current){
//	alert($('#pwd-mypwd-check').val())
	if(inputPWDCheck()){
		var password = $('#pwd-mypwd-check').val();
		var params = "command=myPwd_check&password=" + password;

		$.ajax({
			url : 'bookmarket',
			type : 'post',
			data : params,
			dataType : 'json',
			async: true,
			success : function(data) {
//					alert(data.result);
				if (data.result == false) {							
					$('#pwd-mypwd-check').attr({
						'title':"WRONG",
						'data-content':
							"비밀번호가 틀렸습니다."
					});
					$('#pwd-mypwd-check').popover('show');
				}
				else if(data.result == true){
					alert('비밀번호 확인!')
					$('#div-mypwd-check').hide();
					
					current.show();
					return true;
				}
			}
		});
	}
}

/* myKeepbook */

function listUpload(list){
	
	$.each(list, function(index, item) {

		var keepBook_id = item.keepBook_id;
		var book_id = item.book_id;
		var mem_id =item.mem_id;
		var keep_date = item.keep_date;

		var tr = $('<tr>').appendTo('#listTable tbody');
	
		$('<td>').text(keepBook_id).appendTo(tr);
		$('<td>').text(book_id).appendTo(tr);
		$('<td>').text(mem_id).appendTo(tr);
		$('<td>').text(keep_date).appendTo(tr);

		var btnTd = $('<td>').appendTo(tr);
		$('<input>').attr('type', 'button')
			.attr('data-id', book_id)
			.addClass('del_btn')
			.val('삭제').appendTo(btnTd);
	})
	
}