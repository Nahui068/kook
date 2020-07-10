<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeDTO" %>
<%@ page import = "kook.RecipeDAO" %>
<%@ page import = "kook.RecipeListDAO" %>
<%@ page import = "kook.IngredDTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ include file = "/main/top/topAdmin.jsp" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	try{
	String uploadDir = request.getRealPath("image");

	int maxSize = 1024 * 1024 * 100;
	String encoding = "UTF-8";

	// 사용자가 전송한 파일정보 토대로 업로드 장소에 파일 업로드 수행할 수 있게 함
	MultipartRequest multi = new MultipartRequest(request, uploadDir, maxSize, encoding,
		new DefaultFileRenamePolicy());

	RecipeListDAO listdao = new RecipeListDAO();
	RecipeDTO rdto = new RecipeDTO(); // level에 해당하는 레시피 내용 저장
	RecipeDTO rdto2 = new RecipeDTO(); // dish에 해당하는 레시피 내용 저장
	IngredDTO idto = new IngredDTO(); // level에 해당하는 재료 내용 저장
	IngredDTO idto2 = new IngredDTO(); // dish에 해당하는 재료 내용 저장
	
	// level 테이블의 내용을 변경하기 위해 가져온 값 dto에 저장
	int num = Integer.parseInt(request.getParameter("num"));
	rdto.setNum(num);
	rdto.setCategory(multi.getParameter("category"));
	rdto.setSubject(multi.getParameter("subject"));
	
	if((multi.getFilesystemName("thumbnail2"))!=null)
		rdto.setThumbnail(multi.getFilesystemName("thumbnail2"));
	else
		rdto.setThumbnail(multi.getParameter("thumbnail"));
	
	rdto.setContent(multi.getParameter("content"));
	rdto.setPortion(multi.getParameter("portion"));
	rdto.setContent1_txt(multi.getParameter("content1_txt"));
	rdto.setContent2_txt(multi.getParameter("content2_txt"));
	rdto.setContent3_txt(multi.getParameter("content3_txt"));
	rdto.setContent4_txt(multi.getParameter("content4_txt"));
	rdto.setContent5_txt(multi.getParameter("content5_txt"));
	rdto.setContent6_txt(multi.getParameter("content6_txt"));
	rdto.setContent7_txt(multi.getParameter("content7_txt"));
	rdto.setContent8_txt(multi.getParameter("content8_txt"));
	
	//새로운 이미지가 있으면 새로운 이미지를 저장하고 새로운이미지가 없을 경우 기존 이미지 저장 
	if((multi.getFilesystemName("content1_img2"))!=null)
		rdto.setContent1_img(multi.getFilesystemName("content1_img2"));
	else 
		rdto.setContent1_img(multi.getParameter("content1_img"));
	
	if((multi.getFilesystemName("content2_img2"))!=null)
		rdto.setContent2_img(multi.getFilesystemName("content2_img2"));
	else
		rdto.setContent2_img(multi.getParameter("content2_img"));
	
	if((multi.getFilesystemName("content3_img2"))!=null)
		rdto.setContent3_img(multi.getFilesystemName("content3_img2"));
	else
		rdto.setContent3_img(multi.getParameter("content3_img"));
	
	if((multi.getFilesystemName("content4_img2"))!=null)
		rdto.setContent4_img(multi.getFilesystemName("content4_img2"));
	else
		rdto.setContent4_img(multi.getParameter("content4_img"));
	
	if((multi.getFilesystemName("content5_img2"))!=null)
		rdto.setContent5_img(multi.getFilesystemName("content5_img2"));
	else
		rdto.setContent5_img(multi.getParameter("content5_img"));
	
	if((multi.getFilesystemName("content6_img2"))!=null)
		rdto.setContent6_img(multi.getFilesystemName("content6_img2"));
	else
		rdto.setContent6_img(multi.getParameter("content6_img"));
	
	if((multi.getFilesystemName("content7_img2"))!=null)
		rdto.setContent7_img(multi.getFilesystemName("content7_img2"));
	else
		rdto.setContent7_img(multi.getParameter("content7_img"));
	
	if((multi.getFilesystemName("content8_img2"))!=null)
		rdto.setContent8_img(multi.getFilesystemName("content8_img2"));
	else
		rdto.setContent8_img(multi.getParameter("content8_img"));
	
	// dish 테이블의 내용을 변경하기 위해 가져온 값 dto에 저장
	int num2 = Integer.parseInt(request.getParameter("num2"));
	rdto2.setNum(num2);
	rdto2.setCategory(multi.getParameter("category"));
	rdto2.setSubject(multi.getParameter("subject"));
	
	if((multi.getFilesystemName("thumbnail2"))!=null)
		rdto2.setThumbnail(multi.getFilesystemName("thumbnail2"));
	else
		rdto2.setThumbnail(multi.getParameter("thumbnail"));
	
	rdto2.setContent(multi.getParameter("content"));
	rdto2.setPortion(multi.getParameter("portion"));
	rdto2.setContent1_txt(multi.getParameter("content1_txt"));
	rdto2.setContent2_txt(multi.getParameter("content2_txt"));
	rdto2.setContent3_txt(multi.getParameter("content3_txt"));
	rdto2.setContent4_txt(multi.getParameter("content4_txt"));
	rdto2.setContent5_txt(multi.getParameter("content5_txt"));
	rdto2.setContent6_txt(multi.getParameter("content6_txt"));
	rdto2.setContent7_txt(multi.getParameter("content7_txt"));
	rdto2.setContent8_txt(multi.getParameter("content8_txt"));
	
	if((multi.getFilesystemName("content1_img2"))!=null)
		rdto2.setContent1_img(multi.getFilesystemName("content1_img2"));
	else{ 
		rdto2.setContent1_img(multi.getParameter("content1_img"));
	}
	if((multi.getFilesystemName("content2_img2"))!=null)
		rdto2.setContent2_img(multi.getFilesystemName("content2_img2"));
	else{
		rdto2.setContent2_img(multi.getParameter("content2_img"));
	}
	if((multi.getFilesystemName("content3_img2"))!=null)
		rdto2.setContent3_img(multi.getFilesystemName("content3_img2"));
	else
		rdto2.setContent3_img(multi.getParameter("content3_img"));
	
	if((multi.getFilesystemName("content4_img2"))!=null)
		rdto2.setContent4_img(multi.getFilesystemName("content4_img2"));
	else
		rdto2.setContent4_img(multi.getParameter("content4_img"));
	
	if((multi.getFilesystemName("content5_img2"))!=null)
		rdto2.setContent5_img(multi.getFilesystemName("content5_img2"));
	else
		rdto2.setContent5_img(multi.getParameter("content5_img"));
	
	if((multi.getFilesystemName("content6_img2"))!=null)
		rdto2.setContent6_img(multi.getFilesystemName("content6_img2"));
	else
		rdto2.setContent6_img(multi.getParameter("content6_img"));
	
	if((multi.getFilesystemName("content7_img2"))!=null)
		rdto2.setContent7_img(multi.getFilesystemName("content7_img2"));
	else
		rdto2.setContent7_img(multi.getParameter("content7_img"));
	
	if((multi.getFilesystemName("content8_img2"))!=null)
		rdto2.setContent8_img(multi.getFilesystemName("content8_img2"));
	else
		rdto2.setContent8_img(multi.getParameter("content8_img"));
	
	// level 재료 테이블의 내용을 변경하기 위해 가져온 값 dto에 저장
	int inum = Integer.parseInt(request.getParameter("inum")); // dish 재료값
	idto.setNum(inum);
	idto.setIngred1(multi.getParameter("ingred1"));
	idto.setIngred2(multi.getParameter("ingred2"));
	idto.setIngred3(multi.getParameter("ingred3"));
	idto.setIngred4(multi.getParameter("ingred4"));
	idto.setIngred5(multi.getParameter("ingred5"));
	idto.setIngred6(multi.getParameter("ingred6"));
	idto.setIngred7(multi.getParameter("ingred7"));
	idto.setIngred8(multi.getParameter("ingred8"));
	idto.setIngred9(multi.getParameter("ingred9"));
	idto.setIngred10(multi.getParameter("ingred10"));
	idto.setIngred11(multi.getParameter("ingred11"));
	idto.setIngred12(multi.getParameter("ingred12"));
	idto.setIngred13(multi.getParameter("ingred13"));
	idto.setIngred14(multi.getParameter("ingred14"));
	idto.setIngred15(multi.getParameter("ingred15"));
	idto.setIngred16(multi.getParameter("ingred16"));
	
	// dish 재료 테이블의 내용을 변경하기 위해 가져온 값 dto에 저장
	int inum2 = inum-2; 
	
	idto2.setNum(inum2);
	idto2.setIngred1(multi.getParameter("ingred1"));
	idto2.setIngred2(multi.getParameter("ingred2"));
	idto2.setIngred3(multi.getParameter("ingred3"));
	idto2.setIngred4(multi.getParameter("ingred4"));
	idto2.setIngred5(multi.getParameter("ingred5"));
	idto2.setIngred6(multi.getParameter("ingred6"));
	idto2.setIngred7(multi.getParameter("ingred7"));
	idto2.setIngred8(multi.getParameter("ingred8"));
	idto2.setIngred9(multi.getParameter("ingred9"));
	idto2.setIngred10(multi.getParameter("ingred10"));
	idto2.setIngred11(multi.getParameter("ingred11"));
	idto2.setIngred12(multi.getParameter("ingred12"));
	idto2.setIngred13(multi.getParameter("ingred13"));
	idto2.setIngred14(multi.getParameter("ingred14"));
	idto2.setIngred15(multi.getParameter("ingred15"));
	idto2.setIngred16(multi.getParameter("ingred16"));
		
	String pageNum = request.getParameter("pageNum");
	String category = request.getParameter("category");
	String difficulty = request.getParameter("difficulty");
	
	int check = 0;
	int check2 = 0; 
	
	// num에 해당하는 값 수정
	if("main_dish".equals(category))
		check2 = listdao.modify_main_dish(rdto2);
	if("side_dish".equals(category))
		check2 = listdao.modify_side_dish(rdto2);
	if("dessert".equals(category))
		check2 = listdao.modify_dessert(rdto2);
	if("drink".equals(category))
		check2 = listdao.modify_drink(rdto2);
	if("kimchi".equals(category))
		check2 = listdao.modify_kimchi(rdto2);
	if("korean_bbq".equals(category))
		check2 = listdao.modify_korean_bbq(rdto2);
	if("etc".equals(category))
		check2 = listdao.modify_etc(rdto2);
	if("low".equals(difficulty))
		check= listdao.modify_low(rdto);
	if("middle".equals(difficulty))
		check=listdao.modify_middle(rdto);
	if("high".equals(difficulty))
		check=listdao.modify_high(rdto);

	int icheck = listdao.modify_ingred(idto);
	icheck = listdao.modify_ingred(idto2);
	
	

	if(check==1 && check2 == 1 && icheck==1){ 
%>
 <script>
	alert("수정이 완료되었습니다.");
</script>
<%}else{ %>
	<script>
		alert("수정이 실패하였습니다.");
	</script>
<%}
	response.sendRedirect("recipeContentAdmin.jsp?category=" + category + "&difficulty=" + difficulty + "&num=" + num + "&inum=" + inum);
	
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>