<%-- 회원정보 수정 및 탈퇴를 위한 JSP페이지 --%>
<%-- 작성자 : 전민기 --%>

<%@page import="kook.MemberDTO"%>
<%@page import="kook.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/main/top/topMypage.jsp"%>

<html>
	<head><title>Member Info Mgmt</title>
		<link href='http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css' 	rel='stylesheet' type='text/css' />
		<link href='/kook/css/style_1.css' 	rel='stylesheet' type='text/css' />
		<style type="text/css">	
			.sign{ padding: 0 25px 25px; background: #f1f1f1; opacity: 0.8; width: 530px; border: 1px solid #e5e5e5; font-family: '맑은 고딕'; }	
		</style> 
	</head>
	<script language = "JavaScript" src = "/kook/script/script.js">
	</script>
 <% 
 	try{
		String id = main_id;
 
 		MemberDAO dao = new MemberDAO();
 		MemberDTO dto = dao.getMember(id);
%>
	<body class="bg">
		<center>
		<br><br><br><br><br>
			<div class="sign">  
				<h3>Member Info Modify & Leave</h3>
				<hr /> 
				<form method = "post" action = "memberModifyPro.jsp" name = "memberinfo" onsubmit = "return modifyCheckIt()">
					<table class="tbl" cellpadding="3">		
						<tr>
							<td class="sign_b">
								<li>ID</li>
							</td>
							<td>
								<%= dto.getId() %>
								<input type = "hidden" name = "id" value = "<%= dto.getId() %>" />
							</td>
						</tr>
						<tr>
							<td class="sign_b">
								<li>Current Password</li>
							</td>
							<td>
								<input type="password" size="20" maxlength="18" name="old_pw" placeholder ="Enter Current Password"  tabindex="3" required />
							</td>
						</tr>
						<tr>
							<td class="sign_b">
								<li>New Password</li>
							</td>
							<td>
								<input type="password" size="20" maxlength="18" name="pw" placeholder ="Enter New Password"  tabindex="3" required />
							</td>
						</tr>
						<tr>
							<td class="sign_b">
								<li>Re-password</li>
							</td>
							<td>
								<input type="password" size="20" maxlength="18" name="pw_ck" placeholder ="Repeat Password" tabindex="4" required />
							</td>
						</tr>		
					</table>
					<hr />	
					<table class="tbl" colspan="4" rowspan="4" cellpadding="2">	 
						<tr>
							<td class="sign_b">
								<li>Gender</li>
							</td>
							<td class="sign_l">
<%		
								if(dto.getGender().equals("Male")){	
%>						
									<input type="radio" name="gender" value="Male" tabindex="5" checked />Male
									<input type="radio" name="gender" tabindex="6" value="Female" />Female
<% 
								}else if(dto.getGender().equals("Female")){ 
%>
									<input type="radio" name="gender" value="Male" tabindex="5" />Male					
									<input type="radio" name="gender" tabindex="6" value="Female" checked />Female				
<% 
								}
%>				
							</td>
						</tr>
						<tr>
							<td class="sign_b">
								<li>Name</li>
							</td>
							<td>
								<input type="text" size="16" name="name" value="<%= dto.getName() %>" tabindex="7" required />
							</td>
						</tr>
						<tr>
							<td class="sign_b">
								<li>Date of Birth</li>
							</td>  
							<td class="sign_b"> 
								<select name="birth_y"  tabindex="8">
									<option selected value="<%= dto.getBirth_y() %>"><%= dto.getBirth_y() %></option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
									<option value="2008">2008</option>
									<option value="2007">2007</option>
									<option value="2006">2006</option>
									<option value="2005">2005</option>
									<option value="2004">2004</option>
									<option value="2003">2003</option>
									<option value="2002">2002</option>
									<option value="2001">2001</option>
									<option value="2000">2000</option>
									<option value="1999">1999</option>
									<option value="1998">1998</option>
									<option value="1997">1997</option>
									<option value="1996">1996</option>
									<option value="1995">1995</option>
									<option value="1994">1994</option>
									<option value="1993">1993</option>
									<option value="1992">1992</option>
									<option value="1991">1991</option>
									<option value="1990">1990</option>
									<option value="1989">1989</option>
									<option value="1988">1988</option>
									<option value="1987">1987</option>
									<option value="1986">1986</option>
									<option value="1985">1985</option>
									<option value="1984">1984</option>
									<option value="1983">1983</option>
									<option value="1982">1982</option>
									<option value="1981">1981</option>
									<option value="1980">1980</option>
									<option value="1979">1979</option>
									<option value="1978">1978</option>
									<option value="1977">1977</option>
									<option value="1976">1976</option>
									<option value="1975">1975</option>
									<option value="1974">1974</option>
									<option value="1973">1973</option>
									<option value="1972">1972</option>
								</select>	 
								Year /
								<select name="birth_m" tabindex="9">
									<option selected value="<%= dto.getBirth_m() %>"><%= dto.getBirth_m() %></option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
								Month /
								<select name="birth_d" tabindex="10">
									<option selected value="<%= dto.getBirth_d() %>"><%= dto.getBirth_d() %></option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select>
									Day
							</td>
						 </tr>	 
						 <tr>
							<td rowspan="2" class="sign_b">
								<li>Phone No</li>
							</td>
							<td class="sign_l">	
<%	
								if(dto.getPh().equals("SKT")){	
%>			
									<input type="radio" name="ph" value="SKT" checked tabindex="11" />SKT 
									<input type="radio" name="ph" value="KT" tabindex="12" />KT 
									<input type="radio" name="ph" value="LGU+" tabindex="13" />LGU+
									<input type="radio" name="ph" value="Overseas" tabindex="14" />Overseas
<% 
								}else if(dto.getPh().equals("KT")){ 
%>
									<input type="radio" name="ph" value="SKT" tabindex="11" />SKT 
									<input type="radio" name="ph" value="KT" checked tabindex="12" />KT 
									<input type="radio" name="ph" value="LGU+" tabindex="13" />LGU+
									<input type="radio" name="ph" value="Overseas" tabindex="14" />Overseas
<% 
								}else if(dto.getPh().equals("LGU+")){ 
%>
									<input type="radio" name="ph" value="SKT" tabindex="11" />SKT 
									<input type="radio" name="ph" value="KT" tabindex="12" />KT 
									<input type="radio" name="ph" value="LGU+" checked tabindex="13" />LGU+
									<input type="radio" name="ph" value="Overseas" tabindex="14" />Overseas
<% 
								}else if(dto.getPh().equals("Overseas")){
%>
									<input type="radio" name="ph" value="SKT" tabindex="11" />SKT 
									<input type="radio" name="ph" value="KT" tabindex="12" />KT 
									<input type="radio" name="ph" value="LGU+" tabindex="13" />LGU+
									<input type="radio" name="ph" value="Overseas" checked tabindex="14" />Overseas
<% 
								} 
%>				
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" size="6" maxlength="4" name="ph_no1" tabindex="15"  value = "<%=dto.getPh_no1()%>" required />
								-
								<input type="text" size="6" maxlength="4" name="ph_no2" tabindex="16" value = "<%=dto.getPh_no2()%>" required />
								-
								<input type="text" size="6" maxlength="4" name="ph_no3" tabindex="17" value = "<%=dto.getPh_no3()%>" required />
							</td>
						</tr>
						<tr>
							<td class="sign_b">
								<li>E-mail</li>
							</td>
							<td>
								<input type="text" size="15" name="email_id" maxlength="20" tabindex="18" value = "<%=dto.getEmail_id()%>" required />
								@
								<select name="email_adr" tabindex="19">
									<option value="<%=dto.getEmail_adr()%>" selected><%=dto.getEmail_adr()%></option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="yahoo.com">yahoo.com</option>
								</select>
							</td>
						</tr>
						<tr>
							<td rowspan="3" class="sign_b">
								<li>Address</li>
							</td>
							<td colspan="3">
								<input type="text" size="14" name="adrNum" maxlength="15" value="<%=dto.getAdrNum()%>" tabindex="20" required />
								<input type="text" size="34" name="adr" value="<%=dto.getAdr()%>" tabindex="21" required />						
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<input type="text" size="55" name="address1" value="<%=dto.getAddress1()%>" tabindex="22" required />
							</td>
						</tr>
						<tr>
							<td colspan="3"><input type="text" size="55" name="address2" value="<%=dto.getAddress2()%>" tabindex="23" required />
							</td>
						</tr>
					</table>
					<hr />	
					<table class="tbl" colspan="5" rowspan="4" cellpadding="1">	 
						<tr>
							<td rowspan="4" class="sign_b">
								<li>Preferred</li>
							</td>
							<td class="sign_l">
<%	
								if(dto.getSweet().equals("1")){	
%>
									<input type="checkbox" name="sweet" value="1" tabindex="24" checked />Sweet
<%
								}else{
%>
									<input type="checkbox" name="sweet" value="1" tabindex="24" />Sweet
<%
								}
%>	
							</td>
							<td class="sign_l">
<%	
								if(dto.getSour().equals("1")){	%>
									<input type="checkbox" name="sour" value="1" tabindex="25" checked />Sour
<% 
								}else{
%>
									<input type="checkbox" name="sour" value="1" tabindex="25" />Sour
<% 
								}
%>		
							</td>
							<td class="sign_l">
<%	
								if(dto.getSalty().equals("1")){
%>
									<input type="checkbox" name="salty" value="1" tabindex="26" checked />Salty
<% 
								}else{
%>
									<input type="checkbox" name="salty" value="1" tabindex="26" />Salty
<% 
								}
%>		
							</td>
						</tr>	 
						<tr>
							<td class="sign_l">
<%	
								if(dto.getSpicy().equals("1")){
%>
									<input type="checkbox" name="spicy" value="1" tabindex="27" checked />Spicy
<% 
								}else{
%>
									<input type="checkbox" name="spicy" value="1" tabindex="27" />Spicy
<%
								}
%>		
							</td>
							<td class="sign_l">
<%	
								if(dto.getNon_spicy().equals("1")){
%>
									<input type="checkbox" name="non_spicy" value="1" tabindex="28" checked />Non-spicy
<% 
								}else{
%>
									<input type="checkbox" name="non_spicy" value="1" tabindex="28" />Non-spicy
<%
								}
%>		
							</td>
							<td class="sign_l">
<%
								if(dto.getSoft().equals("1")){
%>
									<input type="checkbox" name="soft" value="1" tabindex="29" checked />Soft
<%
								}else{
%>
									<input type="checkbox" name="soft" value="1" tabindex="29" />Soft
<%
								}
%>		
							</td>
						</tr>	 
						<tr>
							<td class="sign_l">
<%	
								if(dto.getFresh().equals("1")){
%>
									<input type="checkbox" name="fresh" value="1" tabindex="30" checked />Fresh
<%
								}else{
%>
									<input type="checkbox" name="fresh" value="1" tabindex="30" />Fresh
<%
								}
%>	
							</td>
							<td class="sign_l">
<%
								if(dto.getHot().equals("1")){
%>
									<input type="checkbox" name="hot" value="1" tabindex="31" checked />Hot
<%
								}else{
%>
									<input type="checkbox" name="hot" value="1" tabindex="31" />Hot
<%
								}
%>	
							</td>
							<td class="sign_l">
<%	
								if(dto.getCool().equals("1")){
%>
									<input type="checkbox" name="cool" value="1" tabindex="32" checked />Cool
<% 
								}else{
%>
									<input type="checkbox" name="cool" value="1" tabindex="32" />Cool
<%
								}
%>	
							</td>
						</tr>
						<tr>
							<td class="sign_l">
<%	
								if(dto.getLight().equals("1")){	
%>
									<input type="checkbox" name="light" value="1" tabindex="33" checked />Light
<%
								}else{
%>
									<input type="checkbox" name="light" value="1" tabindex="33" />Light
<%
								}
%>	
							</td>					
						</tr>						
					</table>
					<hr />	
					<table class="tbl" rowspan="2" cellpadding="3">	 
						<tr>
							<td align="right">
								<input type="button" value="Home" tabindex="34" onClick="window.location='/kook'" />
							</td>
							<td align="center">
								<input type="submit" value="Modify" tabindex="35" />
							</td>
							<td align="left">
								<input type="button" value="Leave" tabindex="36" onClick="window.location='memberLeave.jsp'" />
							</td>
						</tr>
					</table>
				</form>
			</div>
			<p />
			<div class="cp" align="center">
				Copyright &copy; 
				<Strong>Ko-ok
				</Strong> 
				(Global IT 인재개발원) &nbsp All Rights Reserved.
			</div>
		</center>			
	</body>
<%
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>	
	
</html>