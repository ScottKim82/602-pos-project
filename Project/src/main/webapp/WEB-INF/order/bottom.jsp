<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
function sales(sales){
	location.href="dailey.pm?sales="+sales;	
}
</script> 
</td>
</tr>

<tr height=40>
<td colspan="3" align="center">
<input type="button" id="dailey" value="일일결산" onclick="sales(this.id)">
<input type="button" id="month" value="월결산" onclick="sales(this.id)">
<input type="button" id="end" value="마감정산" onclick="sales(this.id)">
</form>
</td>
</tr>
	</table>

	</body>