<%-- 회원 탈퇴를 수행하기 위한 JSP 페이지 --%>
<%-- 작성자 : 전민기 --%>

<%@page import="kook.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/main/top/topMypage.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>

<% 
		try{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDAO dao = new MemberDAO();
		int check = dao.memberLeave(id, pw);
		
		if(check == 1){
			session.removeAttribute("kook_member_id");
%>			
			<script>
				alert("Complete Delete, Good bye");
				window.location = '/kook';
			</script>		
<%				
		}else{
%>			
			<script>
				alert("Failed Try, Incorrect Password");
				window.location = 'memberLeave.jsp';
			</script>
<%
		}
		}catch(Exception e){	response.sendRedirect("/kook");	}
%>


	
