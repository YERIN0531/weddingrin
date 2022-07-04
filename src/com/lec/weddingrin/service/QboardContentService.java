package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.QnaDao;
import com.lec.weddingrin.dto.QnaDto;

public class QboardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int qno = Integer.parseInt(request.getParameter("qno"));
		QnaDao qDao = QnaDao.getInstance();
		QnaDto qnaboard = qDao.qnaContent(qno);
		request.setAttribute("qnacontent", qnaboard);
		//qnaboard 안에는 qno를 통해 가지고 온 qna 의 모든 정보가 들어있음
	}

}
