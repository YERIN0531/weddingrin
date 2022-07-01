package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ReplyDao;

public class WeddingReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String wmemo = request.getParameter("wmemo");
		String mid = request.getParameter("mid");
		int wno = Integer.parseInt(request.getParameter("wno"));
		ReplyDao replyDao = ReplyDao.getInstance();
		int result = replyDao.writeReply(wmemo, mid, wno);
		if(result==ReplyDao.SUCCESS) {
			request.setAttribute("replyResult", "댓글쓰기가 완료되었습니다");
		}else {
			request.setAttribute("replyResult", "댓글쓰기 실패");
		}
	}

}
