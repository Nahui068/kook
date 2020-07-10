<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.BasketDTO" %>
<%@ page import = "kook.BasketDAO" %>
<%@ include file="/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "dto" class = "kook.BasketDTO" />
<jsp:setProperty property = "*" name = "dto" />

<%
	try{
	BasketDAO dao = new BasketDAO();
	int basketId = Integer.parseInt(request.getParameter("basketId"));
	dto.setBasketId(basketId);

	String id = (String)session.getAttribute("kook_member_id");
	
	dao.deleteBasket(basketId);	

	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
<script language="JavaScript">
	alert("Complete Delete");
	location.href = document.referrer;
</script>