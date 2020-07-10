<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.BasketDAO" %>
<%@ page import = "kook.BasketDTO" %>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ include file="/main/top/top.jsp"%>

<% request.setCharacterEncoding("utf-8"); %>

<h1> ShopBasketPro </h1>

<%	
		try{
		BasketDTO bdto = new BasketDTO();
		String id = (String)session.getAttribute("kook_member_id");
		
		bdto.setId(id);	
		bdto.setProductID(request.getParameter("productID"));
		bdto.setProductName(request.getParameter("productName"));
		bdto.setAmount(Integer.parseInt(request.getParameter("amount")));
		bdto.setPrice(Integer.parseInt(request.getParameter("price")));
		bdto.setImage(request.getParameter("image"));
	
		new BasketDAO().basketInsert(bdto); // 받아온 값 db저장
		response.sendRedirect("/kook/mypage/shop/myBasketList.jsp?id="+id);	
		}catch(Exception e){	response.sendRedirect("/kook");	}
%>		

	
