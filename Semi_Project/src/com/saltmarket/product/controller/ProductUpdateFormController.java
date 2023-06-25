package com.saltmarket.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.product.model.service.ProductRegistrationService;
import com.saltmarket.product.model.service.ProductService;
import com.saltmarket.product.model.vo.Product;

/**
 * Servlet implementation class ProductUpdateFormController
 */
@WebServlet("/ProductUpdateForm.pr")
public class ProductUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 상품 상세 조회, 이미지 파일 요청을 모두 보내서 결과 받기
		
		 
				
		// product에 대한 파일 정보 불러오기
		
		int productNo = Integer.parseInt(request.getParameter("productNo"));
	
		ProductService pService = new ProductService();
		ProductRegistrationService prService = new ProductRegistrationService();
		
		// 카테고리 상세 조회
		ArrayList<Region> regionList = prService.selectRegionList();
		
		Product p = pService.selectProduct(productNo);
		
		ImgFile img = prService.selectImgFileList(productNo);
		// 나중에 selectImgFileList에 productNo을 추가해야됨
		
		request.setAttribute("regionList",regionList);
		request.setAttribute("p", p);
		request.setAttribute("img", img);
		
	
		request.getRequestDispatcher("views/product/productUpdate.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
