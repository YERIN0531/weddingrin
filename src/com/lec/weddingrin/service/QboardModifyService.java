package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.QnaDao;

public class QboardModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int qno = Integer.parseInt(request.getParameter("qno"));
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		String qip = request.getRemoteAddr();
		QnaDao qDao = QnaDao.getInstance();
		int result = qDao.modifyQna(qno, qtitle, qcontent, qip);
		
		if(result == QnaDao.SUCCESS) {
			request.setAttribute("QmodifyResult", "글 수정 성공");
		}else {
			request.setAttribute("QmodifyResult", "글 수정 실패");
		}
	}

}
