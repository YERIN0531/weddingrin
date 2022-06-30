package com.lec.weddingrin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.AdminDao;
import com.lec.weddingrin.dto.AdminDto;

public class AJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aid = request.getParameter("aid");
		String apw = request.getParameter("apw");
		String acode = request.getParameter("acode");
		if(acode.equals("a")) {
			AdminDao aDao = AdminDao.getInstance();
			AdminDto admin = new AdminDto(aid, apw, acode);
			int result = aDao.insertAdmin(admin);
			if(result ==AdminDao.SUCCESS ) {
				request.setAttribute("adminJoinResult", "관리자 등록 성공했습니다");
			}else {
				request.setAttribute("adminJoinResult", "등록실패하였습니다. 다시 시도해주십시오");	
			}
		}else {
			request.setAttribute("adminCodeError", "관리자코드를 올바르게 입력하세요");
		}
	}

}
