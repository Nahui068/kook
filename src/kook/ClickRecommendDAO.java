package kook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

public class ClickRecommendDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class15", pass="class15";
			conn = DriverManager.getConnection(url, user, pass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 異붿쿇�븳 �궗�엺�뱾�쓽 �뜲�씠�꽣踰좎씠�뒪 異붽� 湲곕뒫
public int like(int num, String userid, String subject) {
		
		int x = 0;
		//String sql = "insert into recommend values(?,?,?,?)";
		
		try {
			conn = getConnection();
			
			String sql = "select * from recommend where num = ? and userid = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, userid);
			rs = pstmt.executeQuery();
		
			if(!rs.next()) {
				sql = "insert into recommend values(?,?,?,sysdate)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, userid);
				pstmt.setString(3, subject);
			
				pstmt.executeUpdate();
				
				x = 1;
			}else {x=-1;}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try {pstmt.close();} catch(SQLException s){}
			if(conn!=null) try {conn.close();} catch(SQLException s){}
			if(rs!=null) try {rs.close();} catch(SQLException s){}
		}
		return x;
	}
	
	// 異붿쿇 �겢由��떆 異붿쿇 �닔媛� �삱�씪媛��뒗 寃�
	public int main_dish_getLike(int num)  {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update main_dish set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int side_dish_getLike(int num)  {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update side_dish set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int stew_and_soup_getLike(int num)  {

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update stew_and_soup set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int drink_getLike(int num)  {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update drink set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int dessert_getLike(int num)  {
	
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update dessert set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int korean_bbq_getLike(int num)  {
	
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update korean_bbq set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int kimchi_getLike(int num)  {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update kimchi set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int etc_getLike(int num)  {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update etc set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int low_getLike(int num)  {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update low set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int middle_getLike(int num)  {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update middle set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	public int high_getLike(int num)  {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update high set recommend=recommend+1 where num = ?"); 
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return -1;
		}
	
	
	public int getMyReco_Count(String id) {
		int x = 0;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select count(*) from recommend where userid=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return x;
	}
	
	
	public List getMyReco(int start, int end, String id) {
		
		List myRecoList=null;
		String sql;
		
		try {
			conn=getConnection();
			sql = "select * from (select num,category,difficulty,thumbnail,subject, rownum r from "
					+ "(select * from main_dish union select * from side_dish union select * from stew_and_soup union select * from drink union select * from dessert union select * from korean_bbq union select * from kimchi union select * from etc union select * from low union select * from middle union select * from high) "
					+ "where num in (select num from recommend where userid=?) order by num desc) where r >= ? and r <= ?";
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				myRecoList = new ArrayList(end);
				do {
					RecipeDTO rdto = new RecipeDTO();
					rdto.setNum(rs.getInt("num"));
					rdto.setCategory(rs.getString("category"));
					rdto.setDifficulty(rs.getString("difficulty"));
					rdto.setThumbnail(rs.getString("thumbnail"));
					rdto.setSubject(rs.getString("subject"));
					myRecoList.add(rdto);
				} while(rs.next());
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return myRecoList;
	}

	
	
	
	// 異붿쿇�닔 泥댄겕 
		public int getReco_count(String day1, String day2)  {

			int count = 0;
			
			try {
				conn = getConnection();
				String sql = "select count(*) from recommend where reco_date>=? and reco_date<?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, day1);
				pstmt.setString(2, day2);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}	
			}
			return count;
		}
	
		
		
		
	
}
