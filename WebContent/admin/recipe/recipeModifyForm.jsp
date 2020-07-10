<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeDTO" %>
<%@ page import = "kook.RecipeDAO" %>
<%@ page import = "kook.RecipeListDAO" %>
<%@ page import = "kook.IngredDTO" %>
<%@ page import = "kook.IngredDAO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>

<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
	RecipeListDAO relist = new RecipeListDAO();
	RecipeDTO rdto = new RecipeDTO();
	RecipeDTO rdto2 = new RecipeDTO();
	
	int num = Integer.parseInt(request.getParameter("num"));
	int num2 = num-2; // dish에 있는 테이블도 같이 변경하기 위해
	int inum = num+1; // 재료 테이블 변경(level에 있는 재료 변경)
	int inum2 = inum-2; // 재료 테이블 변경(dish에 있는 재료 변경)
	String pageNum = request.getParameter("pageNum");
	
	String category = request.getParameter("category"); // 카테고리 값 받기
	String difficulty = request.getParameter("difficulty"); //난이도값 받기
	
	if("main_dish".equals(category)) {
		rdto2 = relist.getMain_dish(num2);
	}
	
	if("side_dish".equals(category)) {
		rdto2 = relist.getSide_dish(num2);
	}
	
	if("stew_soup".equals(category)) {
		rdto2 = relist.getStew_soup(num2);
	}
	
	if("drink".equals(category)) {
		rdto2 = relist.getDrink(num2);
	}
	
	if("dessert".equals(category)) {
		rdto2 = relist.getDessert(num2);
	}
	
	if("korean_bbq".equals(category)) {
		rdto2 = relist.getKorean_bbq(num2);
	}
	
	if("kimchi".equals(category)) {
		rdto2 = relist.getKimchi(num2);
	}
	
	if("etc".equals(category)) {
		rdto2= relist.getEtc(num2);
	}
	
	if("low".equals(difficulty)) {
		rdto = relist.getLow(num);
	}
	
	if("middle".equals(difficulty)) {
		rdto = relist.getMiddle(num);
	}
	
	if("high".equals(difficulty)) {
		rdto = relist.getHigh(num);
	}
	IngredDTO idto = relist.getIngred(inum);
	IngredDTO idto2 = relist.getIngred(inum2);
	
	
%>
	<form method="post" action="recipeModifyPro.jsp?num=<%=num%>&num2=<%=num2%>&inum=<%=inum%>&pageNum=<%=pageNum%>&category=<%=category%>&difficulty=<%=difficulty%>"
	enctype="multipart/form-data">
	
	<table align="center">
	<tr>
		<td>제목 : <input type="text" name="subject" value="<%=rdto.getSubject()%>"></td>
	</tr>
	<tr>
		<input type="hidden" name="thumbnail" value="<%=rdto.getThumbnail() %>">
		<td> <img src = "/kook/image/<%= rdto.getThumbnail()%>"></td>
		<td> <input type="file" name="thumbnail2"></td>
	</tr>
	
		
	<tr align="center">
			<td> <input type="text" name="content" value="<%=rdto.getContent()%>"></td>
	</tr>
	
	<tr align="center">
			<td> <input type="text" name="portion" value="<%=rdto.getPortion()%>">servings </td>
	</tr>
</table>

<table align="center" border="1">
	<tr>
			<td> 재료 1 </td> 
			<td><input type="text" name="ingred1" value="<%= idto.getIngred1()%>"> </td>
			
			<td> 재료 2 </td> 
			<td> <input type="text" name="ingred2" value="<%=idto.getIngred2() %>"></td>
	
	</tr>	
		
	<tr>
			<td> 재료 3 </td> 
			<td> <input type="text" name="ingred3" value="<%=idto.getIngred3()%>" ></td>
			<td> 재료 4 </td> 
			<td> <input type="text" name="ingred4" value="<%= idto.getIngred4() %>">  </td>
	</tr>		
			
	<tr>
		
			<td> 재료 5 </td>
			<td> <input type="text" name="ingred5" value="<%= idto.getIngred5() %>"> </td>
	
		
			<td> 재료 6 </td> 
			<td>  <input type="text" name="ingred6" value="<%= idto.getIngred6() %>"> </td>
		
	</tr>	
			
	<tr>
	
			<td> 재료 7 </td> 
			<td><input type="text" name="ingred7" value="<%= idto.getIngred7() %>"> </td>
		
			<td> 재료 8 </td> 
			<td> <input type="text" name="ingred8" value="<%= idto.getIngred8() %>"> </td>
	
	</tr>	
			
	<tr>
			<td> 재료 9 </td> 
			<td> <input type="text" name="ingred9" value="<%= idto.getIngred9() %>"> </td>
	

			<td> 재료 10 </td>
			<td> <input type="text" name="ingred10" value="<%= idto.getIngred10() %>"> </td>
	
	</tr>	
			
	<tr>		
			<td> 재료 11 </td>
			<td> <input type="text" name="ingred11" value="<%= idto.getIngred11() %>"> </td>
	
			<td> 재료 12 </td> 
			<td><input type="text" name="ingred12" value="<%= idto.getIngred12() %>"></td>
	
	</tr>	
			
	<tr>
		
			<td> 재료 13 </td> 
			<td> <input type="text" name="ingred13" value="<%= idto.getIngred13() %>"></td>
	
		
			<td> 재료 14 </td> 
			<td> <input type="text" name="ingred14" value="<%=idto.getIngred14()%>"> </td>
	
	</tr>	
			
	<tr>
	
			<td> 재료 15 </td> 
			<td><input type="text" name="ingred15" value="<%= idto.getIngred15() %>">  </td>
		
	
			<td> 재료 16 </td> 
			<td><input type="text" name="ingred16" value="<%= idto.getIngred16() %>"> </td>

	</tr>		
</table>
	
<table align="center">
	<tr>	
			<input type="hidden" name="content1_img" value="<%=rdto.getContent1_img() %>">
			<td> <img src="/kook/image/<%= rdto.getContent1_img() %>"></td>
			<td> <input type="file" name="content1_img2"></td>
			<td><input type = "text" name="content1_txt" value="<%= rdto.getContent1_txt() %>"></td>
	</tr>

	<tr>
			<input type="hidden" name="content2_img" value="<%=rdto.getContent2_img() %>">
			<td> <img src="/kook/image/<%= rdto.getContent2_img() %>"></td>
			<td> <input type="file" name="content2_img2"></td>
			<td><input type = "text" name="content2_txt" value="<%= rdto.getContent2_txt() %>"></td>
	</tr>
	
	<tr>
			<input type="hidden" name="content3_img" value="<%=rdto.getContent3_img() %>">
			<td> <img src="/kook/image/<%= rdto.getContent3_img() %>"></td>
			<td> <input type="file" name="content3_img2"></td>
			<td><input type = "text" name="content3_txt" value="<%= rdto.getContent3_txt() %>"></td>
	</tr>
	
	<tr>
			<input type="hidden" name="content4_img" value="<%=rdto.getContent4_img() %>">
			<td> <img src="/kook/image/<%= rdto.getContent4_img() %>"></td>
			<td> <input type="file" name="content4_img2"></td>
			<td><input type = "text" name="content4_txt" value="<%= rdto.getContent4_txt() %>"></td>
	
	</tr>
	
	<tr>
			<input type="hidden" name="content5_img" value="<%=rdto.getContent5_img() %>">
			<td> <img src="/kook/image/<%= rdto.getContent5_img() %>"></td>
			<td> <input type="file" name="content5_img2"></td>
			<td><input type = "text" name="content5_txt" value="<%= rdto.getContent5_txt() %>"></td>
	</tr>
	
	<tr>

			<input type="hidden" name="content6_img" value="<%=rdto.getContent6_img() %>">
			<td> <img src="/kook/image/<%= rdto.getContent6_img() %>"></td>
			<td> <input type="file" name="content6_img2"></td>
			<td><input type = "text" name="content6_txt" value="<%= rdto.getContent6_txt() %>"></td>
	</tr>
	
	<tr>			
			<input type="hidden" name="content7_img" value="<%=rdto.getContent7_img() %>">
			<td> <img src="/kook/image/<%= rdto.getContent7_img() %>"></td>
			<td> <input type="file" name="content7_img2"></td>
			<td><input type = "text" name="content7_txt" value="<%= rdto.getContent7_txt() %>"></td>
	</tr>
	
	<tr>
			<input type="hidden" name="content8_img" value="<%=rdto.getContent8_img() %>">
			<td> <img src="/kook/image/<%= rdto.getContent8_img() %>"></td>
			<td> <input type="file" name="content8_img2"></td>
			<td><input type = "text" name="content8_txt" value="<%= rdto.getContent8_txt() %>"></td>
	</tr>
</table>	

<table border = 1 align="center">
		<tr align = "center">
			<th>sweet</th><th>salty</th><th>sour</th><th>spicy</th><th>non_spicy</th>
			<th>soft</th><th>cold</th><th>hot</th><th>fresh</th><th>light</th>
		</tr>
		
		<tr align = "center">
			<% if(rdto.getSweet() == null) { %>
				<td><%=" "%></td>
			<% } else { %>
				<td><%= rdto.getSweet() %></td>
			<% } %>
				
			<% if(rdto.getSalty() == null) { %>
				<td><%=" "%></td> 
			<% } else { %>
				<td><%= rdto.getSalty() %></td> 
			<% } %>	
			<% if(rdto.getSour() == null) { %>
				<td><%=" "%></td>
			<% } else { %>
				<td><%= rdto.getSour() %></td>
			<% } %>
			<% if(rdto.getSpicy() == null) { %>
				<td><%=" "%></td>
			<% } else { %>
				<td><%= rdto.getSpicy() %></td>
			<% } %>
			<% if(rdto.getNon_spicy() == null) { %>
				<td><%=" "%></td>
			<% } else { %>
				<td><%= rdto.getNon_spicy() %></td>
			<% } %>
			<% if(rdto.getSoft() == null) { %>
				<td><%=" "%></td>
			<% } else { %>
				<td><%= rdto.getSoft() %></td>
			<% } %>
			<% if(rdto.getCold() == null) { %>
				<td><%=" "%></td>
			<% } else { %>
				<td><%= rdto.getCold() %></td>
			<% } %>
			<% if(rdto.getHot() == null) { %>
				<td><%=" "%></td>
			<% } else { %>
				<td><%= rdto.getHot() %></td>
			<% } %>
			<% if(rdto.getFresh() == null) { %>
				<td><%=" "%></td>
			<% } else { %>
				<td><%= rdto.getFresh() %></td>
			<% } %>
			<% if(rdto.getLight() == null) { %>
				<td><%=" "%></td>
			<% } else { %>
				<td><%= rdto.getLight() %></td>
			<% } %>
		</tr>
		<tr>
			<td colspan="10" align="center"> <input type = "submit" value="modify">
		</tr>
	</table>	
</form>	
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
