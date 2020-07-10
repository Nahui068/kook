package kook;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BasketDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private Connection getConnection() throws Exception{
		try {
			Class.forName ("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
			String user = "class15", pass = "class15";
			conn = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// shop���ִ°� shopDAO ����ϱ�
	
	// db���� (insert)
	public void basketInsert(BasketDTO bdto) {
		try { 
			conn = getConnection();
			String sql = "insert into kook_basket values(kook_basket_seq.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement (sql);
			pstmt.setString(1, bdto.getId());
			pstmt.setString(2, bdto.getProductID());
			pstmt.setString(3, bdto.getProductName());
			pstmt.setInt(4, bdto.getAmount());
			pstmt.setInt(5, bdto.getPrice());
			pstmt.setString(6, bdto.getImage());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if (conn != null) try {conn.close(); } catch (SQLException e) {}
		}
	}
	
	
	//
	// ��ٱ��� db �ҷ��ͼ� dto�� ���� ��ġ ����
	// session id ���� �� ��
	public ArrayList<BasketDTO> getProduct(){
		ArrayList<BasketDTO> blist = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from kook_basket";
			pstmt = conn.prepareStatement (sql);
			rs = pstmt.executeQuery();
			blist = new ArrayList<BasketDTO>();
			while(rs.next()) {
				BasketDTO bdto = new BasketDTO();
				bdto.setId(rs.getString("id"));
				bdto.setProductID(rs.getString("productID"));
				bdto.setProductName(rs.getString("productName"));
				bdto.setAmount(rs.getInt("amount"));
				bdto.setPrice(rs.getInt("price"));
				bdto.setImage(rs.getString("image"));
				blist.add(bdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try {conn.close(); } catch (SQLException e) {}
		}
		return blist;
		
	}
	
	// db�� ������ ��ٱ��� ���� list�� �����ֱ� (���� ���� ����)
		public List getBasket( String id) throws Exception {
			List myBasket = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
						"select * from (select basketId, id, productID, productName, amount, price, image from" +
						"(select * from kook_basket where id =? order by basketId desc))");
				pstmt.setString(1, id);
			
				
				rs = pstmt.executeQuery();
				
					myBasket = new ArrayList();
					while(rs.next()) {
						BasketDTO bdto = new BasketDTO();
						bdto.setBasketId(rs.getInt("basketId"));
						bdto.setId(rs.getString("id"));
						bdto.setProductID(rs.getString("productID"));
						bdto.setProductName(rs.getString("productName"));
						bdto.setAmount(rs.getInt("amount"));
						bdto.setPrice(rs.getInt("price"));
						bdto.setImage(rs.getString("image"));
						myBasket.add(bdto);
					}
						
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs !=null) try {rs.close();} catch (Exception e) {}
				if(pstmt != null) try {pstmt.close();} catch (Exception e) {}
				if(conn != null) try {conn.close();} catch (Exception e) {}
			}
			return myBasket;
		}
	
	
	// ��ٱ��Ͽ� ���� ���� ���� - db���� X, list ���� ������ ������
	public int getBasketCount(String id){
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from kook_basket where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; 
	}
	
	public void deleteBasket(int basketId) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from kook_basket where basketId=?");
			pstmt.setInt(1, basketId);
			rs = pstmt.executeQuery();
			if(rs.next());{
				pstmt = conn.prepareStatement(
						"delete from kook_basket where basketId=?");
				pstmt.setInt(1, basketId);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs!=null) try { rs.close();} catch (SQLException e) {}
			if (pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if (conn != null) try {conn.close();} catch(SQLException e) {}
		}
	}
	
	
	public void deleteBasket(String id) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from kook_basket where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next());{
				pstmt = conn.prepareStatement(
						"delete from kook_basket where id=?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs!=null) try { rs.close();} catch (SQLException e) {}
			if (pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if (conn != null) try {conn.close();} catch(SQLException e) {}
		}
	}
	
	
	
}

