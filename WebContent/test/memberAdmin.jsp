<%-- 회원 특정 기간에 따른 등록/탈퇴 수를 출력하는 페이지 --%>
<%-- 작성자 : 전민기 --%>

<%@page import="java.util.Calendar"%>
<%@page import="kook.MemberDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Date mb_date = new Date();
	MemberDAO dao = new MemberDAO();

	Calendar mb_cal = Calendar.getInstance();
	SimpleDateFormat mb_sdf = new SimpleDateFormat("yyyy-MM-dd");
	mb_cal.setTime(mb_sdf.parse(mb_sdf.format(mb_date)));
	
	String mb_tdy = mb_sdf.format(mb_cal.getTime());			// 오늘 날짜
	System.out.println("오늘 날짜 : " + mb_tdy);							
	
	mb_cal.add(Calendar.DATE, 1);
	String mb_tomor = mb_sdf.format(mb_cal.getTime());	// 내일 날짜
	System.out.println("내일 날짜 : " + mb_tomor);
	
	mb_cal.add(Calendar.DATE, -2);
	String mb_yester = mb_sdf.format(mb_cal.getTime());	// 어제 날짜
	System.out.println("어제 날짜 : " + mb_yester);
	
	mb_cal.add(Calendar.DATE, -6);
	String mb_week = mb_sdf.format(mb_cal.getTime());		// 7일 전 날짜
	System.out.println("7일전 날짜 : " + mb_week);
	
	mb_cal.add(Calendar.DATE, -22);
	String mb_month = mb_sdf.format(mb_cal.getTime());	// 30일 전 날짜
	System.out.println("30일전 날짜 : " + mb_month);
	
	int totalMembersCount = dao.totalMembers();	// 전체 회원 수
	int yesterdayMembersCount = dao.countMembersCal(mb_yester, mb_tdy);	// (어제 - 오늘)
	int todayMembersCount = dao.countMembersCal(mb_tdy, mb_tomor);	// (오늘 - 내일)
	int weekMembersCount = dao.countMembersCal(mb_week, mb_tdy);	// (7일전 - 오늘)
	int monthMembersCount = dao.countMembersCal(mb_month, mb_tdy);	// (30일전 - 오늘)
	
	int totalLeaveMembersCount = dao.totalLeaveMembers();	// 전체 탈퇴 회원수
	int yesterdayLeaveMembersCount = dao.countLeaveMembersCal(mb_yester, mb_tdy);	// 어제 탈퇴 회원 수
	int todayLeaveMembersCount = dao.countLeaveMembersCal(mb_tdy, mb_tomor);	// 오늘 탈퇴 회원 수
	
%>

<table border = "1" width = "300" align = "center">
	<tr>
		<td width = "200">전체 회원 수	</td>
		<td width = "100" align = "right"><%= totalMembersCount %> 명</td>
	</tr>
	<tr>
		<td width = "200">오늘 등록한 회원 수</td>
		<td width = "100" align = "right"><%= todayMembersCount %> 명</td>
	</tr>
	<tr>
		<td width = "200">어제 등록한 회원 수</td>
		<td width = "100" align = "right"><%= yesterdayMembersCount %> 명</td>
	</tr>
	<tr>
		<td width = "200">최근 7일간 등록회원 수</td>
		<td width = "100" align = "right"><%= weekMembersCount %> 명</td>
	</tr>
	<tr>
		<td width = "200">최근 30일간 등록회원 수</td>
		<td width = "100" align = "right"><%= monthMembersCount %> 명</td>
	</tr>
	<tr>
		<td width = "200">탈퇴한 전체 회원 수</td>
		<td width = "100" align = "right"><%= totalLeaveMembersCount %> 명</td>
	</tr>
	<tr>
		<td width = "200">오늘 등록한 회원 수</td>
		<td width = "100" align = "right"><%= todayLeaveMembersCount %> 명</td>
	</tr>
	<tr>
		<td width = "200">어제 등록한 회원 수</td>
		<td width = "100" align = "right"><%= yesterdayLeaveMembersCount %> 명</td>
	</tr>
</table>
