package com.saltmarket.freeboard.controller;

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
import com.saltmarket.freeboard.model.service.FreeboardService;
import com.saltmarket.freeboard.model.vo.Freeboard;

/**
 * Servlet implementation class FreeboardUpdateController
 */
@WebServlet("/update.fbo")
public class FreeboardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeboardUpdateController() {
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
			String savePath = request.getSession().getServletContext().getRealPath("/resources/freeboard_upfiles/");
			// 전달된 파일명 수정 및 서버에 파일 업로드
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			// 게시글 작성 정보 뽑기
			int boardNo = Integer.parseInt(multiRequest.getParameter("bno"));
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String category = multiRequest.getParameter("category");
			
			// Freeboard 로 가공
			Freeboard fb = new Freeboard();
			fb.setFreeboardNo(boardNo);
			fb.setBoardTitle(boardTitle);
			fb.setBoardContent(boardContent);
			fb.setCategory(category);
			
			
			// -------------------- 기존 첨부파일 부분 --------------------
			
			// 삭제할 파일번호를 담을 ArrayList 정의
			ArrayList<ImgFile> deleteImgList = new ArrayList<>();
			
			// 수정을 원하는 게시글의 마지막 파일번호가 있다면 로직 실행 (없다면 첨부파일이 아예없다는뜻)
			if(multiRequest.getParameter("originfilelastno") != null) {
				
				// 기존 첨부파일의 끝번호 추출(삭제할 파일번호를 추출하기 위한 반복문 횟수)
				// 뷰단의 name값인 deletefile1,2,3,... 을 찾기 위한 변수 셋팅
				int originFileLastNo = Integer.parseInt(multiRequest.getParameter("originfilelastno")); 
				int originCount = 1;
				
				// 삭제버튼이 눌린 기존파일번호를 추출하기위해 기존파일 개수 만큼 반복돌리기
				for(int i = 1; i <= originFileLastNo; i++) {
					
					// 뷰단의 파일번호와 이름이 담긴 name 변수명 추출을 위한 deleteFileNoKey, deleteFileNameKey 값 초기화
					String deleteFileNoKey = "deletefileno" + originCount;
					String deleteFileNameKey = "deletefilename" + originCount;
					
					// 삭제버튼이 눌린 기존파일번호가 담겨있을경우 ImgFile 객체에 담기
					if(multiRequest.getParameter(deleteFileNoKey) != null) {
						
						// 삭제할 파일번호를 ImgFile 객체에 vo 가공
						ImgFile img = new ImgFile();
						img.setFileNo(Integer.parseInt(multiRequest.getParameter(deleteFileNoKey)));
						deleteImgList.add(img);
						// 현재 프로젝트에서는 서버 데이터를 삭제하지 않음 => 삭제 복구 시 데이터를 남겨놓기 위해
						// if) 기존의 첨부파일을 서버로부터 삭제하려면? (참고용으로 적어둠)
						// new File(savePath + multiRequest.getParameter(deleteFileNameKey)).delete();
					}
					
					// 뷰단의 다음 name값 추출을 위해 count 증가
					originCount++;
				}
			}
				
			// -------------------- 새로운 첨부파일 부분 --------------------
			
			// 새로운 첨부파일을 담을 ArrayList 정의
			ArrayList<ImgFile> updateImgList = new ArrayList<>();
			
			// 수정을 원하는 게시글의 새로운 첨부파일의 마지막 파일번호가 있다면 로직 실행 (없다면 첨부파일이 아예없다는뜻)
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
						img.setFilePath("resources/freeboard_upfiles/");
						
						// 파일레벨 셋팅 (대표이미지일 경우1, 아닐경우2)
						// cf) 현재 자유게시판에서는 쓰임새가 없지만 나중을 위해 기능구현 해놓음~
						// 작성기능에서는 제대로 동작하는 기능이지만 수정기능에서는 기존 사진들의 레벨 조회 로직을 구현을 못했기 때문에
						// 제대로 동작하지않음 나중에 필요시 로직 수정해야함! 지금은 작성기능과 동일하게 새로추가하는 첫번째 사진이 대표이미지가 되도록 구현함
						if(levelCount == 1) { // file1 키값이 대표이미지를 나타내는 키값임
							img.setFileLevel(1);
						} else {
							img.setFileLevel(2);
						}
						
						updateImgList.add(img);
						levelCount++;
					}
					
					// 뷰단의 다음 name값 추출을 위해 count 증가
					count++;
				}		
			}
			
			// 서비스 요청
			int result = new FreeboardService().updateBoard(fb, deleteImgList,  updateImgList);
			
			// 결과값에 따른 응답 처리
			if(result > 0) { // 성공 => 해당 게시글의 상세조회 페이지로 url 재요청 
				
				request.getSession().setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다.");
				
				response.sendRedirect(request.getContextPath() + "/detail.fbo?bno=" + boardNo);
				
			} else { // 실패 => 에러페이지 포워딩
				
				request.setAttribute("errorMsg", "일반게시판 수정 실패");
				
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
