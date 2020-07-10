<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberServiceDAO" %>
<%@ page import = "kook.MemberServiceDTO" %>
<%@ page import = "kook.PurchaseDAO" %>
<%@ page import = "kook.PurchaseDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file = "/main/top/top.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
	int count = 0;
	int number = 0;
	
	List myPurchase = null;
	PurchaseDAO pdao = new PurchaseDAO();
	
	String id = (String)session.getAttribute("kook_member_id");
	count = pdao.getPurchaseCount(id);
	
	int purchaseCount = Integer.parseInt(request.getParameter("purchaseCount"));
	
	if(count>0){
		myPurchase = pdao.getPurchase(id, purchaseCount);  // purchaseCount 로 정렬  , parameter에 count 추가 
	}
	// dao에서 id랑 purchase 카운트 사용해서 정렬후 꺼내기
	
	number = count;

 	sdf = new SimpleDateFormat("yyyy-MM-dd");
 
 	PurchaseDTO pdto = (PurchaseDTO)myPurchase.get(0);
 %>


<html>
<head> 
<title> Order List </title>
</head>
<body> 
<br /> <br />
<center><b> MY ORDER LIST : <%=id%> (총 구매: <%=purchaseCount%>)</b></center>

<table border="1" width = "1000" cellpadding = "0" cellspacing ="0" align = "center">
	<tr> 
		<td align = "left" colspan="11"> 
		<br />
		&nbsp;&nbsp;&nbsp;ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=pdto.getId() %> <br />
		&nbsp;&nbsp;&nbsp;Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=pdto.getUserName() %> <br />
		&nbsp;&nbsp;&nbsp;Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=pdto.getAddress()%> <br />
		&nbsp;&nbsp;&nbsp;Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=pdto.getPhone() %> <br />
		&nbsp;&nbsp;&nbsp;Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=pdto.getEmail() %> <br />
		&nbsp;&nbsp;&nbsp;Comment:&nbsp;&nbsp; <%=pdto.getComments() %> <br/>
		<br />
		</td>
	</tr>
	<tr> 
		<td align = "center"> Number </td>
		<td align = "center"> Purchase ID </td>
		<td align = "center"> Image </td>
		<td align = "center"> ProductID </td>
		<td align = "center"> Product Name </td>
		<td align = "center" > Amount </td>
		<td align = "center" > Price </td>
		<td align = "center" > Order Date </td>
	
	</tr>
	
<%
		for (int i = 0; i < myPurchase.size(); i++ ){
			pdto = (PurchaseDTO)myPurchase.get(i);
%>	
	<tr> 
		<td align = "center" > <%= number-- %> </td>
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
		<td align = "center" > <%=pdto.getPrice() %> </td>
		<td align = "center" > <%=sdf.format(pdto.getPurchase_date())%>
	

	</tr>
<%
	}
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
</table>
</body>
</html>