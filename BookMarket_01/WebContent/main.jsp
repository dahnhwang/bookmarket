<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Market</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

1
* {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	list-style: none;
	font-family: 'Noto Sans KR';
}

.wrap {
	width: 100%;
	height : 1300px;
}

#contents {
	width: 70%;
	height: 1200px;
	margin-left: 20px;
}

#contents .section {
	width: 100%;
	height: 30%;
	margin: 20px 0 10px 0;
}

#contents .section ul {
	margin: 40px 0 20px 35px;
}

#contents .section ul li {
	display: inline-block;
	float: left;
	margin: 0 30px 0 0;
	box-sizing: border-box;
}

.bookList {
	position: relative;
}

.book_img {
	width: 130px;
	height: 176px;
	box-shadow: 7px 7px 3px #cccccc;
	opacity: 1;
	display: block;
	transition: .5s ease;
	backface-visibility: hidden;
	transition: .5s ease;
}

.middle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.bookList:hover .book_img {
	opacity: 0.8;
}

.bookList:hover .middle {
	opacity: 1;
}

.text {
	background-color: #006E51;
	color: white;
	font-size: 13px;
	color: white;
	width: 130px;
	height: 80px;
	text-align: center;
}

.strapline {
	display: flex;
	flex-direction: row;
	align-items: center;
	
}

.title {
	margin: 0 5PX 5px 0;
	font-weight: bold;
	font-size: 25px;
	color: #3c3c3c;
	flex-grow: 0;
	background-color: #ffffff;
	border :1px solid #9f9f9f;
}

.divider {
	flex-grow: 1;
	height: 1px;
	background-color: #9f9f9f;
}

#banner {
	width: 100%;
	height: 150px;
	background-color: #e6e2d3;
	margin: 0 0 30px 0;
	font-size: 24px;
	font-weight: bold;
}

#sideBar {
	margin-left: 40px;
	width: 250px;
	height: 400px;
	border: 1px solid #cccccc;
}

.shelf_img {
	
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="navigation">
			<jsp:include page="navigation.jsp" />
		</div>

		<div id="contents" class="col-md-10">
			<div id="banner">BANNER</div>
			<div class="section">
				<div class="strapline">
					<div class="title">&nbsp;오늘의 신간 도서 TOP 5&nbsp;</div>
					<div class="divider"></div>
				</div>
				<ul>
					<c:forEach begin="0" end="4">
						<li>
							<div class="bookList">
								<a href="#"> <img class="book_img"
									src='http://bookthumb.phinf.naver.net/cover/126/697/12669774.jpg?type=m1&udate=20171103 ' /></a>
								<div class="middle">
									<div class="text">
										<br> <span>나미야잡화점의 기적</span> <span>30000원</span>
									</div>
								</div>
							</div>

						</li>
					</c:forEach>
				</ul>
				<img class="shelf_img" alt="" src="img/shelf6.png" width="850px"
					height="70px">
			</div>


			<div class="section">
				<div class="strapline">
					<div class="title">&nbsp;오늘의 입찰 도서 TOP 5&nbsp;</div>
					<div class="divider"></div>
				</div>
				<ul>
					<c:forEach begin="0" end="4">
						<li>
							<div class="bookList">
								<a href="#"> <img class="book_img"
									src='http://bookthumb.phinf.naver.net/cover/109/455/10945513.jpg?type=m1&udate=20170415' /></a>
								<div class="middle">
									<div class="text">
										<br> <span>나미야잡화점의 기적</span> <span>30000원</span>
									</div>
								</div>
							</div>

						</li>
					</c:forEach>
				</ul>
				<img class="shelf_img" alt="" src="img/shelf6.png" width="850px"
					height="70px">
			</div>




			<div class="section">
				<div class="strapline">
					<div class="title">&nbsp;마감임박 도서 TOP 5&nbsp;</div>
					<div class="divider"></div>
				</div>
				<ul>
					<c:forEach begin="0" end="4">
						<li>
							<div class="bookList">
								<a href="#"> <img class="book_img"
									src='https://misc.ridibooks.com/cover/593000426/xxlarge' /></a>
								<div class="middle">
									<div class="text">
										<br> <span>나미야잡화점의 기적</span> <span>30000원</span>
									</div>
								</div>
							</div>

						</li>
					</c:forEach>
				</ul>
				<img class="shelf_img" alt="" src="img/shelf6.png" width="850px"
					height="70px">
			</div>

		</div>

		<div id="sideBar" class="col-md-2"></div>
		<jsp:include page="member/cart.jsp" />
		<div class="footer">
			<jsp:include page="footer.jsp" />
		</div>

	</div>


</body>
</html>