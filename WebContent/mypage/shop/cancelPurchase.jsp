<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.PurchaseDTO" %>
<%@ page import = "kook.PurchaseDAO" %>
<%@ include file = "/main/top/topMypage.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "dto" class = "kook.PurchaseDTO"/>
<jsp:setProperty property ="*" name="dto" />

<%
	try{
	PurchaseDAO pdao = new PurchaseDAO();
	int purchaseID = Integer.parseInt(request.getParameter("purchaseID"));
	dto.setPurchaseID(purchaseID);
	
	pdao.cancelPurchase(purchaseID);
	
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>

<script>
	alert("Cancel your product order");
	location.href = document.referrer;
</script>