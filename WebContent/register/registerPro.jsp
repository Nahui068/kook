<%-- 회원등록 수행하는 JSP페이지 --%>
<%-- 작성자 : 전민기 --%>

<%@ page import="kook.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/main/top/top.jsp"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "dto" class = "kook.MemberDTO" />
<jsp:setProperty property = "*" name = "dto" />

<% 
		try{
		String id = request.getParameter("id");
		if ( id == null) {
%>
			<script>
				alert("정상적으로 접속되지 않은 경로입니다.");
				location.href = "/kook"
			</script>
<%				
		}
		MemberDAO dao =  new MemberDAO();
		dao.memberInsert(dto);
%>

<html>
	<head>
		<title>Complete Register</title>
		<link href='http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css' rel='stylesheet' type='text/css' />
		<link href='/kook/css/style_1.css' rel='stylesheet' type='text/css' />
		<style type="text/css">
			.sign{ padding: 0 25px 25px; background: #f1f1f1; opacity: 0.8; width: 510px; 
				border: 1px solid #e5e5e5; font-family: '맑은 고딕'; margin: 0 auto; clear: both; height: 240px; position: relative; }
		</style> 
	</head>
	<body class="bg" vlign="center">
		<center />
		<div id="floater"></div>
		<div class="sign">  
			<h3> 안녕하세요. </h3>
			<h3>[ <%= id %>  ] 님 가입 완료되었습니다.. </h3>
			<h3>등록하신 ID로 로그인하시기 바랍니다. </h3>
			<form>
				<input type = "button" style="width: 120px; height: 40px;" value="Login" onClick="window.location='/kook/main/login.jsp'" />
			</form>
			<p /> <br />
		</div>
		<div class="cp" align="center">
			Copyright &copy; 
			<Strong>Jeon MinKi</Strong> 
			(Global IT 인재개발원) &nbsp All Rights Reserved.
		</div>
	</body>
</html>
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
 %>