package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.MemberDao;

public class MidConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid"); 
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.mIdConfirm(mid);
		if(result == MemberDao.NONEXISTENT) { //회원가입 가능
			request.setAttribute("idConfirmResult", "사용 가능한 ID 입니다");
		}else {
			request.setAttribute("idConfirmResult", "<b>중복된 ID 입니다</b>");
		}
	}

}
