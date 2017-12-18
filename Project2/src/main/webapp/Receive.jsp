<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="./../common/common.jsp" %>
   <%
   	String totalcount = request.getParameter("totalcount");
    String oid = request.getParameter("oid");
    String paymenttype = request.getParameter("paymenttype");
    String pay;
    if(paymenttype == "1"){
    	 pay = "카드결제";
    }else{
    	pay = "현금결제";
    }
    java.util.Date date = new java.util.Date();
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
    String today = sdf.format(date);
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function con(oid){	
	opener.parent.location='list.od?oid='+oid;
	alert('감사합니다');
	self.close();	
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
<h2>[영수증]</h2>
</center>

[매장명] <br>
[사업자]  111-11-111111 <br>
[주소]  서울 마포구 신촌로 176 <br>
[대표자]  김규경               [TEL]02-222-2222<br>
[매출일]  <%=today%><bR>



==================================================================


<table >

<tr>
<td>상품명</td>
<td>단가</td>
<td>수량</td>
<td>금액<br>
</td>
</tr>


<%-- 
	<c:forEach items="${shoplists}" var="lists" varStatus="status">
<tr>
<td>>${lists.pname}</td>
<td><%=df.format("${lists.price}")%></td>
<td>${lists.qty}</td>
<td><%=df.format("${lists.amount}") %></td>
</tr>

</c:forEach>
 --%>

<tr>
<td colspan="3">합계 금액</td>
<td><%=totalcount%></td>
</tr>

<tr>
<td colspan="3" align="center">
부과세 과세물품가액   
</td>
<td><%=totalcount%>*0.09</td>
</tr>


<tr>
<td colspan="3" align="center">
부    가    세   
</td>
<td><%=totalcount%>*0.01</td>
</tr>


<tr >
<td colspan="3"><%=pay%></td>
<Td align="right"><%=totalcount%>원</Td>
</tr>


</table>

<br><BR><BR><br><BR><BR>
<center>
<input type="button" value="확인" onClick="con(<%=oid %>)">

</center>
</body>
</html>