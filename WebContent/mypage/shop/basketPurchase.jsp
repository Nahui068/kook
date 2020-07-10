<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "kook.MemberDTO" %>
<%@ page import = "kook.MemberDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>

<%@ include file="/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<meta charset="UTF-8">
<title>Basket Purchase Page</title>

<% 
	try{
	MemberDTO mdto = new MemberDTO();
	MemberDAO mdao = new MemberDAO();
	
	ShopDTO sdto = new ShopDTO();
	ShopDAO sdao = new ShopDAO();
	
	ArrayList<MemberDTO> memList = new ArrayList<MemberDTO>();
	ArrayList<ShopDTO> sList = new ArrayList<ShopDTO>();

	String id = main_id;
	String productID = (String)session.getAttribute("productID");
		
	memList = mdao.Info_member(id);
	
	for (int i = 0; i < memList.size(); i++) {
		mdto = memList.get(i);
	}
	

	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));  
	int deliveryCost=0;
%>

<body>
<h3>User Info</h3>

	<table>
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
<form method = "post" name = "basketPurchase" action="basketPurchasePro.jsp">
		<tr>
			<td>Address</td>
			<td><input type = "text" name = "address" style = "width:300px;" required /></td>	
		</tr>
		<tr>
			<td>Delivery Comments</td>
			<td><input type = "text" name = "comments" style = "width:300px;" required /></td>	
		</tr>	
</table>
<br>
<h3>Purchase Info</h3>

	<table>		
		<tr>
			<td>Card&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
			<td>Card Number&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td> <input type = "text" name = "cardNumber1" size = "3" maxlength = "4" placeholder = "0000"/> -
				 <input type = "text" name = "cardNumber2" size = "3" maxlength = "4" placeholder = "0000"/> -
				 <input type = "text" name = "cardNumber3" size = "3" maxlength = "4" placeholder = "0000"/> -
				 <input type = "text" name = "cardNumber4" size = "3" maxlength = "4" placeholder = "0000"/>
			</td>
		</tr>
		
		<tr>
			<td>Installment&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
<%				if(totalPrice>=50000){
					deliveryCost = 0;
				}else{
					deliveryCost=10000;
				}%>
			<td><%=deliveryCost%></td>
		<tr>
			<td>Total Price: </td>
			<td><%=totalPrice+deliveryCost%></td>
		</tr>
		</table>
		<br>
		<table>
		<tr>
			<td>I agree with all the terms and conditions of the purchase and payment agency service.</td>
		</tr>	
		<tr>
			<td><input type="checkbox" name="agreement" value="agree" required />I agree</td>
		</tr>		
		<tr>
			<input type = "hidden" name = "deliveryCost" value="<%=deliveryCost%>" />
			<td><input type="submit" name="purchase" value="buy" /></td>
		</tr>	
	</table>
</form>

</body>

<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>
