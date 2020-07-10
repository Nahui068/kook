<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kook.WarehousingDAO"%>
<%@page import="kook.WarehousingDTO"%>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.text.ParseException" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ include file="/main/top/topAdmin.jsp"%>

<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="wdto" class="kook.WarehousingDTO"/>
	<jsp:setProperty property="*" name="wdto"/> 

<%
	try{
	String productID = request.getParameter("productID");
	wdao = new WarehousingDAO();					// WarehousingDAO wdao
	
	sdf = new SimpleDateFormat("yyyyMMdd");
	Date start= sdf.parse(wdto.getExpiration());
	
	Date time = new Date();
	String today  = sdf.format(time);
	
	wdto.setWarehousing_date(today);
	Date end = sdf.parse(today);
	
	long diffDay = (start.getTime() - end.getTime()) / (24*60*60*1000);
	wdto.setEx_during(diffDay); // 유통기한 - 입고일 날짜뺀 후 dto에 저장
		
	// 입고db 저장
	wdao.productInsert(wdto);
	
	// 재고db 저장
	
	boolean res = wdao.stockInsert(wdto, wdto.getProductID());
	if(res==true){
%>
	<script>
		alert("정상적으로 등록되었습니다.");
		location.href = "/kook/admin/shop/productList.jsp";
	</script>
	
<% }
	}catch(Exception e){	response.sendRedirect("/kook");	}
%>