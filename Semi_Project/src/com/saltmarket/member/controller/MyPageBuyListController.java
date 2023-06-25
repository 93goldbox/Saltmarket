package com.saltmarket.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saltmarket.member.model.service.MemberService;
import com.saltmarket.member.model.vo.Member;
import com.saltmarket.product.model.vo.Product;

/**
 * Servlet implementation class MyPageBuyListController
 */
@WebServlet("/myPageBuyList.me")
public class MyPageBuyListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageBuyListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청 시 전달값 뽑아서 변수에 담은 후 session scope로 넘기기
		HttpSession session = request.getSession();
		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();
		
		// Service 로 전달값 넘기면서 요청 처리 후 결과 받기
		// ArrayList<Product> buyList = new MemberService().selectBuyList(userNo);
		// request.setAttribute("buyList", buyList);
		
		// request.getRequestDispatcher("views/member/myPageBuy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
