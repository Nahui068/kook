<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.FaqDTO" %>
<%@ page import = "kook.FaqDAO" %>

<%@ include file="/main/top/topAdmin.jsp"%>

<% request.setCharacterEncoding("UTF-8");%>

<head>
	<title> FAQ Modify Pro</title>
</head>
<jsp:useBean id = "dto" class = "kook.FaqDTO"></jsp:useBean>
<jsp:setProperty property ="*" name = "dto" />

<%
	try{
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	
	FaqDAO dao = new FaqDAO();
	int check = dao.modifyFaq(dto);
	
	if(check == 1){%>
		<meta http-equiv="Refresh" content="0;url=faqListAdmin.jsp?&pageNum=<%= currentPage %>" >
		<script language = "JavaScript">
			alert("Modify Complete!");
		</script>
<%	}else{ %>
		<script language = "JavaScript">
			alert("Modify Complete!");
		</script>
<%	}
	} catch (Exception e){ response.sendRedirect("/kook"); } 
%>

