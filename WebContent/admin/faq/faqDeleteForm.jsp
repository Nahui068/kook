<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.FaqDTO" %>
<%@ page import = "kook.FaqDAO" %>

<%@ include file="/main/top/topAdmin.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>

<h1> FAQ Delete Page </h1>
<center><b> Notice Delete </b></center>
<br />
<br />

<%
	try{
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

%>
<script type = "text/jacascript">
	alert("정말로 삭제 하시겠습니까?");
</script>

<body>
<form method ="post" name = "deleteForm" action="faqDeletePro.jsp?pageNum=<%=pageNum%>">
<table width="800" cellspacing = "0" cellpadding="0" align = "center">

	<tr height = "40">
		<td align = "center"> 비밀 번호
			<input type = "password" name = "adminPW" maxlength = "20" >
			<input type = "hidden" name = "num" value ="<%=num%>">
		</td>
	</tr>
	<tr></tr>
	<tr>
		<td align = "center" colspan ="2">
			<input type = "submit" name = "deleteFAQ" value = "deleteFAQ" />
		</td>
	</tr>
</table>
</form>
</body>
<%	
	} catch (Exception e){ response.sendRedirect("/kook"); } 
%>