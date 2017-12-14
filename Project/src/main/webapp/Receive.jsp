<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%=today%><br>
총금액: <%=totalcount %>원<br>
결제타입: <%=pay%><br>
<input type="button" value="확인" onClick="con(<%=oid %>)">
</center>
</body>
</html>