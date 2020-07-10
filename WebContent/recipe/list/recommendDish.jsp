<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kook.RecipeListDAO" %>
<%@ page import = "kook.RecipeDTO" %>
<%@ include file="/main/top/topRecommend.jsp"%>
<%@ include file="/Design/design_main_menu.jsp" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%! 

	int pageSize = 12;	
%>

<%
try{
	String pageNum = (String)request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
	String category = (String)request.getParameter("category");
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List recoList = null;
	RecipeListDAO listdao = new RecipeListDAO();
	
	RecipeDTO rdto = new RecipeDTO();
	
	count = listdao.getDish_Reco_Count(); // dish에서 추천수가 1이상인 게시글의 개수
	
	if(count > 0 ){
		recoList = listdao.getDish_Reco(startRow,endRow); // 추천수가 높은수부터 차례대로 가져오기
	}
	
%>
<div class="all">
<title>RecommendDish</title>
<br>
<center><b>글 목록(전체 글:<%=count%>)</b></center>
<br>
<% if(count == 0) { %>
<table border="1">
<tr>
	<td>
		게시판에 저장된 글이 없습니다.
	</td>
</tr>
</table>
<%}else{ %>
		<table>
		<tr>
<%
	int j = 1;
	for(int i=0; i<recoList.size();i++){
		rdto = (RecipeDTO)recoList.get(i);	
%>
		<td>
			<ul>
				<li><a href="/kook/recipe/content.jsp?category=<%=rdto.getCategory()%>&num=<%=rdto.getNum()%>&pageNum=<%=currentPage%>">
				<img src = "/kook/image/<%= rdto.getThumbnail()%>" width="200" height="200"></li>
				
				<li><%=rdto.getSubject() %></li>
			</a>
			</ul>
		</td>
	<%
		if(j%4==0)%> <tr></tr>
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
		<a href="/kook/recipe/recommendDish.jsp?pageNum=<%= startPage - 5 %>">[이전]</a>
		<%}
		for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="/kook/recipe/recommendDish.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="/kook/recipe/recommendDish.jsp?pageNum=<%= startPage + 5 %>">[다음]</a>
<%
        }
    }
}catch(Exception e){	response.sendRedirect("/kook");	}
%>