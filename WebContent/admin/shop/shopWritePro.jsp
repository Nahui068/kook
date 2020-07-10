<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
	ShopDTO sdto = new ShopDTO();

	String uploadDir = request.getRealPath("image");
	
	int maxSize = 1024 * 1024 * 10;
	String encoding = "UTF-8";
	
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest multi = new MultipartRequest(request, uploadDir, maxSize, encoding, dp);
	
	sdto.setProductID(multi.getParameter("productID"));
	sdto.setName(multi.getParameter("name"));
	sdto.setImage(multi.getFilesystemName("image"));
	sdto.setContent(multi.getParameter("content"));
	sdto.setOrigin(multi.getParameter("origin"));
	sdto.setExpiration(multi.getParameter("expiration"));
	sdto.setStorage(multi.getParameter("storage"));
	
	int price = Integer.parseInt(multi.getParameter("price"));
	sdto.setPrice(price);
	
	new ShopDAO().shop_upload(sdto);
	
	response.sendRedirect("/kook/shop/shopContent.jsp?productID="+sdto.getProductID());
	
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
