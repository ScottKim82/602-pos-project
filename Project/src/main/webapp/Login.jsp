<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	String viewLogin = request.getContextPath()+ "/login.ep";

	 String context = request.getContextPath()+"/resources";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

.back{
	position:relative;
	width: 1500px;
	height: 800px;	
	background-repeat: no-repeat;
	background-position: 250px;
	background-attachment: fixed;
	background-image: url("<%=context%>/images/monitor.png");
		
}
.body{	
	position:absolute;
	left:450px;
	top: 200px;	
}


.form-horizontal .form-group {
	margin-right: -15px;
	margin-left: -15px
	
}

table{
border: 1px;
width: 300px;
}

@media ( min-width :768px) {
	.form-horizontal .control-label {
		padding-top: 7px;
		margin-bottom: 0;
		text-align: right;
		
	}
}

.col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3,
	.col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9,
	.col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3,
	.col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9,
	.col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3,
	.col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9,
	.col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3,
	.col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9 {
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px
}


	.col-sm-offset-2 {
		margin-left: 16.66666667%
	}
	
	.form-control {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
}


.btn {
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	-ms-touch-action: manipulation;
	touch-action: manipulation;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-image: none;
	border: 1px solid transparent;
	border-radius: 4px
}


.btn-default {
	color: #333;
	background-color: #fff;
	border-color: #ccc
}
</style>
</head>
<body>
<center>
<div class="back">	
	<div class="body">
		<form action="<%=viewLogin%>" method="post">
			<table>
				<tr>
					<td>
						<h1>FoodPos System</h1>
						<img src="<%=context%>/images/로그인 배경.png" width="250"><br>		
					</td>
				</tr>		
				<tr>
					<td>
						<div class="form-group"><img src="<%=context %>/images/login.png"  width="30px">
			    		<label for="id" class="col-sm-2 control-label">ID</label>
			   			 <div class="col-sm-10">    
						<input type="text" name="id" class="form-control" id="id">
			   			 </div>
			  			</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
						<img src="<%=context%>/images/비밀번호.png"  width="30px">
						    <label for="password" class="col-sm-2 control-label">Password</label>
						    <div class="col-sm-10">
						<input type="password" name="password"  class="form-control" id="password"><br>
						</div>
						  </div>
					</td>
				</tr>
				<tr>
					<td align="center">
						<div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10"><br>
						   <button type="submit" class="btn btn-default">Sign in</button>
						    </div>
			  			</div>
					</td>
				</tr>
		</table>
		</form>
	</div>

</div>
	</center>

</body>
</html>