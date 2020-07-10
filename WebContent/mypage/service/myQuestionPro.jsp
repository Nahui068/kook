<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kook.MemberServiceDAO"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="dto" scope="page" class="kook.MemberServiceDTO">
   <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>


<%
	try{
    MemberServiceDAO dbPro = new MemberServiceDAO();
    dbPro.memberServiceInsert(dto);
    String id = (String)session.getAttribute("kook_member_id");
%> 


<%
		if(id.equals("admin")){
			response.sendRedirect("/kook/admin/service/questionListAdmin.jsp");	
		}else{
			response.sendRedirect("myQuestionList.jsp?id="+id);	
		}
	}catch(Exception e){	response.sendRedirect("/kook");	}	
%>
