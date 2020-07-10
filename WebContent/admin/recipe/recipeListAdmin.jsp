<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeDAO" %>
<%@ page import = "kook.RecipeListDAO" %>    
<%@ page import = "kook.RecipeDTO" %> 
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<style>
	a.link:hover {text-decoration: underline; color: blue;}
</style>

<script>
	function doDel(){
		
		if(confirm("정말 삭제하시겠습니까?")){
			return true;
		}else
			return false;

	}	
</script>
	
<title>recipeList</title>

<%
	int pageSize = 10;
	sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try{
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize+1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List recipeList = null; // 게시글 저장할 list생성

	RecipeDAO dao = new RecipeDAO();
	RecipeListDAO listdao = new RecipeListDAO();
	
	RecipeDTO rdto = new RecipeDTO();
	
	count = listdao.getAll_recipe_Count(); // 전체게시글의 수
	
	if(count > 0){
		recipeList = listdao.getAll_recipe(startRow, endRow); // 첫 게시글부터 마지막 게시글까지 가져오기
	}
	
	int num = rdto.getNum();
	String category = rdto.getCategory();
	String difficulty = rdto.getDifficulty();
	
%>
<center><b>글목록(전체 글:<%=count%>)</b></center>
<table width="700"  align="center" >
	<tr><td align = "right">
		<input type = "button" value = "Write" onClick = "location.href='recipeWriteForm.jsp'" />
		</td></tr>
	</table>
<%if(count==0){ %>
<table width="700" border="1" align="center">
	<tr>
		<td align="center">
			게시판에 저장된 글이 없습니다.	
		</td>
	</tr>
</table>

<%}else{ %>
<table width="700" border="1" align="center">
	<tr height="30">
		<td align="center" width="50">번 호 </td>
		<td align="center" width="100">카테고리</td>
		<td align="center" width="100">난이도</td>
		<td align="center" width="250">제 목</td>
		<td align="center" width="150">작성일</td>
		
		<td align="center" width="100">수 정</td>
		<td align="center" width="100">삭 제</td>
	</tr>
<%
	// 저장된 게시글 불러오기
	for(int i=0; i<recipeList.size(); i++){
		rdto = (RecipeDTO)recipeList.get(i);
%>
	<tr>
		<td align="center"><%=rdto.getNum()%></td>
		<td align="center"><%=rdto.getCategory()%></td>
		<td align="center"><%=rdto.getDifficulty() %></td>
		<td align="center">
			<a class = "link" href="recipeContentAdmin.jsp?category=<%=rdto.getCategory()%>&difficulty=<%=rdto.getDifficulty()%>&num=<%=rdto.getNum()%>&pageNum=<%=currentPage%>">
			<%=rdto.getSubject() %>
		</a></td>
		<td align="center"><%=rdto.getReg() %></td>
		<td align="center"><a class = "link" href = "recipeModifyForm.jsp?num=<%=rdto.getNum()%>&category=<%=rdto.getCategory()%>&difficulty=<%=rdto.getDifficulty()%>&pageNum=<%=currentPage%>" >수 정</a></td>
		<td align="center"><a class = "link" onclick="return doDel();" href = "recipeDeletePro.jsp?num=<%=rdto.getNum()%>&category=<%=rdto.getCategory()%>&difficulty=<%=rdto.getDifficulty()%>&pageNum=<%=currentPage%>">삭 제</a></td>
	</tr>
	<%}
}%>
</table>
<br />
<br />
<center>
<%
    if (count > 0) { //페이지번호 계산
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="recipeListAdmin.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="recipeListAdmin.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="recipeListAdmin.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</center>
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>	
