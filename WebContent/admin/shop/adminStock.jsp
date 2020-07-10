<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	include file = "/main/top/topAdmin.jsp" %>
<%@ page import = "kook.StockDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "kook.WarehousingDAO" %>

<style>
	a.link:hover {text-decoration: underline; color: blue;}
</style>

<script>
	function Order_click() {
		
		if(confirm("입고")){
			return true;
		}
		else{
			return false;
		}
	}
</script>
 
<% 
	WarehousingDAO wdao2 = new WarehousingDAO();
	StockDTO stdto2 = new StockDTO();
	List stockList2 = null;
	
	stockList2 = wdao2.getStock(); %>
	<table align = "center" border = "1">
	<tr>
		<th>productID</th><th>name</th>
		<th>amount</th><th>order</th>
	</tr>
<% 
	for (int i = 0; i < stockList2.size(); i++) {
		stdto2 = (StockDTO)stockList2.get(i); %>

			<%	if (stdto2.getAmount() <= 10) {	%>
					
			<tr>
				<td align = "center"><%= stdto2.getProductID() %></td>
				<td align = "center"><%= stdto2.getName() %></td>
				<td align = "center"><%= stdto2.getAmount() %></td>
				<td align = "center"><a class = "link" onclick = "return Order_click();"
				href="/kook/admin/shop/productInsertForm.jsp?productID=<%=stdto2.getProductID()%>&name=<%=stdto2.getName()%>"> order</a></td>
			</tr>
			<%	}
	} %>
	</table>
	
