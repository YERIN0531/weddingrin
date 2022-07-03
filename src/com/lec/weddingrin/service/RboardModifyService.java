package com.lec.weddingrin.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.dao.ReviewDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RboardModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("reviewBoardUp");
		int maxSize = 1024*1024*10; // 최대업로드 사이즈는 10M
		String rfilename = "", dbFileName = null;
		
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			rfilename = mRequest.getFilesystemName(param);
			dbFileName = mRequest.getParameter("dbFileName");
			if(rfilename==null) {
				rfilename = dbFileName;
			}
			int rno = Integer.parseInt(mRequest.getParameter("rno"));
			String rtitle = mRequest.getParameter("rtitle");
			String rcontent = mRequest.getParameter("rcontent");
			String rip = request.getRemoteAddr();
			ReviewDao reviewDao = ReviewDao.getInstance();
			int result = reviewDao.modifyReview(rno, rtitle, rcontent, rfilename, rip);
			
			if(result == ReviewDao.SUCCESS) {
				request.setAttribute("boardResult", "글 수정 성공");
			}else {
				request.setAttribute("boardResult", "글 수정 실패");
			}
			request.setAttribute("pageNum", mRequest.getParameter("pageNum"));
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		if(dbFileName!=null && rfilename.equals(dbFileName)) {
			InputStream is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path+"/"+rfilename);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\yerin\\source\\00_semiProject\\project\\WebContent\\reviewBoardUp\\"+rfilename);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int nByteCnt = is.read(bs);
					if(nByteCnt==-1) break;
					os.write(bs, 0, nByteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}

}
