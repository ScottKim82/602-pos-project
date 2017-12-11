<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%
	String viewLogin = request.getContextPath()+ "/login.ep";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table{
align: center;
border: 1px;
width: 300px;
}

</style>
</head>
<body>
<center>

<h1>FoodPos System</h1>
<img src="http://blogthumb2.naver.net/MjAxNzEyMDdfMTg0/MDAxNTEyNjI1Mzk3MDE2.Ns6SXyLcRj10fAgxOZ_d8zLLp12cvcKOH9bBQZTh038g.g0MYL_Qie_VJRvDntV0poOfxflkRpOmaRSzdJuIkhl8g.PNG.blueeyerin/if_Streamline-99_185119.png?type=w2"><br>

<br><br>
<form action="<%=viewLogin%>" method="post">
<table border="1" >

<tr><td>
<img src="http://postfiles15.naver.net/MjAxNzEyMDdfMTM4/MDAxNTEyNjI2MDA3NDQ0.pPTUqYIbrnQhwwa-4V45PW560e_9ODKT0UKUI7Z-tKwg.4oYEqzJmOI6XrN__yURTtrGcOMbqBGjt7NuADpgeDBwg.PNG.blueeyerin/if_Food_C203_2427849.png?type=w3" width="30px">
아이디<input type="text" name="id"><br>
</td></tr>
<tr><td>
<img src="http://postfiles16.naver.net/MjAxNzEyMDdfNzgg/MDAxNTEyNjI2MDA3NTcy.TYJuu7FNS_KPl2md7Jm7Yf2CfGBMMMg1uNKU9yZmOuAg.H1QkpnI2PugjwfbBarLNIGUdK1PWFxZB40Bx7QfJdygg.PNG.blueeyerin/if_Food_C226_2427886.png?type=w3" width="30px">
비밀번호:<input type="password" name="password"><br>
</td></tr>
<tr><td align="center">
<input type="submit" value="로그인">	
</td></tr>
</table>
</form>
</center>
</body>
</html>