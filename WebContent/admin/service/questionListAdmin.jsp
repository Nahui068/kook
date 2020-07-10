<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberServiceDAO" %>
<%@ page import = "kook.MemberServiceDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%@ include file="/main/top/topAdmin.jsp"%>
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
    count = db.getWritingCount();
    if (count > 0) {
        writingList = db.getWritings(startRow, endRow);
    }

	number=count-(currentPage-1)*pageSize;
%>
<html>
<head>
<title>게시판</title>
</head>

<body>
<center><b>글목록(전체 글:<%=count%>)</b>
      
<%
    if (count == 0) {
%>
<table width="700" border="1" >
<tr>
    <td align="center">
    게시판에 저장된 글이 없습니다.
    </td></tr>
</table>

<%  } else {    %>
<table border="1" width="700" align="center"> 
    <tr height="30"> 
      <td align="center">Num</td> 
      <td align="center">Title</td> 
      <td align="center">Username</td> 
      <td align="center">Email</td>   
      <td align="center">Reg_date</td>    
    </tr>
<%     for (int i = 0 ; i < writingList.size() ; i++) {
          MemberServiceDTO dto = (MemberServiceDTO)writingList.get(i);
%>
<tr>
    <td align="center" ><%=number--%></td>   
    <td>
    
    <%
    int wid=0; 
    if(dto.getRe_level()>0){
      wid=40*(dto.getRe_level());
    }%>
    <img src="/kook/image/re_step.gif" width="<%=wid%>" height="16">

    
    <a href="questionContentAdmin.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>"><%=dto.getTitle()%></a></td>
    <td align="center"  ><%=dto.getId()%></td>
    <td align="center" ><%=dto.getEmail()%></td>
  
     <td align="center" ><%= sdf.format(dto.getReg_date())%></td>
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
        <a href="questionListAdmin.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="questionListAdmin.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="questionListAdmin.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%
        }
    }
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>
</center>
</body>
</html>