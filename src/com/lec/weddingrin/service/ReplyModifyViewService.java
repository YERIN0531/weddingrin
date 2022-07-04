package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ReplyDao;
import com.lec.weddingrin.dto.ReplyDto;

public class ReplyModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int wreno = Integer.parseInt(request.getParameter("wreno"));
		ReplyDao dao = ReplyDao.getInstance();
		ReplyDto dto = dao.getDto(wreno);
		request.setAttribute("dto", dto);
	}

}
