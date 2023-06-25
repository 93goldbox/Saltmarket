package com.saltmarket.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.notice.model.service.QNAService;

/**
 * Servlet implementation class QNADeleteController
 */
@WebServlet("/delete.qna")
public class QNADeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNADeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int qnaNo = Integer.parseInt(request.getParameter("qno"));
		String qWriter = request.getParameter("qWriter");

		int result = new QNAService().deleteQNA(qnaNo);
		
		if(result > 0) {
				// 성공 시
				request.getSession().setAttribute("alertMsg", "QNA 삭제에 성공하였습니다.");
				response.sendRedirect(request.getContextPath() + "/list.qna?userNo=" + qWriter + "&currentPage=1");
			} else {
				// 실패 시
				request.setAttribute("errorMsg", "QNA 삭제에 실패하였습니다.");
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
