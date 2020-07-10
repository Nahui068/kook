<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.WarehousingDAO" %>
<%@ page import = "kook.WarehousingDTO" %>
<%@ page import = "java.util.List" %>
<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
	int pageSize = 20;
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) pageNum = "1";
	
	int currentPage = Integer.parseInt(pageNum);
	int start = (currentPage -1) * pageSize + 1;
	int end = currentPage * pageSize;
	int count = 0;
	
	wareList = null;
	wdao = new WarehousingDAO();
	WarehousingDTO wdto = new WarehousingDTO();
	
	count = wdao.getWarehousing_Count();
	
	if (count > 0) wareList = wdao.getWarehousing(start, end);
%>

<h2 align="center">입고 테이블</h2>

<table align="center" style=padding-left:520;>
	<tr>
		<td ><input type = "button" value = "입고하기" onclick = "location.href = 'productInsertForm.jsp'"/></td> 
	</tr>
</table>

<% 	if (count == 0) { %>
	<table width = "700" border = "1" align = "center">
		<tr>
			<td align = "center">입고 물품이 없습니다.</td>
		</tr>
	</table>
<%	} else { %>
<table align="center" border = "1">
	<tr>
		<th>productID</th><th>name</th><th>origin</th><th>warehousing_date</th>
		<th>expiration</th><th>ex_during</th><th>price</th><th>amount</th>
	</tr>
			<% for (int i = 0; i < wareList.size(); i++) {
				wdto = (WarehousingDTO)wareList.get(i);	%>
				<% if (wdto.getEx_during() <= 7) { %>		
			<tr style = "color:red;">
				<td align = "center"><%= wdto.getProductID() %></td>
				<td align = "center"><%= wdto.getName() %></td>
				<td align = "center"><%= wdto.getOrigin() %></td>
				<td align = "center"><%= wdto.getWarehousing_date() %></td>
				<td align = "center"><%= wdto.getExpiration() %></td>
				<td align = "center"><%= wdto.getEx_during() %></td>
				<td align = "center"><%= wdto.getPrice() %></td>
				<td align = "center"><%= wdto.getAmount() %></td>		
			</tr>
				<% } else { %>		
			<tr>
				<td align = "center"><%= wdto.getProductID() %></td>
				<td align = "center"><%= wdto.getName() %></td>
				<td align = "center"><%= wdto.getOrigin() %></td>
				<td align = "center"><%= wdto.getWarehousing_date() %></td>
				<td align = "center"><%= wdto.getExpiration() %></td>
				<td align = "center"><%= wdto.getEx_during() %></td>
				<td align = "center"><%= wdto.getPrice() %></td>
				<td align = "center"><%= wdto.getAmount() %></td>		
			</tr>
				<% } %>
		<%	}
	} %>
</table>
<br>
</table>

<br>
<center>
<%
    if (count > 0) { //페이지번호 계산
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/20)*20+1;
		int pageBlock=20;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 20) {    %>
        <a href= "warehousingList.jsp?pageNum=<%= startPage - 20 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href= "warehousingList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href= "warehousingList.jsp?pageNum=<%= startPage + 20 %>">[다음]</a>
<%
        }
    }
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>

</center>