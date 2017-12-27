<%@page import="order.ShoppingInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="top.jsp"%>    
<% 
String context = request.getContextPath()+"/resources";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

  @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      body { font-family: 'Nanum Pen Script', cursive;
		font-size: 22px;
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
	width: 900px;
	height: 500px;
	overflow: scroll;
	left:160px;
	top: 150px;	
}

.tata{
	height: 450px;
}

.ta{
	height: 200px;
	valign: right;
	width: 50px;
}

.ta2{
	width: 400px;
	text-align: center;
}

.table{
	width: 350px;
}
.button_base {
    border: 0;
    font-size: 20px;
    position: relative;
    width: 100px;
    height: 60px;
    text-align: center;
    box-sizing: content-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}

.button_base:hover {
    cursor: pointer;
}




/* ### ### ### 05 */
.b05_3d_roll {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
}

.b05_3d_roll div {
    position: absolute;
    text-align: center;
    width: 60px;
    height: 40px;
    padding:5px;
    border: #000000 solid 1px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b05_3d_roll div:nth-child(1) {
    color: #000000;
    background-color: #000000;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll div:nth-child(2) {
    color: #000000;
    background-color: #ffffff;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll:hover div:nth-child(1) {
    color: #ffffff;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

.b05_3d_roll:hover div:nth-child(2) {
    background-color: #000000;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(-90deg);
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
}

/*product */
.btn {
	border: none;
	font-size: 20px;
	color: inherit;
	background: none;
	cursor: pointer;
	width:100px;
	height: 50px;
    display:inline-block;
	margin: 5px;
 	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	outline: none;
	position: relative;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
	word-break:break-al;
}

.btn:after {
	content: '';
	position: absolute;
	z-index: -1;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
}

.btn-2 {
	background: #e6e6e6;
	color: black;
	box-shadow: 0 6px #8c8c8c;
	-webkit-transition: none;
	-moz-transition: none;
	transition: none;
}

.btn-2a {
	border-radius: 5px 5px 5px 5px;
}

.btn-2a:hover {
	box-shadow: 0 4px #8c8c8c;
	top: 2px;
}

.btn-2a:active {
	box-shadow: 0 0 #8c8c8c;
	top: 6px;
}


a.no-uline { text-decoration:none }



</style>
<script>
function addProd(num, oid, categoryid){
	location.href="prod.od?num="+num+"&oid="+oid+"&categoryid="+categoryid;
}

function UpdateQtyplus(oid, pnum){
	location.href="ordercancle.od?oid="+oid+"&pnum="+pnum+"&qty=plus";	
}

function UpdateQtyminus(oid, pnum){
	location.href="ordercancle.od?oid="+oid+"&pnum="+pnum+"&qty=minus";	
}
</script>
</head>
<body>
<center>
	<div class="back">
	<div class="body">

<table class="tata">
<tr>
<td rowspan="2" valign="top">
	<table align="center" class="table">
		<tr>
			<td>순번	</td>
			<td>상품명(상품번호)</td>
			<td>수량	</td>
			<td>단가	</td>
			<td>금액	</td>
		</tr>		
		<c:set var="total" value="0"/>	
	<c:forEach items="${shoplists}" var="lists" varStatus="status">
			<tr class="table-active ">
				<td align="center">${status.count}</td>
				<td>${lists.pname}
				<input type="button" value="+" name="cancle" onClick="UpdateQtyplus(${oid}, ${lists.pnum})">
				<input type="button" value="-" name="cancle" onClick="UpdateQtyminus(${oid}, ${lists.pnum})">
				</td>
				<td align="center">${lists.qty}</td>
				<td align="right">${lists.price}원</td>
				<td align="right">${lists.amount}원</td>		
			</tr>
		</c:forEach>
	
		<tr>
			<td colspan="4" align="right">총합</td>
			<td>${totalcount}원</td>
		</tr> 
		
		<tr>
			<td colspan="2" align="center">
			<form action="ordercancle.od" method="post">
				<input type="hidden" value="${oid}" name="oid">
				<button type="submit" class="btn btn-primary btn-lg">전체취소</button>
			</form>
			
			</td>
			<td colspan="3" align="center">
					<form action="orderend.od" method="post">
			<input type="hidden" name="oid" value="${oid}">
			<input type="hidden" name="lists" value="${shoplists}">
			<button type="submit" class="btn btn-primary btn-lg">결제하기</button>
		</form>
			</td>
		</tr>
	</table>	

	</td>
	<td>
 	<table>
		<tr>
		<td valign="top" colspan="3">
			<c:if test="${prodlists == null}">
				<table>
					<tr><td class="ta2">
					카테고리를 선택해주세요 
					</td></tr>
				</table>
			</c:if>
			<c:if test="${prodlists !=null}">
				<table>
					<tr>
					<c:forEach items="${prodlists}" var="prodlists" varStatus="status">
						<c:if test="${status.index%3==0}">
							</tr><tr>
						</c:if>
					<td class="ta2">
					<button type="button" class="btn btn-2 btn-2a" value="${prodlists.productname}" name="productname" onclick="addProd(${prodlists.num}, ${oid}, ${prodlists.categoryid})">${prodlists.productname}</button><br>
					</td>
					</c:forEach>			
					</tr>
				</table>
			</c:if>
		</td>
		<td class="ta">
			    <div class="button_base b05_3d_roll" onclick="location.href='order.od?categoryid=1&oid=${oid}'">
			        <div>밥류</div>
			        <div>밥류</div>
   				 </div>			
				<div class="button_base b05_3d_roll" onclick="location.href='order.od?categoryid=2&oid=${oid}'">
			        <div>면류</div>
			        <div>면류</div>
    			</div>
			    <div class="button_base b05_3d_roll" onclick="location.href='order.od?categoryid=3&oid=${oid}'">
			        <div>분식류</div>
			        <div>분식류</div>
   				 </div>	
			    <div class="button_base b05_3d_roll" onclick="location.href='order.od?categoryid=4&oid=${oid}'">
			        <div>덮밥류</div>
			        <div>덮밥류</div>
			    </div>
				 <div class="button_base b05_3d_roll" onclick="location.href='order.od?categoryid=5&oid=${oid}'">
			        <div>찌개류</div>
			        <div>찌개류</div>
	   			 </div>
			    <div class="button_base b05_3d_roll" onclick="location.href='order.od?categoryid=6&oid=${oid}'">
			        <div>기타</div>
			        <div>기타</div>
  				  </div>
			</td>
	</tr>	
</table>
	</div></div>
</center>

</body>
</html>
<%@ include file="bottom.jsp"%>