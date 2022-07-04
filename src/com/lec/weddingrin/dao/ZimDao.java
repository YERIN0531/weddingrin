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

import com.lec.weddingrin.dto.ZimDto;

public class ZimDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	public static final int ZIM_CHECK =1;
	public static final int ZIM_UNCHECK =0;
	
	private static ZimDao instance = new ZimDao();
	public static ZimDao getInstance() {
		return instance;
	}
	
	private ZimDao() {}
	
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
	
//	 찜 하기 누르면 정보가 테이블로 들어옴
	public int insertZim(String mid, int wno) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ZIM(ZNO, MID, WNO) VALUES (ZIM_SEQ.NEXTVAL,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, wno);
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
//	 찜 눌렀는지 안눌렀는지 여부 
	public int zimCheck(String mid, int wno) {
		int result = ZIM_UNCHECK;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM ZIM WHERE MID=? AND WNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, wno);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
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
	
//	 찜 취소
	public int deleteZim(String mid, int wno) {
		int result = ZIM_UNCHECK;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM ZIM WHERE MID=? AND WNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, wno);
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
	
	
//	 내가 찜한 리스트 
	public ArrayList<ZimDto> myZim(String mid){
		ArrayList<ZimDto> zims = new ArrayList<ZimDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT WNO, WNAME, WADDRESS, WLOC FROM WEDDINGHALL WHERE WNO IN(SELECT WNO FROM ZIM WHERE MID=?) ORDER BY WNO DESC";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int wno = rs.getInt("wno");
				String wname = rs.getString("wname");
				String waddress = rs.getString("waddress");
				String wloc = rs.getString("wloc");
				zims.add(new ZimDto(0, mid, wno, null, wname, waddress, wloc));
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
		return zims;
	}
	
	
	
	
}
