package com.lec.weddingrin.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.weddingrin.dto.MemberDto;

public class MemberDao {
	public static final int EXISTENT    = 0;
	public static final int NONEXISTENT = 1;
	public static final int LOGIN_FAIL    =0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			System.out.println("getcon"+1);
			conn = ds.getConnection();
			System.out.println("getcon"+2);
		} catch (NamingException e) {
			System.out.println(e.getMessage() + "getCon");
		}
		return conn;
	}
	// 1. 아이디 중복체크
	public int mIdConfirm(String mid) {
		int result = EXISTENT;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE MID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = EXISTENT;
			}else {
				result = NONEXISTENT;
			}
			System.out.println(5);
		} catch (Exception e) {
			System.out.println(e.getMessage() + "confirm");
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	// 2. 회원가입하기 
	public int joinMember(MemberDto member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER(MID, MPW, MNAME, MTEL, MEMAIL, MBIRTH, MADDRESS)VALUES(" + 
				"                    ?, ?, ?, ?, ?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMid());
			pstmt.setString(2, member.getMpw());
			pstmt.setString(3, member.getMname());
			pstmt.setString(4, member.getMtel());
			pstmt.setString(5, member.getMemail());
			pstmt.setDate(6, member.getMbirth());
			pstmt.setString(7, member.getMaddress());			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 3. 로그인(MID/MPW)
	public int loginCheck(String mid, String mpw) {
		int result = LOGIN_FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE MID=? AND MPW=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = LOGIN_SUCCESS;
			}else {
				result = LOGIN_FAIL;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 4. MID로 DTO 불러오기 (GETMEMBER)
	public MemberDto getMember(String mid) {
		MemberDto member = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM MEMBER WHERE MID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 String mpw = rs.getString("mpw");
				 String mname= rs.getString("mname");
				 String mtel = rs.getString("mtel");
				 String memail = rs.getString("memail");
				 Date   mbirth = rs.getDate("mbirth");
				 String maddress = rs.getString("maddress");
				 Date   mrdate = rs.getDate("mrdate");
				member = new MemberDto(mid, mpw, mname, mtel, memail, mbirth, maddress, mrdate);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return member;
	}
	// 5. 회원정보수정 
	public int modifyMember(MemberDto member) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "MPW = ?," + 
				"                    MNAME = ?," + 
				"                    MEMAIL = ?," + 
				"                    MADDRESS = ?" + 
				"        WHERE MID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMpw());
			pstmt.setString(2, member.getMname());
			pstmt.setString(3, member.getMaddress());
			pstmt.setString(4, member.getMid());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	
	// 6. 회원리스트
	public ArrayList<MemberDto> allMember(int startRow, int endRow){
		ArrayList<MemberDto> members = new ArrayList<MemberDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, A.* FROM" + 
				"                        (SELECT * FROM MEMBER ORDER BY MRDATE DESC) A)" + 
				"        WHERE RN BETWEEN ? AND?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 String mid = rs.getString("mid");
				 String mpw = rs.getString("mpw");
				 String mname = rs.getString("mname");
				 String mtel = rs.getString("mtel");
				 String memail = rs.getString("memail");
				 Date   mbirth = rs.getDate("mbirth");
				 String maddress = rs.getString("maddress");
				 Date   mrdate = rs.getDate("mrdate");
				members.add(new MemberDto(mid, mpw, mname, mtel, memail, mbirth, maddress, mrdate));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return members;
	}
	// 7. 총 가입된 회원 수
	public int getMemberTotCnt() {
		int totCnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) CNT FROM MEMBER";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totCnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return totCnt;
	}
	
	
	// 8. 회원정보삭제 
	public int withdrawal(String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MEMBER WHERE MID =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 9. 이메일 중복체크
		public int mEmailConfirm(String memail) {
			int result = EXISTENT;
			Connection        conn  = null;
			PreparedStatement pstmt = null;
			ResultSet         rs    = null;
			String sql = "SELECT * FROM MEMBER WHERE MEMAIL=?";
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memail);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = EXISTENT;
				}else {
					result = NONEXISTENT;
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(rs    != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn  != null) conn.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
			return result;
		}
		
	
	
	
	
}
