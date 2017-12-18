<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
상품 수정
<form:form commandName="product" action="prodUpdate.pd" method="post">
<table>
	<tr>
	<td>상품명
	<input type="hidden" name="num" value="${num}">
	</td>
	<td>	
	<input type="text" name="productname" value="${productname}">
	<form:errors cssClass="err" path="productname" />
	</td>	
	</tr>
	<tr>	
	<td>금액</td>
	<td><input type="text" name="price" value="${price}">
	<form:errors cssClass="err" path="price" />
	</td>	
	</tr>
	<tr><td align="center">
	<input type="submit" value="수정하기">
	<input type="button" value="삭제하기" onclick="location.href='proddelete.pd?num=${num}'">
	</td></tr>
</table>
</form:form>
</center>
</body>
</html>