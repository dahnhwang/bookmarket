<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Market</title>
<style>
* {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
	list-style: none;
}

.wrap {
	width: 100%;
}

#contents {
	width: 80%;
	height: 700px;
	margin: 20px 0 0 20px;
	border: 1px solid #cccccc;
}

#contents div ul li {
	display: inline-block;
	float: left;
	margin: 0 12px 0 0;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<div class="wrap">
		<div class="navigation">
			<jsp:include page="navigation.jsp" />
		</div>
		<div id="contents">

			<div>
				<ul>
					<li><a href="#" alt=""><img
							src='http://placehold.it/100x127' /></a></li>
					<li><a href="#" alt=""><img
							src='http://placehold.it/100x127' /></a></li>
					<li><a href="#" alt=""><img
							src='http://placehold.it/100x127' /></a></li>
					<li><a href="#" alt=""><img
							src='http://placehold.it/100x127' /></a></li>
					<li><a href="#" alt=""><img
							src='http://placehold.it/100x127' /></a></li>
					<li><a href="#" alt=""><img
							src='http://placehold.it/100x127' /></a></li>
					<li><a href="#" alt=""><img
							src='http://placehold.it/100x127' /></a></li>
					<li><a href="#" alt=""><img
							src='http://placehold.it/100x127' /></a></li>
					<li><a href="#" alt=""><img
							src='http://placehold.it/100x127' /></a></li>

				</ul>
			</div>



		</div>

		<div class="footer">
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>