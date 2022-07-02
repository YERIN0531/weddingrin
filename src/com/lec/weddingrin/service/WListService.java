package com.lec.weddingrin.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.MemberDao;
import com.lec.weddingrin.dao.WeddingDao;
import com.lec.weddingrin.dto.MemberDto;
import com.lec.weddingrin.dto.WeddingDto;

public class WListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE = 9, BLOCKSIZE = 5;
		int startRow = (currentPage-1)*PAGESIZE +1;
		int endRow   = startRow + PAGESIZE -1;
		
		
		
		WeddingDao wDao = WeddingDao.getInstance();
		ArrayList<WeddingDto> halls = wDao.weddingAllList(startRow, endRow);
		for(int i=0; i<halls.size(); i++) {
			System.out.println(i);
		}
		request.setAttribute("wListView", halls);
	
		int totCnt = wDao.weddingTotCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE +1;
		int endPage   = startPage + BLOCKSIZE -1 ;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("pageNum", currentPage);
		
		
	}

}
