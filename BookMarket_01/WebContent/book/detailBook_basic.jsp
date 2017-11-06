<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${ book.title }</title>
<style>
.basic_info_wrapper {
	margin-left: 30px;
	padding-bottom: 30px;
}

td {
	padding: 5px;
}
</style>
</head>
<body>

	<section class="row placeholders basic_info_wrapper">
	<div class="col-sm-3 placeholder">
		<img src="http://via.placeholder.com/135x194">
	</div>
	<div class="col-sm-9 placeholder">
		<table>
			<tr>
				<td colspan="4"><h3>[${genre}] ${book.title }</h3></td>
			</tr>
			<tr>
				<td width="15%"><b>저자</b></td>
				<td width="35%">윤인성</td>
				<td width="15%"><b>출판사</b></td>
				<td width="35%">예담</td>
			</tr>
			<tr>
				<td width="15%"><b>출간일자</b></td>
				<td width="35%">2017.09.25</td>
				<td width="15%"><b>ISBN</b></td>
				<td width="35%">9788959135592</td>
			</tr>
			<tr>
				<td valign="top"><b>소개</b></td>
				<td colspan="3">미국 엄마 한국 엄마가 만나 자신의 아이들에게 실제로 건네는 살아 있는 표현을
					담았다. 정확하고 예의바른 표현과 한국어와 영어로 말할 때의 차이점도 설명했다.미국 엄마 한국 엄마가 만나 자신의
					아이들에게 실제로 건네는 살아 있는 표현을 담았다. 정확하고 예의바른 표현과 한국어와 영어로 말할 때의 차이점도
					설명했다.</td>
			</tr>
		</table>
	</div>
	</section>

</body>
</html>