<%-- 로그아웃 기능을 수행하는 JSP 페이지 (ID 세션삭제) --%>
<%-- 작성자 : 김태언 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
		session.removeAttribute("kook_member_id");
		response.sendRedirect("/kook/index.jsp");
%>