<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "kook.MemberDTO" %>
<%@ page import = "kook.MemberDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ include file = "/main/top/top.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Page</title>
</head>

<% 
	try{
	MemberDTO mdto = new MemberDTO();
	MemberDAO mdao = new MemberDAO();
	
	String productID = request.getParameter("productID");
	
	ShopDTO sdto = new ShopDTO();
	ShopDAO sdao = new ShopDAO();
	sdto =  sdao.getShop(productID);
	
	ArrayList<MemberDTO> memList = new ArrayList<MemberDTO>();
	ArrayList<ShopDTO> prodList = new ArrayList<ShopDTO>();

	String kook_id = (String)session.getAttribute("kook_member_id"); 
		
	memList = mdao.Info_member(kook_id);
	
	for (int i = 0; i < memList.size(); i++) {
		mdto = memList.get(i);
	}
	
	int amount = Integer.parseInt(request.getParameter("amount"));
	String image = request.getParameter("image");
	int price = Integer.parseInt(request.getParameter("price"));
	int deliveryCost=0;

%>

<body>
	<br /> <br />
	<table align = "center">
		<tr><td><h2 >User Info</h2></td>
		</tr>
		<tr>
			<td>User ID</td>
			<td><%= mdto.getId()%></td>
		</tr>
		<tr>
			<td>User Name</td>
			<td><%= mdto.getName()%></td>
		</tr>
		<tr>
			<td>Phone Number</td>
			<td><%= mdto.getPhNum()%></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><%= mdto.getEmail()%></td>
		</tr>
		<form method = "post" name = "BasketPurchase" action="/kook/shop/shopPurchasePro.jsp">
		<tr>
			<td>Delivery Address</td>
			<td><input type = "text" name = "address" style = "width:300px;"/></td>	
		</tr>
		<tr>
			<td>Delivery Comments</td>
			<td><input type = "text" name = "comments" style = "width:300px;" required /></td>	
		</tr>
		<tr>
			<td></td>
		</tr>	
	
		<tr>
			<td></td>
		</tr>
		<tr><td><h2>Purchase Info</h2></td></tr>

		<tr>
			<td>Card</td>
			<td>
			<select name = "card">
				<option>Master Card</option>
				<option>Maestro</option>
				<option>Cirrus</option>
				<option>VISA</option>
				<option>VISA Electron</option>
				<option>PayPal</option>
				<option>DISCOVER</option>
				<option>Union Pay</option>
			</select>
			</td>
		</tr>
		
		<tr>
			<td>Card Number</td>
			<td> <input type = "text" name = "cardNumber1" size = "3" maxlength = "4" placeholder = "0000"/> -
				 <input type = "text" name = "cardNumber2" size = "3" maxlength = "4" placeholder = "0000"/> -
				 <input type = "text" name = "cardNumber3" size = "3" maxlength = "4" placeholder = "0000"/> -
				 <input type = "text" name = "cardNumber4" size = "3" maxlength = "4" placeholder = "0000"/>
			</td>
		</tr>
		
		<tr>
			<td>Installment</td>
			<td> 
				<select name = "installment">
					<option value="0">None</option>
					<option value="2">2 months</option>
					<option value="3">3 months</option>
					<option value="4">4 months</option>
					<option value="5">5 months</option>
					<option value="6">6 months</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Delivery Cost</td>
<%				if(amount*price>=50000){
					deliveryCost = 0;
				}else{
					deliveryCost=10000;
				}%>
			<td><%=deliveryCost%></td>
		<tr>
			<td>Total Price: </td>
			<td><%=amount*price+deliveryCost%></td>
		</tr>
				
	
	<tr>
		<td></td>
	</tr>
	<tr><td><h3>Order Product : <%= amount %>개</h3></td></tr>
	
		<tr>
			<td><img src = "/kook/image/<%= image %>"> </td> <td> <%= amount*price %>원 </td>
		</tr>
	</table>

	<table align = "center">
		<tr>
			<td>I agree with all the terms and conditions of the purchase and payment agency service.</td>
		</tr>	
		<tr>
			<td><input type="checkbox" name="agreement" value="agree" required />I agree</td>
		</tr>
		<tr>
			<td>
				<input type = "hidden" name = "deliveryCost" value="<%=deliveryCost%>" />
				<input type = "hidden" name = "amount" value="<%=amount%>" />
				<input type = "hidden" name = "price" value="<%=price%>" />
				<input type = "hidden" name = "image" value="<%=image%>" />
				<input type = "hidden" name="productName" value=<%=sdto.getName()%> />
				<input type = "hidden" name="productID" value=<%=sdto.getProductID()%> />
				<input type = "submit" name="purchase" value="buy" /></td>
		</tr>
	</table>
	</form>
	<br />
</body>
</html>

<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>