<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.FaqDAO" %>
<%@ page import = "kook.FaqDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %> 

<%@ include file="/main/top/top.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>

<br><br><br><br><br><br>
<h1><center>FAQ List Page</center></h1>
<%
	int pageSize = 10;
	sdf = new SimpleDateFormat("yyyy-MM-dd");

	try{
	String pageNum = request.getParameter("pageNum");
	String memId = main_id;		// (String)session.getAttribute("kook_member_id");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage -1) * pageSize +1; // 게시판 첫 글 넘버
	int endRow = currentPage * pageSize +1; // 게시판 마지막 글 넘버
	int count = 0;  // 전체 글 수 
	int number = 0;  // 한 페이지당 글 수
	
	List faqList = null;
	FaqDAO dao = new FaqDAO();
	count = dao.getFaqCount();
	
	if (count > 0) {
		faqList = dao.getFaq(startRow, endRow);	
	}
	number = count - (currentPage - 1) * pageSize;
%>

<%-- 글쓰기 버튼 만들기 --%>
<body>
<center><b> FAQ List </b>


<table width ="900" border="1">
	<%if (memId != null && memId.equals("admin")){ %>
<tr>

	<td align = "right" colspan ="4">
		<input type = "button" name = "faqWrite" value="faqWrite" 
		onclick = "window.location = '/kook/admin/faq/faqWriteForm.jsp'" />                     
	<%} else if (memId != null) {%>
		<input type ="button" name = "MemberService" value = "MemberService"
		onclick = "window.location = 'questionForm.jsp'" />
	<%}%>
	</td>
</tr>
<tr >
	<td align = "center" width = "100"><b> No.</b></td>
	<td align = "center" width = "500"><b> Question </b></td>
	<td align = "center" width = "100"><b> Readcount </b></td>
	<td align = "center" width = "100"><b> Date </b></td>
</tr>

	<% if ( count == 0) { %>
		<tr>
		<td align = "center" colspan="4"> 등록된 글이없습니다. </td>
		</tr>
	<%}else { // 게시글이 추가 될 때마다 List에 추가
		for( int i =0; i < faqList.size(); i++){
			FaqDTO faq = (FaqDTO)faqList.get(i);%>
			<tr>
			<td align = "center" width = "100"> <%=number--%></td>
			<td align = "center" width = "500">
			<a href = "faqContent.jsp?num=<%=faq.getNum()%>&pageNum=<%=currentPage%>">
		 	<%=faq.getQuestion()%> </a> </td>
			<td align = "center" width = "100"><%=faq.getReadcount()%></td>
			<td align = "center" width= "200"><%=sdf.format(faq.getReg())%></td>
			</tr>
	   <%} 		
	  }%>
</table>


<%
	//페이지 넘버
	if (count >0){
		int pageCount = count / pageSize + (count % pageSize == 0? 0: 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock =10;
		int endPage = startPage + pageBlock -1;
		if (endPage > pageCount ) endPage = pageCount;
		
		if(startPage>10){%>
			<a href = "faqList.jsp?pageNum=<%=startPage-10%>">[Previous]</a>
<%		}
		for (int i = startPage; i <=endPage; i++){%>
			<a href ="faqList.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%		}
		if(endPage< pageCount) {%>
		<a href="faqList.jsp?pageNum=<%=startPage +10 %>">[Next]</a>
<%		} 

	}
	}catch(Exception e){	response.sendRedirect("/kook");	}
	%>	
</center>
</body>
