package com.lec.weddingrin.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.WeddingDao;
import com.lec.weddingrin.dto.WeddingDto;

public class WContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 1. 상세내용 뿌리기 
		int wno = Integer.parseInt(request.getParameter("wno"));
		WeddingDao wDao = WeddingDao.getInstance();
		WeddingDto weddinghall = wDao.getWeddinghall(wno);
		request.setAttribute("weddinghall", weddinghall);
	}

}
