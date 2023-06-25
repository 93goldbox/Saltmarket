package com.saltmarket.freeboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.freeboard.model.service.FreeboardService;
import com.saltmarket.freeboard.model.vo.Freeboard;

/**
 * Servlet implementation class FreeboardDetailController
 */
@WebServlet("/manageDetail.fbo")
public class FreeboardManageDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeboardManageDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		int result = new FreeboardService().increaseCount(boardNo);
		
		// 조회수 증가가 성공했을 경우만 조회 요청
		if(result > 0) {
			
			// 게시글 조회
			Freeboard fb =  new FreeboardService().selectBoard(boardNo);
			
			// 이미지 첨부파일들 조회
			ArrayList<ImgFile> imgList = new FreeboardService().selectImgFile(boardNo);
			// 응답데이터 담기
			request.setAttribute("fb",  fb);
			request.setAttribute("imgList", imgList);
			request.getRequestDispatcher("views/dashboard/freeboardManageDetail.jsp").forward(request, response);
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
