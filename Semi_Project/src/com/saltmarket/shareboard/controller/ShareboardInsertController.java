package com.saltmarket.shareboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.saltmarket.common.MyFileRenamePolicy;
import com.saltmarket.common.model.vo.ImgFile;
import com.saltmarket.shareboard.model.service.ShareboardService;
import com.saltmarket.shareboard.model.vo.Shareboard;

/**
 * Servlet implementation class FreeboardInsertController
 */
@WebServlet("/insert.sbo")
public class ShareboardInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShareboardInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식 => 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		
		// enctype 이 multipart/form-data 로 잘 전송되었을 경우를 검사
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 전송파일 용량 제한 (int maxSize)
			int maxSize = 10 * 1024 * 1024;
			// 전송파일이 실제로 저장될 경로 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/shareboard_upfiles/");
			// 전달된 파일명 수정 및 서버에 파일 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 게시글 작성 정보 뽑기
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			int regionNo = Integer.parseInt(multiRequest.getParameter("regionNo"));
			
			// Shareboard 로 가공
			Shareboard sb = new Shareboard();
			sb.setUserNo(userNo);
			sb.setBoardTitle(boardTitle);
			sb.setBoardContent(boardContent);
			sb.setRegionNo(regionNo);
			
			
			// -------------------- 새로운 첨부파일 부분 --------------------
			
			// 첨부파일을 담을 ArrayList 정의
			ArrayList<ImgFile> imgList = new ArrayList<>();
			
			// 작성을 원하는 게시글의 마지막 파일번호가 있다면 로직 실행 (없다면 첨부파일이 아예없다는뜻)
			if(multiRequest.getParameter("filelastno") != null) {
				
				// 첨부파일의 끝번호 추출
				int fileLastNo = Integer.parseInt(multiRequest.getParameter("filelastno"));
				// 뷰단의 name값인 file1,2,3,... 을 찾기 위한 변수 셋팅
				int count = 1;
				// 파일레벨 셋팅을 위한 변수 (첨부파일이 imgList에 담긴 횟수 카운트)
				int levelCount = 1;
				
				// 뷰단에서 사용자가 중간에 파일선택div를 삭제한 경우 검사가 끝나면 안되기 때문에
				// "file번호" 가 있든 없든 끝번호까지 반복돌리기
				for(int i = 1; i <= fileLastNo; i++) {
					
					// 뷰단의 파일정보가 담긴 name 변수명 추출을 위한 key값 초기화
					String key = "file" + count;
					// multiRequest.getOriginalFileName("키값") : String 원본명 (첨부파일이 있을 경우)
					if(multiRequest.getOriginalFileName(key) != null) {
						
						// ImgFile 객체에 vo 가공
						ImgFile img = new ImgFile();
						img.setOriginName(multiRequest.getOriginalFileName(key)); // 원본파일명
						img.setChangeFileName(multiRequest.getFilesystemName(key)); // 수정파일명 (실제 서버에 업로드되어있는 파일명)
						img.setFilePath("resources/shareboard_upfiles/");
						
						// 파일레벨 셋팅 (대표이미지일 경우1, 아닐경우2)
						// cf) 현재 자유게시판에서는 쓰임새가 없지만 나중을 위해 기능구현 해놓음~
						if(levelCount == 1) { // file1 키값이 대표이미지를 나타내는 키값임
							img.setFileLevel(1);
						} else {
							img.setFileLevel(2);
						}
						
						imgList.add(img);
						levelCount++;
					}
					
					// 뷰단의 다음 name값 추출을 위해 count 증가
					count++;
				}
			}
			
			// 서비스 요청
			int result = new ShareboardService().insertBoard(sb, imgList);
			
			// 결과 응답페이지
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "게시글 작성에 성공했습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.sbo?bno=" + sb.getShareboardNo());
			} else {
				if(imgList != null) {
				    for (ImgFile img : imgList) {
				        new File(savePath + img.getChangeFileName()).delete();
				    }
				}
				request.setAttribute("errorMsg", "게시글 작성 실패");
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
