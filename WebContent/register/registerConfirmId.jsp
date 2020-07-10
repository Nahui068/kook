<%-- ID 중복 확인하기 위한 JSP페이지 --%>
<%-- 작성자 : 전민기 --%>

<%@page import="kook.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<html>
	<head>
		<title>Register Confirm ID</title>
	</head>
<%
			try{
					String id = request.getParameter("id");
					MemberDAO dao = new MemberDAO();
					int check = dao.confirmId(id);							// 중복 id 체크
%>
			<script language="javascript">
				// 사용가능한 ID를 Text form에 입력
				function setId(){		
					opener.document.register.id.value="<%=id%>";
						// opener : 현재 페이지의 부모가 되는 창 (회원가입폼)
					self.close();
						// 윈도우 창 닫기 
				}
			</script>
			<body>
				<center />
<%
    			if(check == 1) {
%>
					<table width="270" border="0" cellspacing="0" cellpadding="5">
		  				<tr> 
		    				<td height="39" >The [ <%=id%> ] is already in use.
		    				</td>
		 				 </tr>
					</table>
					<form name="checkForm" method="post" action="registerConfirmId.jsp">
						<table width="270" border="0" cellspacing="0" cellpadding="5">
		 					 <tr>
		   						 <td align="center"> Please select a different ID.
									<p />
									<input type="text" size="10" maxlength="12" name="id" tabindex = "1" /> 
									<input type="submit" value="Confirm ID" tabindex = "2" />
								</td>
							</tr>
						</table>
					</form>
<%
				}else{
%>
					<table width="270" border="0" cellspacing="0" cellpadding="5">
						<tr> 
							<td align="center"> 
								<p>The [ <%=id%> ] is you can use. </p>
								<input type="button" value="닫기" onclick="setId()" tabindex="1" />
							</td>
						</tr>
					</table>
<%
				}
		}catch(Exception e){	response.sendRedirect("/kook");	}
%>
	</body>
</html>