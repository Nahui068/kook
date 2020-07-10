<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberServiceDAO" %>
<%@ page import = "kook.MemberServiceDTO" %>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "kook.BasketDTO" %>
<%@ page import = "kook.BasketDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{	
    int count = 0; // 글 갯수
    int number=0;  // 글에 따라서 부여하는거

    List myBasket = null;
    BasketDAO db = new BasketDAO();

    String id = (String)session.getAttribute("kook_member_id");
    
    count = db.getBasketCount(id);
    if (count > 0) {
        myBasket = db.getBasket(id);
    }
	
	number=count;	
	
	int totalPrice = 0;
%>



<html>
<head>
<title>게시판</title>
</head>
<br /><br />

<body>
<center><b>My Basket : <%=id %>(전체 글:<%=count%>)</b>
<br>
<%
    if (count == 0) {
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
    There is no basket list.
    </td>
</table>

<%  } else {    %>



<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" > 
      <td align="center">BasketID</td> 
      <td align="center">Image</td> 
      <td align="center">ProductID</td> 
      <td align="center">Product Name</td> 
      <td align="center">Amount</td>   
      <td align="center">Price</td>
      <td align = "center"> Delete </td>       
    </tr>
	
<%  
        for (int i = 0 ; i < myBasket.size() ; i++) {
        	 BasketDTO bdto = (BasketDTO)myBasket.get(i);
        	 totalPrice = bdto.getAmount()*bdto.getPrice() + totalPrice;
%>
   <tr>
      <td align="center" ><%= number-- %></td>
	  <td align="center" >
		<%
			if(bdto.getImage() != null){%>
				<img src="/kook/image/<%=bdto.getImage()%>" width="100" height="100"> 
		<%} %>
	  </td>
      <td align="center" ><%=bdto.getProductID()%></td>
      <td align="center" ><%=bdto.getProductName()%></td>
      <td align="center"  ><%=bdto.getAmount()%></td>
      <td align="center" ><%=bdto.getPrice()*bdto.getAmount()%></td>
<td align = "center">
      <input type = "button" name = "deleteBasket" value = "deleteBasket" onClick="window.location = 'myBasketDeletePro.jsp?basketId=<%=bdto.getBasketId()%>'"/>
      </td>
  </tr>
    <%}%>
</table>
<table>
	<tr>
  	<td align = "center" colspan = 10> TOTAL PRICE : <%=totalPrice%>&nbsp;&nbsp;&nbsp;
  	<input type="button" name = "basketPurchase" value = "basketPurchase" onClick = "window.location = 'basketPurchase.jsp?totalPrice=<%=totalPrice%>'"/>
 	</td>
 	</tr>
 </table>
<%}%>
<br />
<br />
<br />

</center>
</body>
</html>
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>
