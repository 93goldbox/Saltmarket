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
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/updateForm.no")
public class NoticeUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int NoticeNo = Integer.parseInt(request.getParameter("nno"));
		
		// 카테고리 리스트, 게시글 상세조회, 첨부파일1건조회 요청을 모두 보내서 결과 받기
		
		
		Notice n = new NoticeService().selectNotice(NoticeNo);
		// 글번호, 카테고리명, 제목, 내용, 작성자 아이디, 작성일
		
		ArrayList<Attachment> list = new NoticeService().selectAttachmentList(NoticeNo);
		// 첨부파일이 있다면 첨부파일번호, 원본명, 수정명, 저장경로
		// 첨부파일이 없다면 null
		
		request.setAttribute("list", list);
		request.setAttribute("n", n);
		
		request.getRequestDispatcher("views/notice/noticeUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
