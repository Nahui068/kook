<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberServiceDAO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%@ include file="/main/top/topMypage.jsp"%>

 <jsp:useBean id="dto" class="kook.MemberServiceDTO"/>
    <jsp:setProperty property="*" name="dto"/>
    
     <% 
    	try{
     	int num = Integer.parseInt(request.getParameter("num"));
     	String pageNum = request.getParameter("pageNum");
     	String id = (String)session.getAttribute("kook_member_id");
     	String pw = request.getParameter("pw");		
    	MemberServiceDAO dao = new MemberServiceDAO();
    	String msg = "";	
    	if(!(id.equals("admin"))){	//관리자 아이디가 아닐 때 비밀번호 체크 후 글 삭제
    		int check= dao.deleteCheck(id,pw);	
    		if(check==1){
    			 msg = dao.delete(dto);	
    		}else if(check==0){							// 다른 비밀번호를 입력하면 check값이 0이 되어 아래 문구를 띄우고 이전 페이지로 이동
    			%>
    			<script> 
    				alert("Failed Try, Incorrect Password");
    				history.go(-1);	//-1, 이전 페이지로 이동
    			</script>
    <%	
    		}
    	}else{
    		msg = dao.delete(dto);	
    	}
    %>
    <br /><br />
    	<h1><center><%=msg%></center></h1>
    	<br />
    	<center><input type="button" value="글목록" 
       onclick="document.location.href='myQuestionList.jsp?pageNum=<%=pageNum%>'"></center>
       
   <%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>    