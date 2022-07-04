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

import com.lec.weddingrin.dto.QnaDto;

public class QnaDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	
	private static QnaDao instance = new QnaDao();
	public static QnaDao getInstance() {
		return instance;
	}
	
	private QnaDao() {}
	
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
	
	// 1. 글 목록
	public ArrayList<QnaDto> qnaList(int startRow, int endRow){
		ArrayList<QnaDto> qna = new ArrayList<QnaDto>();
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM" + 
				"    (SELECT ROWNUM RN, A.* FROM" + 
				"    (SELECT * FROM QNABOARD" + 
				"                ORDER BY QGROUP DESC, QSTEP) A)" + 
				"    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 int qno = rs.getInt("qno");
				 String qid = rs.getString("qid");
				 String qtitle= rs.getString("qtitle");
				 String qcontent = rs.getString("qcontent");
				 int qhit = rs.getInt("qhit");
				 Date qdate = rs.getDate("qdate");
				 int qgroup = rs.getInt("qgroup");
				 int qstep = rs.getInt("qstep");
				 int qindent = rs.getInt("qindent");
				 String qip = rs.getString("qip");
				qna.add(new QnaDto(qno, qid, qtitle, qcontent, qhit, qdate, qgroup, qstep, qindent, qip));
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
		return qna;
	}
	// 2. 글 개수
	public int qnaTotCnt() {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) QCNT FROM QNABOARD";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("qcnt");
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
	
	// 3. 글 쓰기(원글)
	public int writeQna(String qid, String qtitle, String qcontent, String qip) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO QNABOARD (QNO, QID, QTITLE, QCONTENT,  QGROUP, QSTEP, QINDENT, QIP)" + 
				"    VALUES (QNA_SEQ.NEXTVAL, ?,?,?, QNA_SEQ.CURRVAL, 0, 0, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qid);
			pstmt.setString(2, qtitle);
			pstmt.setString(3, qcontent);
			pstmt.setString(4, qip);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "문의글쓰기성공":"문의글쓰기실패");
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
	
	// 4. FHIT 하나 올리기
	private void qnaHitUp(int qno) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE QNABOARD SET QHIT = QHIT +1 WHERE QNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
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
	// 5. 게시판 프라이머키로 DTO 가지고 오기 
//	 5-1. 게시판 프라이머키로 DTO 가지고 오기 ( 조회수 up)
	public QnaDto qnaContent(int qno) {
		qnaHitUp(qno);
		QnaDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM QNABOARD WHERE QNO=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String qid = rs.getString("qid");
				 String qtitle= rs.getString("qtitle");
				 String qcontent = rs.getString("qcontent");
				 int qhit = rs.getInt("qhit");
				 Date qdate = rs.getDate("qdate");
				 int qgroup = rs.getInt("qgroup");
				 int qstep = rs.getInt("qstep");
				 int qindent = rs.getInt("qindent");
				 String qip = rs.getString("qip");
				dto = new QnaDto(qno, qid, qtitle, qcontent, qhit, qdate, qgroup, qstep, qindent, qip);
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
	public QnaDto qnamodifyView_replyView(int qno) {
		QnaDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM QNABOARD WHERE QNO=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String qid = rs.getString("qid");
				 String qtitle= rs.getString("qtitle");
				 String qcontent = rs.getString("qcontent");
				 int qhit = rs.getInt("qhit");
				 Date qdate = rs.getDate("qdate");
				 int qgroup = rs.getInt("qgroup");
				 int qstep = rs.getInt("qstep");
				 int qindent = rs.getInt("qindent");
				 String qip = rs.getString("qip");
				dto = new QnaDto(qno, qid, qtitle, qcontent, qhit, qdate, qgroup, qstep, qindent, qip);
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
	
	// 6. 글 수정하기 
	public int modifyQna(int qno, String qtitle, String qcontent, String qip) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE QNABOARD SET QTITLE=?," + 
				"                    QCONTENT=?," + 
				"                    QIP =?" + 
				"                    WHERE QNO = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qtitle);
			pstmt.setString(2, qcontent);
			pstmt.setString(3, qip);
			pstmt.setInt(4, qno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "문의글수정성공":"문의글수정실패");
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
	
	// 7. 글 삭제하기 
	public int deleteQna(int qno) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM QNABOARD WHERE QNO=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qno);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "문의글삭제성공":"문의글삭제실패");
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
	// 8. 답변글 추가전 STEP a 수행
	private void preReplyStepA(int qgroup, int qstep) {
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE QNABOARD SET QSTEP = QSTEP+1 WHERE QGROUP =? AND QSTEP>?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qgroup);
			pstmt.setInt(2, qstep);
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
	// 9. 답변글 쓰기 
	public int replyBoard(String qid, String qtitle, String qcontent,
			 String qip, int qgroup, int qstep, int qindent) {
		preReplyStepA(qgroup, qstep);
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO QNABOARD (QNO, QID, QTITLE, QCONTENT,  QGROUP, QSTEP, QINDENT, QIP)" + 
				"    VALUES (QNA_SEQ.NEXTVAL, ?,?,?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qid);
			pstmt.setString(2, qtitle);
			pstmt.setString(3, qcontent);
			pstmt.setInt(4, qgroup);
			pstmt.setInt(5, qstep+1);
			pstmt.setInt(6, qindent+1);
			pstmt.setString(7, qip);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "답변쓰기성공":"답변쓰기실패");
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
	// 10. 회원탈퇴 하려는 사람이 쓴 글 모두 삭제
	public void withdrawalDeleteQna(String qid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM QNABOARD WHERE QID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qid);
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










