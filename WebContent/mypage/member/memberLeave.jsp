<%-- 회원이 탈퇴하기 위한 JSP페이지 --%>
<%-- 작성자 : 전민기 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/main/top/topMypage.jsp"%>
<% request.setCharacterEncoding("UTF-8"); %>

 <% 
		String id = main_id;
%>
<html>
	<head><title>Member Leave</title>
		<link href='http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css' rel='stylesheet' type='text/css' />
		<link href='/kook/script/script.css' rel='stylesheet' type='text/css' />
		<style type="text/css">
			.sign{ padding: 0 25px 25px; background: #f1f1f1; opacity: 0.8; width: 510px; 
				border: 1px solid #e5e5e5; font-family: '맑은 고딕'; margin: 0 auto; clear: both; height: 200px; position: relative; }
		</style> 
	</head>
	<body class="bg">
		<center>
			<div id="floater"></div>
			<div class="sign">  
				<h3>Member Leave</h3>
				<hr /> 
				<form method=post action=memberLeavePro.jsp>
					<table class="tbl" colspan="3" rowspan="2" cellpadding="3" >		
						<tr>
							<td class="sign_b">
								<li>아이디</li>
							</td>
							<td>
								 <%= id %>
								 <input type = "hidden" name = "id" value = "<%= id %>" tabindex = "1" />
							</td>
							<td rowspan = "2">
								<input type="submit" style="width: 150pt; height: 30pt;" value="Leave" tabindex = "3" />
							</td>
						</tr>
						<tr>
							<td class="sign_b">
								<li>비밀번호</li>
							</td>
							<td>
								<input type="password" size="20" maxlength="18" name="pw" placeholder=" Enter Password" tabindex="2" required />
							</td>
						</tr>
					</table>
					<hr />	
					<table class="tbl" cellpadding="3" >	 
						<tr>
							<td align="center">						
								<input type="button"  style="width: 150px; height: 40px;" value="Main" tabindex ="4" onClick="window.location='/kook'" />
							</td>
						</tr>
					</table>
				</form>
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