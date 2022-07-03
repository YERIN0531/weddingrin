package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ReviewDao;
import com.lec.weddingrin.dto.ReviewDto;

public class RboardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int rno = Integer.parseInt(request.getParameter("rno"));
		ReviewDao reviewDao = ReviewDao.getInstance();
		ReviewDto reviewboard = reviewDao.reviewContent(rno);
		request.setAttribute("reviewboard", reviewboard);
	}

}
