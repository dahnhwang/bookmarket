<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Market</title>
<style>
#contents {
	height: 450px;
	margin: 0 auto;
	margin-top: 50px;
}
</style>
</head>
<body>
	<div id="wrap">
		<div id="navigation">
			<jsp:include page="navigation.jsp" />
		</div>
		<div id="contents">
			<div id="contents">콘텐츠영역</div>
		</div>
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>