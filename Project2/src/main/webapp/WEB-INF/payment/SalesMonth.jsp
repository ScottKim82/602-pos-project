<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./../common/common.jsp" %>
   <%@ include file="./../order/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
     <div id="piechart" style="width: 900px; height: 500px;"></div>
   
  <div style="background-color: white;">  	
  </div>

</body>
</html>