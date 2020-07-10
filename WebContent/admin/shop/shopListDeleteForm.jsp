<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "kook.ShopDTO" %>
<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String productID = request.getParameter("productID");
	String pageNum = request.getParameter("pageNum");
	
	ShopDAO sdao = new ShopDAO();
	ShopDTO sdto = sdao.updateGetProduct(productID);
%>

<body>
	<center><b>Product delete</b></center>
	<br>
	<form method = "post" action = "shopDeletePro.jsp?productID=<%= productID %>&pageNum=<%= pageNum %>">
		<table width="400" height = "300" border="1" cellspacing="0" cellpadding="0" align="center">
  		<tr>
    		<td  width = "70" align = "center">Name</td>
    		<td align = "left" width = "330">&nbsp;&nbsp;<%= sdto.getName() %></td>
	    </tr>
  
  		<tr>
   	 		<td  width = "70" align = "center" >Content</td>
    		<td align = "left" width = "330">&nbsp;&nbsp;<%= sdto.getContent() %></td>
  		</tr>
  		
  		<tr>
    		<td  width = "70" align = "center">Origin</td>
    		<td align = "left" width = "330">&nbsp;&nbsp;<%= sdto.getOrigin() %></td>
	    </tr>
  		
  		<tr>
    		<td  width="70" align="center">Expiration</td>
    		<td align="left" width="330" align = "center">&nbsp;&nbsp;<%=sdto.getExpiration()%></td>
		</tr>
		
		<tr>
    		<td  width = "70" align = "center">Storage</td>
    		<td align = "left" width = "330">&nbsp;&nbsp;<%= sdto.getStorage() %></td>
	    </tr>
  		
  		<tr>
    		<td  width = "70" align = "center">Price</td>
    		<td align = "left" width = "330">&nbsp;&nbsp;<%= sdto.getPrice() %></td>
	    </tr>
	    
  		<tr>      
   			<td colspan=2 align="center"> 
     			<input type="submit" value="Delete" >
     		</td>
		</tr>
	</table>
	</form>
</body>