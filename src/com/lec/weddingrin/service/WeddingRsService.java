package com.lec.weddingrin.service;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.weddingrin.dao.ReserveDao;
import com.lec.weddingrin.dto.MemberDto;
import com.lec.weddingrin.dto.ReserveDto;

public class WeddingRsService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 2. 예약하기 
			HttpSession session = request.getSession();
			MemberDto member = (MemberDto) session.getAttribute("member");
			if(member!=null) {
				String mid = member.getMid();
				int wno = Integer.parseInt(request.getParameter("wno"));				
				String wrateStr = request.getParameter("wrate");//2022-12-12 12:00:00
				String wtimeStr = request.getParameter("wtime");
				String wdateStr = wrateStr +" "+ wtimeStr + ":00";
//				String wdateStr = wrateStr +" "+ wtimeStr;
				Timestamp wdate = null;
				if(!wrateStr.equals("") && !wtimeStr.equals("")) {
					wdate = Timestamp.valueOf(wdateStr);
				}
				
				ReserveDao reserveDao = ReserveDao.getInstance(); 
				int result = reserveDao.insertReserve(mid, wno, wdate);
				if(result == ReserveDao.SUCCESS) { //예약성공
					request.setAttribute("reserveResult", "예약이 완료되었습니다");
				}else {//예약 실패 
					request.setAttribute("reserveResult", "예약이 실패되었습니다");
				}
			}else {
				request.setAttribute("reserveResult", "로그인해");
			}
	}

}
