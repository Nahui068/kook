package kook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PurchaseDAO {

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
	
	
	public void purchaseInsert(PurchaseDTO pdto) {
		try { 
			conn = getConnection();
			String sql = "insert into kook_purchase values(kook_purchase_seq.nextval, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,sysdate,?,?)";
			pstmt = conn.prepareStatement (sql);
			pstmt.setString(1, pdto.getId());
			pstmt.setString(2, pdto.getUserName());
			pstmt.setString(3, pdto.getPhone());
			pstmt.setString(4, pdto.getAddress());
			pstmt.setString(5, pdto.getEmail());
			pstmt.setString(6, pdto.getComments());
			pstmt.setString(7, pdto.getProductID());
			pstmt.setString(8, pdto.getProductName());
			pstmt.setInt(9, pdto.getAmount());
			pstmt.setInt(10, pdto.getPrice());
			pstmt.setString(11, pdto.getCard());
			pstmt.setString(12, pdto.getCardNumber1()+"-"+pdto.getCardNumber2()+"-"+pdto.getCardNumber3()+"-"+pdto.getCardNumber4());
			pstmt.setString(13, pdto.getInstallment());
			pstmt.setString(14, pdto.getDeliveryCheck());
			pstmt.setString(15, "Preparing");
			pstmt.setString(16, pdto.getImage());
			pstmt.setString(17, "N");
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if (conn != null) try {conn.close(); } catch (SQLException e) {}
		}
	}
	
	public ArrayList<PurchaseDTO> getPurchase(){
		ArrayList<PurchaseDTO> plist = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select * from kook_purchase order by purchaseID desc";
			pstmt = conn.prepareStatement (sql);
			rs = pstmt.executeQuery();
			plist = new ArrayList<PurchaseDTO>();
			while(rs.next()) {
				PurchaseDTO pdto = new PurchaseDTO();
				pdto.setPurchaseID(rs.getInt("purchaseID"));
				pdto.setId(rs.getString("id"));
				pdto.setUserName(rs.getString("userName"));
				pdto.setPhone(rs.getString("phone"));
				pdto.setAddress(rs.getString("address"));
				pdto.setEmail(rs.getString("email"));
				pdto.setComments(rs.getString("comments"));
				pdto.setProductID(rs.getString("productID"));
				pdto.setProductName(rs.getString("productName"));
				pdto.setAmount(rs.getInt("amount"));
				pdto.setPrice(rs.getInt("price"));
				pdto.setCard(rs.getString("card"));
				pdto.setCardNumber(rs.getString("cardNumber"));
				pdto.setInstallment(rs.getString("installment"));
				pdto.setDeliveryCheck(rs.getString("deliveryCheck"));
				pdto.setStatus(rs.getString("status"));
				pdto.setPurchase_date(rs.getTimestamp("purchase_date"));
				pdto.setImage(rs.getString("image"));
				pdto.setOrderCancel(rs.getString("orderCancel"));
				plist.add(pdto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try {conn.close(); } catch (SQLException e) {}
		}
		return plist;
	}
	
	public List getPurchase(String id) throws Exception {
		List myPurchase = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement( "select * from kook_purchase where id =? order by purchaseID desc");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				myPurchase = new ArrayList();
				do{
					PurchaseDTO pdto = new PurchaseDTO();
					pdto.setPurchaseID(rs.getInt("purchaseID"));
					pdto.setId(rs.getString("id"));
					pdto.setUserName(rs.getString("userName"));
					pdto.setPhone(rs.getString("phone"));
					pdto.setAddress(rs.getString("address"));
					pdto.setEmail(rs.getString("email"));
					pdto.setComments(rs.getString("comments"));
					pdto.setProductID(rs.getString("productID"));
					pdto.setProductName(rs.getString("productName"));
					pdto.setAmount(rs.getInt("amount"));
					pdto.setPrice(rs.getInt("price"));
					pdto.setCard(rs.getString("card"));
					pdto.setCardNumber(rs.getString("cardNumber"));
					pdto.setInstallment(rs.getString("installment"));
					pdto.setDeliveryCheck(rs.getString("deliveryCheck"));
					pdto.setStatus(rs.getString("status"));
					pdto.setPurchase_date(rs.getTimestamp("purchase_date"));
					pdto.setImage(rs.getString("image"));
					pdto.setOrderCancel(rs.getString("orderCancel"));
					myPurchase.add(pdto);
				}while(rs.next());
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs !=null) try {rs.close();} catch (Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch (Exception e) {}
			if(conn != null) try {conn.close();} catch (Exception e) {}
		}
		return myPurchase;
	}
	
	public int getPurchaseCount(String id){
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from kook_purchase where id=?");
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
	
	public int getPurchaseCount(){
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from kook_purchase");
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
		
	public List getPurchase(String id, int purchaseCount) throws Exception {
		List myPurchase = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement( "select * from kook_purchase where id =? order by purchaseID desc");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			int i = 0;
			if (rs.next()) {
				myPurchase = new ArrayList();
				do{
					PurchaseDTO pdto = new PurchaseDTO();
					pdto.setPurchaseID(rs.getInt("purchaseID"));
					pdto.setId(rs.getString("id"));
					pdto.setUserName(rs.getString("userName"));
					pdto.setPhone(rs.getString("phone"));;
					pdto.setAddress(rs.getString("address"));
					pdto.setEmail(rs.getString("email"));
					pdto.setComments(rs.getString("comments"));
					pdto.setProductID(rs.getString("productID"));
					pdto.setProductName(rs.getString("productName"));
					pdto.setAmount(rs.getInt("amount"));
					pdto.setPrice(rs.getInt("price"));
					pdto.setCard(rs.getString("card"));
					pdto.setCardNumber(rs.getString("cardNumber"));
					pdto.setInstallment(rs.getString("installment"));
					pdto.setDeliveryCheck(rs.getString("deliveryCheck"));
					pdto.setStatus(rs.getString("status"));
					pdto.setPurchase_date(rs.getTimestamp("purchase_date"));
					pdto.setImage(rs.getString("image"));
					pdto.setOrderCancel(rs.getString("orderCancel"));
					myPurchase.add(pdto);
					
					i++;
					// 바로 구매는 purchasecount =1
				} while (rs.next() && i < purchaseCount);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs !=null) try {rs.close();} catch (Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch (Exception e) {}
			if(conn != null) try {conn.close();} catch (Exception e) {}
		}
		return myPurchase;
	}
	
	public void updateRelease(int purchaseID) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from kook_purchase where purchaseID=?");
			pstmt.setInt(1, purchaseID);
			rs = pstmt.executeQuery();
			if(rs.next());{
				pstmt = conn.prepareStatement("update kook_purchase set status='Released', orderCancel='Impossible' where purchaseID=?");
				pstmt.setInt(1, purchaseID);
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
	
	public void updateStartDelivery(int purchaseID) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from kook_purchase where purchaseID=?");
			pstmt.setInt(1, purchaseID);
			rs = pstmt.executeQuery();
			if(rs.next());{
				pstmt = conn.prepareStatement("update kook_purchase set status='Start_Delivery',orderCancel='Impossible' where purchaseID=?");
				pstmt.setInt(1, purchaseID);
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
	
	public void updateCompleteDelivery(int purchaseID) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from kook_purchase where purchaseID=?");
			pstmt.setInt(1, purchaseID);
			rs = pstmt.executeQuery();
			if(rs.next());{
				pstmt = conn.prepareStatement("update kook_purchase set status='Complete_Delivery', orderCancel='Impossible' where purchaseID=?");
				pstmt.setInt(1, purchaseID);
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
	
	public void cancelPurchase(int purchaseID) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select * from kook_purchase where purchaseID=?");
			pstmt.setInt(1, purchaseID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				pstmt = conn.prepareStatement("update kook_purchase set orderCancel='Y', status='Canceled' where purchaseID=?");
				pstmt.setInt(1, purchaseID);
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
	
	
	
		
		// 날짜별 주문 건 수 비교
		public int dayCountPurchase(String day1, String day2) {
			int count = 0;
			try {
					conn = getConnection();
					String sql = "select count(*) from kook_purchase where purchase_date >= ? and purchase_date < ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, day1);
					pstmt.setString(2, day2);
					rs = pstmt.executeQuery();
					if(rs.next()) {	count = rs.getInt(1);		}							
			}catch(Exception e) {
					e.printStackTrace();
			}finally {
					if(rs != null)		try { rs.close(); }		catch(SQLException s) {}
					if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
					if(conn != null)	try { conn.close(); }	catch(SQLException s) {}
			}
			return count;
	}
		
	
		// 날짜별 매출 확인 메서드
		public int getSales(String day1, String day2){
			int sales = 0;
			try {
				conn = getConnection();
				String sql = "select sum(price) from kook_purchase where purchase_date >= ? and purchase_date < ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, day1);
				pstmt.setString(2, day2);
				rs = pstmt.executeQuery();

				if(rs.next()) { sales = rs.getInt(1); }
			} catch (Exception e){
				e.printStackTrace();
			} finally {
				if(rs != null) try {rs.close();} catch(SQLException s){}
				if(pstmt != null) try {pstmt.close();} catch(SQLException s) {}
				if(conn != null) try {conn.close();} catch(SQLException s) {}
			}
			return sales;
		}

}
