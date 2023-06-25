package com.saltmarket.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.saltmarket.common.model.vo.ProfileImg;
import com.saltmarket.member.model.service.MemberService;
import com.saltmarket.member.model.vo.Member;
import com.saltmarket.product.model.vo.Product;

/**
 * Servlet implementation class MyPageDetailController
 */
@WebServlet("/myPageDetail.me")
public class MyPageDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageDetailController() {
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
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
		int sellCount = new MemberService().selectSellCount(userNo);
		request.setAttribute("sellCount", sellCount);
		
		ArrayList<Product> sellList = new MemberService().selectSellList(userNo);
		request.setAttribute("sellList", sellList);
		
		ArrayList<Product> wishList = new MemberService().selectWishList(userNo);
		request.setAttribute("wishList", wishList);
		
		ProfileImg pImg = new MemberService().selectProfileImg(userNo);
		request.setAttribute("pImg", pImg);
		
		Member m = new MemberService().selectMyPageMember(userNo, userId);
		request.setAttribute("m", m);
		
		request.getRequestDispatcher("views/member/myPageDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}




