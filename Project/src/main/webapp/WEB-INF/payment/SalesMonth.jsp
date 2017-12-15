<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
   <script src="http://code.highcharts.com/highcharts.js"></script> 
   <script src="http://code.highcharts.com/modules/data.js"></script>  

</head>
<body>
<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>

<script language="JavaScript">
$(document).ready(function() { 
   var data = {
      table: 'datatable'
   };
   var chart = {
      type: 'column'
   };
   var title = {
      text: '월'   
   };      
   var yAxis = {
      allowDecimals: false,
      title: {
         text: 'price'
      }
   };
   var tooltip = {
      formatter: function () {
         return '<b>' + this.series.name + '</b><br/>' +
            this.point.y + ' ' + this.point.name.toLowerCase();
      }
   };
   var credits = {
      enabled: false
   };  
      
   var json = {};    
   json.title = title; 
   json.data = data;
   json.yAxis = yAxis;
   json.credits = credits;  
   json.tooltip = tooltip;  
   $('#container').highcharts(json);
});
</script>



<table id="datatable">
	<tbody>
		<c:forEach items="${payday}" var="lists">
			<tr>
			<th>${lists.paydate}</th><td>${lists.totalprice}</td>
			<td>${lists.totalprice}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</body>
</html>