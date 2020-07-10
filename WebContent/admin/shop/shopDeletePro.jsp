<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ShopDAO" %>
<%@ include file = "/main/top/topAdmin.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
		String productID = request.getParameter("productID");
		String pageNum = request.getParameter("pageNum");
		
		ShopDAO sdao = new ShopDAO();
		boolean check = sdao.deleteProduct(productID);
		
		if (check == true) {
		%>
				<script>
					alert("Delete success!");
				</script>
				<meta http-equiv = "Refresh" content = "0;url=shopListAdmin.jsp?pageNum=<%= pageNum %>" >
		<% } else { %>
				<script>
					alert("Delete failed...");
					history.go(-1);
				</script>
		<% } 
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>