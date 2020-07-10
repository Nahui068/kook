<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeDAO" %>
<%@ page import = "kook.RecipeListDAO" %>
<%@ page import = "kook.RecipeDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="/main/top/topRecommend.jsp"%>
<%@ include file="/Design/design_main_menu.jsp" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
try{
	int pageSize = 12;

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) pageNum = "1";
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List recommendList = null;
	RecipeListDAO listdao = new RecipeListDAO();
	RecipeDTO rdto = new RecipeDTO();
	
	count = listdao.getLevel_recommend_Count();
	
	if (count > 0) {
		recommendList = listdao.getLevel_recommend(startRow, endRow);
	}
	
%>
</head>
<div class="all">
<title>Recommended by Level</title>
<br>
<body>
<br>
	<center><b>글 목록(추천  수 1 이상 : <%= count %>)</b></center>
<%
	if(count == 0) { 
%>
		<table border="1">
			<tr>
				<td align = "center">
					게시판에 저장된 글이 없습니다.
				</td>
			</tr>
		</table>
<% 	} else { %>
		<table>
			<tr>
			<%
				int j = 1;
				for (int i = 0; i < recommendList.size(); i++) {
					rdto = (RecipeDTO)recommendList.get(i);
			%>
				<td>
					<ul>
						<li><a href = "/kook/recipe/content.jsp?difficulty=<%= rdto.getDifficulty() %>&num=<%= rdto.getNum() %>&pageNum=<%= currentPage %>">
						<img src = "kook/image/<%= rdto.getThumbnail() %>" width = "200" height = "200"></li>
						
						<li><%= rdto.getSubject() %></li>
					</a>
					</ul>
				</td>
			<%
				if (j % 4 == 0) %> <tr></tr>
			<%
					j++;
				}
			%>
			</tr>
		</table>
<%	}	
	if (count > 0) {	%>
	<br><center>
<%
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

	int startPage = (int)(currentPage / 5) * 5 + 1;
	int pageBlock = 5;
	int endPage = startPage + pageBlock - 1;
	if (endPage > pageCount) endPage = pageCount;
	
	if (startPage > 5) { %>
		<a href = "/kook/recipe/list/recommendLevel.jsp?pageNum=<%= startPage - 5 %>">[이전]</a>
<%	} 
	for (int i = startPage; i <= endPage; i++) {	%>
		<a href = "/kook/recipe/list/recommendLevel.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
	}
	if (endPage < pageCount) { %>
		<a href = "/kook/recipe/list/recommendLevel.jsp?pageNum=<%= startPage + 5 %>">[다음]</a>
<%
	}
	}
}catch(Exception e){	response.sendRedirect("/kook");	}
%>
</center>
</body>
</html>