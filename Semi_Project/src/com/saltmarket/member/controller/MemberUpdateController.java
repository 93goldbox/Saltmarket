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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
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
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		int regionNo = Integer.parseInt(request.getParameter("regionNo"));
		
		Member m = new Member(userId, userName, phone, email, address, regionNo);
		
		// Service 에 VO 를 전달하면서 요청 후 결과 받기
		Member updateMem = new MemberService().updateMember(m);
		
		// 결과에 따른 응답페이지 지정
		if(updateMem == null) { // 회원정보 변경 실패 => 에러페이지
			
			request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		} else { // 회원정보 변경 성공 => 마이페이지
			
			// session scope 에 갱신된 회원정보를 덮어씌운 후 url 재요청
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "성공적으로 회원정보를 변경했습니다.");
			
			response.sendRedirect(request.getContextPath() + "/myPageMain.me");
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





