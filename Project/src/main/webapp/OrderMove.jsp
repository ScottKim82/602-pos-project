<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      body { font-family: 'Nanum Pen Script', cursive;
		font-size:x-large;
}
select, .prod {
 	width: 150px;
    height: 30px;
    padding-left: 5px;
    font-size: 20px;
    color:#262626;
    font-family: 'Nanum Pen Script', cursive;
    border: 3px solid darkgrey;
    border-radius: 3px;
 }
 
 table{
 	margin: 20px;
 }
 
 td{
  	padding: 3px;
  	}
  	
  body{
background-color: white;
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
	font-family: 'Nanum Pen Script', cursive;
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

</style>
</head>
<body>
<center>
<form action="move.od" method="post">
<table>
<tr><td>
	<select name="movebefore">
		<%for(int i=1; i<=12; i++){%>
			<option value="<%=i%>"><%=i%>번</option> 
		<%} %>
	</select>
</td></tr>
<tr><td align="center">	
↓

</td></tr>
<tr><td>
	<select name="moveafter">
		<%for(int i=1; i<=12; i++){%>
			<option value="<%=i%>"><%=i%>번</option>
		<%} %>
	</select>
</td></tr>
<tr><td align="center">		
<input type="submit" value="이동" class="myButton">
<input type="button" value="취소" onclick="self.close()" class="myButton">
</table>
</form>
</center>
</body>
</html>