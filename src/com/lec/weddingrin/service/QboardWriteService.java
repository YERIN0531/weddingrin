package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.QnaDao;

public class QboardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String qid = request.getParameter("qid");
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		String qip = request.getRemoteAddr();
		QnaDao qDao = QnaDao.getInstance();
		int result = qDao.writeQna(qid, qtitle, qcontent, qip);
		if(result == QnaDao.SUCCESS) {
			request.setAttribute("QnaWriteResult", "문의사항 작성 성공");
		}else {
			request.setAttribute("QnaWriteResult", "문의사항 작성 실패");
		}
	}

}
