<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeDAO" %>
<%@ page import = "kook.RecipeDTO" %>
<%@ page import = "kook.IngredDTO" %>
<%@ page import = "kook.IngredDAO" %>
<%@ page import = "kook.RecipeListDAO" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="/main/top/topRecipe.jsp"%>

<style>
	input[type="checkbox"]:checked + label {
		text-decoration:line-through;
	}
	.main1{
		position:relative;
		top : 200px;
		margin-left : 500px;
		text-align:center;
	}	
	.main1 td{
		padding: 15px;
	}
	
	td.content{
		font-size : 15px;
	}
	
	td.portion{
		font-size : 30px;
	}
	
	.main2{
		position : relative;
		top : 250px;
		width : 500px;
		margin-left : 650px;
		text-align:center;
	}
	.main2 td{
		padding : 10px;
		border:1px solid #ddd;
	}
	.main3{
		position:relative;
		top : 350px;
		margin-left : 630px;
		
	}
	.flavor{
		position : relative;
		top : 500px;
		margin-left : 500px;
		border:1px solid #ddd;
		text-align:center;
		width:500px;
		height: 100px;

	}
	.flavor td{
	padding:15px;
	border:1px solid #ddd;
	}

	tr.flavor_th{
		border:1px solid;
		text-align:center;
	}
	tr.flavor_body{
		border:1px solid;
	}
	.last{
		position:relative;
		top : 550px;
		margin-left : 780px;
		text-align:center;
	
	}
	.l{
		postion : relative;
		margin-top : 520px;
		margin-left : 740px;
		margin-botton :100px;
	}
	
	.btn1{
		background-color : white;
		color : #FBB448;
		border:2px solid #FBB448;
		font-size: 12px;
		border-radius : 8px;
	}
	
	.btn1:hover{
		background-color: #FBB448;
		color:white;
	}
	
	td.btn{
		font-size:12px;
		margin-bottom:100px;
	}
	
	.btn2{
		
		background-color : #4d4d4d;
		color : white;
		border:2px solid #4d4d4d;
		font-size: 20px;
		padding: 5px 40px;
		
	
	}
	.btn2:hover{
		background-color:white;
		color:#4d4d4d;
	}
</style>

<script>
	function golist() {
		location.reload();
		history.back();
	}
</script>

<% request.setCharacterEncoding("utf-8"); %>


<%
	try{
	int num = Integer.parseInt(request.getParameter("num")); // 음식의 num값 받기
	int inum = num + 1; // 재료의 num값

	String pageNum = request.getParameter("pageNum"); //페이지번호 받기
	
	RecipeListDAO relist = new RecipeListDAO();
	RecipeDTO rdto = new RecipeDTO();
	
	String category = request.getParameter("category"); // 카테고리 값 받기
	String difficulty = request.getParameter("difficulty"); //난이도값 받기
	
	if("main_dish".equals(category)) {
		rdto = relist.getMain_dish(num); //num에 해당하는 값들 불러오기
	}
	
	if("side_dish".equals(category)) {
		rdto = relist.getSide_dish(num);
	}
	
	if("stew_soup".equals(category)) {
		rdto = relist.getStew_soup(num);
	}
	
	if("drink".equals(category)) {
		rdto = relist.getDrink(num);
	}
	
	if("dessert".equals(category)) {
		rdto = relist.getDessert(num);
	}
	
	if("korean_bbq".equals(category)) {
		rdto = relist.getKorean_bbq(num);
	}
	
	if("kimchi".equals(category)) {
		rdto = relist.getKimchi(num);
	}
	
	if("etc".equals(category)) {
		rdto = relist.getEtc(num);
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

%>
	<body>
	<table class="main1">
		<tr>
			<% if(rdto.getThumbnail()!= null) { %>
				<td> <img src = "/kook/image/<%= rdto.getThumbnail()%>" width="700" height="500"> </td>
			<% } %>
		</tr>
			
		<tr >
			<% if(rdto.getContent() != null) { %>
				<td class="content"> <%= rdto.getContent() %> </td>
			<% } %>
		</tr>
		
		<tr >
			<% if(rdto.getPortion() != null) { %>
				<td class="portion"> <%= rdto.getPortion() %> servings </td>
			<% } %>
		</tr>
	</table>

	<table class="main2">
		<tr>
			<% if(!("null".equals(idto.getIngred1()))) { %>
				<td> 재료 1 </td> 
				<td> <input type = "checkbox" id = "check1" /> <label for = "check1"> <%= idto.getIngred1() %> </label> </td>
			<% } %>
			<% if(!("null".equals(idto.getIngred2()))) { %>
				<td> 재료 2 </td> 
				<td> <input type = "checkbox" id = "check2" /> <label for = "check2"> <%= idto.getIngred2() %> </label> </td>
			<% } %>
		</tr>	
			
		<tr>
			<% if(!("null".equals(idto.getIngred3()))) { %>
				<td> 재료 3 </td> 
				<td> <input type = "checkbox" id = "check3" /> <label for = "check3"> <%= idto.getIngred3() %> </label> </td>
			<% } %>
			
			<% if(!("null".equals(idto.getIngred4()))) { %>
				<td> 재료 4 </td> 
				<td> <input type = "checkbox" id = "check4" /> <label for = "check4"> <%= idto.getIngred4() %> </label> </td>
			<% } %>
		</tr>	
				
		<tr>
			<% if(!("null".equals(idto.getIngred5()))) { %>
				<td> 재료 5 </td>
				<td> <input type = "checkbox" id = "check5" /> <label for = "check5"> <%= idto.getIngred5() %> </label> </td>
			<% } %>
			<% if(!("null".equals(idto.getIngred6()))) { %>
				<td> 재료 6 </td> 
				<td> <input type = "checkbox" id = "check6" /> <label for = "check6"> <%= idto.getIngred6() %> </label> </td>
			<% } %>
		</tr>	
				
		<tr>
			<% if(!("null".equals(idto.getIngred7()))) { %>
				<td> 재료 7 </td> 
				<td> <input type = "checkbox" id = "check7"/> <label for = "check7"> <%= idto.getIngred7() %> </label> </td>
			<% } %>
			<% if(!("null".equals(idto.getIngred8()))) { %>
				<td> 재료 8 </td> 
				<td> <input type = "checkbox" id = "check8" /> <label for = "check8"> <%= idto.getIngred8() %> </label> </td>
			<% } %>
		</tr>	
				
		<tr>
			<% if(!("null".equals(idto.getIngred9()))) { %>
				<td> 재료 9 </td> 
				<td> <input type = "checkbox" id = "check9" /> <label for = "check9"> <%= idto.getIngred9() %> </label> </td>
			<% } %>
			<% if(!("null".equals(idto.getIngred10()))) { %>
				<td> 재료 10 </td>
				<td> <input type = "checkbox" id = "check10" /> <label for = "check10"> <%= idto.getIngred10() %> </label> </td>
			<% } %>
		</tr>	
				
		<tr>
			<% if(!("null".equals(idto.getIngred11()))) { %>
				
				<td> 재료 11 </td>
				<td> <input type = "checkbox" id = "chec11" /> <label for = "chec11"> <%= idto.getIngred11() %> </label> </td>
			<% } %>
			<% if(!("null".equals(idto.getIngred12()))) { %>
				<td> 재료 12 </td> 
				<td> <input type = "checkbox" id = "check12" /> <label for = "check12"> <%= idto.getIngred12() %> </label> </td>
			<% } %>
		</tr>	
				
		<tr>
			<% if(!("null".equals(idto.getIngred13()))) { %>
				<td> 재료 13 </td> 
				<td> <input type = "checkbox" id = "check13" /> <label for = "check13"> <%= idto.getIngred13() %> </label> </td>
			<% } %>
			<% if(!("null".equals(idto.getIngred14()))) { %>
				<td> 재료 14 </td> 
				<td> <input type = "checkbox" id = "check14" /> <label for = "check14"> <%= idto.getIngred14() %> </label> </td>
			<% } %>
		</tr>	
				
		<tr>
			<% if(!("null".equals(idto.getIngred15()))) { %>
				<td> 재료 15 </td> 
				<td> <input type = "checkbox" id = "check15" /> <label for = "check15"> <%= idto.getIngred15() %> </label> </td>
			<% } %>
			<% if(!("null".equals(idto.getIngred16()))) { %>
				<td> 재료 16 </td> 
				<td> <input type = "checkbox" id = "check16" /> <label for = "check16"> <%= idto.getIngred16() %> </label> </td>
			<% } %>
		</tr>		
	</table>
		
	<table class="main3">
		<tr>
			<% if(!("null".equals(rdto.getContent1_img()))){ %>
				<td><img src="/kook/image/<%= rdto.getContent1_img() %>" width="400" height="300"></td>
				<td><%= rdto.getContent1_txt() %></td>
			<% } %>
		</tr>
		
		<tr>
			<% if(!("null".equals(rdto.getContent2_img()))) { %>
				<td><img src="/kook/image/<%= rdto.getContent2_img() %>" width="400" height="300"></td>
				<td><%= rdto.getContent2_txt() %></td>
			<% } %>
		</tr>
		
		<tr>
			<% if(!("null".equals(rdto.getContent3_img()))) { %>
				<td><img src="/kook/image/<%= rdto.getContent3_img() %>" width="400" height="300"></td>
				<td><%= rdto.getContent3_txt() %></td>
			<% }%>
		</tr>
		
		<tr>
			<% if(!("null".equals(rdto.getContent4_img()))) { %>
				<td><img src="/kook/image/<%= rdto.getContent4_img() %>"width="400" height="300"></td>
				<td><%= rdto.getContent4_txt() %></td>
			<% } %>
		</tr>
		
		<tr>
			<% if(!("null".equals(rdto.getContent5_img()))) { %>
				<td><img src="/kook/image/<%= rdto.getContent5_img() %>" width="400" height="300"></td>
				<td><%= rdto.getContent5_txt() %></td>
			<% } %>
		</tr>
		
		<tr>
			<% if(!("null".equals(rdto.getContent6_img()))){ %>
				<td><img src="/kook/image/<%= rdto.getContent6_img() %>" width="400" height="300"></td>
				<td><%= rdto.getContent6_txt() %></td>
			<% } %>
		</tr>
		
		<tr>
			<% if(!("null".equals(rdto.getContent7_img()))) { %>
				<td><img src="/kook/image/<%= rdto.getContent7_img() %>" width="400" height="300"></td>
				<td><%= rdto.getContent7_txt() %></td>
			<% } %>
		</tr>
		
		<tr>
			<% if(!("null".equals(rdto.getContent8_img()))) { %>
				<td><img src="/kook/image/<%= rdto.getContent8_img() %>" width="400" height="300"></td>
				<td><%= rdto.getContent8_txt() %></td>
			<% } %>
		</tr>
	</table>	
	
	<table class="flavor">
			<tr class="flavor_th">
				<b><td>sweet</td><td>salty</td><td>sour</td><td>spicy</td><td>non_spicy</td>
				<td>soft</td><td>cold</td><td>hot</td><td>fresh</td><td>light</td></b>
			</tr>
			
			<tr class = "flavor_body">
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
		</table>
		<br><br><br>
		<table class="last">	
			<tr>
				<td> 추천수 : <%=rdto.getRecommend()%> </td>
			</tr>
				
			<tr>
				
				<td>
					<input class="btn1" type="button"  name="recommend" value="recommend" onclick="location.href='/kook/recipe/userLikeAction.jsp?num=<%=num%>&inum=<%=inum%>&subject=<%=rdto.getSubject()%>&category=<%=category%>&difficulty=<%=difficulty%>'">	
				</td>
			</tr>
		</table>
	<br><br><br>
	<table class="l">
			<tr>
				<td class="btn"> <input class="btn2" type="button" value = "list" onclick= "golist()" ></td>
			</tr>
	</table>
	</body>
	<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>