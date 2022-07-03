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

import com.lec.weddingrin.dto.ReplyDto;

public class ReplyDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	
	private static ReplyDao instance = new ReplyDao();
	public static ReplyDao getInstance() {
		return instance;
	}
	
	private ReplyDao() {}
	
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	
//	 1. 댓글쓰기
	public int writeReply(String wmemo, String mid , int wno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO WEDDINGREPLY (WRENO, WMEMO, MID, WNO)" + 
				"VALUES (REPLY_SEQ.NEXTVAL, ?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wmemo);
			pstmt.setString(2, mid);
			pstmt.setInt(3, wno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "댓글쓰기성공":"댓글쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	
//	 2. 댓글 목록 출력하기 -- 페이징 처리(STARTROW, ENDROW)   // rownum 해주기
	public ArrayList<ReplyDto> listReply(int wno, int startRow, int endRow){
		ArrayList<ReplyDto> reply = new ArrayList<ReplyDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM" + 
				"    (SELECT ROWNUM RN, A.* FROM" + 
				"    (SELECT * FROM WEDDINGREPLY WHERE WNO=?" + 
				"                ORDER BY WRENO DESC) A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs    = pstmt.executeQuery();
			while(rs.next()) {
				 int wreno = rs.getInt("wreno");
				 String wmemo = rs.getString("wmemo");
				 String mid = rs.getString("mid");
				 Date wredate = rs.getDate("wredate") ;
				reply.add(new ReplyDto(wreno, wmemo, mid, wno, wredate));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null)  rs.close();
				if(pstmt!=null)  pstmt.close();
				if(conn !=null)  conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return reply;
	}
	
	
//	 3. 댓글 갯수 
	public int replyTotCnt(int wno) {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) REPLYCNT FROM WEDDINGREPLY WHERE WNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wno);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("replycnt");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return cnt;
	}
	
	//4. 댓글 삭제하기 
	public int deleteReply(int wreno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM WEDDINGREPLY WHERE WRENO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wreno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "댓글삭제성공":"댓글삭제실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	
}
