<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매하기</title>
<style>
.search_body {
	border: 10px solid #eaeaea;
	height: 450px;
	padding: 70px;
}

.search_body_inner {
	padding: 70px;
}

h2.title {
	font-size: 36px;
	line-height: 48px;
	letter-spacing: -1px;
	font-weight: 700;
	margin: 0 auto;
	padding: 0 20px;
	text-align: center;
	padding-bottom: 30px;
}

.search-input {
	position: relative;
	text-align: center;
}

.search-input input {
	display: block;
	font-size: 22px;
	text-align: center;
	letter-spacing: 2px;
	color: #222;
	padding: 20px 0;
	width: 100%;
	font-weight: 700;
	background: none;
	border: 0;
	border-bottom: 1px solid #000;
}

input:focus {
  outline: none;
}

.search-input button {
	position: absolute;
	top: 10px;
	right: 0;
	font-size: 0;
	width: 40px;
	height: 40px;
	background: url(../img/ico_search_brand.png) center no-repeat;
	background-size: 26px;
	border: 0;
}

button:focus {
  outline: none;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div class="container search_body">
			<div class="search_body_inner">
				<h2 class="title">판매도서 ISBN으로 검색하기</h2>
				<div class="search-input">
					<input type="text" placeholder="예) 9788937473135" id="brand_name"
						name="brand_name">
					<button class="btn-search" id="brand_search">검색</button>
				</div>
			</div>
		</div>

		<div class="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>