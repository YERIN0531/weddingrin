package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.weddingrin.dao.MemberDao;
import com.lec.weddingrin.dto.MemberDto;

public class MLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.loginCheck(mid, mpw);
		if(result == MemberDao.LOGIN_SUCCESS) {//로그인 성공
			HttpSession session = request.getSession();
			MemberDto member = mDao.getMember(mid);
			session.setAttribute("member", member);
		}else {//로그인 실패
			request.setAttribute("MloginErrorMsg", "아이디와 비밀번호를 확인하세요");
		}
		
	}

}
