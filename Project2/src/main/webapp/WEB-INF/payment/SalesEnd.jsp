<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="./../common/common.jsp" %>
<%@ include file="./../order/top.jsp"%>
<% 
String context = request.getContextPath()+"/resources";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css" />
    <style type="text/css">  
      
  @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      body { font-family: 'Nanum Pen Script', cursive;
		font-size:x-large;
}	

 .myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #bfbfbf), color-stop(1, #faf5fa));
	background:-moz-linear-gradient(top, #bfbfbf 5%, #faf5fa 100%);
	background:-webkit-linear-gradient(top, #bfbfbf 5%, #faf5fa 100%);
	background:-o-linear-gradient(top, #bfbfbf 5%, #faf5fa 100%);
	background:-ms-linear-gradient(top, #bfbfbf 5%, #faf5fa 100%);
	background:linear-gradient(to bottom, #bfbfbf 5%, #faf5fa 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bfbfbf', endColorstr='#faf5fa',GradientType=0);
	background-color:#bfbfbf;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#777777;
	font-size:20px;
	font-weight:bold;
	padding:7px 21px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #faf5fa), color-stop(1, #bfbfbf));
	background:-moz-linear-gradient(top, #faf5fa 5%, #bfbfbf 100%);
	background:-webkit-linear-gradient(top, #faf5fa 5%, #bfbfbf 100%);
	background:-o-linear-gradient(top, #faf5fa 5%, #bfbfbf 100%);
	background:-ms-linear-gradient(top, #faf5fa 5%, #bfbfbf 100%);
	background:linear-gradient(to bottom, #faf5fa 5%, #bfbfbf 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#faf5fa', endColorstr='#bfbfbf',GradientType=0);
	background-color:#faf5fa;
}
.myButton:active {
	position:relative;
	top:1px;
}

.back{	
	position:relative;
	width: 1200px;
	height: 700px;
	background-repeat: no-repeat;
	background-position: 250px;
	background-attachment: fixed;
	background-image: url("<%=context%>/images/monitor.png");
	
}
.body{	
	position:absolute;
	height: 300px;
	left:400px;
	top: 180px;	
}
    </style>
    
    
</head>
<body>
<center>
<div class="back">
<div class="body">
		<h2 id="grey">오늘(${today})의 총 결제금액</h2>
		<br>
		<form action="dailey.pm" method="post">
	
	<table>
			<c:forEach items="${payday2}" var="lists">
			<tr>
				<c:if test="${lists.paymenttype==1}">
				<td align="center" id="grey">신용카드: &nbsp; &nbsp;</td>
				<td ><input type="text" name="totalprice" value="${lists.totalprice}" disabled="disabled" class="myButton"><b id="white">원</b></td>
				</c:if>
				
				<c:if test="${lists.paymenttype==2}">				
				<td align="center" id="grey">현금: &nbsp; &nbsp; </td>
				<td ><input type="text" name="totalprice2" value="${lists.totalprice}" class="myButton"><b id="white">원</b></td>
				</c:if>				
		</tr>
			</c:forEach>
	</table>			
					<br><BR>
					<input type="hidden" value="${sales}" name="sales">	
					<input type="submit" value="현금금액수정" class="myButton">	 &nbsp; &nbsp;
					<input type="button" value="확인" onclick="location.href='list.od'" class="myButton">
				</form>
			</div>
		</div>
		</center>
	</body>
</html>