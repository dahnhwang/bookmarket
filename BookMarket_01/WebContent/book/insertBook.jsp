<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script  src="https://code.jquery.com/jquery-2.2.4.min.js"
  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
  crossorigin="anonymous"></script>
  
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--   부트스트랩연결, 썸머노트는 부트스트랩 사용해 연결하는 java script -->

<!-- include summernote css/js-->
<link href="plugins/summernote/summernote.css" rel="stylesheet">
<script src="plugins/summernote/summernote.js"></script>
<!-- summer note korean language pack -->
<script src="plugins/summernote/lang/summernote-ko-KR.js"></script>
<!-- 게시판개체삽입 썸머노트 -->


<title>상품등록페이지</title>


<style type="text/css">
#fileupload {
	height: 150px;
	background-color: lightgray;
}

#regi_introduce {
hight : 200px;
background-color : deepgray}


#regi_detail {
	height: 550px;
	overflow: 600;
	background-color: gray;
}
#regi_price {
hegiht : 300px;
overflow : 400px;
background-color: deepgray;
}

</style>

<script type="text/javascript">
  $(function() {
    $('.summernote').summernote({
      height: 300,          
      minHeight: 100,      
      maxHeight: 400,     
      focus: true,          // 페이지가 열릴때 포커스를 지정함
      lang: 'ko-KR'         
    });
  });
</script>

</head>
<body>



<section id="regi_books">
<!-- page 468 그리드시스템 10/12-->

<!-- 헤더 -->
<div class ="regi_header"></div>
판매등록 페이지입니다.
<div class = "clear"></div>

<!-- 파일첨부 -->
<div class = "fileupload"></div>
<input type ="file" name="book_img" /> <br>
<form>
<label> 첨부파일 등록</label>
<input type ="submit" />
</form>
<div class = "clear"></div>

<!-- 도서정보등록 -->
<div class="regi_detail"></div>

가격설정 <select name="choice_price">
    <option value="fixprice"  alt="판매를 원하는 가격을 고정가격으로 입력합니다. " >
		지정가</option>
    <option value="bidprice" alt="판매를 원하는 가격을 최소입찰가로 입력합니다.">
		경매가</option><br>
 <input type ="text" name = "price"> 원<br>

isbn등록 <input type = "text"><br>
<img input ="/images/isbn.jpg"> <br>
<input type = submit />
 
 도서명 <input type ="text" />
   
    
<div class = "clear"></div>

저자 <input type ="text" />
출판사 <input type ="text" />
출간일 <input type ="text" />
도서상태

</select>

<div class="regi_introduce">
<!-- from api 기본적으로는 펼쳐짐, 경우에 따라 폴딩-->
</div>
<br>

<!-- 판매자코멘트(게시판추가) footer -->
<div class = "regi_footer"></div>
판매자는 잘 팔아야하고, 어쩌구 저쩌구 나중에 게시판은 추가하게되게찌★
<div class = "clear"></div>


<div class="regi_price">
<input type ="ratio">

</div>




</body>
</html>