package com.lec.weddingrin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.weddingrin.dto.WeddingDto;

public class WeddingDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	
	private static WeddingDao instance = new WeddingDao();
	public static WeddingDao getInstance() {
		return instance;
	}
	
	private WeddingDao() {}
	
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
	
//	 1. 등록된 웨딩홀 목록(전체 LIST) -- 신규 업로드 순으로 출력
	public ArrayList<WeddingDto> weddingAllList(int startRow, int endRow){
		ArrayList<WeddingDto> weddinghall = new ArrayList<WeddingDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM" + 
				"    (SELECT ROWNUM RN, A.* FROM" + 
				"    (SELECT WNO, WNAME ||'('||(SELECT COUNT(*) FROM WEDDINGREPLY WHERE WNO=W.WNO GROUP BY WNO)||')' WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC FROM WEDDINGHALL w ORDER BY WNO) A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs    = pstmt.executeQuery();
			while(rs.next()) {
				 int wno = rs.getInt("wno");
				 String wname = rs.getString("wname");
				 String waddress = rs.getString("waddress");
				 String wcontent = rs.getString("wcontent");
				 int wprice = rs.getInt("wprice");
				 String wimage = rs.getString("wimage");
				 String wloc = rs.getString("wloc");
				weddinghall.add(new WeddingDto(wno, wname, waddress, wcontent, wprice, wimage, wloc));
			}
			System.out.println(weddinghall.size());
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null)  rs.close();
				if(pstmt!=null)  pstmt.close();
				if(conn !=null)  conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return weddinghall;
	}
//
//	 2. 등록된 웨딩홀 목록 (WLOC ) 별로 선택 
	public ArrayList<WeddingDto> weddingLocList(String wloc , int startRow, int endRow){
		ArrayList<WeddingDto> weddinghall = new ArrayList<WeddingDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM" + 
				"    (SELECT ROWNUM RN, A.* FROM" + 
				"    (SELECT WNO, WNAME||'('||(SELECT COUNT(*) FROM WEDDINGREPLY WHERE WNO=W.WNO GROUP BY WNO)||')' WNAME, WADDRESS, WCONTENT, WPRICE, WIMAGE, WLOC  FROM WEDDINGHALL W WHERE WLOC=? ORDER BY WNO) A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wloc);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs    = pstmt.executeQuery();
			while(rs.next()) {
				 int wno = rs.getInt("wno");
				 String wname = rs.getString("wname");
				 String waddress = rs.getString("waddress");
				 String wcontent = rs.getString("wcontent");
				 int wprice = rs.getInt("wprice");
				 String wimage = rs.getString("wimage");
				weddinghall.add(new WeddingDto(wno, wname, waddress, wcontent, wprice, wimage, wloc));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null)  rs.close();
				if(pstmt!=null)  pstmt.close();
				if(conn !=null)  conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
		return weddinghall;
	}
	
//	 3. 등록된 웨딩홀 수 
	public int weddingTotCnt() {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) WCNT FROM WEDDINGHALL";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("wcnt");
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
// 3.-2 지역별 웨딩홀 수 
	public int localweddingTotCnt(String wloc) {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) WCNT FROM WEDDINGHALL WHERE WLOC=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, wloc);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("wcnt");
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
	
	
	
	
//	 4. 웨딩홀 상세보기 
	public WeddingDto getWeddinghall(int wno) {
		WeddingDto wedding = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM WEDDINGHALL WHERE WNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 String wname = rs.getString("wname");
				 String waddress = rs.getString("waddress");
				 String wcontent = rs.getString("wcontent");
				 int wprice = rs.getInt("wprice");
				 String wimage = rs.getString("wimage");
				 String wloc = rs.getString("wloc");
				wedding = new WeddingDto(wno, wname, waddress, wcontent, wprice, wimage, wloc);
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
		return wedding;
	}
}















