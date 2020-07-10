<%-- 등록된 전체 회원들의 목록을 보여주는 JSP페이지 (회원 제명 등의 기능 보류) --%>
<%-- 작성자 : 전민기 --%>

<%@page import="java.util.List"%>
<%@page import="kook.MemberDTO"%>
<%@page import="kook.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/main/top/topAdmin.jsp"%>

<link href='http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css' rel='stylesheet' type='text/css' />
<link href='/kook/css/style_1.css' rel='stylesheet' type='text/css' />
	<style type="text/css">	
		.sign{ padding: 0 25px 10px; background: #f1f1f1; opacity: 0.8; width: 1000px; 
			border: 1px solid #e5e5e5; font-family: '맑은 고딕'; }	
	</style> 
<% 
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = dao.memberList();
%>
<html>
	<head><title>memberList</title>
	<script>
		function memberDelete(id){
				if(confirm("Delete?") == true){
						location.href = "memberDeletePro.jsp?id="+id.name;
				}else{
						return false;
				}
		}		
	</script>
	</head>
	<body class = "bg">
    	<center>
    		<div class = "sign">
    			<h3>전체 회원 목록</h3>
    			<hr />
    			<table class = "tbl" colspan = "13" cellpadding = "3" style = "table-layout:fixed">
    				<tr>
   						<th class = "sign_b" width = "80" align = "center">Member ID</th>
   						<th class = "sign_b" width = "150" align = "center">Day of Register</th>
   						<th class = "sign_b" width = "80" align = "center">Name</th>
   						<th class = "sign_b" width = "80" align = "center">Gender</th>
   						<th class = "sign_b" width = "150" align = "center">Day of Birth</th>
   						<th class = "sign_b" width = "100" align = "center">Phone No.</th>
   						<th class = "sign_b" width = "160" align = "center">E-mail</th>
   						<th class = "sign_b" width = "100" align = "center">Delete</th>
   					</tr>    	
<%
				for(MemberDTO dto : list) {
%>    						
					<tr align = "center">
						<td><%= dto.getId() %></td>
						<td><%= dto.getReg() %></td>
						<td><%= dto.getName() %></td>
						<td><%= dto.getGender() %></td>
						<td><%= dto.getBirth() %></td>
						<td><%= dto.getPhNum() %></td>
						<td><%= dto.getEmail() %></td>
							<td>
								<input type = "button" name = "<%= dto.getId() %>" value = "Delete" onClick = "memberDelete(this)" />
							</td>											 							
					</tr>
 <%
				} // for(MemberDTO dto : list){
 %>   						
    			</table>
    		</div>
    		<p />
			<div class="cp" align="center">
				Copyright &copy; 
				<Strong>Jeon MinKi</Strong> 
				(Global IT 인재개발원) &nbsp All Rights Reserved.
			</div>
		</center>
	</body>
</html>	