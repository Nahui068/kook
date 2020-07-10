<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/main/top/topAdmin.jsp"%>

<h1>Product_Insert</h1>

<%
	String productID = request.getParameter("productID");
	String productName = request.getParameter("name");
%>
<form action = "productInsertPro.jsp" method="post">
	<table border="1">
	<tr>
		<%if(productID != null){ %>
		<td align="center">제품코드</td> <td><input type="text" name="productID" value="<%= productID %>"></td>
		<%}else{ %>
		<td align="center">제품코드</td> <td><input type="text" name="productID"></td>
		<%}%>
	</tr>
	
	<tr><%
		WarehousingDTO wdto2 = new WarehousingDTO();
		WarehousingDAO wdao2 = new WarehousingDAO();
		
		
		if(productName != null){ %>
		<td align="center">이름</td> <td><input type = "text" name = "name" value="<%= productName %>"></td>
		<%} else{%>
		 <td align="center">이름</td> <td><input type = "text" name = "name"></td>
		 <%}%>
	</tr>
	
	<tr>
		<td align="center">원산지</td> <td><input type="text" name="origin"></td>
	</tr>
	
	<tr>
		<td align="center">유통기한</td><td><input type="text" name="expiration"></td>
	</tr>

	<tr>
		<td align="center">가격</td><td><input type="text" name="price"></td>
	</tr>
	
	<tr>
		<td align="center">수량</td><td><input type="text" name="amount"></td>
	</tr>
	
	<tr >
		<td colspan = "2" align="center">
		<input type="reset"  value="rewrite"/>
		<input type="submit" value="finish"/> 
		</td>
	</tr>
	
	</table>
</form>
 