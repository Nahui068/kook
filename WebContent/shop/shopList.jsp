<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kook.ShopDAO" %>
<%@ page import = "kook.ShopDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ include file="/Design/design_main_menu.jsp" %>
<%@ include file = "/main/top/top.jsp" %>

<% request.setCharacterEncoding("utf-8"); %>

<%!
	int pageSize = 12 ;
%>
<%
	try{
	String pageNum = request.getParameter("pageNum");
	if(pageNum==null) pageNum="1";
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1) * pageSize + 1; 
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List shopList = null; // shop게시글 저장할 list생성
	ShopDAO sdao = new ShopDAO();
	ShopDTO sdto = new ShopDTO();
	
	ArrayList<ShopDTO> slist = new ArrayList<ShopDTO>(); //shop content내용을 가져오기 위한 list생성
	
	slist = sdao.getShop(); // kook_shop db에 있는 내용 가져와서 list에 저장
	
	for(int i=0; i<slist.size(); i++)
		sdto = slist.get(i); // slist에 저장된 요소를 가져와서 dto에 저장
		
	count = sdao.getShop_count(); // shop 게시글의 수
	
	if(count > 0){
		shopList = sdao.getShop_count(startRow,endRow); // 첫 게시물부터 마지막 게시물까지 불러오기
	}
	number = count-(currentPage-1)*pageSize;
	
%>

<title>Shop</title>
<div class="all">
<br><br><br>
<center><b>상품목록(전체 글:<%=count %>)</b></center>
<br>

<% if(count==0){%>
<table>
<tr>
	<td align="center">
		게시판에 저장된 글이 없습니다.
	</td>
</tr>
</table>
<%}else{%>
		<table>
		<tr>
<%
		int j = 1;

		for(int i=0; i<shopList.size(); i++){
			sdto = (ShopDTO)shopList.get(i);
%>	
		<td>
			<ul>
				<li><a href="shopContent.jsp?productID=<%=sdto.getProductID()%>&pageNum=<%=currentPage%>">
				<img src = "/kook/image/<%=sdto.getImage() %>" width="200" height="200" align="center"></a></li>
				
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=sdto.getName()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<%=sdto.getPrice()%>원</li>
			</ul>
		</td>
	<% if(j%4==0) %> <tr></tr>
	<% j++;
	} %>
	</tr>
	</table>
	</div>
<%}
	if(count>0){
%> <p /><br /><center /><%
	int pageCount = count/pageSize+(count%pageSize==0?0:1);
	
	int startPage = (int)(currentPage/5)*5+1;
	int pageBlock = 5;
	int endPage = startPage + pageBlock-1;
	if (endPage > pageCount) endPage = pageCount;
	
	if(startPage>5){%>
		<a href = "/kook/shop/shopList.jsp?pageNum=<%=startPage-5 %>">[이전]</a>
	<%}
	for(int i= startPage; i<=endPage; i++){ %>
		<a href = "/kook/shop/shopList.jsp?pageNum=<%=i%>">[<%=i%>]</a>
	<%
	}
	if(endPage<pageCount){%>
		<a href = "/kook/shop/shopList.jsp?pageNum=<%=startPage+5 %>">[다음]</a>
	<%
	}
	}
	}catch(Exception e){	response.sendRedirect("/kook");	}
	%>