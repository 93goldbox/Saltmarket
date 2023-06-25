package com.saltmarket.member.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.saltmarket.common.MyFileRenamePolicy;
import com.saltmarket.common.model.vo.ProfileImg;
import com.saltmarket.member.model.service.MemberService;

/**
 * Servlet implementation class UpdateProfileController
 */
@WebServlet("/updateProfile.me")
public class UpdateProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 인코딩 설정 (post)
		request.setCharacterEncoding("UTF-8");
		
		// 해당 요청이 multipart/form-data 형식인지 우선 검사 후 코드 작성
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 전송용량 제한, byte 단위 (10mb)
			int maxSize = 10 * 1024 * 1024;
			
			// 저장할 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/profileImg_upfiles/");
			
			// 전달된 파일명 수정 작업 및 서버에 파일 업로드 (MultiPartRequest 객체 생성 시 일어남)
			MultipartRequest multiRequest = new MultipartRequest(request
											                   , savePath
											                   , maxSize
											                   , "UTF-8"
											                   , new MyFileRenamePolicy());
			
			// 요청 시 전달값 뽑기
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String userName = multiRequest.getParameter("userName");
			ProfileImg pImg = null;
			
			// ProfileImg 관련 데이터들 뽑기
			// 기존 첨부파일 또는 새로운 첨부파일이 있을 경우
			if(multiRequest.getOriginalFileName("upfile") != null) {
				
				// 첨부파일이 존재할 경우 ProfileImg 객체 생성
				pImg = new ProfileImg();
				
				pImg.setOriginName(multiRequest.getOriginalFileName("upfile"));
				pImg.setChangeName(multiRequest.getFilesystemName("upfile"));
				pImg.setFilePath("resources/profileImg_upfiles/");
				
				// case1. 기존 첨부파일이 있을 경우
				// => 기존 첨부파일의 파일번호, 수정명을 hidden 으로 넘겼었음!
				if(multiRequest.getParameter("originFileNo") != null) {
					
					// 새로운 첨부파일이 있고, 기존의 파일이 있었을 경우
					// => PROFILE_IMG UPDATE
					pImg.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					// 기존의 첨부파일은 서버로부터 삭제
					new File(savePath + multiRequest.getParameter("originFileName")).delete();
					
				} else {
					// case2. 기존 첨부파일이 없을 경우
					// => PROFILE_IMG INSERT
					pImg.setUserNo(userNo);
				}
			}
				
			// 프로필 변경 등록 서비스 요청 후 결과 받기
			int result = new MemberService().updateProfileMember(userNo, userName, pImg);
			
			// 결과에 따른 응답화면 지정
			if(result > 0) { // 성공 => 마이페이지 상세프로필로 url 재요청
				
				request.getSession().setAttribute("alertMsg", "프로필 변경에 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/myPageMain.me?userNo=" + userNo);
				
			} else { // 실패 => 에러페이지 포워딩
				
				request.setAttribute("errorMsg", "프로필 변경 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
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




