<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			<td>${lists.pname}(${lists.pnum})</td>
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
			<input type="button" value="현금결제">
			<input type="button" value="카드결제">
			<input type="button" value="자리이동">
		</td>
	</tr>
	</table>	