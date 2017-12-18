<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../order/top.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/i18n/jquery-ui-i18n.min.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css" />
<script>


 $(function() {
	 
 $.datepicker.setDefaults($.datepicker.regional['ko']);
	 
  $("#datepicker").datepicker({
	  
	  dateFormat: 'yy/mm/dd',
	  
	  onSelect: function(dateText, inst){ 
		  
		  
		  location.href="dailey.pm?dayday="+dateText+"&sales=dailey";
		
	  }		  
  });
    
 }); 

</script>

<style type="text/css">



.table {
  width: 800px;
  max-width: 100%;
  margin-bottom: 1rem;
  background-color: transparent;
}

.table th,
.table td {
  padding: 0.75rem;
  vertical-align: top;
  border-top: 1px solid #333;
}

.table thead th {
  vertical-align: bottom;
  border-bottom: 2px solid #333;
}

.table tbody + tbody {
  border-top: 2px solid #333;
}

.table .table {
  background-color: #fff;
}

.table-sm th,
.table-sm td {
  padding: 0.3rem;
}

.table-bordered {
  border: 1px solid #333;
}

.table-bordered th,
.table-bordered td {
  border: 1px solid #333;
}

.table-bordered thead th,
.table-bordered thead td {
  border-bottom-width: 2px;
}

.table-striped tbody tr:nth-of-type(odd) {
  background-color: #ccc;
}

.table-hover tbody tr:hover {
  background-color: #fff;
}

.table-active > td {
  background-color: #fff;
}


</style>
</head>
<body>
<center>

<div class="box_Calendar" id="dtpicker">
</div>
<p>
   <input type="button" id="datepicker" value="날짜 선택"/><br><br>
 </p>
	<h2>${today}</h2>
	
	
	
	
<table border="1"  class="table table-hover">
<tr class="table-active">
	<td>상품명</td>
	<td>수량</td>
	<td>금액</td>
	<td>합계</td>
</tr>


<c:forEach items="${payment}" var="lists" >
<tr class="table-active">
<td>${lists.pname}</td>
<td align="right">${lists.qty}개</td>
<td align="right">${lists.price}원</td>
<td align="right">${lists.amount}원</td>
</tr>
</c:forEach>
<tr>
</tr>
</table>
<br>
<b>
총금액: ${totalprice}원
</b>


</center>
</body>
</html>