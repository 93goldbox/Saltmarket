package com.saltmarket.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.PageInfo;
import com.saltmarket.notice.model.service.QNAService;
import com.saltmarket.notice.model.vo.Attachment;
import com.saltmarket.notice.model.vo.QNA;

/**
 * Servlet implementation class MToMListController
 */
@WebServlet({ "/list.qna" })
public class QNAListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int listCount; 
		int currentPage; 
		int pageLimit; 
		int boardLimit; 
		
		int maxPage; 
		int startPage; 
		int endPage; 

		listCount = new QNAService().selectListCount();

		currentPage = Integer.parseInt(request.getParameter("currentPage"));

		pageLimit = 10;
		
		boardLimit = 10;

		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit,
								   boardLimit, maxPage, startPage, endPage);



		QNA q = new QNA();
		String qWriter = request.getParameter("userNo");

		q.setqWriter(qWriter);
		ArrayList<QNA> list = new QNAService().selectQNAList(q, pi);

		ArrayList<Attachment> aList = new QNAService().selectAttachmentList(list);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("aList", aList);
		request.getRequestDispatcher("views/notice/qnaListView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
