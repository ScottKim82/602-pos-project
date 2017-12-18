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
상품 추가
<form:form commandName="product" action="product.pd" method="post">
<table>
	<tr>
	<td>카테고리</td>
	<td>
	<select name="categoryname">
		<option value="김밥류">김밥류</option>
		<option value="면류">면류</option>
		<option value="분식류">분식류</option>
		<option value="덮밥류">덮밥류</option>
		<option value="찌개류">찌개류</option>
		<option value="기타">기타</option>
	</select>
	<form:errors cssClass="err" path="categoryname" />
	</td></tr>
	<tr>
	<td>상품명</td>
	<td><input type="text" name="productname">
	<form:errors cssClass="err" path="productname" />
	</td>	
	</tr>
	<tr>	
	<td>금액</td>
	<td><input type="text" name="price">
	<form:errors cssClass="err" path="price" />
	</td>	
	</tr>
	<tr><td align="center">
	<input type="submit" value="추가하기">
	</td></tr>
</table>
</form:form>
</center>
</body>
</html>