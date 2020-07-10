<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.PurchaseDTO" %>
<%@ page import = "kook.PurchaseDAO" %>
<%@ page import = "kook.BasketDTO" %>
<%@ page import = "kook.BasketDAO" %>
<%@ page import = "kook.WarehousingDAO"%>
<%@ page import = "kook.WarehousingDTO"%>
<%@ page import = "kook.StockDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
	PurchaseDTO pdto = new PurchaseDTO();
	PurchaseDAO pdao = new PurchaseDAO();
	
	BasketDAO bdao = new BasketDAO();
	
	WarehousingDAO whdao = new WarehousingDAO();
	
	int purchaseID = Integer.parseInt(request.getParameter("purchaseID"));
	String productID = request.getParameter("productID");
	pdto.setPurchaseID(purchaseID);
	
	
	String id = (String)session.getAttribute("kook_member_id");
	int amount = Integer.parseInt(request.getParameter("amount"));
	pdao.updateRelease(purchaseID);
	
	List stockList = null;
	stockList = whdao.getStock(productID);

		for (int j=0; j < stockList.size(); j++){
				StockDTO stdto = (StockDTO)stockList.get(j);

				int stock = stdto.getAmount()- amount;
				whdao.updateAmount(productID,stock);
		}
	}catch(Exception e){	
		response.sendRedirect("/kook");	}
%>
<script language="JavaScript">
	alert("상품이 출고되었습니다!");
	location.href = document.referrer;
</script>