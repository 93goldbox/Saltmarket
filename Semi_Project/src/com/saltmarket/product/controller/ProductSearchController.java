package com.saltmarket.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.common.model.vo.PageInfo;
import com.saltmarket.product.model.service.ProductService;
import com.saltmarket.product.model.vo.Product;

/**
 * Servlet implementation class ProductSearchController
 */
@WebServlet("/search.pr")
public class ProductSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSearchController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");

		int listCount = 0;
		int pageLimit;
		int boardLimit;
		
		int maxPage;
		int startPage;
		int endPage;
		
		int currentPage = Integer.parseInt((request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage")));
	    int category = Integer.parseInt((request.getParameter("category") == null ? "0" : request.getParameter("category")));

	    if(category == 0 && keyword != null && !keyword.isEmpty()) {
			listCount = new ProductService().selectListCount(keyword);
		}

	    pageLimit = 10;
		boardLimit = 12;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		/* 사진 썸네일 */
		ArrayList<Product> list = new ProductService().selectThumbnailList();
		request.setAttribute("list", list);
		
		/* 헤더에 검색 */
		ArrayList<Product> plist = new ArrayList<>();

		
		if(category == 0 && keyword != null && !keyword.isEmpty()) {
			plist = new ProductService().selectSearchList(pi, keyword);

		} else if(category == 0) {
			plist = new ProductService().selectList(pi);

		} else if(category >= 1 && category <= 10) {
		
			plist = new ProductService().selectCategoryFilter(category, pi);

		}
		
		ArrayList<Product> searchList = new ProductService().selectSearchList(pi, keyword);
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("plist", plist);
		request.setAttribute("ilist", list);
		request.setAttribute("searchList", searchList);
		
//		ImgFile i = new ProductService().selectImgFile();
//		request.setAttribute("i", i);
		
		request.getRequestDispatcher("views/product/productSearchListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
