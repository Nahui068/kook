<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/main/top/topAdmin.jsp"%>

<html>
<head> 
<title> 관리자 로그인 시에만 작성 가능 FAQ </title>
</head>
<center> <b> 관리자 FAQ 게시물 작성 FORM </b></center>
<body>
<br />
<br />
<form method = "post" name = "faqWriteForm" action = "faqWritePro.jsp" onsubmit = "return writeSave()" />

<table width="800" border = "1" align="center">
	 <tr height=40> 
	 	<td align = "right" colspan = 2>
	 		<input type = "button" name = "faqList" value = "faqList" OnClick="window.location ='faqListAdmin.jsp'" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
	 	</td>
	 </tr>
	 <tr>
	 	<td align= "center" width="100"><b> Question </b></td>
	 	<td>
	 		<textarea name = "question" rows="4" cols="90">
	 		</textarea>
	 	</td>
	 </tr>
	 <tr>
	 	<td align="center" width="100"><b> Answer </b></td>
	 	<td> 
	 		<textarea name = "answer" rows = "20" cols = "90" >
	 		</textarea>
	 	</td>
	 </tr>
	 <tr>
	 	<td colspan=2 align = "center">
	 		<input type = "submit" name = "faqfinish" value="faqfinish" />
		</td>
	</tr>
</table>

</form>
<br /> 
<br />
<br />
</body> 
</html>