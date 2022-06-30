package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.MemberDao;
import com.lec.weddingrin.dto.MemberDto;

public class MListContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String mid = request.getParameter("mid");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto mDto = mDao.getMember(mid); 
		
		request.setAttribute("mDto", mDto);
	}

}
