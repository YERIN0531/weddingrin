package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ZimDao;

public class deleteZimservice implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		int wno = Integer.parseInt(request.getParameter("wno"));
		ZimDao zDao = ZimDao.getInstance();
		int result = zDao.deleteZim(mid, wno);
		if(result == zDao.SUCCESS) {
			request.setAttribute("nozimResult", "찜이 취소되셨습니다");
		}else {
			request.setAttribute("nozimResult", "찜취소가 실패하셨습니다.");
		}
	}

}
