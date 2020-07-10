<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.PurchaseDTO" %>
<%@ page import = "kook.PurchaseDAO" %>
<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
	PurchaseDTO pdto = new PurchaseDTO();
	PurchaseDAO pdao = new PurchaseDAO();
	
	int purchaseID = Integer.parseInt(request.getParameter("purchaseID"));
	pdto.setPurchaseID(purchaseID);
	
	pdao.updateStartDelivery(purchaseID);

	}catch(Exception e){	response.sendRedirect("/kook");	}
%>

<script language="JavaScript">
	alert("상품 배송을 시작합니다!");
	location.href = document.referrer;
</script>