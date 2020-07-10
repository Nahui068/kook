<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "kook.WarehousingDAO" %>
<%@ page import = "kook.WarehousingDTO" %>
<%@ page import = "kook.StockDTO" %>
<%@ page import = "kook.PurchaseDAO" %>
<%@ page import = "kook.PurchaseDTO" %>
<%@ page import = "java.util.List" %>
<%@ include file="/main/top/top.jsp"%>
<% request.setCharacterEncoding("utf-8");%>

<%
	try{
	String pageNum = request.getParameter("pageNum");
	String productID = request.getParameter("productID");	

	ShopDTO sdto = new ShopDTO();
	ShopDAO sdao = new ShopDAO();
	
	sdto =  sdao.getShop(productID);
	
	String id = (String)session.getAttribute("kook_member_id");
	
	WarehousingDAO whdao = new WarehousingDAO();
	List stockList = null;

%>
<style>
	.shop{
		margin-left : 450px;
		font-size : 20px;
	}
</style>
<br><br><br><br>
<table class="shop" border = "1" align = "center" cellpadding="20px">
<%		
		stockList= whdao.getStock(productID);
			int stock = 0;

			for (int j=0; j < stockList.size(); j++){
				StockDTO stdto = (StockDTO)stockList.get(j);
				stock = stdto.getAmount();
			}
%>
	<tr>
		<td rowspan="6">
		<% if (sdto.getImage() != null) { %>
			<img src = "/kook/image/<%= sdto.getImage()%> " width="500" height="450">
		<% } %>
		</td>
		<tr>
			<td align="center" colspan="2" width="100" height="50"> <b>상 품 명 :</b> &nbsp;&nbsp;&nbsp;   
				<% if (sdto.getName() != null) { %>
					 <%= sdto.getName() %> 
				<% } %>
			</td>
		</tr>
		<tr>
			<td align="center" colspan = "2" width="100" height="50"> <b>상 세 설 명 : </b>&nbsp;&nbsp;&nbsp; 
		<% if (sdto.getContent() != null) { %>
			<%= sdto.getContent() %> 
		<% } %>
			</td>
		</tr>
		<tr>
			<td align="center" colspan = "2" width="100" height="50"> <b>원 산 지 :</b> &nbsp;&nbsp;&nbsp; 
		<% if (sdto.getOrigin() != null) { %>
			<%= sdto.getOrigin() %>
		<% } %>
			</td>
		</tr>
		<tr>
			<td align="center" colspan = "2" width="100" height="50"> <b>가 격 :</b> &nbsp;&nbsp;&nbsp; 
		<% if (sdto.getPrice() != 0) { %>
			<%= sdto.getPrice() %>
		<% } %>
			</td>
		</tr>
			<form action = "/kook/shop/shopPurchase.jsp?productID=<%= request.getParameter("productID") %>&image=<%= sdto.getImage() %>&price=<%= sdto.getPrice() %>" method = "post">
			<tr>
			<td align="center" width="100" height="50"> <b>수 량</b> </td>	
			<%if(stock <=0) {%>
			<td>Sold Out</td>
			<%} else{%>
			<td align="center" width="100" height="50"><select name="amount" id = "amount">
				<option value="1"> 1 </option>
				<option value="2"> 2 </option>
				<option value="3"> 3 </option>
				<option value="4"> 4 </option>
				<option value="5"> 5 </option>
				<option value="6"> 6 </option>
				<option value="7"> 7 </option>
				<option value="8"> 8 </option>
				<option value="9"> 9 </option>
				<option value="10"> 10 </option>
			</select></td>
			<%} %>
		</tr>
		
		<tr align = "center"> 
			<script>
				function Basket(){
					var a = document.getElementById("amount");
					var option_value = a.options[a.selectedIndex].value;
					alert("You select "+option_value +"!"+"\n"+"Let's go your Basket :)");
					window.location = "/kook/shop/shopBasketPro.jsp?productName=<%=sdto.getName()%>&amount="+option_value+"&price=<%=sdto.getPrice()%>&productID=<%=sdto.getProductID()%>&image=<%=sdto.getImage()%>";
				}
				function BasketLogIn(){
					alert("You can use Basket after Sign In!");
					window.location = "/kook/main/login.jsp";
				}
			</script>
<%
		if(id == null ){%>
			<td colspan = "3"> <input type = "button" name="shoppingcart" value = "shoppingcart" onClick = "BasketLogIn()" /> 
		
<%		} else{ %>
			<td colspan = "3"> <input type = "button" name="shoppingcart" value = "shoppingcart" onClick = "Basket()"/>			
	  <%}%>		 
	  		<input type="hidden" name="productID" value="productID" />
	  		<input type="hidden" name="productName" value=<%=sdto.getName()%> />
			<input type = "submit" value = "purchase"/> </td>
			</form>
		</tr>				
	</tr>	
</table>
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>