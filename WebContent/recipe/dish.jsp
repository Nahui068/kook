<%-- [Dish] 페이지 - 모든 게시글 포함 --%>
<%-- 작성자 : 김나희, 이건우 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeDAO" %>
<%@ page import = "kook.RecipeDTO" %>
<%@ page import = "kook.RecipeListDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="/Design/design_main_menu.jsp" %>
<%@ include file="/main/top/topRecipeDish.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>

<title>Dish</title>

<%!
	int pageSize = 12;
%>
<%
	try{
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) pageNum = "1";
	
	String category = request.getParameter("category");
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List recipeList = null;
	RecipeDAO dao = new RecipeDAO();
	RecipeListDAO listdao = new RecipeListDAO();
	
	RecipeDTO rdto = new RecipeDTO();
	
	count = listdao.getDish_Count();
	
	if (count > 0) {
		recipeList = listdao.getDish(startRow, endRow);
	}
	
%>
<div class="all">
<br>
<center><b>글 목록 (전체 글 : <%= count %>)</b></center>
<br>
<% if(count == 0) { %>
<table border="1">
<tr>
	<td align="center">
		게시판에 저장된 글이 없습니다.
	</td>
</tr>
</table>

<% }else{
%>
		<table>
		<tr>
			
<%
	int j = 1;
	
	for(int i=0; i<recipeList.size(); i++){ //저장된 게시글 불러오기(썸네일,제목)
		
	
		rdto = (RecipeDTO)recipeList.get(i);
%>
		
				<td>
					<ul>
						<li><a href="/kook/recipe/content.jsp?category=<%=rdto.getCategory()%>&num=<%=rdto.getNum()%>&pageNum=<%=currentPage%>">
						<img src = "/kook/image/<%= rdto.getThumbnail()%>" width="200" height="200"></li>
	
						<li><%=rdto.getSubject() %></li>
					</ul>
					</a>
				</td>

		<% 
		
		if(j%4==0) 	%> <tr></tr>				
<%	
		j++;	
	}
%>
</tr>
</table>
</div>

<%
	}
	if(count>0){
%> <p /><br /><center /> <%
		int pageCount = count/pageSize+(count % pageSize==0?0:1);
		
		int startPage = (int)(currentPage/5)*5+1;
		int pageBlock=5;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount) endPage = pageCount;
		
		if(startPage>5){%>
		<a href="/kook/recipe/recipe.jsp?category=<%= category %>&pageNum=<%= startPage - 5 %>">[이전]</a>
		<%}
		for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="/kook/recipe/recipe.jsp?category=<%= category %>&pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="/kook/recipe/dish.jsp?category=<%= category %>&pageNum=<%= startPage + 5 %>">[다음]</a>
<%
        }
    }
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
</body>
</html>