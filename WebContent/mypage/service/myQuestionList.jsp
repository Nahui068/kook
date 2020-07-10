<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberServiceDAO" %>
<%@ page import = "kook.MemberServiceDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%	
    int pageSize = 10;
    sdf =  new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try{
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);	
    int startRow = (currentPage - 1) * pageSize + 1;	
    int endRow = currentPage * pageSize;	
    int count = 0;
    int number=0;

    
    List writingList = null;
    MemberServiceDAO db = new MemberServiceDAO();
    String id = (String)session.getAttribute("kook_member_id");
    
    count = db.getWritingCount(id);
    if (count > 0) {
        writingList = db.getWritings(startRow, endRow, id);
    }

	number=count-(currentPage-1)*pageSize;
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
<br /><br />
<center><b>나의 글목록(전체 글:<%=count%>)</b>
<br>
<table width="700">
<tr>
    <td align="right" >
    <%if(session.getAttribute("kook_member_id")!=null){ %>
    <a href="myQuestionForm.jsp">글쓰기</a>
     <%}%>	
    </td>
</table>

<%
    if (count == 0) {
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
    게시판에 저장된 글이 없습니다.
    </td>
</table>

<%  } else {    %>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" > 
      <td align="center">Num</td> 
      <td align="center">Title</td> 
      <td align="center">ID</td> 
      <td align="center">Email</td>   
      <td align="center">Reg_date</td>       
    </tr>
<%  
		int n = writingList.size();		//
		number = n;								// 글번호
        for (int i = 0 ; i < writingList.size() ; i++) {
        	 MemberServiceDTO dto = (MemberServiceDTO)writingList.get(i);
%>
   <tr>
   <td align="center" ><%= number-- %></td>
     <td>
    <%
	      int wid=0; 
	      if(dto.getRe_level()>0){
	        wid=40*(dto.getRe_level());
	      }
	%>
	<img src="/kook/image/re_step.gif" width="<%=wid%>" height="16">
	<%-- --%>
    <a href="questionContent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>"><%=dto.getTitle()%></a></td>
    <td align="center"  ><%=dto.getId()%></td>
    <td align="center" ><%=dto.getEmail()%></td>
  	
     <td align="center" ><%= dto.getReg_date()%></td>
  </tr>
     <%}%>
</table>
<%}%>

<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="myQuestionList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="myQuestionList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="myQuestionList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
%>
</center>
</body>
</html>
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>