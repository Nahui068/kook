<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
try{
		String id = main_id;
%>

<title>memberService </title>
<br /><br />
<h1><center>Ask Us Directly!</h1>

<h3><center>Question</center></h3>


<% 
  int num=0,ref=1,re_step=0,re_level=0;
    if(request.getParameter("num")!=null){
	num=Integer.parseInt(request.getParameter("num"));
	ref=Integer.parseInt(request.getParameter("ref"));
	re_step=Integer.parseInt(request.getParameter("re_step"));
	re_level=Integer.parseInt(request.getParameter("re_level"));
	}
%>


<form action="myQuestionPro.jsp" method="post" name="userinput" onsubmit="return writeSave()">	<%--일대일 문의 작성 후 myQuestionPro로 이동 --%>
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="ref" value="<%=ref%>">
<input type="hidden" name="re_step" value="<%=re_step%>">
<input type="hidden" name="re_level" value="<%=re_level%>">
<table width="600px" align="center" border="1">
	<tr><td width="100px">Title</td>
	<td style=border:1px solid #fff> 
	<%if(request.getParameter("num")==null){%>
       <input type="text" size="40" maxlength="50" name="title"></td>
	<%}else{%>
	   <input type="text" size="40" maxlength="50" name="title" value="[답변]">
	<%}%></td></tr>
	<tr><td width="100px">ID</td>
	<td style=border:1px solid #fff><input type="hidden" name="id" value="<%=id%>" /><%=id%></td></tr>
	<tr><td width="100px">Email</td>
	<td style=border:1px solid #fff><input type="text" name="email" size="40"></td></tr>
	<tr><td width="100px">Contents</td>
	<td style=border:1px solid #fff><form><textarea name="content" cols="60" rows="20"></textarea></form></td></tr>
	<tr>
</table><br>
<center>

<input type="submit" value="Send">
</form></center>

<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>