/**
 * 		마이페이지
 */
$(document).ready(function() {
		$('#div-myInfo-delete').hide();
		$('#div-myInfo-update').hide();
		$('#btn-mypwd-check').on('click', function(){
			// 	alert('클릭')
			var current= $('.current-div')
			myPwdCheck(current);
		});
		// 찜상품
		$.ajax({
			url : 'bookmarket',
			type : 'get',
			data : "command=myKeep_List",
			dataType : 'json',
			success : function(data) {
				if (data) {
					alert(true)
					$('#table-myKeepBookList tbody').empty();
					myKeepBook_listUpload(data);
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

function myKeepBook_listUpload(list) {
	var bookList = list.bookList;
	var memberList = list.memberList;
	var keepBookList = list.keepBookList;
	for(var i=0; i<keepBookList.length; i++){
		var tr = $('<tr>').appendTo('#table-myKeepBookList tbody');
		var td = $('<td>');
		
		var keepBook_id = keepBookList[i].keepBook_id;
		var book_id = keepBookList[i].book_id;
		var keep_date = keepBookList[i].keep_date;
		var ISBN = bookList[i].isbn;
		var title = bookList[i].title;
		var seller_email = memberList[i].email;
		var price = bookList[i].price;
		var price_type = bookList[i].price_type;
		var sold_state = bookList[i].isSold;
		var titleTag =$('<a>').attr('href', 'bookmarket?command=detail_book&book_id='+book_id)
        .addClass("bookTitle").text(title);
		
		$('<td>').text(i+1).appendTo(tr);
		$('<td>').text("["+book_id+"/"+ISBN+"]").appendTo(tr);
		$('<td>').append(titleTag).appendTo(tr);
		if(price_type == '1')
			$('<td>').text('[일반] \\'+price).appendTo(tr);
		else if(price_type=='0')
			$('<td>').text('[경매] \\'+price).appendTo(tr);
		if(sold_state == '1')
			$('<td>').text('판매완료').appendTo(tr);
		else if(sold_state == '0')
			$('<td>').text('판매중').appendTo(tr);
		$('<td>').text(keep_date).appendTo(tr);
		var purchaseBtn = $('<input>').attr('type', 'button')
			.attr('data-id',book_id).addClass('purchase_btn').css('margin', '5px')
			.val('purchase');
		var deleteBtn = $('<input>').attr('type', 'button')
		.attr('data-id',book_id).addClass('delete_btn').css({
			'margin' : '5px'
		}).val('delete');
	
		$('<td>').append(purchaseBtn).append(deleteBtn).appendTo(tr);
	}
}
/* myBookMoney	*/
function checkChargeBookMoney(){
//	alert('check')
	if(isNaN($('#charge').val())){
		alert('숫자를 입력하세요')
		$('#charge').attr({
			
			'title':"WRONG",
			'data-content':
				"충전금액은 숫자로 입력해주세요"
		});
		$('#charge').popover('show');
		return false;
	}
	if($('#charge').val().length == 0){
		$('#charge').attr({
			'title':"WRONG",
			'data-content':
				"충전금액은 0보다 커야 합니다."
		});
		$('#charge').popover('show');
		return false;
	}	
	return true;
};