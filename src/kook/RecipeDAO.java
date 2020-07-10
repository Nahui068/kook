package kook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class RecipeDAO {

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

	// 데이터 저장하기
	public void main_dish_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into main_dish values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	public void side_dish_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into side_dish values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	public void stew_soup_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into stew_and_soup values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	public void drink_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into drink values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	public void dessert_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into dessert values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	public void korean_bbq_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into korean_bbq values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	public void kimchi_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into kimchi values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	public void etc_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into etc values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	public void low_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into low values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	public void middle_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into middle values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	public void high_upload(RecipeDTO dto) {
		
		try {
			conn = getConnection();
			String sql= "insert into high values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getCategory());
			pstmt.setString(4,dto.getDifficulty());
			pstmt.setString(5,dto.getThumbnail());
			pstmt.setString(6,dto.getPortion());
			pstmt.setString(7,dto.getContent1_img());
			pstmt.setString(8,dto.getContent1_txt());
			pstmt.setString(9,dto.getContent2_img());
			pstmt.setString(10,dto.getContent2_txt());
			pstmt.setString(11,dto.getContent3_img());
			pstmt.setString(12,dto.getContent3_txt());
			pstmt.setString(13,dto.getContent4_img());
			pstmt.setString(14,dto.getContent4_txt());
			pstmt.setString(15,dto.getContent5_img());
			pstmt.setString(16,dto.getContent5_txt());
			pstmt.setString(17,dto.getContent6_img());
			pstmt.setString(18,dto.getContent6_txt());
			pstmt.setString(19,dto.getContent7_img());
			pstmt.setString(20,dto.getContent7_txt());
			pstmt.setString(21,dto.getContent8_img());
			pstmt.setString(22,dto.getContent8_txt());
			pstmt.setString(23,dto.getSweet());
			pstmt.setString(24,dto.getSour());
			pstmt.setString(25,dto.getSalty());
			pstmt.setString(26,dto.getSpicy());
			pstmt.setString(27,dto.getNon_spicy());
			pstmt.setString(28,dto.getHot());
			pstmt.setString(29,dto.getCold());
			pstmt.setString(30,dto.getLight());
			pstmt.setString(31,dto.getSoft());
			pstmt.setString(32,dto.getFresh());
			pstmt.setInt(33,dto.getRecommend());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
	}
	
	// db불러와서 출력
	public ArrayList<RecipeDTO> getMain_dish() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from main_dish";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}

	public ArrayList<RecipeDTO> getSide_dish() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from side_dish";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	
	public ArrayList<RecipeDTO> getStew_soup() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from stew_soup";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	
	public ArrayList<RecipeDTO> getDrink() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from drink";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	
	public ArrayList<RecipeDTO> getDessert() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from dessert";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	
	public ArrayList<RecipeDTO> getKorean_bbq() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from korean_bbq";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	
	public ArrayList<RecipeDTO> getKimchi() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from kimchi";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	
	public ArrayList<RecipeDTO> getEtc() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from etc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	
	public ArrayList<RecipeDTO> getLow() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from low order by num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	public ArrayList<RecipeDTO> getMiddle() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from middle order by num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	
	public ArrayList<RecipeDTO> getHigh() {
		ArrayList<RecipeDTO> writeList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from high order by num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			writeList = new ArrayList<RecipeDTO>();
			while(rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setDifficulty(rs.getString("difficulty"));
				dto.setThumbnail(rs.getString("thumbnail"));
				dto.setPortion(rs.getString("portion"));
				dto.setContent1_img(rs.getString("content1_img"));
				dto.setContent1_txt(rs.getString("content1_txt"));
				dto.setContent2_img(rs.getString("content2_img"));
				dto.setContent2_txt(rs.getString("content2_txt"));
				dto.setContent3_img(rs.getString("content3_img"));
				dto.setContent3_txt(rs.getString("content3_txt"));
				dto.setContent4_img(rs.getString("content4_img"));
				dto.setContent4_txt(rs.getString("content4_txt"));
				dto.setContent5_img(rs.getString("content5_img"));
				dto.setContent5_txt(rs.getString("content5_txt"));
				dto.setContent6_img(rs.getString("content6_img"));
				dto.setContent6_txt(rs.getString("content6_txt"));
				dto.setContent7_img(rs.getString("content7_img"));
				dto.setContent7_txt(rs.getString("content7_txt"));
				dto.setContent8_img(rs.getString("content8_img"));
				dto.setContent8_txt(rs.getString("content8_txt"));
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
				dto.setRecommend(rs.getInt("recommend"));
				dto.setReg(rs.getTimestamp("reg"));
				writeList.add(dto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return writeList;
	}
	
}
