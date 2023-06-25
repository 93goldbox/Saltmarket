package com.saltmarket.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteController
 */
@WebServlet("/delete.no")
public class NoticeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int noticeNo = Integer.parseInt(request.getParameter("nno"));
		
		// 게시글 번호를 넘기면서 삭제 요청 후 결과 받기
		// (Attachment 테이블은 따로 건들일 필요가 없음!!)
		int result = new NoticeService().deleteNotice(noticeNo);
		
		// 결과에 따른 응답뷰 지정
		if(result > 0) { // 성공 => /jsp/list.bo?currentPage=1 로 재요청
			
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			response.sendRedirect(request.getContextPath() + "/list.mno");
			
		} else { // 실패 => 에러페이지로 포워딩
			
			request.setAttribute("errorMsg", "일반게시판 삭제 실패");
			
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
