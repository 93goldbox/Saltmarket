package com.saltmarket.shareboard.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.shareboard.model.service.ShareboardService;

/**
 * Servlet implementation class FreeboardDeleteController
 */
@WebServlet("/manageDelete.sbo")
public class ShareboardManageDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareboardManageDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int regionNo = Integer.parseInt(request.getParameter("regionNo"));
		String status = request.getParameter("status");
		String kind = request.getParameter("kind");
		String keyword = request.getParameter("keyword");
		
		int result = new ShareboardService().deleteBoard(boardNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			response.sendRedirect(request.getContextPath() + 
					"/manage.sbo?currentPage=" + currentPage + 
					"&regionNo=" + regionNo +
					"&status=" + status +
					"&kind=" + kind +
					"&keyword=" + keyword
					);
		} else {
			request.setAttribute("errorMsg", "자유게시판 삭제 실패");
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
