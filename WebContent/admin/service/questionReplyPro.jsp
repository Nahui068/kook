<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kook.MemberServiceDAO"%>
<%@ include file="/main/top/topAdmin.jsp"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" scope="page" class="kook.MemberServiceDTO">
   <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<%
	try{
    MemberServiceDAO dbPro = new MemberServiceDAO();
    dbPro.memberServiceInsert(dto);
    
    response.sendRedirect("questionListAdmin.jsp");
	
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>