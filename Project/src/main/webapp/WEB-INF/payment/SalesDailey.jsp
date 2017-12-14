<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
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
		  
		  location.href="dailey.pm?dayday="+dateText;
		  
		  /*var dateArr = dateText.split("/"); 

			year = dateArr[2]; 
			month = dateArr[0]; 
			day = dateArr[1];
			
			Day = getStrDay(day);
			
			$("#dateInput").val(dateText);
			
			actionDAY();

			 location.href="dailey.pm?dayday="+Day;
			
						
			
			dayday = "";
			dayday += $("#dateInput").val();
			
			Day = getStrDay(dayday);	 */
	  }		  
  });
    
 });
 
 function getStrDay(Day) {
	 
	 alert(Day);
	 
     Day = Day + "";
     if (Day.length == 1) {
         Day = "0" + Day;
     }
     return Day;
 }
 
 /* function actionDAY(){
	
	dayday = "";
	dayday += $("#dateInput").val();
	
	alert(dayday);
	
	location.href="dailey.pm?dayday="+dayday;
	 
 } */
</script>


</head>
<body>
<center>

<div class="box_Calendar" id="dtpicker">
</div>
<p>
   <input type="button" id="datepicker" value="날짜 선택"/><br><br>
   Date: <input type="text" id="dateInput" /><br>
 </p>
	<h2>${today}</h2>
<table border="1">
<tr>
	<td>상품명</td>
	<td>수량</td>
	<td>금액</td>
	<td>합계</td>
</tr>
<c:forEach items="${payment}" var="lists" >
<tr>
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