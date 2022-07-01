package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ZimDao;

public class CountZimService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		int wno = Integer.parseInt(request.getParameter("wno"));
		ZimDao zDao = ZimDao.getInstance();
		int result = zDao.zimCheck(mid, wno);
		request.setAttribute("ZimCount", result);
		
		
	}

}
