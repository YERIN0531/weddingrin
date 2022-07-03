package com.lec.weddingrin.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.QnaDao;
import com.lec.weddingrin.dto.QnaDto;

public class QboardListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			if(request.getAttribute("pageNum")==null) { 
				pageNum = "1";
			}else {
				pageNum = (String)request.getAttribute("pageNum");
			}
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE=10, BLOCKSIZE=10;
		int startRow = (currentPage-1) * PAGESIZE +1;
		int endRow   = startRow + PAGESIZE -1;
		
		QnaDao qnaDao = QnaDao.getInstance();
		ArrayList<QnaDto> qnaList = qnaDao.qnaList(startRow, endRow);
		request.setAttribute("qnaList", qnaList);
		
		int totCnt = qnaDao.qnaTotCnt();
		int pageCnt = (int)Math.ceil((double)totCnt/PAGESIZE);
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("totCnt", totCnt); 
		request.setAttribute("pageNum", currentPage);
	}

}
