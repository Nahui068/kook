<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberServiceDTO" %>
<%@ page import = "kook.MemberServiceDAO" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<title>게시판</title>

</head>

<%
	try{	// num과 pageNum값을 받아온다
		String id = main_id;
    int num = Integer.parseInt(request.getParameter("num"));
    String pageNum = request.getParameter("pageNum");

  	sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

      MemberServiceDAO dbPro = new MemberServiceDAO();
      MemberServiceDTO writing =  dbPro.getWriting(num);	//num값에 따른 내용들을 MemberServiceDTO에 전달
	 
%>
<body>  
<br /><br />
<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1"  align="center">  
  <tr height="30">
    <td align="center" width="125">글번호</td>
    <td align="center" colspan="3" width="125" >
	     <%=writing.getNum()%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125">작성자</td>
    <td align="center" width="125" >
	     <%=writing.getId()%></td>
    <td align="center" width="125"  >작성일</td>
    <td align="center" width="125">
	     <%= sdf.format(writing.getReg_date())%></td>
  </tr>
  <tr height="30">
    <td align="center" width="125">글제목</td>
    <td align="center" width="375"  colspan="3">
	     <%=writing.getTitle()%></td>
  </tr>
  <tr>
    <td align="center" width="125" >글내용</td>
    <td align="left" width="375" colspan="3"><pre><%=writing.getContent()%></pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4"  align="right" > 
    <%if(id.equals("admin")){%>		<%--관리자의 경우 바로 삭제 --%>
	  <input type="button" value="글삭제" 
       onclick="document.location.href='myQuestionDeletePro.jsp?num=<%=writing.getNum()%>&pageNum=<%=pageNum%>'">
       <%}else {%>					<%--관리자가 아닌 경우 비밀번호 입력 페이지 --%>
       <input type="button" value="글삭제" 
       onclick="document.location.href='myQuestionDeleteForm.jsp?num=<%=writing.getNum()%>&pageNum=<%=pageNum%>'">
       <%}%>
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='myQuestionList.jsp?pageNum=<%=pageNum%>'">
    </td>
  </tr>
</table>    
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>
</form>      
</body>
</html>      
