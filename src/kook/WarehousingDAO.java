package kook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class WarehousingDAO {

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
	
	// 입고db에 데이터 삽입
	public boolean productInsert(WarehousingDTO wdto) {
		boolean res = false;
		try {
			conn = getConnection();
			String sql = "insert into warehousing values(?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,wdto.getProductID());
			pstmt.setString(2, wdto.getName());
			pstmt.setString(3, wdto.getOrigin());
			pstmt.setString(4, wdto.getWarehousing_date());
			pstmt.setString(5, wdto.getExpiration());
			pstmt.setLong(6, wdto.getEx_during());
			pstmt.setInt(7, wdto.getPrice());
			pstmt.setInt(8, wdto.getAmount());
			
			pstmt.executeUpdate();
			res = true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return res;
	}
	
	// 입고db에 따른 재고db삽입
	public boolean stockInsert(WarehousingDTO wdto, String productID) {
		
		boolean result = false;
		
		try {
			conn = getConnection();
			String sql = "select * from stock where productid=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productID);
			rs = pstmt.executeQuery();
			
			if(!(rs.next())) {
				sql = "insert into stock values(?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, productID);
				pstmt.setString(2, wdto.getName());
				pstmt.setInt(3, wdto.getAmount());
				
				pstmt.executeUpdate();
				result = true;
			}else {
				sql = "update stock set amount=amount+? where productid=?";
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, wdto.getAmount());
				pstmt.setString(2, productID);
				
				pstmt.executeUpdate();
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return result;
	}
	
	public int getWarehousing_Count() {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from warehousing");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
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
		return x;	
	}
	
	public List getWarehousing(int start, int end) {
		List warelist=null;
		
		try {
			conn=getConnection();
			String sql = "select * from (select productid, name, origin, warehousing_date, expiration, ex_during, price, amount, rownum r from (select * from warehousing order by warehousing_date desc) order by warehousing_date desc) where r >= ? and r <= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			warelist = new ArrayList(end);
			
			while(rs.next()){
				WarehousingDTO wdto = new WarehousingDTO();
				wdto.setProductID(rs.getString("productid"));
				wdto.setName(rs.getString("name"));
				wdto.setOrigin(rs.getString("origin"));
				wdto.setWarehousing_date(rs.getString("warehousing_date"));
				wdto.setExpiration(rs.getString("expiration"));
				wdto.setEx_during(rs.getLong("ex_during"));
				wdto.setPrice(rs.getInt("price"));
				wdto.setAmount(rs.getInt("amount"));
				warelist.add(wdto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		
		
		return warelist;
	}
	
	public List getWarehousing() {
		List warelist=null;
		
		try {
			conn=getConnection();
			String sql = "select * from warehousing";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			warelist = new ArrayList();
			
			while(rs.next()){
				WarehousingDTO wdto = new WarehousingDTO();
				wdto.setProductID(rs.getString("productid"));
				wdto.setName(rs.getString("name"));
				wdto.setOrigin(rs.getString("origin"));
				wdto.setWarehousing_date(rs.getString("warehousing_date"));
				wdto.setExpiration(rs.getString("expiration"));
				wdto.setEx_during(rs.getLong("ex_during"));
				wdto.setPrice(rs.getInt("price"));
				wdto.setAmount(rs.getInt("amount"));
				warelist.add(wdto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		
		
		return warelist;
	}
	
	public int getStock_Count() {
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from stock");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
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
		return x;	
	}
	
	
	public List getStock(int start, int end) {
		List stocklist=null;
		
		try {
			conn=getConnection();
			String sql = "select * from (select productid, name, amount, rownum r from (select * from stock)) where r >= ? and r <= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			stocklist = new ArrayList(end);
			
			while(rs.next()){
				StockDTO stdto = new StockDTO();
				stdto.setProductID(rs.getString("productid"));
				stdto.setName(rs.getString("name"));
				stdto.setAmount(rs.getInt("amount"));
				stocklist.add(stdto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		
		
		return stocklist;
	}
	
	public boolean update_during(String expiration, long diffDay){
		
		boolean x = false;
		try {
			conn = getConnection();
			String sql = "update warehousing set ex_during=? where expiration =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, diffDay);
			pstmt.setString(2, expiration);
			pstmt.executeUpdate();
			x = true;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		return x;
	}
	

	public ArrayList<StockDTO> getStock(String productID) { 
		ArrayList<StockDTO> stockList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		stockList = new ArrayList<StockDTO>();
		
		try {
			conn = getConnection();
			String sql = "select * from stock where productID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productID);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StockDTO sdto = new StockDTO();
				
				sdto.setProductID(rs.getString("productID"));
				sdto.setName(rs.getString("name"));
				sdto.setAmount(rs.getInt("amount"));
				stockList.add(sdto);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn != null) try {conn.close();} catch(SQLException s) {}
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(rs != null) try {rs.close();} catch(SQLException s) {}
			}
			catch (Exception e) {}
		}
		return stockList;
	}
	

	public void updateAmount(String productID, int stock) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from stock where productID=?");
			pstmt.setString(1, productID);
			rs = pstmt.executeQuery();
			if(rs.next());{
				pstmt = conn.prepareStatement("update stock set amount=? where productID=?");
				pstmt.setInt(1, stock);
				pstmt.setString(2, productID);
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
	
	
	public List getStock() {
		List stocklist=null;
		
		try {
			conn=getConnection();
			String sql = "select * from (select productid, name, amount, rownum r from (select * from stock))";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			stocklist = new ArrayList();
			
			while(rs.next()){
				StockDTO stdto = new StockDTO();
				stdto.setProductID(rs.getString("productid"));
				stdto.setName(rs.getString("name"));
				stdto.setAmount(rs.getInt("amount"));
				stocklist.add(stdto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn!=null) try {conn.close();}catch(SQLException s) {}
				if(pstmt!=null) try {pstmt.close();}catch(SQLException s) {}
				if(rs!=null) try {rs.close();}catch(SQLException s) {}
			}catch(Exception e) {}
		}
		
		
		return stocklist;
	}
	
	
}
