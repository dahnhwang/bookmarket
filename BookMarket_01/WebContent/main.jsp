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
}

#contents {
	width: 70%;
	height: 1200px;
	margin-left: 20px;
}

#contents .section {
	width: 100%;
	height: 28%;
	margin: 5px 0;
}

#contents .section ul {
	margin: 20px 0;
}

#contents .section ul li {
	display: inline-block;
	float: left;
	margin: 0 27px 0 0;
	box-sizing: border-box;
}

#contents .section ul li img {
	width: 110px;
	height: 147px;
	box-shadow: 7px 7px 3px #cccccc;
}

#contents .section ul li p {
	margin: 20px 0 0 2px;
	line-height: 130%;
}

.book_title {
	font-size: 13px;
	font-weight: bold;
	color: #454140;
}

.book_price {
	font-size: 12px;
	color: #9896A4;
}

.strapline {
	display: flex;
	flex-direction: row;
	align-items: center;
}

.title {
	margin: 0 5PX 5px 35px;
	font-weight: bold;
	font-size: 25px;
	color: #3c3c3c;
	flex-grow: 0;
	background-color: #e6e2d3;
}

.divider {
	flex-grow: 1;
	height: 1px;
	background-color: #9f9f9f;
}

#banner {
	width: 95%;
	height: 120px;
	background-color: #e6e2d3;
    margin : 0 0 30px 35px;
    font-size: 24px;
    font-weight: bold;
}

#sideBar {
    margin : 0 0 0 30px;
	width : 250px;
	height: 400px;
	border :1px solid #282828;

}


</style>
</head>
<body>
	<div class="wrap">
		<div class="navigation">
			<jsp:include page="navigation.jsp" />
		</div>

		<div id="contents" class="col-md-10">
			<div id="banner">
               BANNER 
               </div>
			<div class="section">
				<div class="strapline">
					<div class="title">오늘의 신간 도서 TOP 5</div>
					<div class="divider"></div>
				</div>
				<ul>
					<c:forEach begin="0" end="4">
						<li><a href="#"><img
								src='https://misc.ridibooks.com/cover/593000426/xxlarge' /></a>
							<p>
								<span class="book_title">나미야 잡화점의 기적</span><br> <span
									class="book_price">33000원</span>
							</p></li>
					</c:forEach>
				</ul>
			</div>


			<div class="section">
				<div class="strapline">
					<div class="title">오늘의 입찰 도서 TOP 5</div>
					<div class="divider"></div>
				</div>
				<ul>
					<c:forEach begin="0" end="4">
						<li><a href="#"><img
								src='https://misc.ridibooks.com/cover/593000426/xxlarge' /></a>
							<p>
								<span class="book_title">나미야 잡화점의 기적</span><br> <span
									class="book_price">33000원</span>
							</p></li>
					</c:forEach>
				</ul>
			</div>




			<div class="section">
				<div class="strapline">
					<div class="title">마감임박 도서 TOP 5</div>
					<div class="divider"></div>
				</div>
				<ul>
					<c:forEach begin="0" end="4">
						<li><a href="#"><img
								src='https://misc.ridibooks.com/cover/593000426/xxlarge' /></a>
							<p>
								<span class="book_title">나미야 잡화점의 기적</span><br> <span
									class="book_price">33000원</span>
							</p></li>
					</c:forEach>
				</ul>
			</div>


		</div>

		<div id="sideBar" class="col-md-2">
		
		
	    </div>

		<div class="footer">
			<jsp:include page="footer.jsp" />
		</div>

	</div>


</body>
</html>