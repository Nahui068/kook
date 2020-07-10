<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberServiceDAO" %>
<%@ page import = "kook.MemberServiceDTO" %>
<%@ page import = "kook.PurchaseDAO" %>
<%@ page import = "kook.PurchaseDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file = "/main/top/topMypage.jsp" %>

<br /><br />


<%
	try{
	int count = 0;
	int number = 0;
	
	List myPurchase = null;
	PurchaseDAO pdao = new PurchaseDAO();
		
	String id = (String)session.getAttribute("kook_member_id");
	
	count = pdao.getPurchaseCount(id);
	if(count>0){
		myPurchase = pdao.getPurchase(id);
	}
	
	number = count;
 %>

<html>
<head> 
<title> my Order List </title>
</head>
<body> 
<center><b> MY ORDER LIST : <%=id%> (총 구매: <%=count%>)</b></center>

<%
	if (count ==0){
%>
<table align = "center"> 
	<tr>
		<td align = "center"> There's no ordered product. </td>
	</tr>
</table>

<%	} else { %>

<table border="1" width = "1200" cellpadding = "0" cellspacing ="0" align = "center">
	<tr> 
		<td align = "center"> Number </td>
		<td align = "center"> Purchase ID </td>
		<td align = "center"> Image </td>
		<td align = "center"> ProductID </td>
		<td align = "center"> Product Name </td>
		<td align = "center" > Amount </td>
		<td align = "center" > Price </td>
		<td align = "center" > Order Date </td>
		<td align = "center" > Status </td>
		<td align = "center" > Cancel </td>
	</tr>
	<%
		for (int i = 0; i < myPurchase.size(); i++ ){
			PurchaseDTO pdto = (PurchaseDTO)myPurchase.get(i);
	%>
	
	<tr> 
		<td align = "center" > <%=number--%> </td>
		<td align = "center" > <%=pdto.getPurchaseID() %>
		<td align = "center" >
			<%
				if(pdto.getImage()!=null){%>
					<img src = "/kook/image/<%=pdto.getImage() %>" width = "100" height= "100" >			
			<%	}%>
		</td>
		<td align = "center"> <%=pdto.getProductID() %> </td>
		<td align = "center"> <%=pdto.getProductName() %> </td>
		<td align = "center" > <%=pdto.getAmount()%> </td>
		<td align = "center" > <%=pdto.getPrice()%> </td>
		<td align = "center" > <%=sdf.format(pdto.getPurchase_date())%></td>
		<td align = "center" >
			<%
			if(pdto.getStatus().equals("Preparing")){%>
				<%=pdto.getStatus()%> 
			<%}else if(pdto.getStatus().equals("Released")){%>
				<%=pdto.getStatus()%>
			<%}else if(pdto.getStatus().equals("Start_Delivery")){%>
				<%=pdto.getStatus() %> <br />
				<input type = "button" name = "Complete_delivery" value = "Complete_Delivery" onClick = "window.location = '/kook/admin/shop/completeDeliveryPro.jsp?purchaseID=<%=pdto.getPurchaseID()%>'" />
			<%}else if(pdto.getOrderCancel().equals("Y")){%>
			Canceled
			<%} %>
		</td>		
		<td align = "center" width="15%"> 
			<%if(pdto.getStatus().equals("Preparing")){ %>
			<input type = "button" name = "cancel_order" value = "cancel_order" onClick = "window.location= 'cancelPurchase.jsp?purchaseID=<%=pdto.getPurchaseID()%>'"/>
			<%}else{%>
			Impossible<%}%>
		</td>
	</tr>
	<% }
	}
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
</table>
<br />
<br />
<br />
</body>
</html>