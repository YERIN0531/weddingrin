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
import javax.servlet.http.HttpSession;

import com.lec.weddingrin.dao.ReviewDao;
import com.lec.weddingrin.dto.MemberDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RboardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String path = request.getRealPath("reviewBoardUp");
		int maxSize = 1024*1024*10;
		MultipartRequest mRequest = null;
		String rfilename = null;
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8",new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			
			rfilename=mRequest.getFilesystemName(param);
			
			
			HttpSession httpSession = request.getSession();
			MemberDto member = (MemberDto)httpSession.getAttribute("member");
			
			if(member!=null) {
				String mid = member.getMid();
				String rtitle = mRequest.getParameter("rtitle");
				String rcontent = mRequest.getParameter("rcontent");
				String rip = request.getRemoteAddr();
				ReviewDao reviewDao = ReviewDao.getInstance();
				int result = reviewDao.writeReview(mid, rtitle, rcontent, rfilename, rip);
				
				if(result == ReviewDao.SUCCESS) {
					request.setAttribute("boardResult", "글쓰기 성공");
				}else {
					request.setAttribute("boardResult", "글쓰기 실패");
				}
			}else {
				request.setAttribute("boardResult", "로그인 후 이용가능한 서비스입니다");
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("boardResult", "글쓰기 실패");
		}
		
		// 서버에 올라간 reviewBoardUp 파일을 소스 폴더에 filecopy
		if(rfilename!=null) {
			InputStream is = null;
			OutputStream os = null;
		
		try {
			File serverFile = new File(path +"/"+rfilename);
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
					if(os!=null)os.close();
					if(is!=null)is.close();
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
		}//if
		
	}

}
