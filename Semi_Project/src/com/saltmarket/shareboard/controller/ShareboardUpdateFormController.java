package com.saltmarket.shareboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.common.model.vo.Region;
import com.saltmarket.freeboard.model.service.FreeboardService;
import com.saltmarket.shareboard.model.service.ShareboardService;
import com.saltmarket.shareboard.model.vo.Shareboard;

/**
 * Servlet implementation class FreeboardUpdateFormController
 */
@WebServlet("/updateForm.sbo")
public class ShareboardUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareboardUpdateFormController() {
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
		Shareboard sb = new ShareboardService().selectBoard(boardNo);
		ArrayList<ImgFile> imgList = new ShareboardService().selectImgFile(boardNo);
		ArrayList<Region> regionList = new ShareboardService().selectRegionList();
		
		request.setAttribute("sb", sb);
		request.setAttribute("imgList",  imgList);
		request.setAttribute("regionList", regionList);
		
		// 수정하기 페이지로 포워딩
		request.getRequestDispatcher("views/shareboard/shareboardUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
