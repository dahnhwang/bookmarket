<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">
    <link href="css/bootstrap-table.min.css" rel="stylesheet">
    
        <!-- jQuery -->
    
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
    <script src="js/bootstrap-table.min.js"></script>


<style type="text/css">

#searchBar{
width : 100%;
height : px;
background-color: #cccccc;
}

</style>

<script>

$(document).ready(function() {
	
    $('#example').dataTable();
  
    
} );

</script>
</head>
<body>
	<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div id="contents">
		<div id="bookList_naviation" class="col-md-2">	
		</div>
		<div id="bookListTable" class="col-md-10">
		<div id="searchBar">
		 
		</div>
		<table style="text-align :center" id="example" class="display" cellspacing="0" width="100%"  data-toggle="table" data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true">
        <thead>
            <tr>
                <th>이미지</th>
                <th>제목 </th>
                <th>장르</th>
                <th>저자 / 출판사 </th>
                <th>상태</th>
                <th>판매자 이메일</th>
                <th>업데이트 날짜</th>
                <th>가격</th>
                <th>구매 버튼</th>
            </tr>
        </thead>
 
       <tbody>
         <c:forEach var="cnt" begin="1" end="10">
            <tr>
                <td><img src="http://placehold.it/70x92"/></td>
                <td>나미야 잡화점의 기적</td>
                <td>소설</td>
                <td>히가시노게이고 <br> 나미야 출판사</td>
                <td>A</td>
                <td>slokang@naver.com</td>
                <td>2017.11.03</td>
                <td>30000원</td>
                <td><button class="btn btn-primary">Purchase!</button></td>
            </tr>
           
         </c:forEach> 
           
        </tbody>
    </table>
		</div>
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>