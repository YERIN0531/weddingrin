package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.MemberDao;

public class EmailConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String memail = request.getParameter("memail");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mEmailConfirm(memail);
		if(result == MemberDao.NONEXISTENT) { //사용가능한 이메일
			request.setAttribute("emailConfirmResult", "사용 가능한 메일입니다");
		}else {
			request.setAttribute("emailConfirmResult", "<b>사용 불가능한 메일입니다</b>");
		}
	}

}
