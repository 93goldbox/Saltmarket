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
 * Servlet implementation class FreeboardUpdateFormController
 */
@WebServlet("/updateForm.fbo")
public class FreeboardUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeboardUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 글번호 파싱해서 받기
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// 게시글 상세조회, 이미지 파일들 요청 보내서 받아오기
		Freeboard fb = new FreeboardService().selectBoard(boardNo);
		ArrayList<ImgFile> imgList = new FreeboardService().selectImgFile(boardNo);
		
		request.setAttribute("fb", fb);
		request.setAttribute("imgList",  imgList);
		
		// 수정하기 페이지로 포워딩
		request.getRequestDispatcher("views/freeboard/freeboardUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
