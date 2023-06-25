package com.saltmarket.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.Declaration;
import com.saltmarket.product.model.service.ProductService;

/**
 * Servlet implementation class DeclareDecideController
 */
@WebServlet("/decide.dc")
public class DeclareDecideController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeclareDecideController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int declareNo = Integer.parseInt(request.getParameter("dno"));
		int declareCheck = Integer.parseInt(request.getParameter("check"));
		String declareReason = request.getParameter("reason");
		
		Declaration d = new Declaration();
		d.setDeclareNo(declareNo);
		d.setDeclareCheck(declareCheck);
		d.setDeclareReason(declareReason);

		int result = new ProductService().updateDeclare(d);

		if(result > 0) {
			response.sendRedirect("list.mpr");
		} else {
			request.setAttribute("msg", "신고 처리에 실패하였습니다.");
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
