<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/main/top/topAdmin.jsp"%>
<%@ page import = "kook.ClickRecommendDAO" %>
<%@ page import = "kook.ClickRecommendDTO" %>

<%
	
	// 유통기한 얼마 남지 않은 것 보일 수 있도록 함
	WarehousingDAO wdao2 = new WarehousingDAO();
	WarehousingDTO wdto2 = new WarehousingDTO();
	List wareList2 = null;
	
	wareList2 = wdao2.getWarehousing(); %>

	<table align="center" border = "1">
	<tr>
		<th>productID</th><th>name</th><th>origin</th><th>warehousing_date</th>
		<th>expiration</th><th>ex_during</th><th>price</th><th>amount</th>
	</tr>
<%
	for (int i = 0; i < wareList.size(); i++) {
		wdto2 = (WarehousingDTO)wareList.get(i);
	
		Date ExTime= sdf.parse(wdto2.getExpiration());
		long diffDay = (ExTime.getTime() - nowTime.getTime()) / (24*60*60*1000);
		
		if (diffDay <= 7) { %>
				<tr>
					<td align = "center"><%= wdto2.getProductID() %></td>
					<td align = "center"><%= wdto2.getName() %></td>
					<td align = "center"><%= wdto2.getOrigin() %></td>
					<td align = "center"><%= wdto2.getWarehousing_date() %></td>
					<td align = "center"><%= wdto2.getExpiration() %></td>
					<td align = "center"><%= wdto2.getEx_during() %></td>
					<td align = "center"><%= wdto2.getPrice() %></td>
					<td align = "center"><%= wdto2.getAmount() %></td>	
				</tr>
<% 
		}
	
	}
%>
			</table>