<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.FaqDTO" %>
<%@ page import = "kook.FaqDAO" %>
<%@ page import = "java.sql.Timestamp" %>  
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="/main/top/topAdmin.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "faq" class = "kook.FaqDTO" />
<jsp:setProperty property = "*" name = "faq" />

<%
	try{
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	
	FaqDAO dao = new FaqDAO();
	dao.faqBoardInsert(faq);
	
	response.sendRedirect("faqListAdmin.jsp?num=" + faq.getNum() + "&pageNum=" + currentPage);
	
	} catch (Exception e){ response.sendRedirect("/kook"); } 
%>