<%-- 회원 제명 처리 수행하는 jsp페이지 --%>
<%-- 작성자 : 전민기 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kook.MemberDAO"%>
<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	try{
		String id = request.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		String msg = dao.memberDelete(id);
		 
%>		
		<script>
			alert(<%= msg %>);
		</script>
<%		
		response.sendRedirect("memberListAdmin.jsp");		

	}catch(Exception e){	response.sendRedirect("/kook");	}
%>