package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.weddingrin.dao.MemberDao;
import com.lec.weddingrin.dto.MemberDto;

public class MemberModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		String maddress = request.getParameter("maddress");
		MemberDao mDao = MemberDao.getInstance();
		MemberDto member = new MemberDto(mid, mpw, mname, null, memail, null, maddress, null);
		int result = mDao.modifyMember(member);
		if(result == MemberDao.SUCCESS) {
			request.setAttribute("modifyResult", "회원정보 수정 성공");
		}else {
			request.setAttribute("modifyResult", "회원정보 수정 실패");
		}
		
	}

}
