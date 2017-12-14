<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="./../common/common.jsp" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
	<table align="center">
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
				<td>${lists.pname}(${lists.pnum})</td>
				<td align="center">${lists.qty}</td>
				<td align="right">${lists.price}원</td>
				<td align="right">${lists.amount}원</td>		
			</tr>
		</c:forEach>
		<tr><td></td></tr>
		<tr>
			<td colspan="4">총합</td>
			<td>${totalcount}원</td>
		</tr>
		<tr>
			<td colspan="4">결제금액</td>
			<td>${payment}원</td>
		</tr> 
		<tr>
			<td>
				<table>
					<tr><td colspan="3" align="right">
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
						
						<td>
						<input type="button" onclick="window.location='orderend.od?num=<%=i%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value=<%=i%>> </td>		
						<%	
						if(i%3==0){
						%></tr><tr><%}
						}				
					%>
						<td><input type="button" onclick="window.location='orderend.od?num=<%=0%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value="0"> </td>
						<td><input type="button" onclick="window.location='orderend.od?num=<%=777%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value="00"> </td>
						<td><input type="button" onclick="window.location='orderend.od?num=<%=999%>&oid=${oid}&cal=${calculator}&payment=${payment}'" value="C"> </td>		
					</tr>
				</table>	
			</td>
		</tr>
		<tr>
			<td colspan="5">

			<form action="payment.pm" method="post">			
				<input type="hidden" value="${oid}" name="oid">
				<input type="hidden" value="${calculator}" name="cal">
				<input type="hidden" value="${payment}" name="payment">
				<input type="hidden" value="${totalcount}" name="totalcount">
				<input type="hidden" value="1" name="paymenttype">			
				<input type="submit" value="카드결제">			
			</form>
			
			<form action="payment.pm" method="post">			
				<input type="hidden" value="${oid}" name="oid">
				<input type="hidden" value="${calculator}" name="cal">
				<input type="hidden" value="${payment}" name="payment">
				<input type="hidden" value="${totalcount}" name="totalcount">
				<input type="hidden" value="2" name="paymenttype">			
				<input type="submit" value="현금결제">							
			</form>
			</td>
		</tr>
	</table>
	
	

</body>
</html>