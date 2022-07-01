package com.lec.weddingrin.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ZimDao;
import com.lec.weddingrin.dto.ZimDto;

public class insertZimservice implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		int wno = Integer.parseInt(request.getParameter("wno"));
		ZimDao zDao = ZimDao.getInstance();
		int result = zDao.insertZim(mid, wno);
		if(result == zDao.SUCCESS) {
			request.setAttribute("zimResult", "찜하셨습니다");
		}else {
			request.setAttribute("zimResult", "찜을 실패하셨습니다");
		}
	}

}
