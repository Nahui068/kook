<%-- 회원의 정보 수정을 수행하는 JSP페이지 --%>
<%-- 작성자 : 전민기 --%>

<%@page import="kook.MemberDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/main/top/topMypage.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id = "dto" class = "kook.MemberDTO" />
<jsp:setProperty property = "*" name = "dto" />

<% 
		try{
				String id = request.getParameter("id");
				String old_pw = request.getParameter("old_pw");
				dto.setId(id);
				MemberDAO dao = new MemberDAO();
				int check = dao.memberModify(dto, old_pw);
				
				if(check == 1){
%>
						<script>
							alert("Complete Modify");
							window.location = '/kook';
						</script>	
<%				
				}else{
%>			
						<script>
							alert("Failed Try, Incorrect Password");
							history.go(-1);
						</script>
<%
				}
		}catch(Exception e){	response.sendRedirect("/kook");	}
%>