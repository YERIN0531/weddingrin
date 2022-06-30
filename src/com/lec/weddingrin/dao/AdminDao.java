package com.lec.weddingrin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.weddingrin.dto.AdminDto;

public class AdminDao {
	public static final int LOGIN_FAIL    =0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	
	private static AdminDao instance = new AdminDao();
	public static AdminDao getInstance() {
		return instance;
	}
	
	private AdminDao() {}
	
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
	
	// 1. 관리자 등록하기
	public int insertAdmin(AdminDto admin) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ADMIN (AID, APW, ACODE) VALUES (?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin.getAid());
			pstmt.setString(2, admin.getApw());
			pstmt.setString(3, admin.getAcode());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
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
	// 2. 로그인(aid,apw) 하기 
	public int AdminLogin(String aid, String apw) {
		int result = LOGIN_FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM ADMIN WHERE AID=? AND APW=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aid);
			pstmt.setString(2, apw);
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
	
	
	// 3. 로그인 후 세션에 넣을 용도 admin id 로 dto 가지고 오기 
	public AdminDto getAdmin(String aid) {
		AdminDto admins = null;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM ADMIN WHERE AID =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String apw = rs.getString("apw");
				String acode = rs.getString("acode");
				admins = new AdminDto(aid, apw, acode);
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
		return admins;
	}
	
	
	
	
}


















