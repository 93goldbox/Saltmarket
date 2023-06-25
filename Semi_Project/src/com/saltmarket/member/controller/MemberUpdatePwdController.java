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
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 설정 (post)
		request.setCharacterEncoding("UTF-8");
		
		// 요청 시 전달값을 뽑아서 변수에 담기
		String userPwd = request.getParameter("userPwd");
		String updatePwd = request.getParameter("updatePwd");
		
		// 현재 로그인한 회원의 아이디값 전달 (hidden 으로 입력받은 값)
		String userId = request.getParameter("userId");
		
		// VO 로 가공
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		
		// Service 로 요청 후 결과 받기
		// 비밀번호 변경용 UPDATE + 갱신된 회원정보 조회
		Member updateMem = new MemberService().updatePwdMember(m, updatePwd);
		
		// 결과에 따른 응답화면 지정
		if(updateMem == null) { // 비밀번호 변경 실패 => 에러페이지
			
			request.setAttribute("errorMsg", "비밀번호 변경에 실패했습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		} else { // 비밀번호 변경 성공 => 마이페이지 메인
			
			// session scope 에 갱신된 회원정보를 덮어씌운 후 url 재요청
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "성공적으로 비밀번호가 변경되었습니다.");
			
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




