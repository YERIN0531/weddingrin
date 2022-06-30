package com.lec.weddingrin.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.weddingrin.dao.MemberDao;
import com.lec.weddingrin.dto.MemberDto;

public class MJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mid    	 = request.getParameter("mid");
		String mpw 	  	 = request.getParameter("mpw");
		String mname  	 = request.getParameter("mname");
		String mtel   	 = request.getParameter("mtel");
		String memail 	 = request.getParameter("memail");
		String mbirthStr = request.getParameter("mbirth");
		Date   mbirth 	 = null;
		if(!mbirthStr.equals("")) {
			mbirth = Date.valueOf(mbirthStr);
		}
		String maddress  = request.getParameter("maddress");
		
		MemberDao mDao   = MemberDao.getInstance();
		MemberDto member = new MemberDto(mid, mpw, mname, mtel, memail, mbirth, maddress, null);
		int result = mDao.joinMember(member);
		if(result == MemberDao.SUCCESS) { //회원가입 성공 
			HttpSession session = request.getSession();
			session.setAttribute("mid", mid);
			request.setAttribute("memberJoinResult", "회원가입이 완료되었습니다");
		}else {
			request.setAttribute("memberJoinResult", "회원가입 실패 하였습니다 다시 시도해 주세요");
		}
	}

}
