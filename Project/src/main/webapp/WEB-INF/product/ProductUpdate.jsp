<%@page import="java.util.ArrayList"%>
<%@page import="payment.PaymentBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="./../common/common.jsp" %>
 <%@ include file="./../order/top.jsp"%>  
<%String context = request.getContextPath()+"/resources"; %>

<%
	List<PaymentBean> lists = new ArrayList<PaymentBean>();
	lists = (List<PaymentBean>)request.getAttribute("lists");
	int totalprice =0;	
	for(int i=0; i<lists.size(); i++){
		totalprice += lists.get(i).getAmount();
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

  @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      body { font-family: 'Nanum Pen Script', cursive;
		font-size:x-large;
}

.back{
	position:relative;	
	width: 1200px;
	height: 800px;	
	background-repeat: no-repeat;
	background-position: 300px;
	background-attachment: fixed;
	background-image: url("<%=context%>/images/monitor.png");
}
.body{	
	position:absolute;
	left:260px;
	top: 150px;	
}

.tata{
outline: thick ridge white;
width: 350px;
height: 400px;
padding: 15px;
margin: 20px;
text-align: center;
color:white;
}

.tata2{
color:#4d4d4d;
outline: thick ridge white;
width: 350px;
height: 400px;
padding: 15px;
align: center;
}


.tata4{
color: #4d4d4d;
padding: 0 10px 0 10px;
}

.tata3{
color:#4d4d4d;
}


 .myButton {
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
	font-size:20px;
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
</head>
<body>
	<center>
	<div class="back">
		<div class="body">	
			<form:form commandName="product" action="prodUpdate.pd" method="post">
				<table>
					<tr>
					<td>
						<table class="tata">
							<tr>
								<td class="tata3">상품명</td>
								<td><input type="hidden" name="num" value="${num}">
								<input type="text" name="productname" value="${productname}" class="myButton">
								<form:errors cssClass="err" path="productname" />
								</td>	
							</tr>
							<tr>	
								<td class="tata3">금액</td>
								<td><input type="text" name="price" value="${price}" class="myButton">
								<form:errors cssClass="err" path="price" />
								</td>	
							</tr>
							<tr>
								<td align="center" colspan="2" class="tata5">
								<input type="submit" value="수정하기" class="myButton">
								<input type="button" value="삭제하기" class="myButton" onclick="location.href='proddelete.pd?num=${num}'">
								</td>
							</tr>	
						</table>
					</form:form>
				</td>
				<td>
						<table class="tata2">
							<tr><td class="tata3">
							<b>${productname}</b>의 일주일간 판매현황
							</td></tr>
							<%
							if(lists.size()==0){
								%>
								<tr><td class="tata4">판매내역이 없습니다</td></tr>
								<% 
							}				
							if(lists.size()>7){		//일주일치만 나오도록					
								for(int i=0; i<7; i++){
									%>
									<tr>
									<td class="tata4"><%=lists.get(i).getPaydate().substring(0, 10) %></td>
									<td class="tata4" align="right"><%=lists.get(i).getQty() %>개</td>		
								</tr>			
								<%	
								}		
							}else{								
							for(int i=0; i<lists.size(); i++){%>	
								<tr>
									<td class="tata4"><%=lists.get(i).getPaydate().substring(0, 10) %></td>
									<td class="tata4" align="right"><%=lists.get(i).getQty() %>개</td>		
								</tr>					
								<%totalprice += lists.get(i).getAmount();
								} 
							}%>				
				<tr><td colspan="2" align="right" class="tata6">총: <%=totalprice%>원</td></tr>
			</table>
			</div>
		</div>
</center>
</body>
</html>