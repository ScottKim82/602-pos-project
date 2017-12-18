<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="top.jsp"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<style type="text/css">



.table {
  width: 100%;
  background-color: transparent;
     table-layout: fixed;
}

.table th,
.table td {
  vertical-align: top;
  border-top: 1px solid #333;
}

.table thead th {
  vertical-align: bottom;
  border-bottom: 2px solid #333;
}

.table tbody + tbody {
  border-top: 2px solid #333;
}

.table .table {
  background-color: #fff;
}

.table-bordered {
  border: 1px solid #333;
}

.table-bordered th,
.table-bordered td {
  border: 1px solid #333;
}

.table-bordered thead th,
.table-bordered thead td {
  border-bottom-width: 2px;
}

.table-striped tbody tr:nth-of-type(odd) {
  background-color: #ccc;
}

.table-hover tbody tr:hover {
  background-color: #fff;
}

.table-active > td {
  background-color: #fff;
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
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 2px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    line-height: 1.5;
    border-radius: 255px 25px 225px 25px/25px 225px 25px 255px;
    -webkit-transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    
}
bootstrap.css:8834
button, input, optgroup, select, textarea {
    font-family: "Neucha", -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
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
    padding: 2rem 3rem;
    font-size: 1.09375rem;
    line-height: 1.5;
    border-radius: 0;
}
bootstrap.css:2489
.btn-primary {
    color: #000000;
   background-color: #f0ad4e;
    border-color: #f0ad4e;
}

.button5 {
 background-color: #336699;
    border: none;
    color: white;
    padding: 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
border-radius: 50%;
}

.button3 {
border-radius: 8px;
background-color:#d9d9d9;
    border: none;
    color: black;
    padding: 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;

}
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
	<table align="center"  class="table table-hover">
		<tr>
			<td>순번	</td>
			<td>상품명(상품번호)</td>
			<td>수량	</td>
			<td>단가	</td>
			<td>금액	</td>
		</tr>
		<c:set var="total" value="0"/>	
	<c:forEach items="${shoplists}" var="lists" varStatus="status">
			<tr class="table-active">
				<td align="center">${status.count}</td>
				<td>${lists.pname}(${lists.pnum})</td>
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
		
		
		<br><BR><br><BR>
		
		
		<table align="left">
		<tr>
			<td align="right" colspan="5">
					<c:if test="${calculator==null}">
					0
					</c:if>	
					
					<c:if test="${calculator!=null}">
					${calculator}
					</c:if>	 													
									
					</td></tr>
					
					
					<tr>
					<%
						for(int i=1; i<=9; i++){%>
						
						<td align="center"  colspan="2">
						<button class="button button5" onclick="window.location='orderend.od?num=<%=i%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value=<%=i%>><%=i%></button> </td>		
						<%	
						if(i%3==0){
						%></tr><tr><%}
						}				
					%>
						<td align="center" colspan="2"><button class="button button3" onclick="window.location='orderend.od?num=<%=0%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value="0">0</button> </td>
						<td align="center" colspan="2"> <button class="button button3" onclick="window.location='orderend.od?num=<%=777%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value="00">00</button> </td>
						<td align="center" colspan="2"><button class="button button3"onclick="window.location='orderend.od?num=<%=999%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value="C">C</button> </td>		
					</tr>
		
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		
		
		<tr>
			<td colspan="3" align="center">

			<form action="payment.pm" method="post">			
				<input type="hidden" value="${oid}" name="oid">
				<input type="hidden" value="${calculator}" name="cal">
				<input type="hidden" value="${payment}" name="payment">
				<input type="hidden" value="${totalcount}" name="totalcount">
				<input type="hidden" value="1" name="paymenttype">			
				<button type="submit" class="btn btn-primary btn-lg">카드결제</button>			
			</form>
			</td>
			<td colspan="2" align="center">
			<form action="payment.pm" method="post">			
				<input type="hidden" value="${oid}" name="oid">
				<input type="hidden" value="${calculator}" name="cal">
				<input type="hidden" value="${payment}" name="payment">
				<input type="hidden" value="${totalcount}" name="totalcount">
				<input type="hidden" value="2" name="paymenttype">			
				<button type="submit" class="btn btn-primary btn-lg">현금결제</button>			
			</form>
			</td>
		</tr>
		
		
	</table>
</body>
</html>

<%@ include file="bottom.jsp"%>