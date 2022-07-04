package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.QnaDao;

public class QboardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int qno = Integer.parseInt(request.getParameter("qno"));
		QnaDao qDao = QnaDao.getInstance();
		int result = qDao.deleteQna(qno);
		if(result == QnaDao.SUCCESS) {
			request.setAttribute("qnadeleteResult", "글삭제성공");
		}else {
			request.setAttribute("qnadeleteResult", "글삭제실패");
		}
	}

}
