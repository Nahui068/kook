<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>

<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int pageSize = 10;

	try{
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage - 1) * pageSize + 1;
	int end = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List prodList = null;
	ShopDAO sdao = new ShopDAO();
	ShopDTO sdto = new ShopDTO();
	
	count = sdao.getShop_count();
	
	String id = main_id;
	
	if (count > 0) {
		prodList = sdao.getShopList(start, end);
	}
%>

<body>
	<center><b>재료 목록 (전체 재료 : <%= count %>)</b>
	<input type = "button" name = "write" value = "write" onClick = "location.href = '/kook/admin/shop/shopWriteForm.jsp' " />
	</center><br>
<%
	if (count == 0) {
%>
<table width="700" border="1" cellpadding="0" cellspacing="0" align = "center">
<tr>
    <td align="center">
    	저장된 식재료가 없습니다.
    </td>
</tr>
</table>
<%
    } else {
%>    
	<table border = "1" align = "center" width = "700" cellpadding = "0"> 
		<tr height = "30" style = "background-color:pink;">
			<td align = "center" width = "150">Product ID</td>
			<td align = "center" width = "100">Name</td>
			<td align = "center" width = "400">Content</td>
			<td align = "center" width = "100">Origin</td>
			<td align = "center" width = "100">Expiration</td>
			<td align = "center" width = "150">Storage</td>
			<td align = "center" width = "100">Price</td>
			<td align = "center" width = "100">Modify</td>
			<td align = "center" width = "100">Delete</td>
		</tr>
		
		
	<%
		for (int i = 0; i < prodList.size(); i++) {
			sdto = (ShopDTO)prodList.get(i);
	%>		
	
	<tr>
		<td align="center"><%= sdto.getProductID() %></td>
		<td align="center"><a href = "/kook/shop/shopContent.jsp?productID=<%= sdto.getProductID() %>&pageNum=<%=currentPage%>"><%= sdto.getName() %></a></td>
		<td align="center"><%= sdto.getContent() %></td>
		<td align="center"><%= sdto.getOrigin() %></td>
		<td align="center"><%= sdto.getExpiration() %></td>
		<td align="center"><%= sdto.getStorage() %></td>
		<td align="center"><%= sdto.getPrice() %></td>
		<td align="center"><a href = "shopModifyForm.jsp?productID=<%=sdto.getProductID()%>&pageNum=<%=currentPage%>">Modify</a></td>
		<td align="center"><a href = "shopListDeleteForm.jsp?productID=<%=sdto.getProductID()%>&pageNum=<%=currentPage%>">Delete</a></td>
	</tr>
				
		<%
			}
    }
		%>
	</table>
<br>
<center>
<%
    if (count > 0) { //페이지번호 계산
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="shopListAdmin.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="shopListAdmin.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="shopListAdmin.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</center>
</body>
</html>
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>