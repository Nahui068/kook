<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.WarehousingDAO" %>
<%@ page import = "kook.StockDTO" %>
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
	
	List stockList = null;
	wdao = new WarehousingDAO();
	StockDTO stdto = new StockDTO();
	
	count = wdao.getStock_Count();
	
	if (count > 0) stockList = wdao.getStock(start, end);
%>
<br><br><br>
<h2 align="center">재고 테이블</h2>
<% 	if (count == 0) { %>
	<table width = "700" border = "1" align = "center">
		<tr>
			<td align = "center">재고 물품이 없습니다.</td>
		</tr>
	</table>
<%	} else { %>
<table align="center" border = "1">
	<tr>
		<th>productID</th><th>name</th><th>amount</th>
	</tr>
			<%	for (int i = 0; i < stockList.size(); i++) {
					stdto = (StockDTO)stockList.get(i);	%>
					
		<tr>
			<td align = "center"><%= stdto.getProductID() %></td>
			<td align = "center"><%= stdto.getName() %></td>
			<td align = "center"><%= stdto.getAmount() %></td>

		</tr>
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
        <a href= "stockList.jsp?pageNum=<%= startPage - 20 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href= "stockList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href= "stockList.jsp?pageNum=<%= startPage + 20 %>">[다음]</a>
<%
        }
    }
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>

</center>