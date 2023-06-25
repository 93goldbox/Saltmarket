package com.saltmarket.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.product.model.service.ProductRegistrationService;

/**
 * Servlet implementation class ProductDeleteFormController
 */
@WebServlet("/ProductDeleteForm.pr")
public class ProductDeleteFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));
	
		int result = new ProductRegistrationService().deleteProduct(productNo);
		
		if(result > 0 ) { // 성공
			
			request.getSession().setAttribute("alertMsg", "성공적으로 상품이 삭제되었습니다.");
			
			response.sendRedirect(request.getContextPath());
			
		}else { // 실패 
			
			request.setAttribute("errorMsg", "상품 삭제 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request,  response);
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
