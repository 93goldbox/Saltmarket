package com.saltmarket.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.notice.model.service.QNAService;
import com.saltmarket.notice.model.vo.QNA;

/**
 * Servlet implementation class QNAManageUpdateController
 */
@WebServlet("/update.mqna")
public class QNAManageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAManageUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int qnaNo = Integer.parseInt(request.getParameter("qno"));
		String aContent = request.getParameter("aContent");
		QNA q = new QNA();
		q.setQnaNo(qnaNo);
		q.setaContent(aContent);		
		
		int result = new QNAService().updateManageQNA(q);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath() + "/detail.mqna?qno="+qnaNo);
		}else {
			request.setAttribute("errorMsg", "답변 수정에 실패하였습니다.");
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
