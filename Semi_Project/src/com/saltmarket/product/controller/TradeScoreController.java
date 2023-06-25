package com.saltmarket.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.product.model.service.ProductService;

/**
 * Servlet implementation class TradeScoreController
 */
@WebServlet("/score.tr")
public class TradeScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TradeScoreController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("uno"));
		int productNo = Integer.parseInt(request.getParameter("pno"));
		
		String[] signs = request.getParameterValues("score[]");
		
		int numPlus = 0;
		int numMinus = 0;

		for (String sign : signs) {
		    if (sign.equals("+")) {
		        numPlus++;
		    } else if (sign.equals("-")) {
		        numMinus++;
		    }
		}

		double score = (numPlus * 0.5) - (numMinus * 0.5);
		
		int result = new ProductService().updateScore(userNo, score);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "평가 제출 완료");
			response.sendRedirect(request.getContextPath() + "/detail.pr?pno=" + productNo);
		} else {
			request.setAttribute("errorMsg", "평가 제출 실패");
			request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
