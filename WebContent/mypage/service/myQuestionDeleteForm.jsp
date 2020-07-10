<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	try{
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>
<html>
<head>
<title>게시판</title>
</head>
<body>
<br><br><br><br><br>
<center><b>글삭제</b>
<br>
<form method="POST" name="delForm"  action="myQuestionDeletePro.jsp?pageNum=<%=pageNum%>" > 
 <table border="1" align="center"  width="360">
 <tr>
 	<td>Password:</td>
 	<td><input type="password"  name="pw"></td>
 </tr>	
 <tr height="30">
    <td align=center colspan="2">
    	<input type="hidden" name="num" value="<%=num%>">
      <input type="submit" value="글삭제" >
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>
