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
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 설정 (post)
		request.setCharacterEncoding("UTF-8");
		
		// 요청 시 전달값을 뽑아서 변수에 담기 => 아이디, 비번, 닉네임, 전화번호, 이메일, 주소
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		// VO 에 담기
		Member m = new Member(userId, userPwd, userName, phone, email, address);
		
		// Service 로 전달값 넘기면서 요청 처리 후 결과 받기
		int result = new MemberService().insertMember(m);
		
		// 결과에 따른 응답화면 지정
		if(result > 0) { // 성공 => 메인페이지
			
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원 가입에 성공했습니다.");
			
			// 메인페이지로 url 재요청
			response.sendRedirect(request.getContextPath());
			
		} else { // 실패 => 에러페이지
			
			// 에러 문구 담은 후 에러페이지 포워딩
			request.setAttribute("errorMsg", "회원 가입에 실패했습니다.");
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
