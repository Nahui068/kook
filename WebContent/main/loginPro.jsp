<%-- 회원 로그인 기능을 수행하는 JSP페이지 --%>
<%-- 작성자 : 김태언 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberDAO" %>

<% request.setCharacterEncoding("UTF-8");	%>

<%
		try{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao =  new MemberDAO();
		int check= dao.loginCheck(id,pw);
	
		if(check == 1){
				session.setAttribute("kook_member_id", id);
				response.sendRedirect("/kook/main/main.jsp");
		}else if(check==0){
%>
			<script> 
				alert("Failed Try, Incorrect Password");
				history.go(-1);	//-1, 이전 페이지로 이동
			</script>
<%	
		}else{ 
%>
			<script>
				alert("Failed Try, Incorrect ID");
				history.go(-1);
			</script>
<%
		}	
		}catch(Exception e){	response.sendRedirect("/kook");	}
%>	