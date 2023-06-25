package com.saltmarket.shareboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.PageInfo;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.common.model.vo.SearchInfo;
import com.saltmarket.shareboard.model.service.ShareboardService;
import com.saltmarket.shareboard.model.vo.Shareboard;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/list.sbo")
public class ShareboardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ShareboardListController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int regionNo =  Integer.parseInt(request.getParameter("regionNo"));
		String status = request.getParameter("status");
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String kind = request.getParameter("kind");
		String keyword = request.getParameter("keyword");
		
		 if(kind == null || keyword == null) {
			 kind = "null"; keyword = "null";
		 } 
		 
		SearchInfo si = new SearchInfo(regionNo, status, kind, keyword);
		
		int listCount = new ShareboardService().selectListCount(si);
		int pageLimit = 10;
		int boardLimit = 10;
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		 if(endPage > maxPage) {
			 endPage = maxPage;
		 }
		 
		 PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, 
				  boardLimit, maxPage, startPage, endPage);
		 
		 ArrayList<Region> regionList = new ShareboardService().selectRegionList();
		 ArrayList<Shareboard> list = new ShareboardService().selectList(pi, si);
		 ArrayList<Shareboard> bestList = new ShareboardService().selectBestList(regionNo);
		 
		 request.setAttribute("si", si);
		 request.setAttribute("pi", pi);
		 request.setAttribute("regionList", regionList);
		 request.setAttribute("list", list);
		 request.setAttribute("bestList", bestList);
		 
		 request.getRequestDispatcher("views/shareboard/shareboardListView.jsp").forward(request, response);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
