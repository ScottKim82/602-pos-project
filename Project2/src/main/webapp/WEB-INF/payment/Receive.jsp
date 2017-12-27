<%@page import="java.util.ArrayList"%>
<%@page import="payment.PaymentDao"%>
<%@page import="payment.PaymentBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ include file="./../common/common.jsp" %>
   <%
   	int totalcount = Integer.parseInt(request.getParameter("totalcount"));
    String oid = request.getParameter("oid");
    String paymenttype = request.getParameter("paymenttype");
    String pay;
    if(paymenttype == "1"){
    	 pay = "카드결제";
    }else{
    	pay = "현금결제";
    }
    
    int total1 = Integer.parseInt(String.valueOf(Math.round(totalcount * 0.9)));
    int total2 = Integer.parseInt(String.valueOf(Math.round(totalcount * 0.1)));
    String image = request.getContextPath()+"/resources/images/re.png";
    String context = request.getContextPath()+"/resources";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function con(oid){
	alert('감사합니다');
	location.href='list.od?oid='+oid;
}
</script>
<style>

	.receive{		
		width: 450px;
		height: 250px;
		overflow: scroll;		
		} 
		
	.re{	
		background-repeat: no-repeat;
		background-position: top;
		 background-attachment: fixed;
		background-image: url("<%=image%>");		 
	}	
	
	.re2{	
		width: 420px;
		padding: 20px;
	}		
		.receive2{
		background-color: #fff;
		width: 400px;
		padding: 10px;
		border-top: 3px dashed lightgrey;
		
		}
		
		.myButton {
		
		margin: 20px;
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #bfbfbf), color-stop(1, #faf5fa));
	background:-moz-linear-gradient(top, #bfbfbf 5%, #faf5fa 100%);
	background:-webkit-linear-gradient(top, #bfbfbf 5%, #faf5fa 100%);
	background:-o-linear-gradient(top, #bfbfbf 5%, #faf5fa 100%);
	background:-ms-linear-gradient(top, #bfbfbf 5%, #faf5fa 100%);
	background:linear-gradient(to bottom, #bfbfbf 5%, #faf5fa 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#bfbfbf', endColorstr='#faf5fa',GradientType=0);
	background-color:#bfbfbf;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#777777;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:7px 21px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #faf5fa), color-stop(1, #bfbfbf));
	background:-moz-linear-gradient(top, #faf5fa 5%, #bfbfbf 100%);
	background:-webkit-linear-gradient(top, #faf5fa 5%, #bfbfbf 100%);
	background:-o-linear-gradient(top, #faf5fa 5%, #bfbfbf 100%);
	background:-ms-linear-gradient(top, #faf5fa 5%, #bfbfbf 100%);
	background:linear-gradient(to bottom, #faf5fa 5%, #bfbfbf 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#faf5fa', endColorstr='#bfbfbf',GradientType=0);
	background-color:#faf5fa;
}
.myButton:active {
	position:relative;
	top:1px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<center>
<div class="back">
<div class="body">
	<div class="re">
		<table class="re2">
			<tr><td><h2>[영수증]</h2></td></tr>
			
			<tr><td>[매장명] </td></tr>
			<tr><td>[사업자]  111-11-111111 </td></tr>
			<tr><td>[주소]  서울 마포구 신촌로 176 </td></tr>
			<tr><td>[대표자]  김규경               [TEL]02-222-2222</td></tr>
			<tr><td>[매출일]  ${today}</td></tr>
			<tr><td>[결제유형] <%=pay%></td></tr>
			<tr><td>
			
			===============================
			</td></tr>
		</table>
	<div class="receive">
		<table class="re2">
			<tr>
			<td>상품명</td>
			<td>단가</td>
			<td>수량</td>
			<td>금액<br>
			</td>
			</tr>
			
			<c:forEach items="${lists}" var="lists" varStatus="status">
			<tr>
			<td>${lists.pname}</td>
			<td>${lists.price}원</td>
			<td>${lists.qty}개</td>
			<td>${lists.amount}원</td>
			</tr>
			</c:forEach>
			
			<tr>
			<td colspan="3">
			물품가액   
			</td>
			<td><%=total1%>원</td>
			</tr>
			
			
			<tr>
			<td colspan="3">
			부    가    세   
			</td>
			<td><%=total2%>원</td>
			</tr>
		</table>

		<table class="receive2">
			<tr>
			<td colspan="3">합계 금액</td>
			<td align="right"><%=totalcount%>원</td>
			</tr>
		</table>
	</div>
	<br><BR><BR>
	<input type="button" value="확인" onClick="con(<%=oid %>)" class="myButton">
		</div>
</div>
</div>
</center>
</body>
</html>