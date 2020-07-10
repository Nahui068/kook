<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>
<html>
<head>
<title>게시판</title>


</head>

<body>
<center><b>글삭제</b>
<br>
<form method="POST" name="delForm"  action="/kook/mypage/service/myQuestionDeletePro.jsp?pageNum=<%=pageNum%>" > 
 <table border="1" align="center"  width="360">
 <tr height="30">
    <td align=center>
    	<input type="hidden" name="num" value="<%=num%>">
      <input type="submit" value="글삭제" >
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 
