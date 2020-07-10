<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kook.ClickRecommendDAO"%>
<%@page import="kook.ClickRecommendDTO"%>
<%@page import="kook.RecipeDTO" %>
<%@ page import = "java.util.List" %> 
 
 
 <%@ include file="/Design/design_main_menu.jsp" %>
<%@ include file="/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
	int pageSize=12;

	String pageNum=(String)request.getParameter("pageNum");
	if (pageNum == null) pageNum="1";
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int num = 0;
	
	List myRecoList = null;
	
	ClickRecommendDTO cdto = new ClickRecommendDTO();
	ClickRecommendDAO cdao = new ClickRecommendDAO();
	RecipeDTO rdto = new RecipeDTO();
	
	// 세션id와 db에 저장된 id를 확인하여 추천개수 출력
	count = cdao.getMyReco_Count(main_id);

	if(count>0){
		myRecoList = cdao.getMyReco(startRow, endRow, main_id);
	}
%>
<title>MyRecommend</title>   
<div class="all">
<br /><br />
<center><b>글목록(내가 찜한 글:<%=count%>)</b></center>
<br>
<% if(count==0){ %>
<table border="1" >
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
	int j = 1; // 4개씩 출력하기 위한 변수 선언
	
	for(int i=0; i<myRecoList.size(); i++){ //저장된 게시글 불러오기(썸네일,제목)
		
	
		rdto = (RecipeDTO)myRecoList.get(i);
%>
					<td>
						<ul>
							<li><a href="/kook/recipe/content.jsp?category=<%=rdto.getCategory()%>&difficulty=<%=rdto.getDifficulty()%>&num=<%=rdto.getNum()%>&pageNum=<%=currentPage%>">
							<img src = "/kook/image/<%= rdto.getThumbnail()%>" width="200" height="200"></li>
							<li><%=rdto.getSubject() %></li>
						</a>
						</ul>
				</td>

		<% 
		
		if(j%4==0) 	%> <tr></tr>	<%-- 4개씩 출력 후 한줄 띄우기 --%>			
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
		<a href="myRecommend.jsp?pageNum=<%= startPage - 5 %>">[이전]</a>
		<%}
		for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="myRecommend.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="myRecommend.jsp?pageNum=<%= startPage + 5 %>">[다음]</a>
<%
        }
    }
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
