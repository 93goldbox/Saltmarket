package com.saltmarket.shareboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.saltmarket.shareboard.model.service.ShareboardService;
import com.saltmarket.shareboard.model.vo.Shareboard;

/**
 * Servlet implementation class AjaxFreeboardLikeSelectController
 */
@WebServlet("/lselect.sbo")
public class AjaxShareboardLikeSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxShareboardLikeSelectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		Shareboard sb = new ShareboardService().selectLike(boardNo);

		// GSON 을 이용해서 응답데이터 넘기기
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(sb, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
