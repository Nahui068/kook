<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ClickRecommendDAO" %>
<%@ page import = "kook.ClickRecommendDTO" %>
<%@ page import = "java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>


<%
	try{
	// 로그인한 유저의 아이디를 가져오기(세션확인)
	String userid = null;
	if(session.getAttribute("kook_member_id")!=null){
		userid = (String)session.getAttribute("kook_member_id");
	}
	
	if(userid==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = '/kook/main/login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}

	// 게시판 번호 및 제목 가져오기
	int num = 0;
	String subject = null;
	
	if(request.getParameter("num")!=null && request.getParameter("subject") != null){
		num = Integer.parseInt(request.getParameter("num"));
		subject = (String)request.getParameter("subject");
	}
	
	ClickRecommendDAO crdao = new ClickRecommendDAO();
	
	int result = crdao.like(num, userid, subject);//추천db에 저장
	
	String category = request.getParameter("category");
	String difficulty = request.getParameter("difficulty");
	
	if(result==1){ // 데이터가 정상적으로 입력되면 실행
		if("main_dish".equals(category)){
			result = crdao.main_dish_getLike(num);
		}
		if("side_dish".equals(category)){
			result = crdao.side_dish_getLike(num);
		}
		if("stew_and_soup".equals(category)){
			result = crdao.stew_and_soup_getLike(num);
		}
		if("drink".equals(category)){
			result = crdao.drink_getLike(num);
		}
		if("dessert".equals(category)){
			result = crdao.dessert_getLike(num);
		}
		if("korean_bbq".equals(category)){
			result = crdao.korean_bbq_getLike(num);
		}
		if("kimchi".equals(category)){
			result = crdao.kimchi_getLike(num);
		}
		if("etc".equals(category)){
			result = crdao.etc_getLike(num);
		}
		if("low".equals(difficulty)){
			result = crdao.low_getLike(num);
		}
		if("middle".equals(difficulty)){
			result = crdao.middle_getLike(num);
		}
		if("high".equals(difficulty)){
			result = crdao.high_getLike(num);
		}
				
%>
		<script>
			alert("추천이 완료되었습니다.");
			location.href = document.referrer;
			
		</script>
		
<%
	}else{ // 이미 아이디가 존재할 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 추천을 누른 글입니다.');");
		script.println("history.go(-1);");
		script.println("</script>");
		script.close();
		
		return;
	}
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>