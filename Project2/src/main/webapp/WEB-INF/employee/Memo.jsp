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

<style>

      @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      body { font-family: 'Nanum Pen Script', cursive;
		font-size:x-large;
}
	#memo{
		width: 200px;
		height: 200px;	
		padding: 20px;
		margin: 5px;
		background-image: url("<%=context%>/images/memo.png") ;
		
	}
	
	#tdd{
		padding: 10px;
		text-align: center;
	}
	
	#memoinsert{
		margin-left: 50px;
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
	top: 160px;	
}
</style>
</head>
<body>
<center>
<div class="back">
<div class="body">
	<table id="tdd">
	<tr><td>
	<table>
		<tr>
			<td>
			<table id="memo">
			<tr><td valign="top"><b>주문 품목</b></td>
				<td align="right" valign="top"><a href="memoupdate.ep?num=1"><img src="<%=context%>/images/delete.png"></a></td></tr>
				<c:forEach items="${lists1}" var="lists">
				<tr><td colspan="2">${lists.context}</td></Tr>
				</c:forEach>
			</table>		
			</td>
		</tr>		
		<tr>
			<td>
			<table id="memo">
			<tr><td valign="top"><b>예약</b></td>
			<td align="right" valign="top"><a href="memoupdate.ep?num=2"><img src="<%=context%>/images/delete.png"></a></td></tr>
				<c:forEach items="${lists2}" var="lists">
				<tr><td colspan="2">${lists.context}</td></Tr>
				</c:forEach>
			</table>		
			</td>
		</tr>
	</table>
	</td><td>
	<table>	
		<tr>
			<td>
			<table id="memo">
			<tr><td valign="top"><b>아르바이트</b></td>
			<td align="right" valign="top"><a href="memoupdate.ep?num=3"><img src="<%=context%>/images/delete.png"></a></td></tr>
				<c:forEach items="${lists3}" var="lists">
				<tr><td colspan="2">${lists.context}</td></Tr>
				</c:forEach>
			</table>		
			</td>
		</tr>
		
		<tr>
			<td>
			<table id="memo">
			<tr><td valign="top"><b>외상</b></td>
			<td align="right" valign="top"><a href="memoupdate.ep?num=4"><img src="<%=context%>/images/delete.png"></a></td></tr>
				<c:forEach items="${lists4}" var="lists">
				<tr><td colspan="2">${lists.context}</td></Tr>
				</c:forEach>
			</table>		
			</td>
		</tr>
	</table>
	</td>
	<td>
		<table id="memoinsert">		
			<form action="memoupdate.ep" method="post">
				<tr><td align="right">
				<select name="num">
					<option value="1">주문 품목</option>
					<option value="2">예약</option>
					<option value="3">아르바이트</option>
					<option value="4">외상</option>
				</select>
				</td></tr><tr><td>
				<textarea name="context"></textarea>
				</td></tr>
				<tr><td align="right">
				<input type="submit" value="글쓰기">
				</td></tr>
			</form>	
		</table>
	</td>
	
	</tr>
	</table>
	
	
</div></div>
</center>
</body>
</html> 