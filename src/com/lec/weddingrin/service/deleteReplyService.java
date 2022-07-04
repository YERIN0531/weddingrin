package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ReplyDao;

public class deleteReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int wreno = Integer.parseInt(request.getParameter("wreno"));
		ReplyDao reDao = ReplyDao.getInstance();
		int result = reDao.deleteReply(wreno);
		if(result == ReplyDao.SUCCESS) {
			request.setAttribute("deleteReplyResult", "댓글삭제성공");
		}else {
			request.setAttribute("deleteReplyResult", "댓글삭제실패");
		}
	}

}
