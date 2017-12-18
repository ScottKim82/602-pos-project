<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="./../common/common.jsp" %>
<%@ include file="./../order/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
/* function priceEdit(e){
	
	String editPrice = document.form.totalprice2.val();
	System.out.println("editprice:"+editPrice);
	location.href="dailey.pm?editPrice="+editPrice+"&sales=end";
}
 */
</script>
</head>
<body>

<center>
<h2>오늘(${today})의 총 결제금액</h2>
<form action="dailey.pm" method="post">
	
	<table>
			<c:forEach items="${payday2}" var="lists">
			<tr>
				<c:if test="${lists.paymenttype==1}">
				<td>신용카드: </td><td><input type="text" name="totalprice" value="${lists.totalprice}" disabled="disabled">원</td>
				</c:if>
				
				<c:if test="${lists.paymenttype==2}">				
				<td>현금: </td><td><input type="text" name="totalprice2" value="${lists.totalprice}">원</td>
				</c:if>				
		</tr>
			</c:forEach>
		<tr><td align="right">
		<input type="hidden" value="${sales}" name="sales">
		<input type="submit" value="현금금액수정" onclick="priceEdit()">	
		<input type="button" value="확인" onclick="location.href='list.od'">
		</td></tr>		
	</table>
</form>
</center>
</body>
</html>