package com.saltmarket.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.member.model.vo.Member;
import com.saltmarket.product.model.service.ProductService;
import com.saltmarket.product.model.vo.Product;

/**
 * Servlet implementation class SellerProfileController
 */
@WebServlet("/sellerprofile.pr")
public class SellerProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerProfileController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("pno"));
		
		ArrayList<Product> plist = new ProductService().selectList();
		request.setAttribute("plist", plist);
		
		int count = new ProductService().selectListCount();
		request.setAttribute("count", count);
		
		ImgFile img = new ProductService().selectProfileImgFile(productNo);
		request.setAttribute("img", img);
		
		Member m = new ProductService().selectSellerProfile();
		request.setAttribute("m", m);

		String g = new ProductService().selectSellerProfileGrade();
		
		request.getRequestDispatcher("views/product/SellerProfileView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
