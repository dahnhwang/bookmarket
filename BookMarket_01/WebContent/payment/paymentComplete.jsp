<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

* {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	vertical-align: baseline;
	list-style: none;
	font-family: 'Noto Sans KR';
	color: #484f4f;
}

#content {
	width: 400px;
	height: 1000px;
	margin: 0 auto;
	align: center;
}

.strapline {
	margin-left: 10px;
	width: 98%;
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
	background-color: #cfe0e8;
}

.divider {
	flex-grow: 1;
	height: 1px;
	background-color: #9f9f9f;
}

.messageDiv {
	margin-top: 10px;
	width: 100%;
	height: 400px;
	border-radius: 10px;
	background-color: #cccccc;
	padding: 20px;
	width: 100%;
	text-align: center;
	vertical-align: middle;
}


</style>


<script type="text/javascript">

	
</script>

</head>
<body>
	
	<div id="wrap">
		<div id="navigation">
			<jsp:include page="../navigation.jsp" />
		</div>
		<div id="content">

			<div class="strapline">
				<div class="title">&nbsp;결 제 완 료 &nbsp;</div>
				<div class="divider"></div>
			</div>


              <div class="messageDiv">
              <p class="text"> 결제가 완료 되었습니다 ! </p>
              
            <button type="button" class="btn btn-success" id="purchase_btn">메인으로 이동하기</button>
             
             </div>
			
		</div>
		<div id="footer">
			<jsp:include page="../footer.jsp" />
		</div>
	</div>
</body>
</html>