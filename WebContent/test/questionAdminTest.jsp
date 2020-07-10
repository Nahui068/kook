<%-- 답변이 없는 문의글 수 / 게시판 이동 버튼 --%>
<%-- 기간 별 게시글 개수 (당일, 1일전, 7일전, 30일전, 전체 // ref 중복x) --%>

<%--
		re_step = 1 인 게시물들의 ref를 구하고 해당 ref를 제외한 나머지 게시물 출력하기
		
		select * from kook_memberService where ref not in (select ref from kook_memberService where re_step = 1) order by ref desc
 --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="kook.MemberServiceDAO"%>
<%
		Date qu_date = new Date();
		MemberServiceDAO dao = new MemberServiceDAO();
		
		Calendar qu_cal = Calendar.getInstance();
		SimpleDateFormat qu_sdf = new SimpleDateFormat("yyyy-MM-dd");
		qu_cal.setTime(qu_sdf.parse(qu_sdf.format(qu_date)));
		
		String qu_tdy = qu_sdf.format(qu_cal.getTime());	// 오늘
		
		qu_cal.add(Calendar.DATE, 1);
		String qu_tomor = qu_sdf.format(qu_cal.getTime());	// 내일
		
		qu_cal.add(Calendar.DATE, -2);
		String qu_yester = qu_sdf.format(qu_cal.getTime());	// 어제
		
		qu_cal.add(Calendar.DATE, -6);
		String qu_week = qu_sdf.format(qu_cal.getTime());	// 7일전
		
		qu_cal.add(Calendar.DATE, -22);
		String qu_month = qu_sdf.format(qu_cal.getTime());	// 30일전
		
		int totalQuestionCount = dao.totalQuestionCount();	// 전체 문의글 수
		
		int todayQuestionCount = dao.countQuestionCal(qu_tdy, qu_tomor);		// 오늘 문의글 수
		int yesterdayQuestionCount = dao.countQuestionCal(qu_yester, qu_tomor);		// 어제 문의글 수
		int weekQuestionCount = dao.countQuestionCal(qu_week, qu_tdy);	// 최근 7일간 문의글 수
		int monthQuestionCount = dao.countQuestionCal(qu_month, qu_tdy);	// 최근 30일간 문의글 수
		
		int noRefQuestionCount = dao.noRefQuestionCount();	// 답글없는 문의 글 수
		
		
%>


<table border = "1" width = "300" align = "center">
	<tr>
		<td width = "200">답글 기다리는 문의글 수</td>
		<td width = "100" align = "right"><%= noRefQuestionCount %> 개</td>
	</tr>
	<tr>
		<td width = "200">전체 문의글 수	</td>
		<td width = "100" align = "right"><%= totalQuestionCount %> 개</td>
	</tr>
	<tr>
		<td width = "200">오늘 등록된 문의글 수</td>
		<td width = "100" align = "right"><%= todayQuestionCount %> 개</td>
	</tr>
	<tr>
		<td width = "200">어제 등록된 문의글 수</td>
		<td width = "100" align = "right"><%= yesterdayQuestionCount %> 개</td>
	</tr>
	<tr>
		<td width = "200">최근 7일간 등록된 문의글 수</td>
		<td width = "100" align = "right"><%= weekQuestionCount %> 개</td>
	</tr>
	<tr>
		<td width = "200">최근 30일간 등록된 문의글 수</td>
		<td width = "100" align = "right"><%= monthQuestionCount %> 개</td>
	</tr>
</table>

 