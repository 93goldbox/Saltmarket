package com.saltmarket.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saltmarket.member.model.service.MemberService;
import com.saltmarket.member.model.vo.Member;

/**
 * Servlet implementation class MemberDeleteController
 */
@WebServlet("/delete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 설정 (post)
		request.setCharacterEncoding("UTF-8");
		
		// 요청 시 전달값들을 뽑아서 변수에 담은 후 VO 로 가공
		String userPwd = request.getParameter("userPwd");
		
		HttpSession session = request.getSession();
		String userId = ((Member)session.getAttribute("loginUser")).getUserId(); // 현재 로그인한 사용자의 아이디
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		
		// Service 로 요청 후 결과 받기
		int result = new MemberService().deleteMember(m);
		
		// 결과에 따른 응답화면 지정
		if(result > 0) { // 탈퇴 성공 => 메인페이지
			
			session.setAttribute("alertMsg", "회원 탈퇴에 성공했습니다.");
			
			session.removeAttribute("loginUser");
			response.sendRedirect(request.getContextPath());
			
		} else { // 탈퇴 실패 => 에러페이지
			
			request.setAttribute("error", "회원 탈퇴에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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




