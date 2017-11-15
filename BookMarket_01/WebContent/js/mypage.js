


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
$(document).on('click', '.purchase_btn', function() {
	var seller_email = $(this).attr('email');
	var book_id = $(this).attr('data-id');
	//판매자와 구매자가 같은 사람인지 판별하기 
	var params = "command=payment_check_pass&seller_email=" + seller_email;
	$.ajax({
		url : 'bookmarket',
		type : 'get',
		data : params,
		success : function(data) {

			if (data == 0) {
				alert('본인이 판매하는 상품은 구매할 수 없습니다!');
			} else if (data == 1) {

				window.location.href = 'bookmarket?command=payment&book_id=' + book_id;


			}else if (data == -1) {
				alert('로그인 후 구매하실 수 있습니다.')
			}
		}
	})

});
$(document).on('click', '.cart_btn', function() {
	
	var book_id = $(this).attr('data-id');
	var params = "command=cart_add&book_id=" + book_id;
	$.ajax({
		url : 'bookmarket',
		type : 'get',
		data : params,
		success : function(data) {
			alert(data);
		}
	});
	
});
$(document).on('click', '.delete_btn', function() {
	
	var book_id = $(this).attr('data-id');
	var command = '';
	if($(this).attr('data-command') == 'myKeepBook')
		command = "myKeepBook_delete";
	if($(this).attr('data-command') == 'mySellBook')
		command = "book_delete";
	$.ajax({
		url : 'bookmarket',
		type : 'get',
		data : "command="+command+"&book_id=" + book_id,
		success : function(data) {
			alert(data);
		}
	});
	
});
/* PWD CHECK */
function inputPWDCheck(){
//	alert('여기')
	if($('#pwd-mypwd-check').val().length == 0){
		alert('비밀번호를 입력하세요.');
		$('#pwd-mypwd-check').focus();
		return false;
	}
	return true;
}
function myPwdCheck(){
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

/* mySellbook */

function mySellBook_listUpload(list) {
	var bookList = list.bookList;
	var soldList = list.soldList;
	for(var i=0; i<bookList.length; i++){
		var tr = $('<tr>').appendTo('#table-mySellBookList tbody');
		var td = $('<td>');
		
		var book_id = bookList[i].book_id;
		var image = bookList[i].image;
		var title = bookList[i].title;
		var price_type = bookList[i].price_type;
		var price = bookList[i].price;
		var sold_state = bookList[i].isSold;
		var submit_date = bookList[i].submit_date;
		var due_date = bookList[i].due_date;
		var imgTag = "<img src="+image+" width='80' height ='110' style ='border : 1px solid #cccccc'/>";
		var titleTag =$('<a>').attr(
		  'href', 'bookmarket?command=detail_book&book_id='+book_id)
		  .addClass("bookTitle").text(title);
		
		
		$('<td>').text(book_id).appendTo(tr);
		$('<td>').html(imgTag).appendTo(tr);
		$('<td>').append(titleTag).appendTo(tr);
		if(price_type == '1')
			$('<td>').text('경매').appendTo(tr);
		else if(price_type=='0')
			$('<td>').text('일반').appendTo(tr);
		$('<td>').text(price).appendTo(tr);
		$('<td>').text(due_date).appendTo(tr);
		$('<td>').text(submit_date).appendTo(tr);
		if(sold_state == '1'){
			for(var j=0; j<soldList.length ; j++){
				if(book_id == soldList[j].book_id){
					var order_id = soldList[j].order_id;
					var sold_date = soldList[j].sold_date;
					$('<td>').html('['+sold_date+']<br>판매완료').appendTo(tr);
					var viewSold = $('<input>').attr('type', 'button')
					.attr('data-id', order_id).addClass('view_btn').css({
						'margin' : '5px'
					}).val('ORDER');
					$('<td>').append(viewSold).appendTo(tr);
					
				}
			}
		}
		else if(sold_state == '0'){
			$('<td>').text('판매중').appendTo(tr);
			if(price_type == '1'){
				//경매
				var deleteBtn = $('<input>').attr({
					'type': 'button',
					'data-id':book_id,
					'data-command':'mySellBook'
					}).addClass('delete_btn').css({
					'margin' : '5px'
				}).val('delete');
				$('<td>').append(deleteBtn).appendTo(tr);
			}
			else{
				//일반
				var modifyBtn = $('<input>').attr('type', 'button')
				.attr('data-id',book_id).addClass('modify_btn').css({
					'margin' : '5px'
				}).val('modify');
				var deleteBtn = $('<input>').attr({
					'type': 'button',
					'data-id':book_id,
					'data-command':'mySellBook'
					}).addClass('delete_btn').css({
					'margin' : '5px'
				}).val('delete');
				$('<td>').append(modifyBtn).append(deleteBtn).appendTo(tr);
			}
			
		}
		
		
	}
}
/* myPurchasebook */

function myPurchaseBook_listUpload(list) {
//	var dealList = list.dealList;
//	var bookList = list.bookList;
//	var soldList = list.soldList;
//	var memberList = list.memberList;
//	for(var i=0; i<dealList.length; i++){
//		var tr = $('<tr>').appendTo('#table-myPurchaseBookList tbody');
//		var td = $('<td>');
//		
//		var deal_idx = dealList[i].deal_idx;
//		var book_id = dealList[i].book_id;
//		var deal_date = dealList[i].deal_date;
//		var sold_state = dealList[i].sold_state;
//		var deal_price = dealList[i].deal_price;
//		var seller_email = memberList[i].email;
//		var image = bookList[i].image;
//		var title = bookList[i].title;
//		var price_type = bookList[i].price_type;
//		var submit_date = bookList[i].submit_date;
//		var due_date = bookList[i].due_date;
//		var imgTag = "<img src="+image+" width='80' height ='110' style ='border : 1px solid #cccccc'/>";
//		var titleTag =$('<a>').attr(
//		  'href', 'bookmarket?command=detail_book&book_id='+book_id)
//		  .addClass("bookTitle").text(title);
//		
//		
//		$('<td>').text("["+deal_idx+"/"+book_id+"]").appendTo(tr);
//		$('<td>').append(titleTag).appendTo(tr);
//		$('<td>').text(seller_email).appendTo(tr);
//		
//		if(price_type == '1')
//			$('<td>').text('[경매] '+price+'원').appendTo(tr);
//		else if(price_type=='0')
//			$('<td>').text('[일반] '+price+'원').appendTo(tr);
//		
//		
//		
//		if(sold_state == '1'){
//			$('<td>').text('판매완료').appendTo(tr);
//			tr.css('background', 'pink');
//		}
//		else if(sold_state == '0'){
//			$('<td>').text('판매중').appendTo(tr);
////			var cancelBtn = $('<input>').attr({
////				'type': 'button',
////				'data-id':book_id,
////				'data-command':'myPurchaseBook'
////				}).addClass('cancel_btn').css({
////				'margin' : '5px'
////			}).val('cancel');
//		}
//		
//		
//	}
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
		var image = bookList[i].image;
		var ISBN = bookList[i].isbn;
		var title = bookList[i].title;
		var seller_email = memberList[i].email;
		var price = bookList[i].price;
		var price_type = bookList[i].price_type;
//		var sold_state = bookList[i].isSold;
		var imgTag = "<img src="+image+" width='80' height ='110' style ='border : 1px solid #cccccc'/>";
		var titleTag =$('<a>').attr('href', 'bookmarket?command=detail_book&book_id='+book_id)
        .addClass("bookTitle").text(title+"("+ISBN+")");
		
		$('<td>').text(i+1).appendTo(tr);
		$('<td>').append(imgTag).appendTo(tr);
		$('<td>').append(titleTag).appendTo(tr);
		$('<td>').text(seller_email).appendTo(tr);
		
		if(price_type == '1')
			$('<td>').text('[경매] '+price+'원').appendTo(tr);
		else if(price_type=='0')
			$('<td>').text('[일반] '+price+'원').appendTo(tr);
		
		$('<td>').text('판매중').appendTo(tr);
		var purchaseBtn = $('<input>').attr('type', 'button')
		.attr('data-id',book_id).addClass('purchase_btn').css('margin', '5px')
		.val('purchase');
		var cartBtn = $('<input>').attr({
			'type': 'button',
			'data-id': book_id
		}).addClass('cart_btn').css('margin', '5px').val('cart');
		var deleteBtn = $('<input>').attr({
			'type': 'button',
			'data-id':book_id,
			'data-command':'myKeepBook'
			}).addClass('delete_btn').css({
			'margin' : '5px'
		}).val('delete');
		
		$('<td>').text(keep_date).appendTo(tr);
		if(price_type == '0'){
			$('<td>').append(purchaseBtn).append(cartBtn).append(deleteBtn).appendTo(tr);
		}
		else
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
			$('<td>').text("입금").css('color', 'green').appendTo(tr);
			$('<td>').text(transMoney +'원').css('color', 'green').appendTo(tr);
		}
		else if (item.money_type === 1) { 
			$('<td>').text("출금").css('color', 'red').appendTo(tr);
			$('<td>').text(transMoney +'원').css('color', 'red').appendTo(tr);
		}
		else if (item.money_type === 2) {
			$('<td>').text("충전").css('color', 'blue').appendTo(tr);
			$('<td>').text(transMoney +'원').css('color', 'blue').appendTo(tr);
		}
		$('<td>').text(money+'원').appendTo(tr);

	});
}