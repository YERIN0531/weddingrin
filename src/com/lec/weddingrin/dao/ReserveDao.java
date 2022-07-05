package com.lec.weddingrin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.weddingrin.dto.ReserveDto;

public class ReserveDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	
	private static ReserveDao instance = new ReserveDao();
	public static ReserveDao getInstance() {
		return instance;
	}
	
	private ReserveDao() {}
	
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
	
//	 1. 예약하기 INSERT 해서 RESERVATEION TABLE에 넣기 
	public int insertReserve(String mid, int wno, Timestamp wdate) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO WEDDING_RS(RSNO, MID, WNO, WDATE)" + 
				"VALUES(RS_SEQ.NEXTVAL, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, wno);
			pstmt.setTimestamp(3, wdate);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "예약성공":"예약실패");
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
	
//	 2. 예약한 LIST 뽑기 (사람 이름, 예약 날짜, 예약 시간 ) 
	public ArrayList<ReserveDto> reserveList(String mid){
		ArrayList<ReserveDto> reserve = new ArrayList<ReserveDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM WEDDING_RS WHERE MID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int rsno = rs.getInt("rsno");
				 int wno = rs.getInt("wno");
				 Timestamp wdate = rs.getTimestamp("wdate");
				reserve.add(new ReserveDto(rsno, mid, wno, wdate));
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
		return reserve;
	}
	
//	 3. 예약 취소하기 
	public int deleteReply(int rsno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM WEDDING_RS WHERE RSNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rsno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "예약취소성공":"예약취소실패");
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
