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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/i18n/jquery-ui-i18n.min.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css" />
<script>


 $(function() {
	 
 $.datepicker.setDefaults($.datepicker.regional['ko']);
	 
  $("#datepicker").datepicker({
	  
	  dateFormat: 'yy/mm/dd',
	  
	  onSelect: function(dateText, inst){ 
		  
		  
		  location.href="dailey.pm?dayday="+dateText+"&sales=dailey";
		
	  }		  
  });
    
 }); 

</script>

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

.table {
 width: 600px;
 margin-bottom: 1rem;
 background-color: transparent;
 border: 2px solid white;
 margin: 20px;
}

.table2{
	width: 600px;
}

.price{
	background-color: grey;
	color: #fff;
	padding: 10px;
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
	height: 500px;
	width: 910px;
	overflow: scroll;
	left:160px;
	top: 150px;	
}


 
</style>
</head>
<body>
<center>
<div class="back">
<div class="body">
<div class="box_Calendar" id="dtpicker">
</div>

<p>
   <input type="button" id="datepicker" value="날짜 선택" class="myButton"/><br><br>
 </p>
 
 
	<h2 id="grey">${today}</h2>
	
	
	
	
<table class="table table-hover">
<tr class="table-active">
	<td>상품명</td>
	<td>수량</td>
	<td>금액</td>
	<td>합계</td>
</tr>


<c:forEach items="${payment}" var="lists" >
<tr class="table-active">
<td>${lists.pname}</td>
<td align="right">${lists.qty}개</td>
<td align="right">${lists.price}원</td>
<td align="right">${lists.amount}원</td>
</tr>
</c:forEach>
<tr>
</tr>
</table>
<table class="table2">
<tr>
<td colspan="4" class="price" align="right"><b><h4>총금액: ${totalprice}원</h4></b></td>
</tr>
</table>
</div>
</div>
</center>
</body>
</html>