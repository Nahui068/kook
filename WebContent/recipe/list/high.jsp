<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeDAO" %>
<%@ page import = "kook.RecipeListDAO" %>
<%@ page import = "kook.RecipeDTO" %>
<%@ page import = "kook.IngredDAO" %>
<%@ page import = "kook.IngredDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file = "/main/top/topRecipeLevel.jsp" %>
<%@ include file="/Design/design_main_menu.jsp" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%!
	int pageSize = 12; // 한 페이지당 보여줄 개수
%>    
<% 
try{
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize + 1; // 페이지 시작값
	int endRow = currentPage * pageSize; // 페이지 마지막값
	int count = 0; // 게시글의 수
	int number = 0;
	
	List recipeList = null; // 게시글 저장할 list생성
	RecipeListDAO listdao = new RecipeListDAO(); //게시판에 보여줄 내용을 가져오기 위한 리스트
	
	RecipeDTO rdto = new RecipeDTO();
	IngredDTO idto = new IngredDTO();
	
	ArrayList<RecipeDTO> relist = new ArrayList<RecipeDTO>();
	ArrayList<IngredDTO> inlist = new ArrayList<IngredDTO>();
	
	String difficulty = request.getParameter("difficulty");
	

	if("high".equals(difficulty)){
		
		count = listdao.getHigh_Count(); // low게시물의 수 세기
		
		if(count > 0){
			recipeList = listdao.getHigh(startRow, endRow);//첫 게시물부터 마지막 게시글까지 가져오기
		}
		number = count-(currentPage-1)*pageSize;
		
	}
%>
<title>High</title>   
<div class="all">
<br>
<center><b>글목록(전체 글:<%=count%>)</b></center>
<br>
<% if(count==0){ %>
<table border="1">
<tr>
	<td>
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
						<li><a href="/kook/recipe/content.jsp?difficulty=<%=rdto.getDifficulty()%>&num=<%=rdto.getNum()%>&pageNum=<%=currentPage%>">
						<img src = "/kook/image/<%= rdto.getThumbnail()%>" width="200" height="200"></li>
					
						<li><%=rdto.getSubject() %></li>
						</a>
					</ul>
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
		int pageCount = count/pageSize+(count % pageSize==0? 0:1);
		
		int startPage = (int)(currentPage/5)*5+1;
		int pageBlock=5;
		int endPage = startPage + pageBlock-1;
		if (endPage > pageCount) endPage = pageCount;
		
		if(startPage>5){%>
		<a href="/kook/list/high.jsp?category=<%=difficulty %>&pageNum=<%= startPage - 5 %>">[이전]</a>
		<%}
		for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="/kook/list/high.jsp?category=<%= difficulty %>&pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="/kook/list/high.jsp?category=<%= difficulty %>&pageNum=<%= startPage + 5 %>">[다음]</a>
<%
        }
    }
}catch(Exception e){	response.sendRedirect("/kook");	}
%>