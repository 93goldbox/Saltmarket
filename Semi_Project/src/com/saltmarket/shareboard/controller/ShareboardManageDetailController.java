package com.saltmarket.shareboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.shareboard.model.service.ShareboardService;
import com.saltmarket.shareboard.model.vo.Shareboard;

/**
 * Servlet implementation class FreeboardDetailController
 */
@WebServlet("/manageDetail.sbo")
public class ShareboardManageDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareboardManageDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int result = new ShareboardService().increaseCount(boardNo);
		
		// 조회수 증가가 성공했을 경우만 조회 요청
		if(result > 0) {
			
			// 게시글 조회
			Shareboard sb =  new ShareboardService().selectBoard(boardNo);
			
			// 이미지 첨부파일들 조회
			ArrayList<ImgFile> imgList = new ShareboardService().selectImgFile(boardNo);
			// 응답데이터 담기
			request.setAttribute("sb",  sb);
			request.setAttribute("imgList", imgList);
			request.getRequestDispatcher("views/dashboard/shareboardManageDetail.jsp").forward(request, response);
		} else {
			request.setAttribute("errorMsg", "자유게시판 상세조회 실패");
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
