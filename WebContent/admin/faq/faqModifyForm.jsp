<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.FaqDTO" %>
<%@ page import = "kook.FaqDAO" %>

<%@ include file="/main/top/topAdmin.jsp"%>

<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id = "dto" class = "kook.FaqDTO" />
<jsp:setProperty property = "*" name = "dto" />


<head>
	<title> faq Modify </title>
</head>

<%
	try{
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	FaqDAO dao = new FaqDAO();
	FaqDTO faq = dao.modifyGetFaq(num);
%>

<body> 
<center><b> Notice Modify </b></center>
<br />
<form mothod ="post" name = "modifyForm" action = "faqModifyPro.jsp?pageNum=<%=pageNum%>" onsubmit ="return writeSave()"> 
<table width ="800" border="1" cellspacing ="0" cellpadding ="0" align = "center" >
	<tr height ="40">
		<td align = "center" width = "200"><b> FAQ Number </b></td>
		<td align = "center" width = "200"> <%=dto.getNum()%> </td>
		<input type="hidden" name="num" value=<%=faq.getNum()%> /> 
		<td align = "center" width = "200"><b> Hits </b></td>
		<td align = "center" width = "200"><b> <%=dto.getReadcount()%></b></td>
	</tr>
	<tr height="100">
		<td align = "center" width="100"><b> Question </b></td>
		<td colspan ="3">
		<textarea name = "question" rows="4" cols="90"><%=faq.getQuestion()%></textarea>
		</td>
	</tr>
	<tr height = "400">
		<td align = "center" width = "100"><b> Answer </b></td>
		<td colspan="3">
		<textarea name ="answer" rows="20" cols="90" ><%=faq.getAnswer()%> </textarea>
		</td>
	</tr>
	<tr>
		<td colspan="6" align ="center">
			<input type = "submit" name ="modifyFinish" value="modifyFinish" />
		</td>
	</tr>
</table>	
</form>
<%
	} catch (Exception e){ response.sendRedirect("/kook"); } 
%>
</body>

	 </title>
</head> 