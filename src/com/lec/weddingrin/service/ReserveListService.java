package com.lec.weddingrin.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ReserveDao;
import com.lec.weddingrin.dao.ZimDao;
import com.lec.weddingrin.dto.ReserveDto;
import com.lec.weddingrin.dto.ZimDto;

public class ReserveListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		ReserveDao reDao = ReserveDao.getInstance();
		ArrayList<ReserveDto> reserve = reDao.reserveList(mid);
		request.setAttribute("reserve", reserve);
		
		ZimDao zDao = ZimDao.getInstance();
		ArrayList<ZimDto> zimlist = zDao.myZim(mid);
		request.setAttribute("zimlist", zimlist);
	}

}
