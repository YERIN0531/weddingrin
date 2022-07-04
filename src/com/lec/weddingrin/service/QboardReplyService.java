package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.QnaDao;

public class QboardReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String qid = request.getParameter("qid");
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		String qip = request.getRemoteAddr();
		int qgroup = Integer.parseInt(request.getParameter("qgroup"));
		int qstep = Integer.parseInt(request.getParameter("qstep"));
		int qindent = Integer.parseInt(request.getParameter("qindent"));
		QnaDao qDao = QnaDao.getInstance();
		int result = qDao.replyBoard(qid, qtitle, qcontent, qip, qgroup, qstep, qindent);
		if(result == QnaDao.SUCCESS) {
			request.setAttribute("qnareplyResult", "답글달기성공");
		}else {
			request.setAttribute("qnareplyResult", "답글달기실패");
		}
	}

}
