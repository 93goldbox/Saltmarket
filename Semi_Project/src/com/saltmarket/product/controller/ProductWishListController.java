package com.saltmarket.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.product.model.service.ProductService;
import com.saltmarket.product.model.vo.WishList;

/**
 * Servlet implementation class ProductWishListController
 */
@WebServlet("/wishlist.pr")
public class ProductWishListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductWishListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("uno"));
		int productNo = Integer.parseInt(request.getParameter("pno"));
		
		ProductService pService = new ProductService();

		int count = pService.selectWishListCheck(userNo, productNo);

		
		if(count == 0) {
			pService.insertWishList(userNo, productNo);
					
			request.getSession().setAttribute("alertMsg", "찜 추가 성공");
			
			response.sendRedirect(request.getContextPath() + "/detail.pr?pno=" + productNo);
		

		} else if(count > 0){
			request.getSession().setAttribute("alertMsg", "찜 삭제 성공");
			pService.deleteWishList(userNo, productNo);
			
			response.sendRedirect(request.getContextPath() + "/detail.pr?pno=" + productNo);
			
		} else {
			request.setAttribute("errorMsg", "찜하기 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
