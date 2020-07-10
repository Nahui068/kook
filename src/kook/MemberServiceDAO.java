package kook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;


public class MemberServiceDAO {
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
	
	public void memberServiceInsert(MemberServiceDTO dto) {
			
			int num=dto.getNum();
			int ref=dto.getRef();
			int re_step=dto.getRe_step();
			int re_level=dto.getRe_level();
			int number=0;
			String sql="";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement("select max(num) from kook_memberService");
			rs = pstmt.executeQuery();
			if (rs.next()) 
				number=rs.getInt(1)+1;	
			else
				number=1; 
			if (num!=0) 
			{ 
				sql="update kook_memberService set re_step=re_step+1 where ref= ? and re_step> ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step=re_step+1;
				re_level=re_level+1;
			}else{ 
				ref=number;
				re_step=0;
				re_level=0;
			}
			sql = "insert into kook_memberService values(memberService_seq.nextval,?,?,?,?,sysdate,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
		}
	}

	public List getWritings(int start, int end){
		List writingList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select*from(select num, title, id, email, content,reg_date,ref,re_step,re_level, rownum r from"
					+ "(select*from kook_memberService order by ref desc, re_step asc)) where r >= ? and r <= ? ");
			pstmt.setInt(1, start); 
			pstmt.setInt(2, end); 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				writingList = new ArrayList(end);
				do {
					MemberServiceDTO dto = new MemberServiceDTO();
					dto.setNum(rs.getInt("num"));
					dto.setTitle(rs.getString("title"));
					dto.setId(rs.getString("id"));
					dto.setEmail(rs.getString("email"));
					dto.setContent(rs.getString("content"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_level(rs.getInt("re_level"));
					
					writingList.add(dto);
				}while(rs.next());	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return writingList;
	}

	public List getWritings(int start, int end, String id){
		List writingList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select*from(select num, title, id, email, content,reg_date,ref,re_step,re_level, rownum r from"
					+ "(select*from kook_memberService  where ref in (select ref from kook_memberService where id=?) order by ref desc, re_step asc) order by ref desc, re_step asc) where r >= ? and r <= ? ");
			pstmt.setString(1, id);
			pstmt.setInt(2, start); 
			pstmt.setInt(3, end); 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				writingList = new ArrayList(end);
				do {
					MemberServiceDTO dto = new MemberServiceDTO();
					dto.setNum(rs.getInt("num"));
					dto.setTitle(rs.getString("title"));
					dto.setId(rs.getString("id"));
					dto.setEmail(rs.getString("email"));
					dto.setContent(rs.getString("content"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
					dto.setRef(rs.getInt("ref"));
					dto.setRe_step(rs.getInt("re_step"));
					dto.setRe_level(rs.getInt("re_level"));
					writingList.add(dto);
				}while(rs.next());	
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null)try {pstmt.close();}catch(SQLException s) {}
			if(conn!=null)try {conn.close();}catch(SQLException s) {}
			if(rs!=null)try {rs.close();}catch(SQLException s) {}
		}
		return writingList;
	}

	public MemberServiceDTO getWriting(int num)  {						
		MemberServiceDTO writing=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from kook_memberService where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				writing = new MemberServiceDTO();
				writing.setNum(rs.getInt("num"));
				writing.setTitle(rs.getString("title"));
				writing.setId(rs.getString("id"));
				writing.setEmail(rs.getString("email"));
				writing.setContent(rs.getString("content"));
				writing.setReg_date(rs.getTimestamp("reg_date"));
				writing.setRef(rs.getInt("ref"));
				writing.setRe_step(rs.getInt("re_step"));
				writing.setRe_level(rs.getInt("re_level"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return writing;
	}
	
	
	public String delete(MemberServiceDTO dto) {
		String msg = "글 번호를 확인하세요";
		try {
			conn = getConnection();
			String sql = "select*from kook_memberService where num=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sql = "delete from kook_memberService where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getNum());
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
	
	public int getWritingCount(){
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from kook_memberService");
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
	
	public int getWritingCount(String id){
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from kook_memberService where id=?");
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
	
	// 답글 없는 문의글 수 출력	( 작성자 : 전민기 )
	public int noRefQuestionCount() {
			int count = 0;
			try {
					conn = getConnection();
					String sql = "select count(*) from kook_memberService "
							+ "where ref not in (select ref from kook_memberService where re_step = 1)";
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
	} // public int noRefQuestionCount() {
	
	// 전체 문의글 수 (질문 글) 출력 ( 작성자 : 전민기 )
	public int totalQuestionCount() {
			int count = 0;
			try {
					conn = getConnection();
					String sql = "select count(distinct ref) from kook_memberService";
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
	} // public int totalQuestionCount() {
	
	// 특정 기간 문의(질문) 글 출력 ( 작성자 : 전민기 )
	public int countQuestionCal(String day1, String day2) {
			int count = 0;
			try {
					conn = getConnection();
					String sql = "select count(distinct ref) from kook_memberService "
							+ "where reg_date >= ? and reg_date < ?";
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
	}
	
	
	public int deleteCheck(String id, String pw) {
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
									x= 1; 
							}else {
									x= 0; 
							}	
					}else {
							x= -1;	
					}	
			} catch(Exception e) {
					e.printStackTrace();
			} finally {
					if (rs != null) try { rs.close(); } catch(SQLException s) {}
					if (pstmt != null) try { pstmt.close(); } catch(SQLException s) {}
					if (conn != null) try { conn.close(); } catch(SQLException s) {}
			}
			return x;
	}
	
}
