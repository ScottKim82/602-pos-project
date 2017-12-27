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
<link rel="stylesheet" href="/resources/demos/style.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css" />
<script type="text/javascript">
function prodInsert(){
	window.open("ProductInput.jsp", "NewWindow2", "width=400, height=230, menubar=no, scrollbars=no, status=no, toolbar=no, location=no, top=300, left=600");	
}

function productlist() {
	location.href = "productlist.pd";
}
</script>
<style>

  @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      body { font-family: 'Nanum Pen Script', cursive;
		font-size:x-large;
}

.back{
	
	position:relative;
	margin: 20px;
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
	left:170px;
	top: 110px;	
	overflow: scroll;
}

.ta{
	margin-top: 80px;
}


.td1{
	width: 700px;
	padding-right: 30px;
	}

.button_base {
    border: 0;
    font-size: 25px;
    position: relative; 
    top: 50%;   
    margin-top: -60px;
    margit-right: 10px;
    width: 200px;
    height: 25px;    
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
    width: 50%;
    height: 50px;
    padding: 10px;
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

a.no-uline { text-decoration:none }



/*product */
.btn {
	border: none;
	font-size: inherit;
	color: inherit;
	background: none;
	cursor: pointer;
	padding: 15px 15px;
   	width:150px;
   	height:60px;
	display: inline-block;
	margin: 5px 5px; 
 	text-transform: uppercase;
	letter-spacing: 1px;
	font-weight: 700;
	outline: none;
	position: relative;
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	transition: all 0.3s;
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
	border-radius: 0 0 5px 5px;
}

.btn-2a:hover {
	box-shadow: 0 4px #8c8c8c;
	top: 2px;
}

.btn-2a:active {
	box-shadow: 0 0 #8c8c8c;
	top: 6px;
}

/*price*/
.button5 {
  	width:100px;
 	 height:30px;
    border: none;
    color: white;
    text-align: center;
    text-decoration: none;
    font-size: 20px;
    color: black;
}



/*product add  */

.add{
   border: none;
   font-family: inherit;
   font-size: inherit;
   color: inherit;
   background: none;
   cursor: pointer;   
    padding: 25px 25px 25px 25px;
   display: inline-block;
    margin: 20px 30px 15px 50px;
   width:100px;
   height:100px;
   
   text-transform: uppercase;
   letter-spacing: 3px;
   font-weight: 700;
   outline: none;
   position: relative;
   -webkit-transition: all 0.3s;
   -moz-transition: all 0.3s;
   transition: all 0.3s;
}


.add:after {
   content: '';
   position: absolute;
   z-index: -1;
   -webkit-transition: all 0.3s;
   -moz-transition: all 0.3s;
   transition: all 0.3s;
}

.add-4 {
   border-radius: 50px;
   border: 3px solid #337ab7;
   color: #337ab7;
   overflow: hidden;
}

.add-4:active {
   border-color: #337ab7;
   color: #fff;
}

.add-4:hover {
   background: #337ab7;
   color: #fff;
}

.add-4:before {
   position: absolute;
   height: 100%;
   font-size: 125%;
   line-height: 3.5;
   color: #337ab7;
   -webkit-transition: all 0.3s;
   -moz-transition: all 0.3s;
   transition: all 0.3s;
}

.add-4:active:before {
   color: #337ab7;
}


.add-4c:before {
   left: 40%;
   opacity: 0;
   top: 0;
}

.add-4c:hover:before {
   left: 60%;
   opacity: 1;
}
.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #54a3f7;
	-webkit-box-shadow:inset 0px 1px 0px 0px #54a3f7;
	box-shadow:inset 0px 1px 0px 0px #54a3f7;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #007dc1), color-stop(1, #0061a7));
	background:-moz-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-webkit-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-o-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:-ms-linear-gradient(top, #007dc1 5%, #0061a7 100%);
	background:linear-gradient(to bottom, #007dc1 5%, #0061a7 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#007dc1', endColorstr='#0061a7',GradientType=0);
	background-color:#007dc1;
	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:5px;
	border:1px solid #124d77;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-size:20px;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #154682;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #0061a7), color-stop(1, #007dc1));
	background:-moz-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-webkit-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-o-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:-ms-linear-gradient(top, #0061a7 5%, #007dc1 100%);
	background:linear-gradient(to bottom, #0061a7 5%, #007dc1 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#0061a7', endColorstr='#007dc1',GradientType=0);
	background-color:#0061a7;
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
			<table class="ta" align="left">
						<tr>
				<td align="center" valign="top">
						  <div class="button_base b05_3d_roll" onclick="productlist();">
						        <div>전체메뉴</div>
						        <div>전체메뉴</div>
						    </div>
							<br><br><br>		
						    <div class="button_base b05_3d_roll" onclick="location.href='productlist.pd?categoryid=1'">
						        <div>밥류</div>
						        <div>밥류</div>
						    </div>
								<br><br><br>
							
						    <div class="button_base b05_3d_roll" onclick="location.href='productlist.pd?categoryid=2'">
						        <div>면류</div>
						        <div>면류</div>
						    </div>
						    <br>	<br><br>
								
									
						    <div class="button_base b05_3d_roll" onclick="location.href='productlist.pd?categoryid=3'">
						        <div>분식류</div>
						        <div>분식류</div>
						    </div>
						    
						    <br><br><br>	
								
						    <div class="button_base b05_3d_roll" onclick="location.href='productlist.pd?categoryid=4'">
						        <div>덮밥류</div>
						        <div>덮밥류</div>
						    </div>
						    
						    <br><br><br>
						    
						    
						    <div class="button_base b05_3d_roll" onclick="location.href='productlist.pd?categoryid=5'">
						        <div>찌개류</div>
						        <div>찌개류</div>
						    </div>
								<br><br><br>
								
								
						    <div class="button_base b05_3d_roll" onclick="location.href='productlist.pd?categoryid=6'">
						        <div>기타</div>
						        <div>기타</div>
						        
						      
						    </div>
						    </td>
								</tr>		
					</table>	
			
				<table>
					<tr>
				<td>
				<table>
					<tr><td class="td1" colspan="3" align="right">  
					<button  class="myButton" value="상품추가" onclick="prodInsert()">상품추가</button></td></tr>
				</table>
					<table>							
						<c:forEach items="${lists}" var="prodlists" varStatus="status">
								<c:if test="${status.index%4==0}">
									</tr><tr>
								</c:if>
							<td colspan="3" align="center">
								<button type="button"  class="btn btn-2 btn-2a" value="${prodlists.productname}" onclick="location.href='prodUpdate.pd?pname=${prodlists.productname}&price=${prodlists.price}&num=${prodlists.num}'">${prodlists.productname}</button><br>
								<button type="button" class="button5" value="${prodlists.price}" onclick="location.href='prodUpdate.pd?pname=${prodlists.productname}&price=${prodlists.price}&num=${prodlists.num}'">${prodlists.price}원</button><br>
							</td>
						</c:forEach>	
					</table>	
				</td></tr>
			</table>
</div>
</div>
</center>
</body>
</html>