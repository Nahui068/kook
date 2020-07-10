<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.FaqDTO" %>
<%@ page import = "kook.FaqDAO" %>

<%@ include file="/main/top/topAdmin.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>

<h1> FAQ DeltePro </h1>
<jsp:useBean id = "dto" class = "kook.FaqDTO" />
<jsp:setProperty property = "*" name = "dto" />

<%
	try{
	FaqDAO dao = new FaqDAO(); 

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	dao.deleteFaq(num);
	response.sendRedirect("/kook/admin/faq/faqListAdmin.jsp");
	
	} catch (Exception e){ response.sendRedirect("/kook"); } 
%>

	