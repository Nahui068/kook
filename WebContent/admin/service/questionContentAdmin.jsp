<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberServiceDTO" %>
<%@ page import = "kook.MemberServiceDAO" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="/main/top/topAdmin.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<title>게시판</title>

</head>

<%
	try{
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");


      MemberServiceDAO dbPro = new MemberServiceDAO();
      MemberServiceDTO writing =  dbPro.getWriting(num);
      
      int ref=writing.getRef();
	  int re_step=writing.getRe_step();
	  int re_level=writing.getRe_level();
%>
<body>  
<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1"  align="center">  
  <tr height="30">
    <td align="center" width="125">글번호</td>
    <td align="center" width="125" align="center" colspan = "3">
	     <%=writing.getNum()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125">작성자</td>
    <td align="center" width="125" align="center">
	     <%=writing.getId()%></td>
    <td align="center" width="125"  >작성일</td>
    <td align="center" width="125" align="center">
	     <%= sdf.format(writing.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125">글제목</td>
    <td align="center" width="375" align="center" colspan="3">
	     <%=writing.getTitle()%></td>
  </tr>
  <tr>
    <td align="center" width="125" >글내용</td>
    <td align="left" width="375" colspan="3"><pre><%=writing.getContent()%></pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4"  align="right" > 
	  <input type="button" value="글삭제" 
       onclick="document.location.href='questionDeletePro.jsp?num=<%=writing.getNum()%>&pageNum=<%=pageNum%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   
      <input type="button" value="답글쓰기" 
       onclick="document.location.href='questionReplyForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   
       <input type="button" value="글목록" 
       onclick="document.location.href='questionListAdmin.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>
</form>      
</body>
</html> 