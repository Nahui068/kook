<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberDAO" %>
<%@ page import = "kook.MemberDTO" %>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "kook.BasketDTO" %>
<%@ page import = "kook.BasketDAO" %>
<%@ page import = "kook.PurchaseDTO" %>
<%@ page import = "kook.PurchaseDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>
<%@ include file = "/main/top/top.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
		try{
	String id = (String)session.getAttribute("kook_member_id");

	ShopDTO sdto = new ShopDTO();
	ShopDAO sdao = new ShopDAO();


	MemberDTO mdto = new MemberDTO();
	MemberDAO mdao = new MemberDAO();

	
	PurchaseDTO pdto = new PurchaseDTO();
	PurchaseDAO pdao = new PurchaseDAO();
	

	ArrayList<MemberDTO> memList = new ArrayList<MemberDTO>();

	// 멤버 정보 갖고 오기 
	memList = mdao.Info_member(id);
	for(int i =0; i < memList.size(); i++){
		mdto = memList.get(i); 
	}
	
	// id로 member정보 검색해서 담기 
	String name = mdto.getName();
	String phoneNum = mdto.getPhNum();
	String email = mdto.getEmail();	
	
	
	// basket에 있는 장바구니 정보 검색


	
	int deliveryCost = Integer.parseInt(request.getParameter("deliveryCost"));
	String deliveryCheck = null;
	if (deliveryCost==0){
		deliveryCheck = "N";
	} else {
		deliveryCheck = "Y";
	}
	
	
	// 상품 정보 하나씩 가져오기

					
		// pdto에 저장	
		pdto.setId(id);
		pdto.setUserName(name);
		pdto.setPhone(phoneNum);
		pdto.setAddress(request.getParameter("address"));
		pdto.setEmail(email);
		pdto.setComments(request.getParameter("comments"));
		pdto.setProductID(request.getParameter("productID"));
		pdto.setProductName(request.getParameter("productName"));
		pdto.setAmount(Integer.parseInt(request.getParameter("amount")));
		pdto.setPrice(Integer.parseInt(request.getParameter("price")));
		pdto.setCard(request.getParameter("card"));
		pdto.setCardNumber1(request.getParameter("cardNumber1"));
		pdto.setCardNumber2(request.getParameter("cardNumber2"));
		pdto.setCardNumber3(request.getParameter("cardNumber3"));
		pdto.setCardNumber4(request.getParameter("cardNumber4"));
		pdto.setInstallment(request.getParameter("installment"));
		pdto.setImage(request.getParameter("image"));
		pdto.setDeliveryCheck(deliveryCheck);
		pdao.purchaseInsert(pdto);
		
		
		// 결재 정보 결제 table DB 저장하기
		
		int purchaseCount = 1;
	
	
	response.sendRedirect("orderList.jsp?purchaseCount="+purchaseCount);
		}catch(Exception e){	response.sendRedirect("/kook");	}
%>
