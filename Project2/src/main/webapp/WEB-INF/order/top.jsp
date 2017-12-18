<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.btn {
  display: inline-block;
  font-weight: 400;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  border: 2px solid transparent;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 255px 25px 225px 25px/25px 225px 25px 255px;
  -webkit-transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
  transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
  transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
  transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
}


.btn-group > .btn,
.btn-group-vertical > .btn {
  position: relative;
  -webkit-box-flex: 0;
      -ms-flex: 0 1 auto;
          flex: 0 1 auto;
}


.btn-secondary {
  color: #fff;
  background-color: #555;
      font-family: "Lato", sans-serif;
}

.btn-primary {
  color: #fff;
  background-color: #333;
  border-color: #333;
}


</style>
<script type="text/javascript">

function list() {
	document.location.href="list.od";
}

function logout() {
	document.location.href="Login.jsp";
}

/* function sales(sales){
	location.href="dailey.pm?sales="+sales;	
}
 */
 function sales(sales){
		location.href="dailey.pm?sales="+sales;	
	}
 
 </script>


</head>
<%

Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
SimpleDateFormat sdf1 = new SimpleDateFormat("hh시 mm분");

String dt = sdf.format(date);
String time = sdf1.format(date);


String day ="";
Calendar cal = Calendar.getInstance();
cal.setTime(date);
int dayNum = cal.get(Calendar.DAY_OF_WEEK);

switch(dayNum){
case 1:
    day = "일";
    break ;
case 2:
    day = "월";
    break ;
case 3:
    day = "화";
    break ;
case 4:
    day = "수";
    break ;
case 5:
    day = "목";
    break ;
case 6:
    day = "금";
    break ;
case 7:
    day = "토";
    break ;
}

%>
<body>





	<panel>
	<table  width=100% height=100% align="center">
	
	
		
		<tr height=30>

			<td >
			
			<button type="button" class="btn btn-primary" onclick="list();">
			Main
					</button>
				
			
			
			 <button type="button" id="dailey" class="btn btn-primary" onclick="sales(this.id)" >
	        일일결산
			</button>
			
			
			
			 <button type="button" class="btn btn-primary" id="month" onclick="sales(this.id)">
	        월말결산
			</button>
			
				 <button type="button" class="btn btn-primary" id="end"   onclick="sales(this.id)">
	        마감정산
			</button>
			
			 <button type="button" class="btn btn-primary" onclick="location.href='productlist.pd'">
	      상품관리
			</button>			
					<button type="button" class="btn btn-primary" onclick="logout();">
			Logout
			</button>		
					</td>
					
						
			
			<td  align="left"><%=dt%>  &nbsp;  &nbsp; (<%=day%>) &nbsp;  &nbsp;  <%=time%></td>
		</tr>
		
		</panel>
		
		
		<tr>
		<td colspan="3">
		<br><br>