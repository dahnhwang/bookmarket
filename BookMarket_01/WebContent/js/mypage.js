/**
 * 		마이페이지
 */
$(document).ready(function() {
		
		
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
//	alert('여기')
	if($('#btn-mypwd-check').val().length == 0){
		alert('비밀번호를 입력하세요.');
		$('#btn-mypwd-check').focus();
		return false;
	}
	return true;
}
function myPwdCheck(){
//	alert($('#pwd-mypwd-check').val())
	if(inputPWDCheck()){
		var password = $('#pwd-mypwd-check').val();
		var params = "command=myPwd_check&password=" + password;

		$.ajax({
			url : 'bookmarket',
			type : 'post',
			data : params,
//			async: true,
			success : function(data) {
//				alert(data);	//false
				if(data == 1){
					alert('비밀번호 확인!')
					$('#div-mypwd-check').hide();
					
					$('.current-div').show();
//					return true;
				}
				else if(data == 0) {
					$('#pwd-mypwd-check').attr({
						'title':"WRONG",
						'data-content':
							"비밀번호가 틀렸습니다."
					});
					$('#pwd-mypwd-check').popover('show');
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
		$('<td>').text("["+ISBN+"]").appendTo(tr);
		$('<td>').append(titleTag).appendTo(tr);
		$('<td>').text(seller_email).appendTo(tr);
		if(price_type == '1')
			$('<td>').text('[경매] '+price+'원').appendTo(tr);
		else if(price_type=='0')
			$('<td>').text('[일반] '+price+'원').appendTo(tr);
		if(sold_state == '1'){
			$('<td>').text('판매완료').appendTo(tr);
			tr.attr({
				'background': 'pink'
			});
		}
		else if(sold_state == '0')
			$('<td>').text('판매중').appendTo(tr);
		$('<td>').text(keep_date).appendTo(tr);
		var purchaseBtn = $('<input>').attr('type', 'button')
			.attr('data-id',book_id).addClass('purchase_btn').css('margin', '5px')
			.val('purchase').append('/');
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
function myBookMoney_listUpload(list){
	var bookMoneyList = list.bookMoneyList;
	$.each(bookMoneyList, function(index, item) {
		var tr = $('<tr>').appendTo('#table-myBookMoney tbody');
		var td = $('<td>');
		var money_idx = item.money_idx;
		var money_update_day = item.bookMoney_update_day;
		var money_type = '';
		var transMoney = item.transMoney;
		var money = item.bookMoney;
		
		
		$('<td>').text(index+1).appendTo(tr);
		$('<td>').text(money_update_day).appendTo(tr);
		if (item.money_type === 0) {
			$('<td>').text("입금").appendTo(tr);
			$('<td>').text(transMoney +'원').attr({
				'color': 'green' 
			}).appendTo(tr);
		}
		else if (item.money_type === 1) { 
			$('<td>').text("출금").appendTo(tr);
			$('<td>').text(transMoney +'원').attr({
				'color': 'red' 
			}).appendTo(tr);
		}
		else if (item.money_type === 2) {
			$('<td>').text("충전").appendTo(tr);
			$('<td>').text(transMoney +'원').attr({
				'color': 'yellow' 
			}).appendTo(tr);
		}
		$('<td>').text(money+'원').appendTo(tr);

	});
}