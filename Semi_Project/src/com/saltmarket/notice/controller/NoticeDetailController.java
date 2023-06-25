package com.saltmarket.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.notice.model.service.NoticeService;
import com.saltmarket.notice.model.vo.Attachment;
import com.saltmarket.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeDetailView
 */
@WebServlet("/detail.no")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 클릭했을때의 글 번호
		int noticeNo = Integer.parseInt(request.getParameter("nno")); 
		
		// 조회수 증가용 서비스 먼저 호출
		int result = new NoticeService().increaseViewCount(noticeNo);
		
		if(result > 0) { 
			
			Notice n = new NoticeService().selectNotice(noticeNo);
			
			ArrayList<Attachment> list = new NoticeService().selectAttachmentList(noticeNo);
			
			request.setAttribute("n", n);
			request.setAttribute("list", list);


			request.getRequestDispatcher("views/notice/noticeDetailView.jsp").forward(request, response);
			
		} else { 
			// 조회수 증가에 실패했을 경우 => 에러페이지로 보여지도록 포워딩
			
			request.setAttribute("errorMsg", "공지사항 조회 실패");
			
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
