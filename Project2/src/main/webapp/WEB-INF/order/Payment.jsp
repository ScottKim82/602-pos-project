<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="top.jsp"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 

String context = request.getContextPath()+"/resources";
%>


<style type="text/css">

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
	left:180px;
	top: 100px;
	width: 900px;
	height: 555px;
	overflow: scroll;	
}
.table {
  width: 450px;
  margin-bottom: 1rem;
  background-color: #e6e6e6;
  margin: 30px;
}

.table2 {
  width: 290px;
  height: 70px;
}

.table3{
 width: 300px;
  height: 250px;
  background-color: #e6e6e6;
}

.td{
	background-color: black;
}

.td1{
	background-color: darkgrey;
	color: white;
	padding: 0px 5px;
}
bootstrap.css:2470
.btn:focus, .btn.focus {
    outline: 0;
}
bootstrap.css:2466
.btn:focus, .btn:hover {
    text-decoration: none;
}
bootstrap.css:353
button, html [type="button"], [type="reset"], [type="submit"] {
    -webkit-appearance: button;
}
bootstrap.css:324
button:focus {
    outline: 1px dotted;
    outline: 5px auto -webkit-focus-ring-color;
}
bootstrap.css:8825
.btn {
    border-radius: 255px 25px 225px 25px/25px 225px 25px 255px;
    text-decoration: none;
  
}
bootstrap.css:2769
.btn-outline-secondary {
    color: #555;
    background-color: transparent;
    background-image: none;
    border-color: #555;
  
}
bootstrap.css:2445
.btn {
    display: inline-block;
    font-weight: 400;
    text-align: top;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 2px solid transparent;   
    font-size: 20xp;
    line-height: 1.5;
    border-radius: 255px 25px 225px 25px/25px 225px 25px 255px;
    -webkit-transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    
}

bootstrap.css:346
button, select {
    text-transform: none;
}
bootstrap.css:341
button, input {
    overflow: visible;
}
bootstrap.css:333
input, button, select, optgroup, textarea {
    margin: 0;
    font-family: inherit;
    font-size: inherit;
    line-height: inherit;
}
bootstrap.css:320
button {
    border-radius: 0;
}
bootstrap.css:294
a, area, button, [role="button"], input:not([type="range"]), label, select, summary, textarea {
    -ms-touch-action: manipulation;
    touch-action: manipulation;
}
bootstrap.css:107
*, *::before, *::after {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.btn-lg, .btn-group-lg > .btn {
    padding: 0.5rem 2.4rem;
    line-height: 1.5;
    border-radius: 0;
}
bootstrap.css:2489
.btn-primary {
    color: #000000;
   background-color: #f0ad4e;
    border-color: #f0ad4e;
}



.ta{
vertical-align: top;}

</style>

<script>

function payment1(lists){
	location.href="payment.pm?paymenttype=1&lists="+lists;
}

function payment2(lists){
	location.href="payment.pm?paymenttype=2&lists="+lists;
}

</script>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<div class="back">
<div class="body">
<table align="left"  class="table">
			<tr>
				<td>순번	</td>
				<td>상품명</td>
				<td>수량	</td>
				<td>단가	</td>
				<td>금액	</td>
			</tr>
			<c:set var="total" value="0"/>	
			<c:forEach items="${shoplists}" var="lists" varStatus="status">
				<tr class="table-active " >
					<td align="center">${status.count}</td>
					<td>${lists.pname}</td>
					<td align="center">${lists.qty}</td>
					<td align="right">${lists.price}원</td>
					<td align="right">${lists.amount}원</td>		
				</tr>
			</c:forEach>			
			<tr>
				<td colspan="4">총합</td>
				<td>${totalcount}원</td>
			</tr>
			<tr>
				<td colspan="4">결제금액</td>
				<td>${payment}원</td>
			</tr> 	
		</table>

<table cellpadding="20"  align="center">
	<tr>
	<td>
		<table class="table3">
			<tr>		
				<td align="right" colspan="3" class="td1">
						<c:if test="${calculator==null}">
					0				
						</c:if>						
						<c:if test="${calculator!=null}">
						${calculator}
						</c:if>	 													
						</td>
				</tr>				
			<tr>
						<%
							for(int i=1; i<=9; i++){%>
							
							<td align="center"  class="td" >
							<img src="<%=context%>/images/<%=i%>c.JPG" onclick="window.location='orderend.od?num=<%=i%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value=<%=i%>></td>		
							<%	
							if(i%3==0){
							%></tr><tr><%}
							}				
						%>
							<td align="center" class="td" ><img src="<%=context%>/images/0c.JPG"  onclick="window.location='orderend.od?num=<%=0%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value="0"> </td>
							<td align="center" class="td"> <img src="<%=context%>/images/00c.jpg"  onclick="window.location='orderend.od?num=<%=777%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value="00"> </td>
							<td align="center" class="td"><img src="<%=context%>/images/c.jpg" onclick="window.location='orderend.od?num=<%=999%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value="C"> </td>		
			</tr>
		</table>
	</td>
	</tr>
	<tr>
	<td>
		<table class="table2">	
			<tr>			
				<td>
					<form action="payment.pm" method="post">			
						<input type="hidden" value="${oid}" name="oid">
						<input type="hidden" value="${calculator}" name="cal">
						<input type="hidden" value="${payment}" name="payment">
						<input type="hidden" value="${totalcount}" name="totalcount">
						<input type="hidden" value="1" name="paymenttype">									
						<button type="submit" class="btn btn-primary btn-lg"><img src="<%=context%>/images/card.JPG" width="100" height="100"><br>카드결제</button>			
					</form>						
				</td>
				<td valign="top">
					<form action="payment.pm" method="post">			
						<input type="hidden" value="${oid}" name="oid">
						<input type="hidden" value="${calculator}" name="cal">
						<input type="hidden" value="${payment}" name="payment">
						<input type="hidden" value="${totalcount}" name="totalcount">
						<input type="hidden" value="2" name="paymenttype">			
						<button type="submit" class="btn btn-primary btn-lg"><img  id="way"src="<%=context%>/images/cash.JPG" width="100" height="100"><br>현금결제</button>			
					</form>						
				</td>
			</tr>
		</table>	
	</td></tr>
</table>
	</div>
</div>
</center>
	
</body>
</html>

<%@ include file="bottom.jsp"%>