package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.weddingrin.dao.AdminDao;
import com.lec.weddingrin.dto.AdminDto;

public class ALoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aid = request.getParameter("aid");
		String apw = request.getParameter("apw");
		String acode = request.getParameter("acode");
		AdminDao aDao = AdminDao.getInstance();
		if(acode.equals("a")) {
			int result = aDao.AdminLogin(aid, apw);
			if(result == AdminDao.LOGIN_SUCCESS) {//로그인 성공
				HttpSession session = request.getSession();
				AdminDto admin = aDao.getAdmin(aid);
				session.setAttribute("admin", admin);
			}else {//로그인 실패
				request.setAttribute("aloginErrorMsg", "비밀번호를 확인하세요");
			}	
		}else {
			request.setAttribute("adminCodeError", "관리자코드를 올바르게 입력하세요");
		}
		
		
	}

}
