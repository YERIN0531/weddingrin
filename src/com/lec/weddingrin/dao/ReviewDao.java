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

import com.lec.weddingrin.dto.ReviewDto;

public class ReviewDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	
	private static ReviewDao instance = new ReviewDao();
	public static ReviewDao getInstance() {
		return instance;
	}
	
	private ReviewDao() {}
	
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
	
//	 1. 글 목록 
	public ArrayList<ReviewDto> reviewList(int startRow, int endRow){
		ArrayList<ReviewDto> review = new ArrayList<ReviewDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM" + 
				"    (SELECT ROWNUM RN, A.* FROM" + 
				"    (SELECT R.*, MNAME FROM REVIEWBOARD R, MEMBER M WHERE R.MID=M.MID" + 
				"                ORDER BY RDATE DESC) A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int rno = rs.getInt("rno");
				 String mid = rs.getString("mid");
				 String rtitle = rs.getString("rtitle");
				 String rcontent = rs.getString("rcontent");
				 String rfilename = rs.getString("rfilename");
				 int rhit = rs.getInt("rhit");
				 Date rdate = rs.getDate("rdate");
				 String rip = rs.getString("rip");
				review.add(new ReviewDto(rno, mid, rtitle, rcontent, rfilename, rhit, rdate, rip));
			}
			
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return review;
	}
	
	
//	 2. 글 갯수
	public int reviewTotCnt() {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) RCNT FROM REVIEWBOARD";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("rcnt");
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
	
//	 3. 글쓰기 
	public int writeReview(String mid, String rtitle, String rcontent, String rfilename,
			String rip) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO REVIEWBOARD (RNO, MID, RTITLE, RCONTENT, RFILENAME, RIP)" + 
				"    VALUES (REVIEW_SEQ.NEXTVAL, ?,?,?,?," + 
				"         ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, rtitle);
			pstmt.setString(3, rcontent);
			pstmt.setString(4, rfilename);
			pstmt.setString(5, rip);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "리뷰쓰기성공":"리뷰쓰기실패");
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
	
//	 4. HIT 올리기
	private void reviewHitUp(int rno) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REVIEWBOARD SET RHIT = RHIT+1 WHERE RNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
	}
//	 5-1. 게시판 프라이머키로 DTO 가지고 오기 ( 조회수 up)
	public ReviewDto reviewContent(int rno) {
		reviewHitUp(rno);
		ReviewDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM REVIEWBOARD WHERE RNO=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 String mid = rs.getString("mid");
				 String rtitle = rs.getString("rtitle");
				 String rcontent = rs.getString("rcontent");
				 String rfilename = rs.getString("rfilename");
				 int rhit = rs.getInt("rhit");
				 Date rdate = rs.getDate("rdate");
				 String rip = rs.getString("rip");
				dto = new ReviewDto(rno, mid, rtitle, rcontent, rfilename, rhit, rdate, rip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dto;
	}
	
//	 5-2. 게시판 프라이머키로 DTO 가지고 오기 (수정할땐X)
	public ReviewDto reviewModifyView(int rno) {
		ReviewDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM REVIEWBOARD WHERE RNO=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 String mid = rs.getString("mid");
				 String rtitle = rs.getString("rtitle");
				 String rcontent = rs.getString("rcontent");
				 String rfilename = rs.getString("rfilename");
				 int rhit = rs.getInt("rhit");
				 Date rdate = rs.getDate("rdate");
				 String rip = rs.getString("rip");
				dto = new ReviewDto(rno, mid, rtitle, rcontent, rfilename, rhit, rdate, rip);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dto;
	}
//	 6. 글 수정하기 
	public int modifyReview(int rno, String rtitle, String rcontent, String rfilename, 
			String rip) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE REVIEWBOARD SET RTITLE = ?," + 
				"                    RCONTENT = ?," + 
				"                    RFILENAME = ?," + 
				"                    RIP = ?," + 
				"                    RDATE = SYSDATE" + 
				"            WHERE RNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rtitle);
			pstmt.setString(2, rcontent);
			pstmt.setString(3, rfilename);
			pstmt.setString(4, rip);
			pstmt.setInt(5, rno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "리뷰수정성공":"리뷰수정실패");
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
	
//	 7. 글 삭제하기 
	public int deleteReview(int rno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE REVIEWBOARD WHERE RNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "리뷰삭제성공":"리뷰삭제실패");
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
	
//	 8. 회원탈퇴하려는 사람이 쓴 글 모두 삭제
	public void withdrawalDeleteReview(String mid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM REVIEWBOARD WHERE MID =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
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
	}
}





























