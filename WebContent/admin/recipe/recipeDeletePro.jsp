<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeDTO" %>
<%@ page import = "kook.RecipeDAO" %>
<%@ page import = "kook.RecipeListDAO" %>
<%@ page import = "kook.IngredDTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ include file="/main/top/topAdmin.jsp"%>

<% request.setCharacterEncoding("utf-8"); %>

<%
	try{
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	String category = request.getParameter("category");
	String difficulty = request.getParameter("difficulty");
	
	int check = 0;
	int check2 = 0;
	
	int num2 = num-2; // dish에 있는 테이블도 같이 삭제하기 위해
	int inum = num+1; // 재료 테이블 삭제(level에 있는 재료 삭제)
	int inum2 = inum-2; // 재료 테이블 삭제(dish에 있는 재료 삭제)
	
	RecipeListDAO listdao = new RecipeListDAO();
	
	//num에 해당하는 값 삭제
		if("main_dish".equals(category))
			check2 = listdao.delete_main_dish(num2);
		if("side_dish".equals(category))
			check2 = listdao.delete_side_dish(num2);
		if("dessert".equals(category))
			check2 = listdao.delete_dessert(num2);
		if("drink".equals(category))
			check2 = listdao.delete_drink(num2);
		if("kimchi".equals(category))
			check2 = listdao.delete_kimchi(num2);
		if("korean_bbq".equals(category))
			check2 = listdao.delete_korean_bbq(num2);
		if("etc".equals(category))
			check2 = listdao.delete_etc(num2);
		if("low".equals(difficulty))
			check= listdao.delete_low(num);
		if("middle".equals(difficulty))
			check=listdao.delete_middle(num);
		if("high".equals(difficulty))
			check=listdao.delete_high(num);
		
		int icheck = listdao.delete_Ingred(inum);
		icheck = listdao.delete_Ingred(inum2);
		
		if(check==1 && check2 == 1 && icheck==1){
	%>
	<script>
		alert("삭제되었습니다.");
	</script>
	<%}else{ %>
		<script>
			alert("삭제되지 않았습니다.");
		</script>
	<%}%>
	<meta http-equiv="Refresh" content="0;url=recipeListAdmin.jsp?pageNum=<%=pageNum%>" >
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>	