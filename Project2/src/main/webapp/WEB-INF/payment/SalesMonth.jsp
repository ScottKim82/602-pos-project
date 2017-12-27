<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./../common/common.jsp" %>
   <%@ include file="./../order/top.jsp"%>
<% 
String context = request.getContextPath()+"/resources";


%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  


 <script type="text/javascript">
     
   google.charts.load('current', {'packages':['corechart'] }  );
       
    google.charts.setOnLoadCallback(drawChart);
      function drawChart() {    	  

        var data = google.visualization.arrayToDataTable(
        	${str}	
        );

        var options = {
          title: '월별정산'
        };

        var chart = new google.visualization.LineChart(document.getElementById('piechart'));

        chart.draw(data, options);
}
    </script>
    
    <style type="text/css">
    
      @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      body { font-family: 'Nanum Pen Script', cursive;
		font-size:x-large;
}
    
.back{
	
	position:relative;
	width: 1200px;
	height: 700px;
	background-repeat: no-repeat;
	background-position: 250px;
	background-attachment: fixed;
	background-image: url("<%=context%>/images/monitor.png");
	
}
.body{	
	position:absolute;
	height: 500px;
	left:200px;
	top: 150px;	
} 
    </style>
</head>
<body>
<center>
<div class="back">
<div class="body">
	<div>
	<a href="dailey.pm?sales=${sales}&mon=minus3">◀<a href="dailey.pm?sales=${sales}&mon=minus2">◀<a href="dailey.pm?sales=${sales}&mon=minus1">◀</a> ${month2}</div>
         	<c:if test="${size != 0}">
         		<div id="piechart" style="width: 800px; height: 400px;"></div>
         	</c:if>
         	<c:if test="${size == 0}">
         	<div style="width: 800px; height: 400px;">판매내역이 없습니다</div>
         	</c:if>
   	  <div style="background-color: white;">  	
  </div>
  </div></div>
</center>
</body>
</html>