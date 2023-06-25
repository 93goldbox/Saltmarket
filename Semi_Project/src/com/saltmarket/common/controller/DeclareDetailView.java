package com.saltmarket.common.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.Declaration;
import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.product.model.service.ProductService;

/**
 * Servlet implementation class DeclareDetailView
 */
@WebServlet("/detail.dc")
public class DeclareDetailView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeclareDetailView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		int declareNo=Integer.parseInt(request.getParameter("dno"));
		String declareType=request.getParameter("type");

			
		if(declareType.equals("커뮤니티")){

			Declaration d = new ProductService().selectCommunityDeclare(declareNo);
			ArrayList<ImgFile> list = new ProductService().selectImgFileList(declareNo);
			
			request.setAttribute("d", d);
			
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/freeboard/communityDeclareDetailView.jsp").forward(request, response);
		}
		else {
			

			Declaration d = new ProductService().selectProductDeclare(declareNo);
			ArrayList<ImgFile> list = new ProductService().selectImgFileList(declareNo);
			
			request.setAttribute("d", d);
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/product/productDeclareDetailView.jsp").forward(request, response);
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
