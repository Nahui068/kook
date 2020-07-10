<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberServiceDAO" %>
<%@ page import = "kook.MemberServiceDTO" %>
<%@ page import = "kook.PurchaseDAO" %>
<%@ page import = "kook.PurchaseDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file = "/main/top/topAdmin.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<h1><center>Order List(Admin)</center></h1>

<%
	try{
	int count = 0;
	int number = 0;
	
	List plist = null;
	PurchaseDAO pdao = new PurchaseDAO();
		
	String id = (String)session.getAttribute("kook_member_id");
	
	count = pdao.getPurchaseCount();
	if(count>0){
		plist = pdao.getPurchase();
	}
	
	number = count;

	
 	sdf = new SimpleDateFormat("yyyy-MM-dd");
 %>

<html>
<head> 
<title> Order LIst(Admin) </title>
</head>
<body> 


<%
	if (count ==0){
%>
<table align = "center"> 
	<tr>
		<td align = "center"> 
	</tr>
</table>

<%	} else { %>
<table border="1" width = "1200" cellpadding = "0" cellspacing ="0" align = "center">
	<tr> 
		<td align = "center"> Number </td>
		<td align = "center"> Purchase ID </td>
		<td align = "center"> ID </td>
		<td align = "center"> Image </td>
		<td align = "center"> ProductID </td>
		<td align = "center"> Product Name </td>
		<td align = "center" > Amount </td>
		<td align = "center" > Price </td>
		<td align = "center" > Order Date </td>
		<td align = "center" > Status Check</td>
		<td align = "center" > Cancel </td>
		<td align = "center" > Status </td> 	
		
	</tr>
	
<%
		for (int i = 0; i < plist.size(); i++ ){
			PurchaseDTO pdto = (PurchaseDTO)plist.get(i);
%>	
	<tr> 
		<td align = "center" > <%=number--%> </td>
		<td align = "center" > <%=pdto.getPurchaseID() %>
		<td align = "center"> <%=pdto.getId() %> </td>
		<td align = "center" >
			<%
				if(pdto.getImage()!=null){%>
					<img src = "/kook/image/<%=pdto.getImage() %>" width = "100" height= "100" >			
			<%	}%>
		</td>
		<td align = "center"> <%=pdto.getProductID() %> </td>
		
		<td align = "center"> <%=pdto.getProductName() %> </td>
		<td align = "center" > <%=pdto.getAmount()%> </td>
		<td align = "center" > <%=pdto.getPrice() %> </td>
		<td align = "center" > <%=sdf.format(pdto.getPurchase_date())%>
		<td align = "center" > <%=pdto.getStatus() %>
		<td align = "center" width="15%"> 
		<%
		if(pdto.getOrderCancel().equals("N")){ %>
		<input type = "button" name = "cancel_order" value = "cancel_order" onClick = "window.location= 'cancelPurchaseAdmin.jsp?purchaseID=<%=pdto.getPurchaseID()%>'"/>
		<%}else{%>
		Canceled
		<%}%>
		</td>
		<td align = "center"> 
		<%
		if(pdto.getStatus().equals("Preparing")){%>
		<input type = "button" name = "release_Product" value = "release_Product" onClick = "window.location = 'releasePro.jsp?purchaseID=<%=pdto.getPurchaseID()%>&productID=<%=pdto.getProductID() %>&amount=<%= pdto.getAmount() %>'" />
		<%}else if(pdto.getStatus().equals("Released")){%>
		<input type = "button" name = "start_delivery" value = "start_delivery" onClick = "window.location = 'startDeliveryPro.jsp?purchaseID=<%=pdto.getPurchaseID()%>'" />
		<%}else if(pdto.getStatus().equals("Start_Delivery")){%>
		<input type = "button" name = "Complete_delivery" value = "Complete_delivery" onClick = "window.location = 'completeDeliveryPro.jsp?purchaseID=<%=pdto.getPurchaseID()%>'" />
		<%}else if(pdto.getStatus().equals("Complete_Delivery")){%>
		Complete Delivery
		<%}else if(pdto.getOrderCancel().equals("Y")){%>
		Canceled
		<%} %>
		</td>
	</tr>
	<% }
	}%>
</table>
</body>
</html>

<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>