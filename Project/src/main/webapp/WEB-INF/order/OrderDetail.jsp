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
<script>
function addProd(num, oid, categoryid){
	location.href("prod.od?num="+num+"&oid="+oid+"&categoryid="+categoryid);
}

function UpdateQtyplus(oid, pnum){
	location.href("ordercancle.od?oid="+oid+"&pnum="+pnum+"&qty=plus");	
}

function UpdateQtyminus(oid, pnum){
	location.href("ordercancle.od?oid="+oid+"&pnum="+pnum+"&qty=minus");	
}
</script>

</head>
<body>

OrderDetail.jsp
<table>
<tr>
<td rowspan="2">
	<table border="1" align="center">
		<tr>
			<td>순번	</td>
			<td>상품명(상품번호)</td>
			<td>수량	</td>
			<td>단가	</td>
			<td>금액	</td>
		</tr>
		<c:set var="total" value="0"/>	
	<c:forEach items="${shoplists}" var="lists" varStatus="status">
			<tr>
				<td align="center">${status.count}</td>
				<td>${lists.pname}(${lists.pnum})
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
			<td colspan="5">
			<form action="ordercancle.od" method="post">
				<input type="hidden" value="${oid}" name="oid">
				<input type="submit" value="전체취소">
			</form>
			</td>
		</tr>
	</table>	

</td>
<td>

 	<table border="1" align="center">
		<tr>
			<td><a href="order.od?categoryid=1&oid=${oid}">밥류</a></td>
			<td><a href="order.od?categoryid=2&oid=${oid}">면류</a></td>
			<td><a href="order.od?categoryid=3&oid=${oid}">분식류</a></td>
			<td><a href="order.od?categoryid=4&oid=${oid}">덮밥류</a></td>
			<td><a href="order.od?categoryid=5&oid=${oid}">찌개류</a></td>
			<td><a href="order.od?categoryid=6&oid=${oid}">기타</a></td>
		</tr>
	</table>	 
	<tr>
<td>
<c:if test="${prodlists == null}">
	<table>
		<tr><td>
		카테고리를 선택해주세요 
		</td></tr>
	</table>
</c:if>

<c:if test="${prodlists !=null}">
	<table align="center">
			<c:forEach items="${prodlists}" var="prodlists">
				<tr>
				<td>
				<input type="button" value="${prodlists.productname}" name="productname" onclick="addProd(${prodlists.num}, ${oid}, ${prodlists.categoryid})"></td>
				<td align="right">${prodlists.price}원</td>
				
				<!-- <td><input type="text" name="qty" size="3">개</td> -->
		</c:forEach>
	</table>
</c:if>
</td>
</tr>

<tr>	
	<td>
		<form action="orderend.od" method="post">
			<input type="hidden" name="oid" value="${oid}">
			<input type="hidden" name="lists" value="${shoplists}">
			<input type="submit" value="결제하기">
		</form>
	</td> 
	</tr>
</table>

</body>
</html>
<%@ include file="bottom.jsp"%>