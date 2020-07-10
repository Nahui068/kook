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
import java.util.List;

public class ShopDAO {

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
	
	// productid에 따른 Shop 게시글 내용 불러오기(ShopContent.jsp)
	public ShopDTO getShop(String productid) {
		
		ShopDTO sdto = null;
		
		try {
			conn = getConnection();
			String sql = "select * from kook_shop where productid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sdto = new ShopDTO();
				sdto.setProductID(rs.getString("productid"));
				sdto.setName(rs.getString("name"));
				sdto.setImage(rs.getString("image"));
				sdto.setContent(rs.getString("content"));
				sdto.setOrigin(rs.getString("origin"));
				sdto.setExpiration(rs.getString("expiration"));
				sdto.setStorage(rs.getString("storage"));
				sdto.setPrice(rs.getInt("price"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();} catch(SQLException s) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException s) {}
		}
		return sdto;
	}
	
	// shop db불러와서 해당 값 저장
	public ArrayList<ShopDTO> getShop(){
		ArrayList<ShopDTO> slist = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from kook_shop";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			slist = new ArrayList<ShopDTO>();
			while(rs.next()) {
				ShopDTO sdto = new ShopDTO();
				sdto.setProductID(rs.getString("productid"));
				sdto.setName(rs.getString("name"));
				sdto.setImage(rs.getString("image"));
				sdto.setContent(rs.getString("content"));
				sdto.setOrigin(rs.getString("origin"));
				sdto.setExpiration(rs.getString("expiration"));
				sdto.setStorage(rs.getString("storage"));
				sdto.setPrice(rs.getInt("price"));
				slist.add(sdto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException s) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null) try {conn.close();}catch(SQLException s) {}
		}
		return slist;
		
	}
	
	// shop 게시글 수 세기
	public int getShop_count() throws Exception{
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from kook_shop");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException s) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null) try {conn.close();}catch(SQLException s) {}
		}
		return x;
	}
	
	// shop게시글 list에 나타내기 위한 것
	public List getShop_count(int start, int end) throws Exception{
		
		List shopList = null;
		String sql;
		
		try {
			conn = getConnection();
			sql = "select * from (select productid,name,image,price,rownum r from "
					+"(select * from kook_shop order by price)) where r>=? and r<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				shopList = new ArrayList(end);
				do {
					ShopDTO sdto = new ShopDTO();
					sdto.setProductID(rs.getString("productid"));
					sdto.setName(rs.getString("name"));
					sdto.setImage(rs.getString("image"));
					sdto.setPrice(rs.getInt("price"));
					shopList.add(sdto);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try {rs.close();}catch(SQLException s) {}
			if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null) try {conn.close();}catch(SQLException s) {}
		}
		return shopList;
	}
	// shop 내용 넣기
	public void shop_upload(ShopDTO dto) {
		try {
			conn = getConnection();
			String sql = "insert into kook_shop values(?, ?, ?, ?, ?, ?, ?, ?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getProductID());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getImage());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getOrigin());
			pstmt.setString(6, dto.getExpiration());
			pstmt.setString(7, dto.getStorage());
			pstmt.setInt(8, dto.getPrice());
			
			pstmt.executeUpdate();
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
		
		finally {
			try {
				if (conn != null) try { conn.close(); } catch (SQLException s) {}
				if (pstmt != null) try { pstmt.close(); } catch (SQLException s) {}
				if (rs != null) try { rs.close(); } catch (SQLException s) {}
			} catch (Exception e) {}
		}

	}
	
	public boolean deleteProduct(String productID) {
		boolean check = false;
		try {
			conn = getConnection();
			String sql = "select * from kook_shop where productID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "delete from kook_shop where productID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, productID);
				pstmt.executeUpdate();
				check = true;
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
		return check;
	}
	

	
	public List getShopList(int start, int end) {
		List prodList = null;
		String sql = "";
		try {
			conn = getConnection();
			sql = "select * from (select productID, name, content, origin, expiration, storage, price, rownum r from (select * from kook_shop order by productID desc) order by productID desc) where r>=? and r<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				prodList = new ArrayList(end);
				do {
				ShopDTO sdto = new ShopDTO();
				sdto.setProductID(rs.getString("productID"));
				sdto.setName(rs.getString("name"));
				sdto.setContent(rs.getString("content"));
				sdto.setOrigin(rs.getString("origin"));
				sdto.setExpiration(rs.getString("expiration"));
				sdto.setStorage(rs.getString("storage"));
				sdto.setPrice(rs.getInt("price"));
				prodList.add(sdto);
				} while(rs.next());
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (rs != null) try {rs.close();} catch (SQLException s) {}
			if (pstmt != null) try {pstmt.close();} catch (SQLException s) {}
			if (conn != null) try {conn.close();} catch (SQLException s) {}
		}
		return prodList;
	}
	
	public ShopDTO updateGetProduct(String productID) {
		ShopDTO sdto = null;
		try {
			conn = getConnection();
			String sql = "select * from kook_shop where productID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sdto = new ShopDTO();
				sdto.setName(rs.getString("name"));
				sdto.setImage(rs.getString("image"));
				sdto.setContent(rs.getString("content"));
				sdto.setOrigin(rs.getString("origin"));
				sdto.setExpiration(rs.getString("expiration"));
				sdto.setStorage(rs.getString("storage"));
				sdto.setPrice(rs.getInt("price"));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs!=null) try {rs.close();} catch(SQLException s) {}
			if(pstmt!=null) try {pstmt.close();} catch(SQLException s) {}
			if(conn!=null) try {conn.close();} catch(SQLException s) {}
		}
		return sdto;
	}

	
	public boolean updateProduct(ShopDTO sdto) {
		boolean check = false;
		try {
			conn = getConnection();
			String sql = "update kook_shop set name=?, content=?, origin=?, expiration=?, storage=?, price=? where productID=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, sdto.getName());
			pstmt.setString(2, sdto.getContent());
			pstmt.setString(3, sdto.getOrigin());
			pstmt.setString(4, sdto.getExpiration());
			pstmt.setString(5, sdto.getStorage());
			pstmt.setInt(6, sdto.getPrice());
			pstmt.setString(7, sdto.getProductID());
			pstmt.executeUpdate();
			check = true;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (pstmt!=null) try {pstmt.close();} catch(SQLException s) {}
			if (conn != null) try {conn.close();} catch(SQLException s) {}
		}
		return check;
	}
	
	
}
