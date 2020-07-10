package kook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

public class IngredDAO {
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
	
	public void ingredInsert(IngredDTO dto) {
		try {
			conn=getConnection();
			
			String sql = "insert into ingredient values(recipe_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getIngred1());
			pstmt.setString(2, dto.getIngred2());
			pstmt.setString(3, dto.getIngred3());
			pstmt.setString(4, dto.getIngred4());
			pstmt.setString(5, dto.getIngred5());
			pstmt.setString(6, dto.getIngred6());
			pstmt.setString(7, dto.getIngred7());
			pstmt.setString(8, dto.getIngred8());
			pstmt.setString(9, dto.getIngred9());
			pstmt.setString(10, dto.getIngred10());
			pstmt.setString(11, dto.getIngred11());
			pstmt.setString(12, dto.getIngred12());
			pstmt.setString(13, dto.getIngred13());
			pstmt.setString(14, dto.getIngred14());
			pstmt.setString(15, dto.getIngred15());
			pstmt.setString(16, dto.getIngred16());
			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
		}
	}
	
	public ArrayList<IngredDTO> getIngred(){
		ArrayList<IngredDTO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from ingredient order by num");
			rs = pstmt.executeQuery();
			list = new ArrayList<IngredDTO>();
			while(rs.next()) {
				IngredDTO dto = new IngredDTO();
				dto.setNum(rs.getInt("num"));
				dto.setIngred1(rs.getString("ingred1"));
				dto.setIngred2(rs.getString("ingred2"));
				dto.setIngred3(rs.getString("ingred3"));
				dto.setIngred4(rs.getString("ingred4"));
				dto.setIngred5(rs.getString("ingred5"));
				dto.setIngred6(rs.getString("ingred6"));
				dto.setIngred7(rs.getString("ingred7"));
				dto.setIngred8(rs.getString("ingred8"));
				dto.setIngred9(rs.getString("ingred9"));
				dto.setIngred10(rs.getString("ingred10"));
				dto.setIngred11(rs.getString("ingred11"));
				dto.setIngred12(rs.getString("ingred12"));
				dto.setIngred13(rs.getString("ingred13"));
				dto.setIngred14(rs.getString("ingred14"));
				dto.setIngred15(rs.getString("ingred15"));
				dto.setIngred16(rs.getString("ingred16"));
				list.add(dto);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return list;
	}
	
	public void modify(IngredDTO dto) {
		try {
			conn = getConnection();
			String sql = "update ingredient set ingred1=?, ingred2=?, ingred3=?, ingred4=?, ingred5=?, ingred6=?, ingred7=?, ingred8=?, ingred9=?, ingred10=?, "
					+ "ingred11=?, ingred12=?, ingred13=?, ingred14=?, ingred15=?, ingred16=?,where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getIngred1());
					pstmt.setString(2, dto.getIngred2());
					pstmt.setString(3, dto.getIngred3());
					pstmt.setString(4, dto.getIngred4());
					pstmt.setString(5, dto.getIngred5());
					pstmt.setString(6, dto.getIngred6());
					pstmt.setString(7, dto.getIngred7());
					pstmt.setString(8, dto.getIngred8());
					pstmt.setString(9, dto.getIngred9());
					pstmt.setString(10, dto.getIngred10());
					pstmt.setString(11, dto.getIngred11());
					pstmt.setString(12, dto.getIngred12());
					pstmt.setString(13, dto.getIngred13());
					pstmt.setString(14, dto.getIngred14());
					pstmt.setString(15, dto.getIngred15());
					pstmt.setString(16, dto.getIngred16());
					pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
	}
	
	public String delete(IngredDTO dto) {
		String msg = "글 번호를 확인하세요";
		try {
			conn = getConnection();
			String sql = "select*from ingredient where num=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "delete from ingredient where ingred1=?, ingred2=?, ingred3=?, ingred4=?, ingred5=?, ingred6=?, ingred7=?, ingred8=?, ingred9=?, ingred10=?,"
						+ " ingred11=?, ingred12=?, ingred13=?, ingred14=?, ingred15=?, ingred16=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getIngred1());
				pstmt.setString(2, dto.getIngred2());
				pstmt.setString(3, dto.getIngred3());
				pstmt.setString(4, dto.getIngred4());
				pstmt.setString(5, dto.getIngred5());
				pstmt.setString(6, dto.getIngred6());
				pstmt.setString(7, dto.getIngred7());
				pstmt.setString(8, dto.getIngred8());
				pstmt.setString(9, dto.getIngred9());
				pstmt.setString(10, dto.getIngred10());
				pstmt.setString(11, dto.getIngred11());
				pstmt.setString(12, dto.getIngred12());
				pstmt.setString(13, dto.getIngred13());
				pstmt.setString(14, dto.getIngred14());
				pstmt.setString(15, dto.getIngred15());
				pstmt.setString(16, dto.getIngred16());
				pstmt.executeUpdate();
				msg="삭제 되었습니다.";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return msg;
	}
	
}
