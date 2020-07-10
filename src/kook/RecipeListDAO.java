package kook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecipeListDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private Connection getConnection() throws Exception {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class15" ,pass="class15";
			conn = DriverManager.getConnection(url,user,pass);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public IngredDTO getIngred(int num) {
		IngredDTO idto = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from ingredient where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				idto = new IngredDTO();
				idto.setNum(rs.getInt("num"));
				idto.setIngred1(rs.getString("ingred1"));
				idto.setIngred2(rs.getString("ingred2"));
				idto.setIngred3(rs.getString("ingred3"));
				idto.setIngred4(rs.getString("ingred4"));
				idto.setIngred5(rs.getString("ingred5"));
				idto.setIngred6(rs.getString("ingred6"));
				idto.setIngred7(rs.getString("ingred7"));
				idto.setIngred8(rs.getString("ingred8"));
				idto.setIngred9(rs.getString("ingred9"));
				idto.setIngred10(rs.getString("ingred10"));
				idto.setIngred11(rs.getString("ingred11"));
				idto.setIngred12(rs.getString("ingred12"));
				idto.setIngred13(rs.getString("ingred13"));
				idto.setIngred14(rs.getString("ingred14"));
				idto.setIngred15(rs.getString("ingred15"));
				idto.setIngred16(rs.getString("ingred16"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}	
		}
		return idto;
	}
	
	// �옱猷뚯닔�젙
	public int modify_ingred(IngredDTO idto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update ingredient set ingred1=?, ingred2=?, ingred3=?, ingred4=?, ingred5=?, ingred6=?, ingred7=?, ingred8=?"
					+ ",ingred9=?, ingred10=?,ingred11=?,ingred12=?, ingred13=?, ingred14=?, ingred15=?,ingred16=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idto.getIngred1());
			pstmt.setString(2, idto.getIngred2());
			pstmt.setString(3, idto.getIngred3());
			pstmt.setString(4, idto.getIngred4());
			pstmt.setString(5, idto.getIngred5());
			pstmt.setString(6, idto.getIngred6());
			pstmt.setString(7, idto.getIngred7());
			pstmt.setString(8, idto.getIngred8());
			pstmt.setString(9, idto.getIngred9());
			pstmt.setString(10, idto.getIngred10());
			pstmt.setString(11, idto.getIngred11());
			pstmt.setString(12, idto.getIngred12());
			pstmt.setString(13, idto.getIngred13());
			pstmt.setString(14, idto.getIngred14());
			pstmt.setString(15, idto.getIngred15());
			pstmt.setString(16, idto.getIngred16());
			pstmt.setInt(17, idto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}
	//main_dish 寃뚯떆湲� �닔 �꽭湲�
	public int getMain_dish_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from main_dish");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}
	
	public int delete_Ingred(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from ingredient where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
	}
	
	//main_dish 寃뚯떆湲� list�뿉 �굹���궡湲� �쐞�븳 寃�
	public List getMain_dish(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from main_dish order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	// main_dish�뿉 �빐�떦�븯�뒗 湲��쓣 遺덈윭�삤湲� �쐞�븳 寃�(content.jsp)
	public RecipeDTO getMain_dish(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from main_dish where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}
	
	public int getSide_dish_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from side_dish");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}
	
	// main_dish �닔�젙
	public int modify_main_dish(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update main_dish set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}
	
	public int delete_main_dish(int num) throws Exception{
		int x = -1;
		String sql = "";
		
		try {
			conn = getConnection();
			sql = "delete from main_dish where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}
		}
		return x;
	}
	
	public List getSide_dish(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from side_dish order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getSide_dish(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from side_dish where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}
	
	// side_dish �닔�젙
	public int modify_side_dish(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update side_dish set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}

		public int delete_side_dish(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from side_dish where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
		}
		
	public int getStew_soup_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from stew_and_soup");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}
	
	public List getStew_soup(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from stew_and_soup order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getStew_soup(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from stew_and_soup where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}
	
	// stew_and soup�닔�젙
	public int modify_stew_and_soup(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update stew_and_soup set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}
		
		public int delete_stew_and_soup(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from stew_and_soup where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
		}
		
	public int getDrink_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from drink");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}
	
	public List getDrink(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from drink order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getDrink(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from drink where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}

	// drink �닔�젙
public int modify_drink(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update drink set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}
		
		public int delete_drink(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from drink where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
		}
		
	public int getDessert_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from dessert");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}

	public List getDessert(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from dessert order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getDessert(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from dessert where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}

	// dessert�닔�젙
	public int modify_dessert(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update dessert set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}
		
		public int delete_dessert(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from dessert where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
		}
		
	public int getKorean_bbq_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from korean_bbq");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}
	
	public List getKorean_bbq(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from korean_bbq order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getKorean_bbq(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from korean_bbq where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}

	// korean_bbq �닔�젙
	public int modify_korean_bbq(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update korean_bbq set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}
		
		public int delete_korean_bbq(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from korean_bbq where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
		}
		
	public int getKimchi_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from kimchi");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}
	
	public List getKimchi(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from kimchi order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getKimchi(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from kimchi where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}

	// kimchi �닔�젙
	public int modify_kimchi(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update kimchi set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}
		
		public int delete_kimchi(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from kimchi where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
		}
		
	public int getEtc_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from etc");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}

	public List getEtc(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from etc order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getEtc(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from etc where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}

	// etc �닔�젙
	public int modify_etc(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update etc set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}
		
		public int delete_etc(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from etc where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
		}
		
	public int getLow_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from low");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}
	
	public List getLow(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from low order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getLow(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from low where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}

	// low �닔�젙
	public int modify_low(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update low set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}

	public int getMiddle_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from middle");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}
	
	public int delete_low(int num) throws Exception{
		int x = -1;
		String sql = "";
		
		try {
			conn = getConnection();
			sql = "delete from low where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}
		}
		return x;
	}
	
	public List getMiddle(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from middle order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getMiddle(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from middle where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}

	// middle �닔�젙
	public int modify_middle(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update middle set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}

		
		public int delete_middle(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from middle where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
		}
		
	public int getHigh_Count() throws Exception {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from high");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}

	public List getHigh(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
				+"(select * from high order by num desc)) where r>=? and r<=? ";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	public RecipeDTO getHigh(int num) {
		RecipeDTO rdto = null;
		try {
			conn = getConnection();
			String sql = "select * from high where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				rdto = new RecipeDTO();
				rdto.setNum(rs.getInt("num"));
				rdto.setSubject(rs.getString("subject"));
				rdto.setContent(rs.getString("content"));
				rdto.setCategory(rs.getString("category"));
				rdto.setDifficulty(rs.getString("difficulty"));
				rdto.setThumbnail(rs.getString("thumbnail"));
				rdto.setPortion(rs.getString("portion"));
				rdto.setContent1_img(rs.getString("content1_img"));
				rdto.setContent1_txt(rs.getString("content1_txt"));
				rdto.setContent2_img(rs.getString("content2_img"));
				rdto.setContent2_txt(rs.getString("content2_txt"));
				rdto.setContent3_img(rs.getString("content3_img"));
				rdto.setContent3_txt(rs.getString("content3_txt"));
				rdto.setContent4_img(rs.getString("content4_img"));
				rdto.setContent4_txt(rs.getString("content4_txt"));
				rdto.setContent5_img(rs.getString("content5_img"));
				rdto.setContent5_txt(rs.getString("content5_txt"));
				rdto.setContent6_img(rs.getString("content6_img"));
				rdto.setContent6_txt(rs.getString("content6_txt"));
				rdto.setContent7_img(rs.getString("content7_img"));
				rdto.setContent7_txt(rs.getString("content7_txt"));
				rdto.setContent8_img(rs.getString("content8_img"));
				rdto.setContent8_txt(rs.getString("content8_txt"));
				rdto.setSweet(rs.getString("sweet"));
				rdto.setSour(rs.getString("sour"));
				rdto.setSalty(rs.getString("salty"));
				rdto.setSpicy(rs.getString("spicy"));
				rdto.setNon_spicy(rs.getString("non_spicy"));
				rdto.setHot(rs.getString("hot"));
				rdto.setCold(rs.getString("cold"));
				rdto.setLight(rs.getString("light"));
				rdto.setSoft(rs.getString("soft"));
				rdto.setFresh(rs.getString("fresh"));
				rdto.setRecommend(rs.getInt("recommend"));
				rdto.setReg(rs.getTimestamp("reg"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return rdto;
	}
	
	// high �닔�젙
	public int modify_high(RecipeDTO rdto) throws Exception{
		
		String sql="";
		int x = -1;
		
		try {
			conn = getConnection();
			sql = "update high set subject=?, thumbnail=?, content=?, portion=? ,content1_txt=?, content2_txt=?, content3_txt=?"
					+",content4_txt=?, content5_txt=?, content6_txt=?, content7_txt=?, content8_txt=?, content1_img=?, content2_img=?"
					+",content3_img=?, content4_img=?, content5_img=?, content6_img=?,content7_img=?,content8_img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rdto.getSubject());
			pstmt.setString(2, rdto.getThumbnail());
			pstmt.setString(3, rdto.getContent());
			pstmt.setString(4, rdto.getPortion());
			pstmt.setString(5, rdto.getContent1_txt());
			pstmt.setString(6, rdto.getContent2_txt());
			pstmt.setString(7, rdto.getContent3_txt());
			pstmt.setString(8, rdto.getContent4_txt());
			pstmt.setString(9, rdto.getContent5_txt());
			pstmt.setString(10, rdto.getContent6_txt());
			pstmt.setString(11, rdto.getContent7_txt());
			pstmt.setString(12, rdto.getContent8_txt());
			pstmt.setString(13, rdto.getContent1_img());
			pstmt.setString(14, rdto.getContent2_img());
			pstmt.setString(15, rdto.getContent3_img());
			pstmt.setString(16, rdto.getContent4_img());
			pstmt.setString(17, rdto.getContent5_img());
			pstmt.setString(18, rdto.getContent6_img());
			pstmt.setString(19, rdto.getContent7_img());
			pstmt.setString(20, rdto.getContent8_img());
			pstmt.setInt(21,rdto.getNum());
			pstmt.executeUpdate();
			x=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return x;
	}
		
		public int delete_high(int num) throws Exception{
			int x = -1;
			String sql = "";
			
			try {
				conn = getConnection();
				sql = "delete from high where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				x=1;
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
		}
		
	//�쟾泥� 移댄뀒怨좊━�쓽 寃뚯떆湲� �닔
	public int getAll_recipe_Count() throws Exception {
		int x = 0;
		String sql; 
		
		try {
			conn = getConnection();
			sql = "select sum(h) from (select count(*) h from low union all select count(*) h from middle union all select count(*) h from high)";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return x;
	}
	
	
	public List getAll_recipe() throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail, reg, rownum r from "
				+"(select * from (select * from low union select * from middle union select * from high) order by reg desc)) order by reg desc";	
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList();
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	
	// �쟾泥대━�뒪�듃 遺덈윭�삤湲� - 理쒖떊�닚�쑝濡� �굹�뿴
	public List getAll_recipe(int start, int end) throws Exception{
		
		List recipeList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select num,subject,category,difficulty,thumbnail,reg,rownum r from "
				+"(select * from (select * from low union select * from middle union select * from high) order by reg desc)) where r>=? and r<=? order by reg desc";	
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				recipeList = new ArrayList(end);
				do {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					dto.setReg(rs.getTimestamp("reg"));
					recipeList.add(dto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException s) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			if (conn != null) try { conn.close(); } catch(SQLException s) {}			
		}
		return recipeList;
	}
	

	// Dish 寃뚯떆湲��쓽 �닔 媛��졇�삤湲�
		public int getDish_Count() throws Exception {
			int x = 0;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select sum(cnt) from (select count(*) cnt from main_dish union all select count(*) from side_dish union all select count(*) from stew_and_soup union all select count(*) from drink union all select count(*) from dessert union all select count(*) from korean_bbq union all select count(*) from kimchi union all select count(*) from etc)");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					x = rs.getInt(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}			
			}
			return x;
		}
					
		// Dish 寃뚯떆湲� 媛��졇�삤湲�
		public List getDish(int start, int end) throws Exception{
			
			List recipeList = null;
			String sql;
				
			try {
				conn = getConnection();
				sql = "select * from (select num,subject,category,difficulty,thumbnail,rownum r from "
					+"(select * from main_dish union select * from side_dish union select * from stew_and_soup union select * from drink union select * from dessert union select * from korean_bbq union select * from kimchi union select * from etc) order by reg desc) where r>=? and r<=? ";	
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
						
				rs = pstmt.executeQuery();
				if(rs.next()) {
					recipeList = new ArrayList(end);
					do {
						RecipeDTO dto = new RecipeDTO();
						dto.setNum(rs.getInt("num"));
						dto.setSubject(rs.getString("subject"));
						dto.setCategory(rs.getString("category"));
						dto.setDifficulty(rs.getString("difficulty"));
						dto.setThumbnail(rs.getString("thumbnail"));
						recipeList.add(dto);
					}while(rs.next());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}			
			}
			return recipeList;
		}
		
		
public List getDish_Reco(int start, int end) throws Exception{
			
			List recipeList = null;
			String sql;
				
			try {
				conn = getConnection();
				sql = "select * from (select num,subject,category,difficulty,thumbnail,recommend,rownum r from "
					+"(select * from main_dish where recommend>=1 union select * from side_dish where recommend>=1 union select * from stew_and_soup where recommend>=1 union select * from drink where recommend>=1 union select * from dessert where recommend>=1 union select * from korean_bbq where recommend>=1 union select * from kimchi where recommend>=1 union select * from etc where recommend>=1) order by recommend desc) where r>=? and r<=?";	
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
						
				rs = pstmt.executeQuery();
				if(rs.next()) {
					recipeList = new ArrayList(end);
					do {
						RecipeDTO dto = new RecipeDTO();
						dto.setNum(rs.getInt("num"));
						dto.setSubject(rs.getString("subject"));
						dto.setCategory(rs.getString("category"));
						dto.setDifficulty(rs.getString("difficulty"));
						dto.setThumbnail(rs.getString("thumbnail"));
						dto.setRecommend(rs.getInt("recommend"));
						recipeList.add(dto);
					}while(rs.next());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}			
			}
			return recipeList;
		}
		
		// 레시피 best12
		public List getDish_best_Reco() throws Exception{
			
			List recipeList = null;
			String sql;
				
			try {
				conn = getConnection();
				sql = "select * from (select num,subject,category,difficulty,thumbnail,recommend,rownum r from (select * from main_dish where recommend>=1 union select * from side_dish where recommend>=1 union select * from stew_and_soup where recommend>=1 union select * from drink where recommend>=1 union select * from dessert where recommend>=1 union select * from korean_bbq where recommend>=1 union select * from kimchi where recommend>=1 union select * from etc where recommend>=1) order by recommend desc) where r<=12";	
				pstmt = conn.prepareStatement(sql);
						
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					recipeList = new ArrayList();
					do {
						RecipeDTO dto = new RecipeDTO();
						dto.setNum(rs.getInt("num"));
						dto.setSubject(rs.getString("subject"));
						dto.setCategory(rs.getString("category"));
						dto.setDifficulty(rs.getString("difficulty"));
						dto.setThumbnail(rs.getString("thumbnail"));
						dto.setRecommend(rs.getInt("recommend"));
						recipeList.add(dto);
					}while(rs.next());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}			
			}
			return recipeList;
		}

// dish recommend페이지 게시글 수
		public int getDish_Reco_Count() throws Exception {
			int x = 0;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select sum(cnt) from (select count(*) cnt from main_dish where recommend>=1 union select count(*) from side_dish where recommend>=1 union select count(*) from stew_and_soup where recommend>=1 union select count(*) from drink where recommend>=1 union select count(*) from dessert where recommend>=1 union select count(*) from korean_bbq where recommend>=1 union select count(*) from kimchi where recommend>=1 union select count(*) from etc where recommend>=1)");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					x = rs.getInt(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}			
			}
			return x;
		}

public int getLevel_recommend_Count() {
			int x = 0;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select sum(cnt) from (select count(*) cnt from low where recommend >= 1 union select count(*) from middle where recommend >=1 union select count(*) from high where recommend >= 1)");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					x = rs.getInt(1);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				if (rs != null) try {rs.close();} catch(SQLException s) {}
				if (pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if (conn != null) try {conn.close();} catch(SQLException s) {}
			}
			return x;
		}

public List getLevel_recommend(int start, int end) throws Exception{
			
			List recommendList = null;
			String sql;
			
			try {
				conn = getConnection();
				sql = "select * from (select num,subject,category,difficulty,thumbnail, recommend, rownum r from "
					+"(select * from (select * from low where recommend >= 1 union select * from middle where recommend >= 1 union select * from high where recommend >= 1) order by recommend desc)) where r>=? and r<=? order by recommend desc";	
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					recommendList = new ArrayList(end);
					do {
						RecipeDTO dto = new RecipeDTO();
						dto.setNum(rs.getInt("num"));
						dto.setSubject(rs.getString("subject"));
						dto.setCategory(rs.getString("category"));
						dto.setDifficulty(rs.getString("difficulty"));
						dto.setThumbnail(rs.getString("thumbnail"));
						recommendList.add(dto);
					}while(rs.next());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}			
			}
			return recommendList;
		}
		
		
		public List getPortion_One_recipe(String portion) throws Exception{
			
			List recipeList = null;
			String sql;
			
			try {
				conn = getConnection();
				sql = "select * from (select num,subject,category,difficulty,thumbnail, reg, portion, recommend, rownum r from "
					+"(select * from (select * from low union select * from middle union select * from high) order by reg desc) order by recommend desc) where portion = ?";	
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, portion);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					recipeList = new ArrayList();
					do {
						RecipeDTO dto = new RecipeDTO();
						dto.setNum(rs.getInt("num"));
						dto.setSubject(rs.getString("subject"));
						dto.setCategory(rs.getString("category"));
						dto.setDifficulty(rs.getString("difficulty"));
						dto.setThumbnail(rs.getString("thumbnail"));
						recipeList.add(dto);
					}while(rs.next());
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}			
			}
			return recipeList;
		}
		
		
public ArrayList<RecipeDTO> getDish() {
			
			ArrayList<RecipeDTO> dishList = null;
			
			try {
				conn = getConnection();
				String sql = "select * from (select num,subject,category,difficulty,thumbnail,reg,sweet,sour,salty,spicy,non_spicy,soft,fresh,hot,cold,light from "
						+"(select * from main_dish union select * from side_dish union select * from stew_and_soup union select * from drink union select * from dessert union select * from korean_bbq union select * from kimchi union select * from etc) order by reg desc)";	
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				dishList = new ArrayList<RecipeDTO>();
				
				while(rs.next()) {
					RecipeDTO dto = new RecipeDTO();
					dto.setNum(rs.getInt("num"));
					dto.setSubject(rs.getString("subject"));
					dto.setCategory(rs.getString("category"));
					dto.setDifficulty(rs.getString("difficulty"));
					dto.setThumbnail(rs.getString("thumbnail"));
					dto.setSweet(rs.getString("sweet"));
					dto.setSour(rs.getString("sour"));
					dto.setSalty(rs.getString("salty"));
					dto.setSpicy(rs.getString("spicy"));
					dto.setNon_spicy(rs.getString("non_spicy"));
					dto.setHot(rs.getString("hot"));
					dto.setCold(rs.getString("cold"));
					dto.setLight(rs.getString("light"));
					dto.setSoft(rs.getString("soft"));
					dto.setFresh(rs.getString("fresh"));
					dto.setReg(rs.getTimestamp("reg"));
					dishList.add(dto);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if (rs != null) try { rs.close(); } catch(SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
				if (conn != null) try { conn.close(); } catch(SQLException s) {}			
			}
			return dishList;
		}


		public int getAll_Count() throws Exception {
			int x = 0;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select sum(cnt) from (select count(*) cnt from main_dish union select count(*) cnt from side_dish union "
						+ "select count(*) cnt from stew_and_soup union select count(*) cnt from drink union select count(*) cnt from dessert union "
						+ "select count(*) cnt from korean_bbq union select count(*) cnt from kimchi union select count(*) cnt from etc union "
						+ "select count(*) cnt from low union select count(*) cnt from middle union select count(*) cnt from high)");
				rs = pstmt.executeQuery();
				if(rs.next()) {
					x = rs.getInt(1);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
				if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
				if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
			}			
			return x;
		}

		
}
