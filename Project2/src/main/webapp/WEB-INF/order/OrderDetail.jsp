<%@page import="order.ShoppingInfo"%>
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



.table {
  width: 100%;
  max-width: 100%;
  margin-bottom: 1rem;
  background-color: transparent;
}

.table th,
.table td {
  padding: 0.75rem;
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

.table-sm th,
.table-sm td {
  padding: 0.3rem;
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

.btn-outline-secondary:focus, .btn-outline-secondary.focus {
    -webkit-box-shadow: 0 0 0 0.2rem rgba(85, 85, 85, 0.5);
    box-shadow: 0 0 0 0.2rem rgba(85, 85, 85, 0.5);
}
bootstrap.css:2470
.btn:focus, .btn.focus {
    outline: 0;
    -webkit-box-shadow: 0 0 0 0.2rem rgba(51, 51, 51, 0.25);
    box-shadow: 0 0 0 0.2rem rgba(51, 51, 51, 0.25);
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

.btn-warning {
    -webkit-appearance: button;
    color: #111;
    background-color: #FF851B;
    border-color: #FF851B;
    -webkit-appearance: button;
    border-style: solid;
    border-width: 0 1px 4px 1px;
    font-size: 12px;
    font-weight: bold;
    text-transform: uppercase;
        display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 0.875rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    margin: 0;
    
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    font-family: inherit;
        overflow: visible;
            touch-action: manipulation;
                box-sizing: border-box;
                width:100px; 
                height:100px; 
}


.btn-warning {
    border-color: #ff7702;
    color: #fff;
}

a.no-uline { text-decoration:none }



</style>
<script>
function addProd(num, oid, categoryid){
	location.href="prod.od?num="+num+"&oid="+oid+"&categoryid="+categoryid;
}

function UpdateQtyplus(oid, pnum){
	location.href="ordercancle.od?oid="+oid+"&pnum="+pnum+"&qty=plus";	
}

function UpdateQtyminus(oid, pnum){
	location.href="ordercancle.od?oid="+oid+"&pnum="+pnum+"&qty=minus";	
}
</script>

</head>
<body>

<table  align="center">
<tr>
<td rowspan="2">
	<table align="center"  class="table table-hover">
		<tr>
			<td>순번	</td>
			<td>상품명</td>
			<td>수량	</td>
			<td>단가	</td>
			<td>금액	</td>
		</tr>
		
		
		<c:set var="total" value="0"/>	
	<c:forEach items="${shoplists}" var="lists" varStatus="status">
			<tr class="table-active">
				<td align="center">${status.count}</td>
				<td>${lists.pname}
				<input type="button" value="+" name="cancle" onClick="UpdateQtyplus(${oid}, ${lists.pnum})">
				<input type="button" value="-" name="cancle" onClick="UpdateQtyminus(${oid}, ${lists.pnum})">
				</td>
				<td align="center">${lists.qty}</td>
				<td align="right">${lists.price}원</td>
				<td align="right">${lists.amount}원</td>		
			</tr>
		</c:forEach>
	
		<tr>
			<td colspan="4" align="right">총합</td>
			<td>${totalcount}원</td>
		</tr> 
		
		<tr>
			<td colspan="2">
			<form action="ordercancle.od" method="post">
				<input type="hidden" value="${oid}" name="oid">
				<button type="submit" class="btn btn-primary btn-lg">전체취소</button>
			</form>
			
			</td>
			<td colspan="3">
					<form action="orderend.od" method="post">
			<input type="hidden" name="oid" value="${oid}">
			<input type="hidden" name="lists" value="${shoplists}">
			<button type="submit" class="btn btn-primary btn-lg">결제하기</button>
		</form>
			</td>
		</tr>
	</table>	

</td>





<td>

 	<table align="center">
		<tr>
			<td><a class="no-uline" href="order.od?categoryid=1&oid=${oid}"><button type="button" class="btn btn-outline-secondary">밥류</button></a></td>
			<td><a  class="no-uline" href="order.od?categoryid=2&oid=${oid}"><button type="button" class="btn btn-outline-secondary">면류</button></a></td>
			<td><a  class="no-uline"href="order.od?categoryid=3&oid=${oid}"><button type="button" class="btn btn-outline-secondary">분식류</button></a></td>
			<td><a  class="no-uline"href="order.od?categoryid=4&oid=${oid}"><button type="button" class="btn btn-outline-secondary">덮밥류</button></a></td>
			<td><a  class="no-uline"href="order.od?categoryid=5&oid=${oid}"><button type="button" class="btn btn-outline-secondary">찌개류</button></a></td>
			<td><a  class="no-uline"href="order.od?categoryid=6&oid=${oid}"><button type="button" class="btn btn-outline-secondary">기타</button></a></td>
		</tr>
	</table>	 
	
	
	
	
	<tr>
<td align="center">
<c:if test="${prodlists == null}">
	<table>
		<tr><td >
		카테고리를 선택해주세요 
		</td></tr>
	</table>
</c:if>

<c:if test="${prodlists !=null}">
	<table align="center">
	<tr>
			<c:forEach items="${prodlists}" var="prodlists" varStatus="status">
				<c:if test="${status.index%4==0}">
					</tr><tr>
				</c:if>
			<td colspan="3" align="center">
				<button type="button" class="btn btn-warning" value="${prodlists.productname}" name="productname" onclick="addProd(${prodlists.num}, ${oid}, ${prodlists.categoryid})">${prodlists.productname}</button><br>
			</td>
		</c:forEach>			
			</tr>	
	</table>
</c:if>
</td>
</tr>


	
</table>

</body>
</html>
<%@ include file="bottom.jsp"%>