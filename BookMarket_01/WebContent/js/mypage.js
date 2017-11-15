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
	if($('#pwd-mypwd-check').val().length == 0){
		alert('비밀번호를 입력하세요.');
		$('#pwd-mypwd-check').focus();
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
		var img = "<img src="+image+" width='80' height ='110' style ='border : 1px solid #cccccc'/>";
		var titleTag =$('<a>').attr(
		  'href', 'bookmarket?command=detail_book&book_id='+book_id)
		  .addClass("bookTitle").text(title);
		
		
		$('<td>').text(book_id).appendTo(tr);
		$('<td>').html(img).appendTo(tr);
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
					.attr('data-id',order_id).addClass('view_btn').css({
						'margin' : '5px'
					}).val('ORDER');
					$('<td>').append(viewSold).appendTo(tr);
					
				}
			}
		}
		else if(sold_state == '0'){
			$('<td>').text('판매중').appendTo(tr);
			if(price_type == '0'){
				//경매
				$('<td>').appendTo(tr);
			}
			else{
				//일반
				var modifyBtn = $('<input>').attr('type', 'button')
				.attr('data-id',book_id).addClass('modify_btn').css({
					'margin' : '5px'
				}).val('modify');
				$('<td>').append(modifyBtn).appendTo(tr);
			}
			
		}
		
		
	}
}
/* myPurchasebook */

function myPurchaseBook_listUpload(list) {
	var bookList = list.bookList;
	var memberList = list.memberList;
	var dealList = list.dealList;
	for(var i=0; i<dealList.length; i++){
		var tr = $('<tr>').appendTo('#table-myPurchaseBookList tbody');
		var td = $('<td>');
		
		var deal_idx = dealList[i].deal_idx;
		var book_id = keepBookList[i].book_id;
		var ISBN = bookList[i].isbn;
		var title = bookList[i].title;
		var seller_email = memberList[i].email;
		var price_type = bookList[i].price_type;
		var deal_price = dealList[i].deal_price;
		var sold_state = bookList[i].sold_state;
		var deal_date = dealList[i].deal_date;
		var titleTag =$('<a>').attr('href', 'bookmarket?command=detail_book&book_id='+book_id)
		.addClass("bookTitle").text(title+"("+ISBN+")");
		
		$('<td>').text("["+deal_idx+"/"+book_id+"]").appendTo(tr);
		$('<td>').append(titleTag).appendTo(tr);
		$('<td>').text(seller_email).appendTo(tr);
		
		if(price_type == '1')
			$('<td>').text('[경매] '+price+'원').appendTo(tr);
		else if(price_type=='0')
			$('<td>').text('[일반] '+price+'원').appendTo(tr);
		
		
		
		if(sold_state == '1'){
			$('<td>').text('판매완료').appendTo(tr);
			tr.css('background', 'pink');
			var deleteBtn = $('<input>').attr('type', 'button')
			.attr('data-id',book_id).addClass('delete_btn').css({
				'margin' : '5px'
			}).val('delete');
			$('<td>').text(keep_date).appendTo(tr);
			$('<td>').append(deleteBtn).appendTo(tr);
		}
		else if(sold_state == '0'){
			$('<td>').text('판매중').appendTo(tr);
			var purchaseBtn = $('<input>').attr('type', 'button')
			.attr('data-id',book_id).addClass('purchase_btn').css('margin', '5px')
			.val('purchase');
			var deleteBtn = $('<input>').attr('type', 'button')
			.attr('data-id',book_id).addClass('delete_btn').css({
				'margin' : '5px'
			}).val('delete');
			$('<td>').text(keep_date).appendTo(tr);
			$('<td>').append(purchaseBtn).append(deleteBtn).appendTo(tr);
			
		}
		
		
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
        .addClass("bookTitle").text(title+"("+ISBN+")");
		
		$('<td>').text(i+1).appendTo(tr);
		$('<td>').append(titleTag).appendTo(tr);
		$('<td>').text(seller_email).appendTo(tr);
		
		if(price_type == '1')
			$('<td>').text('[경매] '+price+'원').appendTo(tr);
		else if(price_type=='0')
			$('<td>').text('[일반] '+price+'원').appendTo(tr);
		
		
		
		if(sold_state == '1'){
			$('<td>').text('판매완료').appendTo(tr);
			tr.css('background', 'pink');
			var deleteBtn = $('<input>').attr('type', 'button')
			.attr('data-id',book_id).addClass('delete_btn').css({
				'margin' : '5px'
			}).val('delete');
			$('<td>').text(keep_date).appendTo(tr);
			$('<td>').append(deleteBtn).appendTo(tr);
		}
		else if(sold_state == '0'){
			$('<td>').text('판매중').appendTo(tr);
			var purchaseBtn = $('<input>').attr('type', 'button')
			.attr('data-id',book_id).addClass('purchase_btn').css('margin', '5px')
			.val('purchase');
			var deleteBtn = $('<input>').attr('type', 'button')
			.attr('data-id',book_id).addClass('delete_btn').css({
				'margin' : '5px'
			}).val('delete');
			$('<td>').text(keep_date).appendTo(tr);
			$('<td>').append(purchaseBtn).append(deleteBtn).appendTo(tr);
			   
		}
		
		
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