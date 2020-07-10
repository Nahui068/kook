<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/main/top/topAdmin.jsp"%>

<script>
	function check() {
		if(document.writeform.category.value == "N") { 
			alert("카테고리를 선택하세요.");
			document.writeform.category.focus();
			return false;
		}
			
		if(document.writeform.difficulty.value == "N") {
			alert("난이도를 선택하세요.");
			document.writeform.difficulty.focus();
	 		return false;
		}
	}
</script>		
        
<html>
<body> 
	<center> <b> Recipe content 글쓰기 </b></center>
	<br>
	<form action = "recipeWritePro.jsp"  method = "post" name = "writeform" enctype="multipart/form-data" onSubmit = "return check()" >
	
	<table width = "1000" border="1" cellspacing="0" cellpadding="0" align = "center">
		<tr>
			<td align = "center"> 카테고리 </td>
			<td><select name = "category">
					<option value = "N" > Select Category </option>
					<option value = "main_dish"> Main Dish </option>
				    <option value = "side_dish"> Side Dish </option>
					<option value = "stew_soup"> Stew & Soup </option>
					<option value = "drink"> Drink </option>
					<option value = "dessert"> Dessert </option>
					<option value = "korean_bbq"> Korean_BBQ </option>
					<option value = "kimchi"> Kimchi </option>
					<option value = "etc"> Etc </option>
			</select></td>
		</tr>
		<tr> 
			<td align = "center"> 난이도 </td>
			<td> <select name = "difficulty">
				<option value = "N" > Select Level </option>
				<option value = "low"> Low </option>
				<option value = "middle"> Middle </option>
				<option value = "high"> High </option>			
			</select></td>
		</tr>
		<tr> 
			<td align = "center"> 요리 이름 </td>
			<td><input type = "text" name = "subject" />
			
		</tr>
		<tr> 
			<td align = "center"> 요리 사진 올리기 </td>
			<td> <input type = "file" name = "thumbnail" /></td>
		</tr>
		<tr>
			<td align = "center"> 요리 소개 </td> <%-- textarea value값 --%>
			<td> <textarea name = "content" value = "content" rows = "20" cols = "40" /> </textarea> </td>	
		</tr>
		<tr>
			<td align = "center"> 양 (사람 수) </td>
			<td><select name = "portion">	
				<option value = "1"> 1 </option>
				<option value = "2"> 2 </option>
				<option value = "3"> 3 </option>
				<option value = "4"> 4 </option>				
			</select> </td>
		</tr>
		<%--재료--%>
		<tr>
			<td align = "center"> 재료 1 </td>
			<td><input type = "text" name = "ingred1" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 2 </td>
			<td><input type = "text" name = "ingred2" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 3 </td>
			<td><input type = "text" name = "ingred3" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 4 </td>
			<td><input type = "text" name = "ingred4" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 5 </td>
			<td><input type = "text" name = "ingred5" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 6 </td>
			<td><input type = "text" name = "ingred6" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 7 </td>
			<td><input type = "text" name = "ingred7" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 8 </td>
			<td><input type = "text" name = "ingred8" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 9 </td>
			<td><input type = "text" name = "ingred9" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 10 </td> 
			<td><input type = "text" name = "ingred10" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 11 </td>
			<td><input type = "text" name = "ingred11" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 12 </td>
			<td><input type = "text" name = "ingred12" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 13 </td>
			<td><input type = "text" name = "ingred13" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 14 </td>
			<td><input type = "text" name = "ingred14" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 15 </td>
			<td><input type = "text" name = "ingred15" /></td>
		</tr>
		<tr>
			<td align = "center"> 재료 16 </td>
			<td><input type = "text" name = "ingred16" /></td>
		</tr>
		<%--조리 과정 --%>
		<tr> 
			<td align = "center"> 조리 과정 1 </td>
			<td><input type = "file" name = "content1_img" /> </td>	
			<td><input type = "text" name = "content1_txt" /> </td>
		</tr>
		<tr> 
			<td align = "center"> 조리 과정 2 </td>
			<td><input type = "file" name = "content2_img" /> </td>	
			<td><input type = "text" name = "content2_txt" /> </td>
		</tr>
		<tr> 
			<td align = "center"> 조리 과정 3 </td>
			<td><input type = "file" name = "content3_img" /> </td>	
			<td><input type = "text" name = "content3_txt" /> </td>
		</tr>
		<tr> 
			<td align = "center"> 조리 과정 4 </td>
			<td><input type = "file" name = "content4_img" /> </td>	
			<td><input type = "text" name = "content4_txt" /> </td>
		</tr>
		<tr> 
			<td align = "center"> 조리 과정 5 </td>
			<td><input type = "file" name = "content5_img" /> </td>	   
			<td><input type = "text" name = "content5_txt" /> </td>
		</tr>
		<tr> 
			<td align = "center"> 조리 과정 6 </td>
			<td><input type = "file" name = "content6_img" /> </td>	
			<td><input type = "text" name = "content6_txt" /> </td>
		</tr>
		<tr> 
			<td align = "center"> 조리 과정 7 </td>
			<td><input type = "file" name = "content7_img" /> </td>	
			<td><input type = "text" name = "content7_txt" /> </td>
		</tr>
		<tr> 
			<td align = "center"> 조리 과정 8 </td>
			<td><input type = "file" name = "content8_img" /> </td>	
			<td><input type = "text" name = "content8_txt" /> </td>
		</tr>
		<tr>
			<td><input type = "checkbox" name = "sweet" value = "Y" > Sweet </td>
			<td><input type = "checkbox" name = "sour" value = "Y" > Sour </td>
			<td><input type = "checkbox" name = "salty" value = "Y" > Salty </td>
			<td><input type = "checkbox" name = "spicy" value = "Y" > Spicy </td>
			<td><input type = "checkbox" name = "non_spicy" value = "Y" > Non-Spicy </td>
			<td><input type = "checkbox" name = "hot" value = "Y" > Hot </td>
			<td><input type = "checkbox" name = "cold" value = "Y" > Cold </td>
			<td><input type = "checkbox" name = "light" value = "Y" > Light </td>
			<td><input type = "checkbox" name = "soft" value = "Y" > Soft </td>
			<td><input type = "checkbox" name = "fresh" value = "Y" > Fresh </td>
		</tr>
	</table>
	<input type = "submit" value = "finish"/> 

</form>
</body>
</html>

