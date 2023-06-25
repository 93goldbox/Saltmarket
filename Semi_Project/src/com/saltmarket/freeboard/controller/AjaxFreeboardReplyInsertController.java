package com.saltmarket.freeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saltmarket.common.model.vo.Reply;
import com.saltmarket.freeboard.model.service.FreeboardService;
import com.saltmarket.member.model.vo.Member;

/**
 * Servlet implementation class AjaxFreeboardReplyInsertController
 */
@WebServlet("/rinsert.fbo")
public class AjaxFreeboardReplyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFreeboardReplyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 시 전달값 뽑기
		String replyContent = request.getParameter("content");
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// content가 null이면 응답 데이터로 0을 전송하고 종료
		if(replyContent == "") {
	        response.setContentType("text/html; charset=UTF-8");
	        response.getWriter().print(0);
	        return;
		}
		
		// 추가적으로 필요한 데이터 : 작성자의 회원번호
		// => Session 으로부터 얻어내보기
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		// Reply VO 객체로 데이터 가공
		Reply r = new Reply();
		r.setReplyContent(replyContent);
		r.setFreeboardNo(boardNo);
		r.setUserNo(userNo);
		
		// 서비스로 요청 후 결과 받기
		int result = new FreeboardService().insertReply(r);
		
		// 결과를 응답데이터로 넘기기
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(result); // 성공1, 실패0
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
