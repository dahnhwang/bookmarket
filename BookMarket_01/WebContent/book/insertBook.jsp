<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script src="js/insertbook.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div class="container">
			<div class="row">

				<div class="side-menu">
					<jsp:include page="book_navigation.jsp" />
				</div>
				<div class="col-md-9 book_info_parents">
					<div class="book_basic_info">
						<jsp:include page="detailBook_basic.jsp" />
					</div>
					<br>
					<div class="book_condition_info">
						<jsp:include page="insertBook_condition.jsp" />
					</div>
					<br>
					<div class="book_price_info">
						<jsp:include page="insertBook_price.jsp" />
					</div>
					<div class="book_button">
						<jsp:include page="insertBook_button.jsp" />
					</div>
				</div>

			</div>

		</div>


		<div class="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>