package kook;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FaqDAO {
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		private Connection getConnection()
		{
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
				String user = "class15", pass = "class15";
				conn = DriverManager.getConnection(url, user,pass);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return conn;
		}
		public void faqBoardInsert (FaqDTO dto)
		{
			try {
				conn = getConnection();
				String sql = "insert into faqBoard values(faq_seq.nextval, ?, ?, ?, sysdate)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getQuestion());
				pstmt.setString(2, dto.getAnswer());
				pstmt.setInt(3, dto.getReadcount());
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(pstmt != null ) try {pstmt.close();} catch (SQLException s) {}
				if(conn != null ) try {pstmt.close();} catch (SQLException s) {}
			} 
		}
		
		//faqList method
		public List<FaqDTO> faqList()
		{
			List<FaqDTO> list = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select * from faqBoard");
				rs = pstmt.executeQuery();
				list = new ArrayList();
				while (rs.next())
				{
					FaqDTO dto = new FaqDTO();
					dto.setNum(rs.getInt("num"));
					dto.setQuestion(rs.getString("question"));
					dto.setAnswer(rs.getString("answer"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setReg(rs.getTimestamp("reg"));
					list.add(dto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null) try { rs.close(); } catch (SQLException s) {}
				if(pstmt != null) try { pstmt.close(); } catch (SQLException s) {}
				if(conn != null) try { conn.close(); } catch (SQLException s) {}
			}
			return list; 
		}
		public int getFaqCount() throws Exception {
			 int x =0;
			 try {
				 conn = getConnection();
				 // faq ±Û °¹¼ö
				 pstmt = conn.prepareStatement("select count(*) from faqBoard");
				 rs = pstmt.executeQuery();
				 if(rs.next()) {
					 x = rs.getInt(1);
				 }
			 } catch (Exception ex) {
				 ex.printStackTrace();
			 } finally {
				 if (rs != null) try { rs.close(); } catch (SQLException e) {} 
				 if (pstmt != null) try { pstmt.close();} catch (SQLException e) {}
				 if (conn != null) try {conn.close(); } catch (SQLException e) {}
			 } 
			 return x;
		}
		public List getFaq(int start, int end) throws Exception {
			List faqList = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
						"select * from (select num, question, answer, readcount, reg, rownum r from " 
						+ "(select * from faqBoard order by num desc) order by num desc) where r>=? and r <=?");
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					faqList = new ArrayList(end);
					do {
						FaqDTO dto = new FaqDTO();
						dto.setNum(rs.getInt("Num"));
						dto.setQuestion(rs.getString("question"));
						dto.setAnswer(rs.getString("answer"));
						dto.setReadcount(rs.getInt("readcount"));
						dto.setReg(rs.getTimestamp("reg"));
						faqList.add(dto);
					}while(rs.next());
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) try {rs.close();} catch (SQLException e) {}
				if (pstmt != null) try {pstmt.close();} catch (SQLException e) {}
				if (conn != null) try {conn.close(); } catch (SQLException e) {}
			} 
			return faqList;		
		}
		
		public FaqDTO getFaq(int num) throws Exception {
			FaqDTO faq = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement (
					"update faqBoard set readcount = readcount+1 where num = ?");
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				pstmt = conn.prepareStatement("select * from faqBoard where num =?");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					faq = new FaqDTO();
					faq.setNum(rs.getInt("num"));
					faq.setQuestion(rs.getString("question"));
					faq.setAnswer(rs.getString("answer"));
					faq.setReadcount(rs.getInt("readcount"));
					faq.setReg(rs.getTimestamp("reg"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null ) try {rs.close(); } catch (SQLException e) {}
				if(pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
				if(conn != null) try {conn.close();} catch(SQLException e) {}
			}
			return faq;
		}
		
		public FaqDTO modifyGetFaq(int num) {
			FaqDTO faq = null;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
						"select * from faqBoard where Num =?");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					faq = new FaqDTO();
					faq.setNum(rs.getInt("num"));
					faq.setQuestion(rs.getString("question"));
					faq.setAnswer(rs.getString("answer"));
					faq.setReadcount(rs.getInt("readcount"));
					faq.setReg(rs.getTimestamp("reg"));
				}
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) try { rs.close(); } catch (Exception e) {}
				if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
				if (conn != null) try { conn.close(); } catch (Exception e) {}
	 		}
			return faq;
		}
		public int modifyFaq(FaqDTO faq) throws Exception {
			String sql ="";
			int x = -1;
			try {
				conn = getConnection();
				sql = "update faqBoard set question =?, answer=?,reg =sysdate where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, faq.getQuestion());
				pstmt.setString(2, faq.getAnswer());
				pstmt.setInt(3, faq.getNum());
				pstmt.executeUpdate();
				x = 1;
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if (rs !=null) try {rs.close();} catch (SQLException e) {}
				if (pstmt !=null) try {pstmt.close();} catch(SQLException e) {}
				if (conn != null) try {conn.close(); } catch(SQLException e) {}
			}
			return x; 
		}

		public  void deleteFaq(int num) {
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(
						"select * from faqBoard where num =? ");
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					pstmt = conn.prepareStatement(
							"delete from faqBoard where num =?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) try { rs.close();} catch (SQLException e) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
				if (conn != null) try { conn.close(); } catch(SQLException e) {}
			}
		}
}
