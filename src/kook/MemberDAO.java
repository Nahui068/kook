// 회원 DB 관련 기능 수행을 위한 JAVA 페이지

package kook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
		
		// #0) DB 연결 (작성:전민기)
		private Connection getConnection() {
				try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						String url = "jdbc:oracle:thin:@nullmaster.iptime.org:1521:orcl";
						String user = "class15", pass = "class15";
						conn = DriverManager.getConnection(url, user, pass);
				}catch(Exception e) {
						e.printStackTrace();
				}
				return conn;
				
		} // private Connection getConnection() {
		
		// #1) 회원등록 (작성:전민기)
		public void memberInsert(MemberDTO dto) {
			try {
					conn = getConnection();								// DB연결
					String sql = "insert into kook_member values(?, ?, sysdate, ?, ?, ?, "
										+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					pstmt = conn.prepareStatement(sql);		// Query 저장
					
					if(dto.getSweet() == null) dto.setSweet("0");
					if(dto.getSour() == null) dto.setSour("0");
					if(dto.getSalty() == null) dto.setSalty("0");
					if(dto.getSpicy() == null) dto.setSpicy("0");
					if(dto.getNon_spicy() == null) dto.setNon_spicy("0");
					if(dto.getSoft() == null) dto.setSoft("0");
					if(dto.getFresh() == null) dto.setFresh("0");
					if(dto.getHot() == null) dto.setHot("0");
					if(dto.getCool() == null) dto.setCool("0");
					if(dto.getLight() == null) dto.setLight("0");
					
					pstmt.setString(1,  dto.getId());
					pstmt.setString(2,  dto.getPw());
					pstmt.setString(3,  dto.getGender());
					pstmt.setString(4,  dto.getName());
					dto.setBirth(dto.getBirth_y()+dto.getBirth_m()+dto.getBirth_d());
					pstmt.setString(5,  dto.getBirth());
					pstmt.setString(6,  dto.getBirth_y());
					pstmt.setString(7,  dto.getBirth_m());
					pstmt.setString(8,  dto.getBirth_d());
					pstmt.setString(9,  dto.getPh());
					dto.setPhNum(dto.getPh_no1()+dto.getPh_no2()+dto.getPh_no3());
					pstmt.setString(10,  dto.getPhNum());
					pstmt.setString(11,  dto.getPh_no1());
					pstmt.setString(12,  dto.getPh_no2());
					pstmt.setString(13,  dto.getPh_no3());
					dto.setEmail(dto.getEmail_id()+"@"+dto.getEmail_adr());
					pstmt.setString(14,  dto.getEmail());
					pstmt.setString(15,  dto.getEmail_id());
					pstmt.setString(16,  dto.getEmail_adr());
					pstmt.setString(17,  dto.getAdrNum());
					pstmt.setString(18,  dto.getAdr());
					pstmt.setString(19,  dto.getAddress1());
					pstmt.setString(20,  dto.getAddress2());
					pstmt.setString(21,  dto.getSweet());
					pstmt.setString(22,  dto.getSour());
					pstmt.setString(23,  dto.getSalty());
					pstmt.setString(24,  dto.getSpicy());
					pstmt.setString(25,  dto.getNon_spicy());
					pstmt.setString(26,  dto.getSoft());
					pstmt.setString(27,  dto.getFresh());
					pstmt.setString(28,  dto.getHot());
					pstmt.setString(29,  dto.getCool());
					pstmt.setString(30,  dto.getLight());
					
					pstmt.executeUpdate();									// Query 실행					
			}catch(Exception e) {
					e.printStackTrace();
			}finally {
					if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
					if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
			}
		} // public void memberInsert(MemberDTO dto) {
		
		// #2) 회원등록 ID 중복확인 (작성:전민기)
		public int confirmId(String id) {
				int x = -1;
				try {
						conn = getConnection();
						pstmt = conn.prepareStatement("select id from kook_member where id = ?");
						pstmt.setString(1, id);
						rs = pstmt.executeQuery();
						
						if(rs.next()){
							x = 1; 
						}
				}catch(Exception e) {
						e.printStackTrace();
				}finally {
						if(rs != null)			try { rs.close(); }			catch(SQLException s) {} 
						if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
						if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
				}
				return x;
		} // public int confirmId(String id) {
		
		// #3) 전체회원 목록 출력 (작성:전민기)
		public List<MemberDTO> memberList() {
				List<MemberDTO> list = null;
				try {
						conn = getConnection();
						pstmt = conn.prepareStatement("select * from kook_member order by reg desc");
						rs = pstmt.executeQuery();
						list = new ArrayList<MemberDTO>();
						
						while(rs.next()) {
								MemberDTO dto = new MemberDTO();
								dto.setId(rs.getString("id"));
								dto.setReg(rs.getTimestamp("reg"));
								dto.setName(rs.getString("name"));
								dto.setGender(rs.getString("gender"));
								dto.setBirth(rs.getString("birth"));
								dto.setPhNum(rs.getString("phnum"));
								dto.setEmail(rs.getString("email"));
								
								list.add(dto);
						}
						
				}catch(Exception e){
						e.printStackTrace();
				}finally {
						if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
						if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
						if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
				}
				return list;
		} // public List<MemberDTO> memberList() {
		
		// #4) 자신의 회원정보 출력 (작성:전민기)
		public MemberDTO getMember(String id) {
			 MemberDTO dto = null;
			 try {
				 	conn = getConnection();
				 	pstmt = conn.prepareStatement("select * from kook_member where id = ?");
				 	pstmt.setString(1,  id);
				 	rs = pstmt.executeQuery();
				 	
				 	if(rs.next()) {
				 			dto = new MemberDTO();
				 			dto.setId(rs.getString("id"));
				 			dto.setPw(rs.getString("pw"));
							dto.setGender(rs.getString("gender"));
							dto.setName(rs.getString("name"));
							dto.setBirth_y(rs.getString("birth_y"));
							dto.setBirth_m(rs.getString("birth_m"));
							dto.setBirth_d(rs.getString("birth_d"));
							dto.setPh(rs.getString("ph"));
							dto.setPh_no1(rs.getString("ph_no1"));
							dto.setPh_no2(rs.getString("ph_no2"));
							dto.setPh_no3(rs.getString("ph_no3"));
							dto.setEmail_id(rs.getString("email_id"));
							dto.setEmail_adr(rs.getString("email_adr"));
							dto.setAdrNum(rs.getString("adrnum"));
							dto.setAdr(rs.getString("adr"));
							dto.setAddress1(rs.getString("address1"));
							dto.setAddress2(rs.getString("address2"));
							dto.setSweet(rs.getString("sweet"));
							dto.setSour(rs.getString("sour"));
							dto.setSalty(rs.getString("salty"));
							dto.setSpicy(rs.getString("spicy"));
							dto.setNon_spicy(rs.getString("non_spicy"));
							dto.setSoft(rs.getString("soft"));
							dto.setFresh(rs.getString("fresh"));
							dto.setHot(rs.getString("hot"));
							dto.setCool(rs.getString("cool"));
							dto.setLight(rs.getString("light"));							
				 	}				 	
			 }catch(Exception e) {
				 	e.printStackTrace();
			 }finally {
				 	if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
				 	if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
				 	if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
			 }
			 return dto;			 
		} //public MemberDTO getMember(String id) {
		
		// #5) 회원 정보수정 (작성:전민기)
		public int memberModify(MemberDTO dto, String old_pw) {
				int check = 0;
				try {					
						conn = getConnection();								// DB연결
						
						String sql = "select * from kook_member where pw = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,  old_pw);
						rs = pstmt.executeQuery();
						
						if(rs.next()) {					
								sql = "update kook_member set pw = ?, gender = ?, name = ?, birth = ?, birth_y = ?, birth_m = ?, birth_d = ?,  "
										+ "ph = ?, phnum = ?, ph_no1 = ?, ph_no2 = ?, ph_no3 = ?, email = ?, email_id = ?, email_adr = ?, adrnum = ?, adr = ?, "
										+ "address1 = ?, address2 = ?, sweet = ?, sour = ?, salty = ?, spicy = ?, non_spicy = ?, soft = ?, fresh = ?, hot = ?, cool = ?, light = ? "
										+ "where id = ?";
								pstmt = conn.prepareStatement(sql);		// Query 저장
								
								if(dto.getSweet() == null) dto.setSweet("0");
								if(dto.getSour() == null) dto.setSour("0");
								if(dto.getSalty() == null) dto.setSalty("0");
								if(dto.getSpicy() == null) dto.setSpicy("0");
								if(dto.getNon_spicy() == null) dto.setNon_spicy("0");
								if(dto.getSoft() == null) dto.setSoft("0");
								if(dto.getFresh() == null) dto.setFresh("0");
								if(dto.getHot() == null) dto.setHot("0");
								if(dto.getCool() == null) dto.setCool("0");
								if(dto.getLight() == null) dto.setLight("0");
								
								pstmt.setString(1,  dto.getPw());
								pstmt.setString(2,  dto.getGender());
								pstmt.setString(3,  dto.getName());
								dto.setBirth(dto.getBirth_y()+dto.getBirth_m()+dto.getBirth_d());
								pstmt.setString(4,  dto.getBirth());
								pstmt.setString(5,  dto.getBirth_y());
								pstmt.setString(6,  dto.getBirth_m());
								pstmt.setString(7,  dto.getBirth_d());
								pstmt.setString(8,  dto.getPh());
								dto.setPhNum(dto.getPh_no1()+dto.getPh_no2()+dto.getPh_no3());
								pstmt.setString(9,  dto.getPhNum());
								pstmt.setString(10,  dto.getPh_no1());
								pstmt.setString(11,  dto.getPh_no2());
								pstmt.setString(12,  dto.getPh_no3());
								dto.setEmail(dto.getEmail_id()+"@"+dto.getEmail_adr());
								pstmt.setString(13,  dto.getEmail());
								pstmt.setString(14,  dto.getEmail_id());
								pstmt.setString(15,  dto.getEmail_adr());
								pstmt.setString(16,  dto.getAdrNum());
								pstmt.setString(17,  dto.getAdr());
								pstmt.setString(18,  dto.getAddress1());
								pstmt.setString(19,  dto.getAddress2());
								pstmt.setString(20,  dto.getSweet());
								pstmt.setString(21,  dto.getSour());
								pstmt.setString(22,  dto.getSalty());
								pstmt.setString(23,  dto.getSpicy());
								pstmt.setString(24,  dto.getNon_spicy());
								pstmt.setString(25,  dto.getSoft());
								pstmt.setString(26,  dto.getFresh());
								pstmt.setString(27,  dto.getHot());
								pstmt.setString(28,  dto.getCool());
								pstmt.setString(29,  dto.getLight());
								pstmt.setString(30,  dto.getId());
								
								pstmt.executeUpdate();									// Query 실행
								
								check = 1;
						}		
				}catch(Exception e) {
						e.printStackTrace();
				}finally {
						if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
						if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
						if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
				}
				return check;
		} // public int memberModify(MemberDTO dto, String old_pw) {
		
		// #6) 회원 탈퇴 (작성:전민기)
		public int memberLeave(String id, String pw) {
				int check = 0;
				try {
						conn = getConnection();
						String sql = "select * from kook_member where id = ? and pw = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, id);
						pstmt.setString(2, pw);
						rs = pstmt.executeQuery();

						if(rs.next()) {
								sql = "insert into kook_leaveMembers values("
										+ "kook_leaveMembers_seq.nextval, sysdate, ?, ?, ?, ?)";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, rs.getString("id"));
								pstmt.setString(2, rs.getString("name"));
								pstmt.setString(3, rs.getString("birth"));
								pstmt.setString(4, rs.getString("phnum"));
								pstmt.executeUpdate();
								
								sql = "delete from kook_member where id = ?";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1,  id);
								pstmt.executeUpdate();
								check = 1;
						}
				}catch(Exception e) {
						e.printStackTrace();
				}finally {
						if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
						if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
						if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
				}				
				return check;
				
		} // public int memberLeave(String id, String pw) {
		
		// #7) 회원 로그인 기능 (작성:김태언)
		public int loginCheck(String id, String pw)  {
	        String dbpw="";
			int x=-1;
			try {
		            conn = getConnection();
		            pstmt = conn.prepareStatement("select pw from kook_member where id = ?");
		            pstmt.setString(1, id);
		            rs= pstmt.executeQuery();
					if(rs.next()){
							dbpw = rs.getString("pw"); 
							if(dbpw.equals(pw)) {
								x= 1; 	//인증 성공
							}else {
								x= 0; 	//비밀번호 틀림
							}	
						}else {
							x= -1;		//해당 아이디 없음
						}	
		        } catch(Exception e) {
		            	e.printStackTrace();
		        } finally {
						if (rs != null) try { rs.close(); } catch(SQLException s) {}
			            if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
			            if (conn != null) try { conn.close(); } catch(SQLException s) {}
		        }
				return x;
		} // public int loginCheck(String id, String pw)  {
		
		// #8) 회원 ID 찾기 기능 (작성자 : 김태언)
		public String find_id(String birth, String email)  {
	        String id = null;
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement("select id from kook_member where birth=? and email=?");
					pstmt.setString(1, birth);
					pstmt.setString(2, email);
					rs=pstmt.executeQuery();
					if(rs.next()){
							id=rs.getString("id");
					}				
			} catch(Exception e) {
	            	e.printStackTrace();
	        } finally {
					if (rs != null)			try { rs.close(); }			catch(SQLException s) {}
		            if (pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
		            if (conn != null)	try { conn.close(); }		catch(SQLException s) {}
	        }
			return id;
		} // public String find_id(String birth, String email)  {
		
		// #9) 회원 PW 찾기 (작성자 : 김태언)
		public String find_pw(String id, String birth, String email)  {
		        String pw = null;
				try {
					conn = getConnection();
					pstmt = conn.prepareStatement("select pw from kook_member where id=? and birth=? and email=?");
					pstmt.setString(1, id);
					pstmt.setString(2, birth);
					pstmt.setString(3, email);
					rs=pstmt.executeQuery();
					if(rs.next()){
						pw=rs.getString("pw");
					}
				} catch(Exception e) {
	            		e.printStackTrace();
		        } finally {
						if (rs != null)			try { rs.close(); }			catch(SQLException s) {}
			            if (pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
			            if (conn != null)	try { conn.close(); }		catch(SQLException s) {}
		        }
				return pw;
		} // public String find_pw(String id, String birth, String email)  {
		
		// #10) 회원 제명하기 (작성자 : 전민기)
		public String memberDelete(String id) {
			String msg = "정상적으로 처리되지 못했습니다.";
				try {
						conn =getConnection();
						pstmt = conn.prepareStatement("delete from kook_member where id = ?");
						pstmt.setString(1, id);
						pstmt.executeUpdate();
						msg = "제명 완료되었습니다.";
				}catch(Exception e) {
						e.printStackTrace();
				}finally {
						if (pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
			            if (conn != null)	try { conn.close(); }		catch(SQLException s) {}
				}
			return msg;
		}	// public String MemberDelete(String id) {
		
		// #11) 
		public ArrayList<MemberDTO> Info_member(String id) { 
			ArrayList<MemberDTO> memList = null;
			memList = new ArrayList<MemberDTO>();

			try {
			conn = getConnection();
			String sql = "select * from kook_member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
			MemberDTO mdto = new MemberDTO();
			mdto.setId(rs.getString("id"));
			mdto.setName(rs.getString("name"));
			mdto.setPhNum(rs.getString("phNum"));
			mdto.setEmail(rs.getString("email"));
			memList.add(mdto);
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
			return memList;
		} // public ArrayList<MemberDTO> Info_member(String id) { 
		
		// #12) 현재 등록되어 있는 회원 수 출력 ( 작성자 : 전민기 )
		public int totalMembers() {
			int total = 0;
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement("select count(*) from kook_member");
					rs = pstmt.executeQuery();
					if(rs.next()) {	total = rs.getInt(1);		}					
			}catch(Exception e) {
					e.printStackTrace();
			}finally {
					if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
					if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
					if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
			}	
			return total;
		}	// public int totalMembers() {
		
		// #13) 특정 기간 등록 회원 수 출력 ( 작성자 : 전민기 )
		public int countMembersCal(String day1, String day2) {
				int count = 0;
				try {
						conn = getConnection();
						String sql = "select count(*) from kook_member where reg >= ? and reg < ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, day1);
						pstmt.setString(2, day2);
						rs = pstmt.executeQuery();
						if(rs.next()) {	count = rs.getInt(1);		}							
				}catch(Exception e) {
						e.printStackTrace();
				}finally {
						if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
						if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
						if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
				}
				return count;
		} // public int countMembersCal(String day1, String day2) {
		
		// #14) 탈퇴한 전체 회원 수 출력 ( 작성자 : 전민기)
		public int totalLeaveMembers() {
			int total = 0;
			try {
					conn = getConnection();
					pstmt = conn.prepareStatement("select count(*) from kook_leaveMembers");
					rs = pstmt.executeQuery();
					if(rs.next()) {	total = rs.getInt(1);		}					
			}catch(Exception e) {
					e.printStackTrace();
			}finally {
					if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
					if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
					if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
			}	
			return total;
		}	// public int totalLeaveMembers() {
		
		// #15) 특정 기간 탈퇴한 회원 수 출력 ( 작성자 : 전민기 )
				public int countLeaveMembersCal(String day1, String day2) {
						int count = 0;
						try {
								conn = getConnection();
								String sql = "select count(*) from kook_leavemembers where reg >= ? and reg < ?";
								pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, day1);
								pstmt.setString(2, day2);
								rs = pstmt.executeQuery();
								if(rs.next()) {	count = rs.getInt(1);		}							
						}catch(Exception e) {
								e.printStackTrace();
						}finally {
								if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
								if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
								if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
						}
						return count;
				} // public int countLeaveMembersCal(String day1, String day2) {
				
				// #16) 회원들의 각각 선호 맛 선택한 수 출력 ( 작성자 : 전민기 )
				public int countPreferFlavor(String prefer) {
					int count = 0;
					try {
							conn = getConnection();
							String sql = "select count(*) from kook_member where " + prefer +" = '1' ";
							pstmt = conn.prepareStatement(sql);
							
							rs = pstmt.executeQuery();
							if(rs.next()) {	count = rs.getInt(1);		}

					}catch(Exception e) {
							e.printStackTrace();
					}finally {
							if(rs != null)			try { rs.close(); }			catch(SQLException s) {}
							if(pstmt != null)	try { pstmt.close(); }	catch(SQLException s) {}
							if(conn != null)		try { conn.close(); }		catch(SQLException s) {}
					}
					return count;
			}	// public int countPreferFlavor(String prefer) {
		
				
				
} // public class MemberDAO {
