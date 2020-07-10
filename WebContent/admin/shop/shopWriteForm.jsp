<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/main/top/topAdmin.jsp" %>

<center>
<h1>ShopWriteForm</h1>

<form action = "shopWritePro.jsp" name = "form" method="post" enctype="multipart/form-data">
	<table border="1">
	<tr>
		<td align="center">제품코드</td> <td><input type="text" name="productID"></td>
	</tr>
	
	<tr>
		<td align="center">이름</td> <td><input type = "text" name = "name" ></td> 
	</tr>
	
	<tr>
		<td align="center">사진</td> <td><input type="file" name="image"></td>
	</tr>
	
	<tr>
		<td align="center" >설명</td> <td> <textarea name="content" rows="20" cols="40"></textarea></td>
	</tr>
	
	<tr>
		<td align="center">원산지</td> <td><input type="text" name="origin"></td>
	</tr>
	
	<tr>
		<td align="center">유통기한</td><td><input type="text" name="expiration"></td>
	</tr>
	
	<tr>
		<td align="center">보관방법</td><td><input type="text" name="storage"></td>
	</tr>
	
	<tr>
		<td align="center">가격</td><td><input type="text" name="price"></td>
	</tr>
	
	<tr >
		<td colspan = "2" align="center">
		<input type="reset"  value="rewrite"/>
		<input type="submit" value="finish"/> 
		</td>
	</tr>
	</table>
</form>

</center>