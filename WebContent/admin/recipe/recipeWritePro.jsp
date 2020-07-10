<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.RecipeDAO" %>
<%@ page import = "kook.RecipeDTO" %>
<%@ page import = "kook.IngredDTO" %>
<%@ page import = "kook.IngredDAO" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file = "/main/top/topAdmin.jsp" %>

<%request.setCharacterEncoding("utf-8"); %>

<%		
		try{
		RecipeDTO rdto = new RecipeDTO();
		IngredDTO idto = new IngredDTO();
		
		//image경로에 사진을 업로드함
  	 	 String uploadDir = request.getRealPath("image");
	
		// 총 100M 까지 저장 가능하게 함
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		// 사용자가 전송한 파일정보 토대로 업로드 장소에 파일 업로드 수행할 수 있게 함
		MultipartRequest multi = new MultipartRequest(request, uploadDir, maxSize, encoding,
				new DefaultFileRenamePolicy());
		
		//WriteForm에서 값 받아오기
		rdto.setSubject(multi.getParameter("subject"));
		rdto.setContent(multi.getParameter("content"));
		rdto.setThumbnail(multi.getFilesystemName("thumbnail"));
		rdto.setPortion(multi.getParameter("portion"));
		
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
		
		rdto.setContent1_img(multi.getFilesystemName("content1_img"));
		rdto.setContent1_txt(multi.getParameter("content1_txt"));
		rdto.setContent2_img(multi.getFilesystemName("content2_img"));
		rdto.setContent2_txt(multi.getParameter("content2_txt"));
		rdto.setContent3_img(multi.getFilesystemName("content3_img"));
		rdto.setContent3_txt(multi.getParameter("content3_txt"));
		rdto.setContent4_img(multi.getFilesystemName("content4_img"));
		rdto.setContent4_txt(multi.getParameter("content4_txt"));
		rdto.setContent5_img(multi.getFilesystemName("content5_img"));
		rdto.setContent5_txt(multi.getParameter("content5_txt"));
		rdto.setContent6_img(multi.getFilesystemName("content6_img"));
		rdto.setContent6_txt(multi.getParameter("content6_txt"));
		rdto.setContent7_img(multi.getFilesystemName("content7_img"));
		rdto.setContent7_txt(multi.getParameter("content7_txt"));
		rdto.setContent8_img(multi.getFilesystemName("content8_img"));
		rdto.setContent8_txt(multi.getParameter("content8_txt"));
		
		if(rdto.getContent1_img()==null) rdto.setContent1_img("null");
		if(rdto.getContent2_img()==null) rdto.setContent2_img("null");
		if(rdto.getContent3_img()==null) rdto.setContent3_img("null");
		if(rdto.getContent4_img()==null) rdto.setContent4_img("null");
		if(rdto.getContent5_img()==null) rdto.setContent5_img("null");
		if(rdto.getContent6_img()==null) rdto.setContent6_img("null");
		if(rdto.getContent7_img()==null) rdto.setContent7_img("null");
		if(rdto.getContent8_img()==null) rdto.setContent8_img("null");
		
		rdto.setSweet(multi.getParameter("sweet"));
		rdto.setSour(multi.getParameter("sour"));
		rdto.setSalty(multi.getParameter("salty"));
		rdto.setSpicy(multi.getParameter("spicy"));
		rdto.setNon_spicy(multi.getParameter("non_spicy"));
		rdto.setHot(multi.getParameter("hot"));
		rdto.setCold(multi.getParameter("cold"));
		rdto.setLight(multi.getParameter("light"));
		rdto.setSoft(multi.getParameter("soft"));
		rdto.setFresh(multi.getParameter("fresh"));
		rdto.setRecommend(0);
		
		String category = multi.getParameter("category");
		rdto.setCategory(multi.getParameter("category"));
		
		String difficulty = multi.getParameter("difficulty");
		rdto.setDifficulty(multi.getParameter("difficulty"));
		
		ArrayList<RecipeDTO> relist = new ArrayList<RecipeDTO>();
		ArrayList<IngredDTO> inlist = new ArrayList<IngredDTO>();
		
		int num = 0;
		int inum = 0;
		
		// 디비에 음식내용 저장 및 재료저장(음식의 num+1이 재료의 번호로 삽입됨)
		if("main_dish".equals(category)){
			new RecipeDAO().main_dish_upload(rdto);
			new IngredDAO().ingredInsert(idto);
		}
		if("side_dish".equals(category)){
			new RecipeDAO().side_dish_upload(rdto);
			new IngredDAO().ingredInsert(idto);
		}
		if("stew_soup".equals(category)){
			new RecipeDAO().stew_soup_upload(rdto);
			new IngredDAO().ingredInsert(idto);
		}
		if("drink".equals(category)){
			new RecipeDAO().drink_upload(rdto);
			new IngredDAO().ingredInsert(idto);
		}
		if("dessert".equals(category)){
			new RecipeDAO().dessert_upload(rdto);
			new IngredDAO().ingredInsert(idto);
		}
		if("korean_bbq".equals(category)){
			new RecipeDAO().korean_bbq_upload(rdto);
			new IngredDAO().ingredInsert(idto);
		}
		if("kimchi".equals(category)){
			new RecipeDAO().kimchi_upload(rdto);
			new IngredDAO().ingredInsert(idto);
		}
		if("etc".equals(category)){
			new RecipeDAO().etc_upload(rdto);
			new IngredDAO().ingredInsert(idto);
		}
		if("low".equals(difficulty)){
			new RecipeDAO().low_upload(rdto);
			new IngredDAO().ingredInsert(idto);
			
			//num값 받아오기
			relist= new RecipeDAO().getLow();
			for(int i = 0; i < relist.size(); i++) rdto = relist.get(i);
			num = rdto.getNum();
			
			inlist = new IngredDAO().getIngred();
			for(int i = 0; i < inlist.size(); i++) idto = inlist.get(i);
			inum = idto.getNum();
		}
		if("middle".equals(difficulty)){
			new RecipeDAO().middle_upload(rdto);	
			new IngredDAO().ingredInsert(idto);
			
			relist= new RecipeDAO().getMiddle();
			for(int i = 0; i < relist.size(); i++) rdto = relist.get(i);
			num = rdto.getNum();
			
			inlist = new IngredDAO().getIngred();
			for(int i = 0; i < inlist.size(); i++) idto = inlist.get(i);
			inum = idto.getNum();
		}
		if("high".equals(difficulty)){
			new RecipeDAO().high_upload(rdto);
			new IngredDAO().ingredInsert(idto);
			
			relist= new RecipeDAO().getHigh();
			for(int i = 0; i < relist.size(); i++) rdto = relist.get(i);
			num = rdto.getNum();
			
			inlist = new IngredDAO().getIngred();
			for(int i = 0; i < inlist.size(); i++) idto = inlist.get(i);
			inum = idto.getNum();
		}
		

	response.sendRedirect("recipeContentAdmin.jsp?category=" + category + "&difficulty=" + difficulty + "&num=" + num + "&inum=" + inum);	
		
		}catch(Exception e){	response.sendRedirect("/kook");	}
%>
	
	