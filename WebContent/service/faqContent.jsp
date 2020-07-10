<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.FaqDTO" %>
<%@ page import = "kook.FaqDAO" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="/main/top/top.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>

<head> 
	<title> FAQ Answer Content </title>
</head>

<% 
	try{
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	sdf = new SimpleDateFormat("yyyy-MM-dd");

		FaqDAO dao = new FaqDAO();
		FaqDTO faq = dao.getFaq(num);	 // 해당하는 num으로 db를 검색해서 나온 결과값을 받은 list를 저장한 faq
%>	
<body>
<center><b> FAQ Content </b></center>
<br />

<table width = "800" border ="1" align = "center" cellspacing ="0" cellpadding ="0">
	<tr height = "40">
		<td align = "center" width = "100"><b> FAQ Number </b></td>
		<td align = "center" width = "100"> <%=faq.getNum()%> </td>
		<td align = "center" width = "100"><b> Hits </b></td>
		<td align = "center" width = "100"> <%=faq.getReadcount()%> </td>
		<td align = "center" width = "100"><b> Date </b></td>
		<td align = "center" width = "100"><%=sdf.format(faq.getReg())%></td>
	</tr>
	<tr height = "100">
		<td align = "center" width = "100"><b> Question </b></td>
		<td align = "center" colspan="5"> <%=faq.getQuestion()%> </td>
	</tr>
	<tr height = "400">
		<td align = "center" width = "100"><b> Answer </b></td>
		<td align = "center" colspan = "5"> <%=faq.getAnswer()%> </td>
	</tr>
	<% // 관리자 로그인 후 확인 하기!
		String id = (String)session.getAttribute("kook_member_id");
		if (id != null && id.equals("admin")){%>

	<tr height = "50">
		<td align = "center"  colspan="6"> 
		<input type = "button" name = "faqmodify" value = "faqmodify" 
		onclick="window.location = '/kook/admin/faq/faqModifyForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'"/>
		<input type = "button" name = "faqdelete" value = "faqdelete"
		onclick = "window.location = '/kook/admin/faq/faqDeleteForm.jsp?num=<%=num%>&pageNum=<%=pageNum%>'" />
		<input type="button" name = "faq_list" value = "faq_list" onClick="window.location ='/kook/service/faqList.jsp'" />
		</td>
	</tr>
 
<%		} else {%>
		
		<tr height = "50"><td align = "center"  colspan="6">
		<input type="button" name = "faq_list" value = "faq_list" onClick="window.location ='/kook/service/faqList.jsp'" />
		</td></tr>
<%}%>
</table>	
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>


</body>
	
