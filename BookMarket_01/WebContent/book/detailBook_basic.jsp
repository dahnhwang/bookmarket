<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
.contents_wrapper {
	margin-left: 30px;
	padding-bottom: 30px;
}

.contents_table th, .contents_table td {
	padding: 5px;
}
.book_img{
width:135px;
height:194px;
}
</style>
</head>
<body>
	<section class="row placeholders contents_wrapper">
	<div class="col-sm-3 placeholder">
		<img class="book_img" src="${book.image}">
	</div>
	<div class="col-sm-9 placeholder">
		<table class="contents_table">
			<tr>
				<td colspan="4"><h3>[${genre}] ${book.title }</h3></td>
			</tr>

			<tr>
				<td width="15%"><b>저자</b></td>
				<td width="35%">${book.author }</td>
				<td width="15%"><b>출판사</b></td>
				<td width="35%">${book.publisher }</td>
			</tr>
			<tr>
				<td width="15%"><b>출간일자</b></td>
				<td width="35%">${book.published_date }</td>
				<td width="15%"><b>ISBN</b></td>
				<td width="35%">${book.isbn }</td>
			</tr>
			<tr>
				<td valign="top"><b>소개</b></td>
				<td colspan="3">${book.description }</td>
			</tr>

		</table>
	</div>
	</section>

</body>
</html>