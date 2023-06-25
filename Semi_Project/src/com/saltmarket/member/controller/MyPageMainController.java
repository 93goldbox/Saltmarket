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
 * Servlet implementation class MyPageMainController
 */
@WebServlet("/myPageMain.me")
public class MyPageMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageMainController() {
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
		
		// Service 로 전달값 넘기면서 요청 처리 후 결과 받기
		// wishList 객체 생성
		ArrayList<Product> wishList = new MemberService().selectWishList(userNo);
		request.setAttribute("wishList", wishList);
		
		// ProfileImg 객체 생성
		ProfileImg pImg = new MemberService().selectProfileImg(userNo);
		request.setAttribute("pImg", pImg);
		
		// 회원 전체 조회
		Member m = new MemberService().selectMyPageMember(userNo, userId);
		request.setAttribute("m", m);
		
		request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}




