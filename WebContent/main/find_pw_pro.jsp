<%-- PW찾기 수행을 위한 JSP페이지 --%>
<%-- 작성자 : 김태언 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import = "kook.MemberDAO" %>
<%@ include file="/main/top/top.jsp"%>

<% request.setCharacterEncoding("UTF-8");%>

<%
		try{
		String id = request.getParameter("id");
	    String birth_y = request.getParameter("birth_y");
		String birth_m = request.getParameter("birth_m");
		String birth_d = request.getParameter("birth_d");
		String birth = birth_y+birth_m+birth_d;
		String email_id  = request.getParameter("email_id");
		String email_adr  = request.getParameter("email_adr");
		String email = email_id+"@"+email_adr;		
		
		MemberDAO dao =  new MemberDAO();
	    String pw = dao.find_pw(id, birth, email);

		if(pw!=null){
%>
				<br /><br />
				<table width="300" align="center" >
					<tr>
						<td width="70">
							User PW:
						</td>
						<td>
							<%=pw %>
						</td>
					</tr>
					<tr>
						<td >
							<input type="button" value="Login" style="width:50px"  onclick="location.href='login.jsp'"/>
						</td>
					</tr>
				</table>
<%
		}else{
%>
				<script>
					alert("Check your info.");
					history.go(-1);
				</script>
<%
		}
		}catch(Exception e){	response.sendRedirect("/kook");	}
%>