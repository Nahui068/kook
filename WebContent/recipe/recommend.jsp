<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeListDAO" %>    
<%@ page import = "kook.RecipeDTO" %> 
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="/Design/design_main_menu.jsp" %>
<%@ include file="/main/top/topRecommend.jsp"%> 

<% request.setCharacterEncoding("UTF-8"); %>

<%!
	int pageSize = 12;
%>
<%
	try{
	int count = 0; // 게시글의 수

	List recoList = null;
	
	RecipeListDAO listdao = new RecipeListDAO();
	
	RecipeDTO rdto = new RecipeDTO();
	
	count = listdao.getDish_Reco_Count();
	
	if(count > 0){
		recoList = listdao.getDish_best_Reco();
	}
	
%>
<br><br><br><br>
<div class="all">
<h2><center><b>Best 12</b></center></h2>

<% if(count==0){ %>
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
	
	for(int i=0; i<recoList.size(); i++){ //저장된 게시글 불러오기(썸네일,제목)
		
	
		rdto = (RecipeDTO)recoList.get(i);
%>
		
				<td>
					<ul>
						<li><a href="/kook/recipe/content.jsp?category=<%=rdto.getCategory()%>&num=<%=rdto.getNum()%>">
						<img src = "/kook/image/<%= rdto.getThumbnail()%>" width="200" height="200">
						</li>
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
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>