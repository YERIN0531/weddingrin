package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.QnaDao;
import com.lec.weddingrin.dto.QnaDto;

public class QboardModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int qno = Integer.parseInt(request.getParameter("qno"));
		QnaDao qDao = QnaDao.getInstance();
		QnaDto qnaboard = qDao.qnamodifyView_replyView(qno);
		request.setAttribute("qnaboard", qnaboard);
	}

}
