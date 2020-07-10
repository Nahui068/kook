<%-- ID/PW찾기 페이지로 이동시킬 JSP페이지 --%>
<%-- 작성자 : 김태언 --%>

<%@ include file="/main/top/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

		<br />		
		<center />
		<h1>Find ID/PW</h1>
		<table width="300" align="center" >
			<tr>
				<td width="200" align="center"><input type="button" style="width:100px"  value="Find ID" onclick="location.href='find_id.jsp'" >
				</td>
			</tr>
			<tr>
				<td width="200" align="center"><input type="button" style="width:100px"  value="Find PW" onclick="location.href='find_pw.jsp'" >
				</td>
			</tr>
		</table>
	</body>
</html>