<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "kook.ShopDAO" %>
<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
</head>

<script>
	function check_onclick() {
		var frm1 = document.frm1;
		var name = frm1.name.value;
		var content = frm1.content.value;
		var origin = frm1.origin.value;
		var expiration = frm1.expiration.value;
		var storage = frm1.storage.value;
		var price = frm1.price.value;
		
		if(!name || !content || !origin || !expiration || !storage || !price) {
			alert("빈칸없이 작성하세요.");
		}
		else {
			frm1.submit();
		}
	}
</script>

<%
try {
	String productID = request.getParameter("productID");
	String pageNum = request.getParameter("pageNum");
	
	
		ShopDAO sdao = new ShopDAO();
		ShopDTO sdto = sdao.updateGetProduct(productID);
%>
<body>
	<center><b>Product modify</b></center>
<br>
<form method = "post" name = "frm1" action = "shopListModifyPro.jsp?productID=<%= productID %>&pageNum=<%= pageNum %>">
	<table width="400" border="1" cellspacing="0" cellpadding="0" align="center">
  		<tr>
    		<td  width = "70" align = "center">Name</td>
    		<td align = "left" width = "330">
       			<input type = "text" size = "45" maxlength = "20" name = "name" value = "<%= sdto.getName() %>">
	    	</td>
	    </tr>
  		
  		<tr>
  			<td align = "center">Image</td>
  			<td><img src = "/kook/image/<%= sdto.getImage() %>" style = "width: 300px; height: auto;"></td>
  		</tr>
  		
  		<tr>
   	 		<td  width = "70" align = "center" >Content</td>
    		<td align = "left" width = "330">
        		<textarea name = "content" rows = "5" cols = "42" style = "resize: none;"><%= sdto.getContent() %></textarea> 
        	</td>
  		</tr>
  		
  		<tr>
    		<td  width = "70" align = "center">Origin</td>
    		<td align = "left" width = "330">
       		<input type = "text" size = "45" maxlength = "20" name = "origin" value = "<%= sdto.getOrigin() %>"></td>
	    </tr>
  		
  		<tr>
    		<td  width="70" align="center">Expiration</td>
    		<td align="left" width="330">
        	<input type="text" size = "45" maxlength="10" name="expiration" value="<%=sdto.getExpiration()%>"></td>
		</tr>
		
		<tr>
    		<td  width = "70" align = "center">Storage</td>
    		<td align = "left" width = "330">
       		<input type = "text" size = "45" maxlength = "20" name = "storage" value = "<%= sdto.getStorage() %>"></td>
	    </tr>
  		
  		<tr>
    		<td  width = "70" align = "center">Price</td>
    		<td align = "left" width = "330">
       		<input type = "text" size = "45" maxlength = "10" name = "price" value = "<%= sdto.getPrice() %>"></td>
	    </tr>
	    
  		<tr>      
   			<td colspan=2 align="center"> 
     			<input type="button" value="Modify" onclick = "check_onclick()">  
				<input type="reset" value="Rewrite">
     		</td>
		</tr>
	</table>
</form>	
<% 	
}catch(Exception e){	response.sendRedirect("/kook");	}
	%>
</body>
</html>