<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ShopDAO" %>
<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="sdto" scope = "page" class = "kook.ShopDTO">
	<jsp:setProperty name = "sdto" property = "*" />
</jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<% 
	try{
	String pageNum = request.getParameter("pageNum");
	
	ShopDAO sdao = new ShopDAO();
	boolean check = sdao.updateProduct(sdto);
	
	if(check == true) {
%>
	<meta http-equiv = "Refresh" content = "0;url=shopList.jsp?pageNum=<%= pageNum %>" >
<% } 
	else { %>
		<script>
			alert("Modify failed..");
			history.go(-1);
		</script>
<%	
		} 
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
</body>
</html>