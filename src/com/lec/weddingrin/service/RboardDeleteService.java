package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ReviewDao;

public class RboardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		ReviewDao reviewDao = ReviewDao.getInstance();
		int result = reviewDao.deleteReview(rno);
		if(result == ReviewDao.SUCCESS) {
			request.setAttribute("boardResult", "글 삭제 성공");
		}else {
			request.setAttribute("boardResult", "글 삭제 실패");
		}
	}

}
