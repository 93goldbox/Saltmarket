package com.saltmarket.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.member.model.service.MemberService;

/**
 * Servlet implementation class IdCheckController
 */
@WebServlet("/idCheck.me")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String checkId = request.getParameter("checkId");
		
		// 아이디 중복 확인용 서비스 호출 후 결과 받기 => 현재 아이디를 사용 중인 계정의 갯수를  count 해올 것 (최대 1)
		int count = new MemberService().idCheck(checkId);
		
		// 결과에 따른 응답 데이터 보내기
		response.setContentType("text/html; charset=UTF-8");
		
		if(count > 0) { // 존재하는 아이디가 이미 있을 경우 => 사용 불가능
			response.getWriter().print("NNNNN");
		} else { // 존재하는 아이디가 없을 경우 => 사용 가능
			response.getWriter().print("NNNNY");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
