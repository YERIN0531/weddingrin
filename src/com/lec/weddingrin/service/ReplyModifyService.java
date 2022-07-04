package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ReplyDao;
import com.lec.weddingrin.dto.ReplyDto;

public class ReplyModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int wreno = Integer.parseInt(request.getParameter("wreno"));
		String wmemo = request.getParameter("wmemo");
		int wno = Integer.parseInt(request.getParameter("wno"));
		ReplyDao dao = ReplyDao.getInstance();
		ReplyDto dto = new ReplyDto(wreno, wmemo, null, wno, null);
		request.setAttribute("replyModifyResult", dao.replyModify(dto));
//		ReplyDto dto = dao.replyModify(dto);
	}

}
