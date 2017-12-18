<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">


</style>
</head>
<body>
<% 

String context = request.getContextPath()+"/resources";
System.out.println(context);
%>

<center>
	<img src="<%=context%>/images/mainfood.JPG" width="300" height="150"><br><br><br>
</center>

	<form action="order.od" method="post" id="form">
		<table align="center" height="100%">
			<tr>
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

	<%@ include file="bottom.jsp"%>
</html>
