package com.lec.weddingrin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.weddingrin.service.AJoinService;
import com.lec.weddingrin.service.ALoginService;
import com.lec.weddingrin.service.EmailConfirmService;
import com.lec.weddingrin.service.MJoinService;
import com.lec.weddingrin.service.MListContentService;
import com.lec.weddingrin.service.MListService;
import com.lec.weddingrin.service.MLoginService;
import com.lec.weddingrin.service.MLogoutService;
import com.lec.weddingrin.service.MidConfirmService;
import com.lec.weddingrin.service.Service;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		String viewPage = null;
		Service service = null;
		
		if(com.equals("/intro.do")) {//첫화면
			viewPage = "main/intro.jsp";
		}else if(com.equals("/main.do")) {//메인화면
			//service = WeddingListService();
			//service.......
			viewPage = "main/main.jsp";
		
			/* * * * * * * * * * *  * * * * * * * * * * * *
			 * * * * * * * * * member 관련 요청  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		
		}else if(com.equals("/memberJoinView.do")) {
			viewPage = "member/join.jsp";
		}else if(com.equals("/memberIdConfirm.do")) {
			service = new MidConfirmService();
			service.execute(request, response);
			viewPage = "member/idConfirm.jsp";
		}else if(com.equals("/emailConfirm.do")) {
			service = new EmailConfirmService();
			service.execute(request, response);
			viewPage = "member/emailConfirm.jsp";
		}else if(com.equals("/memberJoin.do")) {
			service = new MJoinService();
			service.execute(request, response);
			viewPage = "memberLoginView.do";
		}else if(com.equals("/memberLoginView.do")) {
			viewPage = "member/login.jsp";
		}else if(com.equals("/memberLogin.do")) {
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/memberLogout.do")) {
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			
		}else if(com.equals("/MListView.do")) {
			service= new MListService();
			service.execute(request, response);
			viewPage = "member/memberlist.jsp";
		}else if(com.equals("/MListContent.do")) {
			service = new MListContentService(); //얘는 고객이 로그인 한게 아니기 때문에 session이 안넘어옴
			service.execute(request, response);
			viewPage = "member/membercontent.jsp";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			 * * * * * * * * * admin 관련 요청  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/adminLoginView.do")) {
			viewPage = "admin/adminLogin.jsp";
		}else if(com.equals("/adminLogin.do")) {
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "MListView.do";
		}else if(com.equals("/adminJoinView.do")) {
			viewPage = "admin/adminJoin.jsp";
		}else if(com.equals("/adminJoin.do")) {
			service = new AJoinService();
			service.execute(request, response);
			viewPage = "adminLoginView.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}














