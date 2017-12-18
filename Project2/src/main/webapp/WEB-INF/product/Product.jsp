<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
<%@ include file="./../order/top.jsp"%>  

<%String context = request.getContextPath()+"/WEB-INF/product"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.btn-warning {
    -webkit-appearance: button;
    color: #111;
    background-color: #FF851B;
    border-color: #FF851B;
    -webkit-appearance: button;
    border-style: solid;
    border-width: 0 1px 4px 1px;
    font-size: 12px;
    font-weight: bold;
    text-transform: uppercase;
        display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 0.875rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    margin: 0;
    
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    font-family: inherit;
        overflow: visible;
            touch-action: manipulation;
                box-sizing: border-box;
                width:100px; 
                height:70px; 
}

.btn-warning2 {
    -webkit-appearance: button;
    color: #111;
    background-color: #ffbf80;
    border-color: #FF851B;
    -webkit-appearance: button;
    border-style: solid;
    border-width: 0 1px 4px 1px;
    font-size: 12px;
    font-weight: bold;
    text-transform: uppercase;
        display: inline-block;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 1px solid transparent;
    padding: 0.375rem 0.75rem;
    font-size: 0.875rem;
    line-height: 1.5;
    border-radius: 0.25rem;
    margin: 0;
    
    transition: background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
    font-family: inherit;
        overflow: visible;
            touch-action: manipulation;
                box-sizing: border-box;
                width:100px; 
                height:30px; 
}

.btn-warning {
    border-color: #ff7702;
    color: #fff;
}

a.no-uline { text-decoration:none }

</style>

<script type="text/javascript">
function prodInsert(){
	window.open("ProductInput.jsp", "NewWindow2", "width=500, height=500, menubar=no, scrollbars=no, status=no, toolbar=no");	
}
</script>
</head>
<body>
<table align="center">
<tr><td>
 	<table width="750">
		<tr>
			<td><a class="no-uline" href="productlist.pd"><button type="button" class="btn btn-outline-secondary">전체메뉴</button></a></td>
			<td><a class="no-uline" href="productlist.pd?categoryid=1"><button type="button" class="btn btn-outline-secondary">밥류</button></a></td>
			<td><a  class="no-uline" href="productlist.pd?categoryid=2"><button type="button" class="btn btn-outline-secondary">면류</button></a></td>
			<td><a  class="no-uline"href="productlist.pd?categoryid=3"><button type="button" class="btn btn-outline-secondary">분식류</button></a></td>
			<td><a  class="no-uline"href="productlist.pd?categoryid=4"><button type="button" class="btn btn-outline-secondary">덮밥류</button></a></td>
			<td><a  class="no-uline"href="productlist.pd?categoryid=5"><button type="button" class="btn btn-outline-secondary">찌개류</button></a></td>
			<td><a  class="no-uline"href="productlist.pd?categoryid=6"><button type="button" class="btn btn-outline-secondary">기타</button></a></td>
			<td align="right"><input type="button" value="상품추가" onclick="prodInsert()"></td>
		</tr>
	</table>	
	<br><br>
</td>

</tr><tr><td>
	<table width="750">
		<c:forEach items="${lists}" var="prodlists" varStatus="status">
				<c:if test="${status.index%6==0}">
					</tr><tr>
				</c:if>
			<td colspan="3" align="center">
				<button type="button" class="btn btn-warning" value="${prodlists.productname}" onclick="location.href='prodUpdate.pd?pname=${prodlists.productname}&price=${prodlists.price}&num=${prodlists.num}'">${prodlists.productname}</button><br>
				<button type="button" class="btn btn-warning2" value="${prodlists.price}" onclick="location.href='prodUpdate.pd?pname=${prodlists.productname}&price=${prodlists.price}&num=${prodlists.num}'">${prodlists.price}원</button><br>
			</td>
		</c:forEach>	
	</table>
</td></tr>
</table>

</body>
</html>