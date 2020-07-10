<%-- 회원로그인 JSP페이지 --%>
<%-- 작성자 : 김태언 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/main/top/top.jsp"%>

<%
if (main_id != null) {
		response.sendRedirect("/kook");
}
%>
 <html>
	<script language="JavaScript" src="/kook/script/script.js">
	</script>		
	<body onload="beginLogin()">	
		<br /><br /><br /><br /><br />
		<center>
			<h1>Login</h1>
			<table width="300" align="center" border="1">
				<form name = "login" action="loginPro.jsp">
					<tr>
						<td width="200">
							<input type="text" tabindex = "1" placeholder="ID" name="id">
						</td>
						<td rowspan="2">
							<input type="submit" tabindex = "3" value="Login" style="width:85px;height:50px">
						</td>
					</tr>
					<tr>
						<td width="200">
							<input type="password" tabindex = "2" placeholder="Password" name="pw">
						</td>
					</tr>
					<tr>
						<td width="100" colspan="2">
							<a href="/kook/register/register.jsp">Register</a>    
							<a href="find_id_pw.jsp">Find ID/PW</a>
						</td>
					</tr>
				</form>					
			</table>
		</center>	
	</body>
</html>