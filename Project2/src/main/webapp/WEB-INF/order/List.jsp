<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="top.jsp"%>    
<% 
String context = request.getContextPath()+"/resources";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css" />
<title>Insert title here</title>
<style type="text/css">

  @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      body { font-family: 'Nanum Pen Script', cursive;
		font-size:x-large;
}
.back{
	position:relative;
	width: 1200px;
	height: 800px;	
	background-repeat: no-repeat;
	background-position: 250px;
	background-attachment: fixed;
	background-image: url("<%=context%>/images/monitor.png");
	
}
.body{	
	position:absolute;
	left:200px;
	top: 80px;	
}


.title{
  display: inline-block;
  font-weight: 400;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  border: 2px solid transparent;
  padding: 0.375rem 0.75rem;
  width:90px;
 height:80px;
  line-height: 1.5;
  border-radius: 255px 25px 225px 25px/25px 225px 25px 255px;
  -webkit-transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
  transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
  transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
  transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
}


.btn-group > .btn,
.btn-group-vertical > .btn {
  position: relative;
  -webkit-box-flex: 0;
      -ms-flex: 0 1 auto;
          flex: 0 1 auto;
}


.btn-secondary {
  color: #fff;
  background-color: #555;
}

.btn-primary {
  color: #fff;
  background-color: #333;
  border-color: #333;
}

 
 #white{
	 color: white;
	 }
 

</style>

<script type="text/javascript">

function list() {
	document.location.href="list.od";
}

function logout() {
	document.location.href="Login.jsp";
}

function move(){
	window.open("OrderMove.jsp", "win", "width=400, height=400, menubar=no, scrollbars=no, status=no, toolbar=no, left=300, top=300");
}
 function sales(sales){
		location.href="dailey.pm?sales="+sales;	
	}

 </script>
</head>
<body>

<center>
<div class="back">
<!-- <div class="a"> -->
	<form action="order.od" method="post" id="form">
		<table align="center" width=600px class="body">
			<tr>
			<Td rowspan="4">	<br><br><br></Td>			
			
				<td><a href="order.od?oid=1">
					<img src="<%=context%>/images/1.png"></a>
				</td>
				<td><a href="order.od?oid=2">
					<img src="<%=context%>/images/2.png"></a>
				</td>
				<td><a href="order.od?oid=3">
					<img src="<%=context%>/images/3.png"></a>
				</td>
				<td><a href="order.od?oid=4">
					<img src="<%=context%>/images/4.png"></a>
				</td>
			</tr>

			<tr>
				<td><a href="order.od?oid=5">
					<img src="<%=context%>/images/5.png"></a>
				</td>
				<td><a href="order.od?oid=6">
					<img src="<%=context%>/images/6.png"></a>
				</td>
				<td><a href="order.od?oid=7">
					<img src="<%=context%>/images/7.png"></a>
				</td>
				<td><a href="order.od?oid=8">
				<img src="<%=context%>/images/8.png"></a>
				</td>
			</tr>


			<tr>
				<td><a href="order.od?oid=9">
					<img src="<%=context%>/images/9.png"></a>
				</td>
				<td><a href="order.od?oid=10">
					<img src="<%=context%>/images/10.png"></a>
				</td>
				<td><a href="order.od?oid=11">
					<img src="<%=context%>/images/11.png"></a>
				</td>
				<td><a href="order.od?oid=12">
					<img src="<%=context%>/images/12.png"></a>
				</td>
			</tr>


		</table>
	</form>
</div>
</center>
</body>
	<%@ include file="bottom.jsp"%>
</html>
