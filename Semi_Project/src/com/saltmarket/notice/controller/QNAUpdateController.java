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
import com.saltmarket.notice.model.service.QNAService;
import com.saltmarket.notice.model.vo.Attachment;
import com.saltmarket.notice.model.vo.QNA;

/**
 * Servlet implementation class QNAUpdateController
 */
@WebServlet("/update.qna")
public class QNAUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAUpdateController() {
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

			int qnaNo = Integer.parseInt(multiRequest.getParameter("qno"));
			String qWriter = multiRequest.getParameter("userNo");
			String qTitle = multiRequest.getParameter("title");
			String qContent = multiRequest.getParameter("content");
			String qCategory = multiRequest.getParameter("category");

			QNA q = new QNA();
			q.setQnaNo(qnaNo);
			q.setqTitle(qTitle);
			q.setqContent(qContent);
			q.setqCategory(qCategory);
			
			ArrayList<Attachment> list = new ArrayList<Attachment>();
			
			for(int i = 1; i <=3; i++) {
				String key = "reUpfile" + i; // file1, file2, file3

				
				if(multiRequest.getOriginalFileName(key) != null) {					

					Attachment at = new Attachment();


					at.setOriginName(multiRequest.getOriginalFileName(key));					
					at.setChangeName(multiRequest.getFilesystemName(key));
					at.setFilePath("resources/notice_upfiles/");
					
					if(multiRequest.getParameter("originFileNo") != null) {
					
						// 새로운 첨부파일이 있고, 기존의 파일이 있었을 경우
						// => ATTACHMENT UPDATE
						at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
						
						// 기존의 첨부파일은 서버로부터 삭제
						new File(savePath + multiRequest.getParameter("originFileName")).delete();
					} else {
					
					// case2. 기존 첨부파일이 없을 경우
					// => ATTACHMENT INSERT
						at.setRefNo(qnaNo);
					}
					
					
					list.add(at);
				}
			}
			
			int result = new QNAService().updateQNA(q, list);
			
			System.out.println(result);
			if(result > 0) {
				// 성공 시
				request.getSession().setAttribute("alertMsg", "공지사항 수정에 성공하였습니다.");
				response.sendRedirect(request.getContextPath() + "/list.qna?userNo=" + qWriter + "&currentPage=1");
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
