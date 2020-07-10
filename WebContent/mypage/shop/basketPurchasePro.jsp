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
<%@ include file = "/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<h1> Basket Purchase PRO</h1>

<%
	try{
	String id = (String)session.getAttribute("kook_member_id");

	ShopDAO sdao = new ShopDAO();

	MemberDTO mdto = new MemberDTO();
	MemberDAO mdao = new MemberDAO();

	BasketDAO bdao = new BasketDAO();
	
	PurchaseDTO pdto = new PurchaseDTO();
	PurchaseDAO pdao = new PurchaseDAO();
	
	ArrayList<MemberDTO> memList = new ArrayList<MemberDTO>();
	

	List myPurchase = null;
	
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

	int count = 0;

	count = bdao.getBasketCount(id);
	
	// 주문내역에 보여주려고
	if (count > 0) {
		myPurchase = bdao.getBasket(id);
	}
	
	int deliveryCost = Integer.parseInt(request.getParameter("deliveryCost"));
	String deliveryCheck = null;
	if (deliveryCost==0){
		deliveryCheck = "N";
	} else {
		deliveryCheck = "Y";
	}
		
	// 상품 정보 하나씩 가져오기
	
	int purchaseCount = myPurchase.size();
	for (int i=0; i < myPurchase.size(); i++){
		BasketDTO bdto = (BasketDTO)myPurchase.get(i);			
		// pdto에 저장		
		pdto.setId(id);
		pdto.setUserName(name);
		pdto.setPhone(phoneNum);
		pdto.setAddress(request.getParameter("address"));
		pdto.setEmail(email);
		pdto.setComments(request.getParameter("comments"));
		pdto.setProductID(bdto.getProductID());
		pdto.setProductName(bdto.getProductName());
		pdto.setAmount(bdto.getAmount());
		pdto.setPrice(bdto.getPrice());
		pdto.setCard(request.getParameter("card"));
		pdto.setCardNumber1(request.getParameter("cardNumber1"));
		pdto.setCardNumber2(request.getParameter("cardNumber2"));
		pdto.setCardNumber3(request.getParameter("cardNumber3"));
		pdto.setCardNumber4(request.getParameter("cardNumber4"));
		pdto.setInstallment(request.getParameter("installment"));
		pdto.setDeliveryCheck(deliveryCheck);
		pdto.setImage(bdto.getImage());
		pdao.purchaseInsert(pdto);
		
		// 결제 정보 결제 table DB 저장하기
	}
	
	bdao.deleteBasket(id);
	
	response.sendRedirect("/kook/shop/orderList.jsp?purchaseCount="+purchaseCount);
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
