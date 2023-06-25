package com.saltmarket.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.member.model.service.MemberService;
import com.saltmarket.member.model.vo.Member;

/**
 * Servlet implementation class MemberSearchIdController
 */
@WebServlet("/searchId.me")
public class MemberSearchIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSearchIdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 설정 (POST)
		request.setCharacterEncoding("UTF-8");
		
		// 요청 시 전달값을 뽑아서 변수 선언 후 Member 객체에 담기
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		
		System.out.println(userName);
		System.out.println(email);
		
		// Member m = new Member(userName, email);
		
		Member m = new Member();
		m.setUserName(userName);
		m.setEmail(email);
		
		// Service 로 전달값 넘기면서 요청 처리 후 결과 받기
		String searchId = new MemberService().searchIdMember(m);
		
		// 뷰단으로 결과값 넘기기
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(searchId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}




