package com.saltmarket.notice.controller;

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
import com.saltmarket.notice.model.service.NoticeService;
import com.saltmarket.notice.model.vo.Attachment;
import com.saltmarket.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdate
 */
@WebServlet("/update.no")
public class NoticeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			int noticeNo = Integer.parseInt(multiRequest.getParameter("nno"));
			String noticeTitle = multiRequest.getParameter("title");
			String noticeContent = multiRequest.getParameter("content");
			

			Notice n = new Notice();
			n.setNoticeNo(noticeNo);
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			
			for(int i = 0; i <=2; i++) {
				String key = "reUpfile" + i; // file1, file2, file3

				
				if(multiRequest.getOriginalFileName(key) != null) {					

					Attachment at = new Attachment();


					at.setOriginName(multiRequest.getOriginalFileName(key));					
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/notice_upfiles/");
					
					if(multiRequest.getParameter("originFileNo"+i) != null) {
					
						// 새로운 첨부파일이 있고, 기존의 파일이 있었을 경우
						// => ATTACHMENT UPDATE
						at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo" + i)));
						
						// 기존의 첨부파일은 서버로부터 삭제
						new File(savePath + multiRequest.getParameter("originFileName"+i)).delete();
					} else {
					
					// case2. 기존 첨부파일이 없을 경우
					// => ATTACHMENT INSERT
						at.setRefNo(noticeNo);
					}
					
					
					list.add(at);
				}
			}
			
			int result = new NoticeService().updateNotice(n, list);
			
			
			if(result > 0) {
				// 성공 시
				request.getSession().setAttribute("alertMsg", "공지사항 수정에 성공하였습니다.");
				response.sendRedirect(request.getContextPath() + "/list.mno");
			} else {
				// 실패 시
				request.setAttribute("errorMsg", "공지사항 수정에 실패하였습니다.");
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
