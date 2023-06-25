package com.saltmarket.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.service.BoardReportService;
import com.saltmarket.common.model.vo.BoardReport;

/**
 * Servlet implementation class BoardReportController
 */
@WebServlet("/report.bo")
public class BoardReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		String reportTitle = request.getParameter("title");
		String reportContent = request.getParameter("content");
		
		BoardReport br = new BoardReport(type, boardNo, userNo, reportTitle, reportContent);

		int result = new BoardReportService().reportBoard(br);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "게시글 신고에 성공했습니다.");
			if(type.equals("free")) {
				response.sendRedirect(request.getContextPath() + "/detail.fbo?bno=" + boardNo);
			} else if(type.equals("share")) {
				response.sendRedirect(request.getContextPath() + "/detail.sbo?bno=" + boardNo);
			}
		} else {
			request.setAttribute("errorMsg", "신고 작성 실패");
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
